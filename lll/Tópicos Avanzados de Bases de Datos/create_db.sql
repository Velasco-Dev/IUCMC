-- =========================================
-- CREAR BASE DE DATOS
-- =========================================

CREATE DATABASE tienda_zapatos;

\c tienda_zapatos;

-- =========================================
-- TABLAS PRINCIPALES
-- =========================================

CREATE TABLE MARCA (
    ID_Marca SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE ROL (
    ID_Rol SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(150)
);

CREATE TABLE PERMISO (
    ID_Permiso SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Modulo VARCHAR(50) NOT NULL
);

CREATE TABLE MEDIO_PAGO (
    ID_Medio_Pago SERIAL PRIMARY KEY,
    Tipo VARCHAR(50) NOT NULL
);

CREATE TABLE TIENDA (
    ID_Tienda SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(150),
    Activa BOOLEAN NOT NULL
);

CREATE TABLE USUARIO (
    ID_Usuario SERIAL PRIMARY KEY,
    FKRol INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Cedula VARCHAR(20) UNIQUE NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL,
    Celular VARCHAR(20),
    Activo BOOLEAN NOT NULL,
    FOREIGN KEY (FKRol) REFERENCES ROL(ID_Rol)
);

CREATE TABLE MODELO_ZAPATO (
    ID_Modelo_Zapato SERIAL PRIMARY KEY,
    FKMarca INT NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Genero VARCHAR(20) NOT NULL,
    Existencias INT NOT NULL,
    CodigoBarras VARCHAR(50) UNIQUE NOT NULL,
    Activo BOOLEAN NOT NULL,
    FOREIGN KEY (FKMarca) REFERENCES MARCA(ID_Marca)
);

CREATE TABLE ROL_PERMISO (
    FKRol INT NOT NULL,
    FKPermiso INT NOT NULL,
    PRIMARY KEY (FKRol, FKPermiso),
    FOREIGN KEY (FKRol) REFERENCES ROL(ID_Rol),
    FOREIGN KEY (FKPermiso) REFERENCES PERMISO(ID_Permiso)
);

CREATE TABLE TIENDA_VENDEDOR (
    FKVendedor INT NOT NULL,
    FKTienda INT NOT NULL,
    PRIMARY KEY (FKVendedor, FKTienda),
    FOREIGN KEY (FKVendedor) REFERENCES USUARIO(ID_Usuario),
    FOREIGN KEY (FKTienda) REFERENCES TIENDA(ID_Tienda)
);

CREATE TABLE VENTA (
    ID_Venta SERIAL PRIMARY KEY,
    Fecha TIMESTAMP NOT NULL,
    FKVendedor INT NOT NULL,
    FKTienda INT NOT NULL,
    FKMedioPago INT NOT NULL,
    TotalBruto DECIMAL(10,2),
    TotalDescuento DECIMAL(10,2),
    TotalFinal DECIMAL(10,2),
    FOREIGN KEY (FKVendedor) REFERENCES USUARIO(ID_Usuario),
    FOREIGN KEY (FKTienda) REFERENCES TIENDA(ID_Tienda),
    FOREIGN KEY (FKMedioPago) REFERENCES MEDIO_PAGO(ID_Medio_Pago)
);

CREATE TABLE FACTURA (
    ID_FACTURA SERIAL PRIMARY KEY,
    FKVenta INT NOT NULL,
    FKModelo_Zapato INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2),
    Descuento DECIMAL(10,2),
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (FKVenta) REFERENCES VENTA(ID_Venta),
    FOREIGN KEY (FKModelo_Zapato) REFERENCES MODELO_ZAPATO(ID_Modelo_Zapato)
);

-- =========================================
-- TABLA DE AUDITORÍA
-- =========================================

CREATE TABLE AUDITORIA (
    ID_Auditoria SERIAL PRIMARY KEY,
    Tabla VARCHAR(100),
    Operacion VARCHAR(20),
    Usuario TEXT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Datos_Antiguos JSONB,
    Datos_Nuevos JSONB
);


CREATE OR REPLACE FUNCTION fn_auditoria()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

IF TG_OP = 'INSERT' THEN

    INSERT INTO AUDITORIA(Tabla,Operacion,Usuario,Datos_Nuevos)
    VALUES(
        TG_TABLE_NAME,
        TG_OP,
        current_user,
        to_jsonb(NEW)
    );

    RETURN NEW;

ELSIF TG_OP = 'UPDATE' THEN

    INSERT INTO AUDITORIA(Tabla,Operacion,Usuario,Datos_Antiguos,Datos_Nuevos)
    VALUES(
        TG_TABLE_NAME,
        TG_OP,
        current_user,
        to_jsonb(OLD),
        to_jsonb(NEW)
    );

    RETURN NEW;

ELSIF TG_OP = 'DELETE' THEN

    INSERT INTO AUDITORIA(Tabla,Operacion,Usuario,Datos_Antiguos)
    VALUES(
        TG_TABLE_NAME,
        TG_OP,
        current_user,
        to_jsonb(OLD)
    );

    RETURN OLD;

END IF;

END;
$$;

-- =========================================
-- TRIGGERS DE AUDITORÍA
-- =========================================

CREATE TRIGGER audit_usuario
AFTER INSERT OR UPDATE OR DELETE
ON USUARIO
FOR EACH ROW
EXECUTE FUNCTION fn_auditoria();

CREATE TRIGGER audit_modelo
AFTER INSERT OR UPDATE OR DELETE
ON MODELO_ZAPATO
FOR EACH ROW
EXECUTE FUNCTION fn_auditoria();

CREATE TRIGGER audit_venta
AFTER INSERT OR UPDATE OR DELETE
ON VENTA
FOR EACH ROW
EXECUTE FUNCTION fn_auditoria();

CREATE TRIGGER audit_factura
AFTER INSERT OR UPDATE OR DELETE
ON FACTURA
FOR EACH ROW
EXECUTE FUNCTION fn_auditoria();

-- =========================================
-- INSERTS
-- =========================================

INSERT INTO MARCA (Nombre) VALUES
('Nike'),('Adidas'),('Puma'),('Reebok'),('Fila'),
('Converse'),('Vans'),('Skechers'),('New Balance'),('Asics');

INSERT INTO ROL (Nombre,Descripcion) VALUES
('Admin','Administrador del sistema'),
('Vendedor','Empleado de ventas'),
('Supervisor','Supervisor de tienda'),
('Bodega','Inventario'),
('Gerente','Gerencia'),
('Caja','Cajero'),
('Soporte','Soporte técnico'),
('Auditor','Auditor interno'),
('RRHH','Recursos Humanos'),
('Invitado','Acceso limitado');

INSERT INTO PERMISO (Nombre,Modulo) VALUES
('Crear','Usuarios'),
('Editar','Usuarios'),
('Eliminar','Usuarios'),
('Ver','Ventas'),
('Crear','Ventas'),
('Editar','Ventas'),
('Eliminar','Ventas'),
('Ver','Inventario'),
('Editar','Inventario'),
('Ver','Reportes');

INSERT INTO MEDIO_PAGO (Tipo) VALUES
('Efectivo'),('Tarjeta Crédito'),('Tarjeta Débito'),
('Nequi'),('Daviplata'),('PSE'),
('Transferencia'),('Bono'),('Crédito Tienda'),('Cheque');

INSERT INTO TIENDA (Nombre,Ubicacion,Activa) VALUES
('Centro Cali','Cali Centro',true),
('Unicentro','Cali Sur',true),
('Chipichape','Cali Norte',true),
('Palmira','Palmira',true),
('Yumbo','Yumbo',true),
('Jamundi','Jamundi',true),
('Tulua','Tulua',true),
('Buga','Buga',true),
('Cartago','Cartago',true),
('Popayan','Popayan',true);

INSERT INTO USUARIO (FKRol,Nombre,Cedula,Correo,Celular,Activo) VALUES
(2,'Juan Perez','1001','juan@mail.com','3000000001',true),
(2,'Ana Gomez','1002','ana@mail.com','3000000002',true),
(2,'Luis Torres','1003','luis@mail.com','3000000003',true),
(3,'Maria Ruiz','1004','maria@mail.com','3000000004',true),
(1,'Admin','9999','admin@mail.com','3000000005',true),
(2,'Pedro Diaz','1006','pedro@mail.com','3000000006',true),
(2,'Laura Rios','1007','laura@mail.com','3000000007',true),
(2,'Carlos Mena','1008','carlos@mail.com','3000000008',true),
(2,'Diana Solis','1009','diana@mail.com','3000000009',true),
(2,'Jorge Paz','1010','jorge@mail.com','3000000010',true);

INSERT INTO MODELO_ZAPATO (FKMarca,Precio,Genero,Existencias,CodigoBarras,Activo) VALUES
(1,250000,'Hombre',50,'CB001',true),
(2,230000,'Mujer',40,'CB002',true),
(3,210000,'Hombre',30,'CB003',true),
(4,180000,'Mujer',20,'CB004',true),
(5,195000,'Unisex',25,'CB005',true),
(6,220000,'Unisex',35,'CB006',true),
(7,200000,'Hombre',15,'CB007',true),
(8,190000,'Mujer',18,'CB008',true),
(9,260000,'Hombre',22,'CB009',true),
(10,240000,'Mujer',28,'CB010',true);


INSERT INTO VENTA (Fecha, FKVendedor, FKTienda, FKMedioPago, TotalBruto, TotalDescuento, TotalFinal) VALUES
(NOW(),1,1,1,250000,0,250000),
(NOW(),1,1,2,210000,0,210000),
(NOW(),1,2,1,230000,10000,220000),
(NOW(),1,3,2,240000,0,240000),

(NOW(),2,1,2,230000,10000,220000),
(NOW(),2,2,3,200000,0,200000),
(NOW(),2,3,1,210000,0,210000),

(NOW(),3,2,3,210000,0,210000),
(NOW(),3,3,4,180000,5000,175000),

(NOW(),4,2,1,180000,5000,175000),
(NOW(),4,4,1,220000,10000,210000),

(NOW(),5,3,2,195000,0,195000),
(NOW(),5,5,2,190000,0,190000),

(NOW(),6,3,4,220000,20000,200000),
(NOW(),6,6,3,230000,5000,225000),

(NOW(),7,4,1,200000,0,200000),
(NOW(),7,7,4,240000,0,240000),

(NOW(),8,5,3,190000,0,190000),

(NOW(),9,6,2,260000,10000,250000),

(NOW(),10,7,1,240000,0,240000);


INSERT INTO FACTURA (FKVenta, FKModelo_Zapato, Cantidad, PrecioUnitario, Descuento, Subtotal) VALUES
(1,1,1,250000,0,250000),
(2,3,1,210000,0,210000),
(3,2,1,230000,10000,220000),
(4,4,1,240000,0,240000),

(5,2,1,230000,10000,220000),
(6,7,1,200000,0,200000),
(7,5,1,210000,0,210000),

(8,3,1,210000,0,210000),
(9,4,1,180000,5000,175000),

(10,4,1,180000,5000,175000),
(11,6,1,220000,10000,210000),

(12,5,1,195000,0,195000),
(13,8,1,190000,0,190000),

(14,6,1,220000,20000,200000),
(15,2,1,230000,5000,225000),

(16,7,1,200000,0,200000),
(17,10,1,240000,0,240000),

(18,8,1,190000,0,190000),

(19,9,1,260000,10000,250000),

(20,1,1,240000,0,240000);