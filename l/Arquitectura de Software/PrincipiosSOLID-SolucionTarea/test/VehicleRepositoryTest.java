/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Scanner;

import co.unicauca.parkinglot.access.VehicleRepository;
import co.unicauca.parkinglot.domain.Vehicle;
import co.unicauca.parkinglot.domain.TypeEnum;

/**
 *
 * @author Tagpa
 */

public class VehicleRepositoryTest {

    private VehicleRepository repo;

    @BeforeEach
    public void setUp() {
        repo = new VehicleRepository();
        repo.connect();
    }

    @AfterEach
    public void tearDown() {
        repo.disconnect();
    }

    @Test
    public void testDatabaseInitialization() {

        Scanner scanner = new Scanner(System.in);

        String menu = "Bienvenido:" +
                "\n------------------------------------------" +
                "\nPruebas para el repositorio de vehiculos:" +
                "\n------------------------------------------" +
                "\n1. Agregar vehiculo." + "\n2. Listar vehiculos." + "\n3. Salir." +
                "\n------------------------------------------";

        String subMenuTipo = "Desea registrar:\n"+
                "1. Moto.\n" +
                "2. Carro.\n" +
                "3. Camion.\n";

        String opcion = "";
        String subOpcion = "";
        String subPlaca = "Ingrese la placa del vehiculo:";

        System.out.println(menu);
        opcion = scanner.next();

        switch (opcion) {
            case "1":

                System.out.println(subMenuTipo);

                String placa = "";
                TypeEnum tipo = null;
                
                subOpcion = scanner.next();

                if(subOpcion.equals("1")){
                    tipo = TypeEnum.MOTO;
                } else if(subOpcion.equals("2")){
                    tipo = TypeEnum.CAR;
                } else if(subOpcion.equals("3")){
                    tipo = TypeEnum.TRUCK;
                } else {
                    System.out.println("Opcion no valida.");
                    scanner.close();
                    return;
                }

                System.out.println(subPlaca);
                placa = scanner.next();

                // Try to save a vehicle
                Vehicle testVehicle = new Vehicle(placa, tipo);
                boolean saveResult = repo.save(testVehicle);
                assertTrue(saveResult, "Should save vehicle successfully");

                scanner.close();

                break;
                case "2":
                // Try to retrieve vehicles
                List<Vehicle> vehicles = repo.list();
                if (vehicles.isEmpty()) {
                    System.out.println("No hay vehiculos registrados.");
                } else {
                    System.out.println("\nVehiculos registrados:");
                    System.out.println("------------------------------------------");
                    for (Vehicle vehicle : vehicles) {
                        System.out.println("Placa: " + vehicle.getPlaca() + 
                                         " - Tipo: " + vehicle.getType());
                    }
                    System.out.println("------------------------------------------");
                }
                break;
            case "3":
                System.out.println("Saliendo...");
                scanner.close();
                return;
            default:
                System.out.println("Opcion no valida.");
                break;
        }
        // Try to connect to the database

        // Verify the retrieved vehicle data
        // Vehicle retrievedVehicle = vehicles.get(0);
        // assertEquals("ABC-123", retrievedVehicle.getPlaca(), "Should retrieve the
        // correct plate");
        // assertEquals(TypeEnum.CAR, retrievedVehicle.getType(), "Should retrieve the
        // correct type");
    }
}