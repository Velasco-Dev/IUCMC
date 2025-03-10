package co.unicauca.parkinglot.access;

import co.unicauca.parkinglot.domain.Vehicle;
import java.util.ArrayList;
import java.util.List;

public class DefaultVehicleRepository implements IVehicleRepository {
    private List<Vehicle> vehicles = new ArrayList<>();

    @Override
    public boolean save(Vehicle vehicle) {
        return vehicles.add(vehicle);
    }

    @Override
    public List<Vehicle> list() {
        return vehicles;
    }
}
