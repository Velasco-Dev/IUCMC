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
        long cost = 0;

        switch (veh.getType()) {
            case MOTO:
                cost = hours * 1000; // Ejemplo: 1000 por hora para motos
                break;
            case CAR:
                cost = hours * 2000; // Ejemplo: 2000 por hora para carros
                break;
            case TRUCK:
                cost = hours * 3000; // Ejemplo: 3000 por hora para camiones
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
