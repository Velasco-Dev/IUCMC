package co.unicauca.parkinglot.domain.service;

import co.unicauca.parkinglot.access.IVehicleRepository;
import co.unicauca.parkinglot.domain.Vehicle;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

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
        Duration duration = Duration.between(input, output);
        long hours = duration.toHours();
        long minutes = duration.toMinutes() % 60;
        double cost = 0;
    
        switch (veh.getType()) {
            case MOTO:
                cost = 1000; // Valor fijo primera hora
                if (hours > 1 || (hours == 1 && minutes > 0)) {
                    // Después de la primera hora, $500 por hora usando regla de tres
                    double additionalHours = (hours - 1) + (minutes / 60.0);
                    cost += additionalHours * 500;
                }
                break;
            case CAR:
                cost = 2000; // Valor fijo primera hora
                if (hours > 1 || (hours == 1 && minutes > 0)) {
                    // Después de la primera hora, $1000 por hora usando regla de tres
                    double additionalHours = (hours - 1) + (minutes / 60.0);
                    cost += additionalHours * 1000;
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
                        cost += (remainingHours * 15000.0) / 24.0;
                    }
                }
                // Lógica del sorteo
                Random rand = new Random();
                int randomNum = rand.nextInt(1000) + 1;
                if (randomNum == 1) {
                    cost = 0;
                }
                break;
            default:
                throw new UnsupportedOperationException("Tipo de vehículo no soportado: " + veh.getType());
        }
    
        // Redondear a la centena más cercana por encima
        return (long) (Math.ceil(cost / 100.0) * 100);
    }

    public List<Vehicle> listVehicles() {
        return repo.list();
    }

    public void saveVehicle(Vehicle veh) {
        repo.save(veh);
    }
}