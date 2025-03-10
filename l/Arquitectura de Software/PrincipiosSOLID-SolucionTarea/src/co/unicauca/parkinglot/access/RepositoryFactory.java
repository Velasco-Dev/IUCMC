/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.unicauca.parkinglot.access;

/**
 *
 * @author Tagpa
 */
public class RepositoryFactory {

    private static RepositoryFactory instance;

    private RepositoryFactory() {
    }

    public static RepositoryFactory getInstance() {
        if (instance == null) {
            instance = new RepositoryFactory();
        }
        return instance;
    }

    public IVehicleRepository getRepository(String type) {
        if ("default".equals(type)) {

            return new DefaultVehicleRepository();

        } else if ("def".equals(type)) {

            VehicleRepository repository = new VehicleRepository();
            return repository;

        }
        return null;
    }

    // public IVehicleRepository getRepository(String type) {
    // VehicleRepository repository = new VehicleRepository();
    // return repository;
    // }
}
