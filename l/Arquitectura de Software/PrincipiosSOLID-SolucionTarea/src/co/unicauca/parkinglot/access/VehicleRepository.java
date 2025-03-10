package co.unicauca.parkinglot.access;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import co.unicauca.parkinglot.domain.TypeEnum;
import co.unicauca.parkinglot.domain.Vehicle;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tagpa
 */

public class VehicleRepository implements IVehicleRepository {

    private Connection conn;

    public VehicleRepository() {
        initDatabase();
    }

    @Override
    public boolean save(Vehicle newVehicle) {
        try {
            // Validate vehicle
            if (newVehicle == null || newVehicle.getPlaca().isBlank() || newVehicle.getType() == null) {
                Logger.getLogger(VehicleRepository.class.getName()).log(Level.WARNING, "\nInvalid vehicle data");
                return false;
            }

            String sql = "INSERT INTO Vehicle (Plate, Type) VALUES (?, ?)";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newVehicle.getPlaca());
            pstmt.setString(2, newVehicle.getType().toString());

            // Execute and check result
            int rowsAffected = pstmt.executeUpdate();
            boolean success = rowsAffected > 0;

            if (success) {
                Logger.getLogger(VehicleRepository.class.getName()).log(Level.INFO,
                        "\nVehicle saved successfully: " + newVehicle.getPlaca());
            } else {
                Logger.getLogger(VehicleRepository.class.getName()).log(Level.WARNING,
                        "\nFailed to save vehicle: " + newVehicle.getPlaca());
            }

            return success;

        } catch (SQLException ex) {
            Logger.getLogger(VehicleRepository.class.getName()).log(Level.SEVERE,
                    "\nDatabase error while saving vehicle: " + ex.getMessage(), ex);
            return false;
        }
    }

    @Override
    public List<Vehicle> list() {
        List<Vehicle> vehicles = new ArrayList<>();
        try {
            String sql = "SELECT Plate, Type FROM Vehicle";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Vehicle newVehicle = new Vehicle(
                        rs.getString("Plate"),
                        TypeEnum.valueOf(rs.getString("Type")));
                vehicles.add(newVehicle);
            }

        } catch (SQLException ex) {
            Logger.getLogger(VehicleRepository.class.getName()).log(Level.SEVERE, "Error listing vehicles", ex);
        }
        return vehicles;
    }

    private void initDatabase() {
        Logger logger = Logger.getLogger(VehicleRepository.class.getName());
        
        try {
            this.connect();
            if (conn == null) {
                logger.severe("\nDatabase connection failed");
                return;
            }
            logger.info("\nDatabase connected successfully");
    
            // SQL statement for creating a new table
            String sql = "CREATE TABLE IF NOT EXISTS Vehicle (\n"
                    + "	Plate text PRIMARY KEY,\n"
                    + "	Type text NOT NULL\n"
                    + ");";
    
            Statement stmt = conn.createStatement();
            stmt.execute(sql);
            logger.info("\nVehicle table created successfully");
    
        } catch (SQLException ex) {
            logger.severe("\nDatabase initialization failed: " + ex.getMessage());
        }
    }

    public void connect() {
        Logger logger = Logger.getLogger(VehicleRepository.class.getName());

        try {
            // Register JDBC driver
            Class.forName("org.sqlite.JDBC");

            // SQLite connection string
            String url = "jdbc:sqlite:parking.db";

            conn = DriverManager.getConnection(url);
            logger.info("\nDatabase connected at: " + url);

        } catch (ClassNotFoundException e) {
            logger.severe("\nSQLite JDBC Driver not found: " + e.getMessage());
        } catch (SQLException ex) {
            logger.severe("\nDatabase connection failed: " + ex.getMessage());
        }
    }

    public void disconnect() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

}
