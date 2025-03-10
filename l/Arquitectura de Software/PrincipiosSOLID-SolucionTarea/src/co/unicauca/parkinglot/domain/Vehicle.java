package co.unicauca.parkinglot.domain;

/**
 * Clase que representa un vehículo
 * 
 * @autor Tagpa
 */
public class Vehicle {

    private String placa;
    private TypeEnum tipo;

    public Vehicle(String placa, TypeEnum tipo) {
        this.placa = placa;
        this.tipo = tipo;
    }

    public TypeEnum getType() {
        return tipo;
    }

    public void setType(TypeEnum tipo) {
        this.tipo = tipo;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getPlaca() {
        return placa;
    }

    @Override
    public String toString() {
        return "Vehicle{" + "placa=" + placa + ", tipo=" + tipo + '}';
    }
}
