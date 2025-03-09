package co.unicauca.parkinglot.domain.service;

import co.unicauca.parkinglot.access.IVehicleRepository;
import co.unicauca.parkinglot.domain.Vehicle;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Servicio de parqueadero
 * 
 * @autor Tagpa
 */
public class Service {
    private IVehicleRepository repo;

    public Service(IVehicleRepository repo) {
        this.repo = repo;
    }

    public long calculateParkingCost(Vehicle veh, LocalDateTime input, LocalDateTime output) {
        // Implementación básica para calcular el costo del parqueo
        Duration duration = Duration.between(input, output);
        long hours = duration.toHours();
        long minutes = duration.toMinutes() % 60;
        long cost = 0;

        switch (veh.getType()) {
            case MOTO:
                cost = hours * 1000;
                if (minutes > 0) {
                    cost += 1000; // Cobrar una hora adicional si hay minutos adicionales
                }
                break;
            case CAR:
                cost = hours * 2000;
                if (minutes > 0) {
                    cost += 2000; // Cobrar una hora adicional si hay minutos adicionales
                }
                break;
            case TRUCK:
                if (hours <= 12) {
                    cost = 10000;
                } else if (hours <= 24) {
                    cost = 15000;
                } else {
                    long days = hours / 24;
                    long remainingHours = hours % 24;
                    cost = days * 15000;
                    if (remainingHours > 0) {
                        cost += 15000; // Cobrar un día adicional si hay horas adicionales
                    }
                }
                break;
            default:
                throw new UnsupportedOperationException("Tipo de vehículo no soportado: " + veh.getType());
        }

        return cost;
    }

    public List<Vehicle> listVehicles() {
        return repo.list();
    }

    public void saveVehicle(Vehicle veh) {
        repo.save(veh);
    }
}