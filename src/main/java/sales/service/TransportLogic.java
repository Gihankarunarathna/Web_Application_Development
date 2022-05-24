
package sales.service;

import sales.dao.BranchDAO;
import sales.dao.IBranchDAO;
import sales.dao.ITransportDAO;
import sales.dao.TransportDAO;
import sales.models.Driver;
import sales.models.Vehicle;
import java.util.ArrayList;
import org.apache.commons.lang.NotImplementedException;

public class TransportLogic implements ITransportLogic{

    @Override
    public boolean RegisterVehicleInSystem(Vehicle vehicle) {
       ITransportDAO trnsportDAO = new TransportDAO();
       int vahicleId = trnsportDAO.CreateVehicle(vehicle);
       if(vahicleId > 0) return true;
       else return false;
    }

    @Override
    public boolean RegisterDriverInSystem(Driver driver) {
      return false;
    }

    @Override
    public boolean UpdateDriverProfile(Driver driver) {
       throw new NotImplementedException();
    }

    @Override
    public boolean UpdateVehicleProfile(Vehicle vehicle) {
       ITransportDAO trnsportDAO = new TransportDAO();
       boolean response = trnsportDAO.EditVehicle(vehicle);
       return response;
    }

    @Override
    public boolean DeleteVehicleFromSystem(int vehicle) {
       ITransportDAO trnsportDAO = new TransportDAO();
       return trnsportDAO.DeleteVehicle(vehicle);
    }

    @Override
    public boolean DeleteDriverFromSystem(int driver) {
       ITransportDAO trnsportDAO = new TransportDAO();
       return trnsportDAO.DeleteDriverProfile(driver);
    }

    @Override
    public Driver GetDriverById(int driver) {
       return null;
    }

    @Override
    public Vehicle GetVehicleById(int vehicle) {
       ITransportDAO trnsportDAO = new TransportDAO();
       return trnsportDAO.GetVehicleById(vehicle);
    }

    @Override
    public ArrayList<Vehicle> GetFreeVehiclesUnderBranch(int branchId) {
        ITransportDAO trnsportDAO = new TransportDAO();
        return trnsportDAO.GetAllVehiclesUnderBranchFree(branchId);
    }

    @Override
    public ArrayList<Vehicle> GetVehiclesUnderBranch(int branchId) {
        ITransportDAO trnsportDAO = new TransportDAO();
        return trnsportDAO.GetAllVehiclesUnderBranch(branchId);
    }

    @Override
    public ArrayList<Driver> GetFreeDriverUnderBranch(int branchId) {
        ITransportDAO trnsportDAO = new TransportDAO();
        return trnsportDAO.GetAllDriversUnderBranchHasNoVehicle(branchId);
    }

    @Override
    public ArrayList<Driver> GetDriversUnderBranch(int branchId) {
        ITransportDAO trnsportDAO = new TransportDAO();
        return trnsportDAO.GetAllDriversUnderBranch(branchId);    
    }

    @Override
    public ArrayList<Vehicle> GetAllVehiclesUnderBranchHasNoDriver(int branchId) {
        ITransportDAO trnsportDAO = new TransportDAO();
        return trnsportDAO.GetAllVehiclesUnderBranchHasNoDriver(branchId);      
    }

    @Override
    public int GetVehicleForDriver(int id) {
        ITransportDAO trnsportDAO = new TransportDAO();
        return trnsportDAO.GetVehicleForDriver(id); 
    }

    @Override
    public int GetDriverForVehicle(int id) {
       ITransportDAO trnsportDAO = new TransportDAO();
       return trnsportDAO.GetDriverForVehicle(id);
    }
    
}
