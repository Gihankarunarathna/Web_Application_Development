
package sales.dao;

import sales.models.Branch;
import sales.models.Driver;
import sales.models.Vehicle;
import java.util.ArrayList;

public interface ITransportDAO {
    
    int CreateVehicle(Vehicle vehicle);
    boolean DeleteVehicle(int branchId);
    boolean EditVehicle(Vehicle vehicle);
    ArrayList<Vehicle> GetAllVehiclesUnderBranch(int branchId);
    ArrayList<Vehicle> GetAllVehiclesUnderBranchFree(int branchId);
    ArrayList<Vehicle> GetAllVehiclesUnderBranchHasNoDriver(int branchId);
    Vehicle GetVehicleById(int branchId);
    
    
    int CreateDriverProfile(Driver driver);
    boolean DeleteDriverProfile(int driverId);
    boolean EditDriver(Driver driver);
    ArrayList<Driver> GetAllDriversUnderBranch(int branchId);
    ArrayList<Driver> GetAllDriversUnderBranchHasNoVehicle(int branchId);
    Driver GetBranchById(int branchId);
    
    int GetVehicleForDriver(int driver);
    int GetDriverForVehicle(int vehicle);
}
