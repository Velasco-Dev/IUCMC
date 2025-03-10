package co.unicauca.parkinglot.presentation;

import co.unicauca.parkinglot.access.IVehicleRepository;
import co.unicauca.parkinglot.access.RepositoryFactory;
import co.unicauca.parkinglot.access.VehicleRepository;
import co.unicauca.parkinglot.domain.Vehicle;
import co.unicauca.parkinglot.domain.service.Service;
import co.unicauca.parkinglot.domain.TypeEnum;

import java.time.LocalDateTime;
import java.time.Month;
import java.util.List;
import java.util.Scanner;

/**
 * Un cliente main de prueba
 *
 * @author Tagpa
 */
public class ClientMain {
    private static VehicleRepository repo;
    private static Scanner scanner;

    public static void main(String[] args) {
        initialize();
        boolean running = true;

        while (running) {
            displayMenu();
            String opcion = scanner.nextLine();

            switch (opcion) {
                case "1":
                    addVehicle();
                    break;
                case "2":
                    listVehicles();
                    break;
                case "3":
                    persistence();
                    break;
                case "4":
                    running = false;
                    System.out.println("Saliendo...");
                    return;
                default:
                    System.out.println("Opción no válida.");
                    break;
            }
        }
        cleanup();
    }

    private static void persistence() {
        // Crear un vehículo de tipo MOTO
        Vehicle veh = new Vehicle("FTK-123", TypeEnum.MOTO);
        LocalDateTime input = LocalDateTime.of(2021, Month.FEBRUARY, 22, 8, 0);
        LocalDateTime output = LocalDateTime.of(2021, Month.FEBRUARY, 22, 19, 30);

        // Obtener el repositorio de vehículos
        IVehicleRepository repos = RepositoryFactory.getInstance().getRepository("default");
        if (repos == null) {
            System.err.println("Error: No se pudo obtener el repositorio de vehículos.");
            return;
        }

        // Crear el servicio con inyección de dependencias
        Service service = new Service(repos);

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
            System.out.println("Placa: " + vehicle.getPlaca() +
                    " - Tipo: " + vehicle.getType());
        });
    }

    private static void initialize() {
        scanner = new Scanner(System.in);
        // Get repository instance from factory
        repo = (VehicleRepository) RepositoryFactory.getInstance().getRepository("def");
        // Connect to database
        repo.connect();
    }

    private static void cleanup() {
        if (scanner != null) {
            scanner.close();
        }
        if (repo instanceof VehicleRepository) {
            ((VehicleRepository) repo).disconnect();
        }
    }

    private static void displayMenu() {
        System.out.println("\nBienvenid@:");
        System.out.println("------------------------------------------");
        System.out.println("Pruebas para el repositorio de vehículos:");
        System.out.println("------------------------------------------");
        System.out.println("1. Agregar vehículo.");
        System.out.println("2. Listar vehículos de la DB.");
        System.out.println("3. Listar vehículos en persistencia.");
        System.out.println("4. Salir.");
        System.out.println("------------------------------------------");
    }

    private static void addVehicle() {
        System.out.println("\nSeleccione el tipo de vehículo:");
        System.out.println("1. Moto.");
        System.out.println("2. Carro.");
        System.out.println("3. Camión.");

        String subOpcion = scanner.nextLine();
        TypeEnum tipo = null;

        switch (subOpcion) {
            case "1":
                tipo = TypeEnum.MOTO;
                break;
            case "2":
                tipo = TypeEnum.CAR;
                break;
            case "3":
                tipo = TypeEnum.TRUCK;
                break;
            default:
                System.out.println("Tipo de vehículo no válido.");
                return;
        }

        System.out.println("Ingrese la placa del vehículo:");
        String placa = scanner.nextLine();

        Vehicle vehicle = new Vehicle(placa, tipo);
        boolean result = repo.save(vehicle);

        if (result) {
            System.out.println("Vehículo guardado exitosamente.");
        } else {
            System.out.println("Error al guardar el vehículo.");
        }
    }

    private static void listVehicles() {
        List<Vehicle> vehicles = repo.list();

        if (vehicles.isEmpty()) {
            System.out.println("\nNo hay vehículos registrados.");
            return;
        }

        System.out.println("\nVehículos registrados:");
        System.out.println("------------------------------------------");
        for (Vehicle vehicle : vehicles) {
            System.out.println("Placa: " + vehicle.getPlaca() +
                    " - Tipo: " + vehicle.getType());
        }
        System.out.println("------------------------------------------");
    }
}
