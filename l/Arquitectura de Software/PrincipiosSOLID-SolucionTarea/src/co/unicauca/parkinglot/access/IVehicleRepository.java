/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.unicauca.parkinglot.access;

/**
 *
 * @author Tagpa
 */
import co.unicauca.parkinglot.domain.Vehicle;
import java.util.List;

public interface IVehicleRepository {
    boolean save(Vehicle vehicle);

    List<Vehicle> list();
}
