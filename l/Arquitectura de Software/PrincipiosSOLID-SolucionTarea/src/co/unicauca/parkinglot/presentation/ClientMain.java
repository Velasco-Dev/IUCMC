 package co.unicauca.parkinglot.presentation;
 import co.unicauca.parkinglot.access.IVehicleRepository;

 import co.unicauca.parkinglot.access.RepositoryFactory;
 import co.unicauca.parkinglot.domain.Vehicle;
 import co.unicauca.parkinglot.domain.TypeEnum;
 import co.unicauca.parkinglot.domain.service.Service;
 import java.time.LocalDateTime;
 import java.time.Month;
 import java.util.List;
 /**
 * Un cliente main de prueba
 *
 * @author Libardo
 */
public class ClientMain {
    public static void main(String[] args) {
        // Crear un vehículo de tipo MOTO
        Vehicle veh = new Vehicle("FTK-123", TypeEnum.MOTO);
        LocalDateTime input = LocalDateTime.of(2021, Month.FEBRUARY, 22, 8, 0);
        LocalDateTime output = LocalDateTime.of(2021, Month.FEBRUARY, 22, 19, 30);

        // Obtener el repositorio de vehículos
        IVehicleRepository repo = RepositoryFactory.getInstance().getRepository("default");
        if (repo == null) {
            System.err.println("Error: No se pudo obtener el repositorio de vehículos.");
            return;
        }

        // Crear el servicio con inyección de dependencias
        Service service = new Service(repo);

        // Calcular el costo del parqueo
        long result = service.calculateParkingCost(veh, input, output);
        System.out.println("Valor a pagar por la moto: " + result);

        // Guardar el vehículo en el repositorio
        service.saveVehicle(veh);

        // Crear y guardar otro vehículo de tipo CAR
        veh = new Vehicle("JNK-124", TypeEnum.CAR);
        service.saveVehicle(veh);

        // Listar todos los vehículos guardados
        List<Vehicle> list = service.listVehicles();
        list.forEach(vehicle -> {
            System.out.println(vehicle.toString());
        });
    }
}
