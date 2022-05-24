
package sales.service;

import sales.dao.BranchDAO;
import sales.dao.IBranchDAO;
import sales.dao.ITransportDAO;
import sales.dao.IUserDAO;
import sales.dao.TransportDAO;
import sales.dao.UserDAO;
import sales.models.Branch;
import sales.models.DualBranchLocation;
import java.util.ArrayList;


public class BranchLogic implements IBranchLogic{

    @Override
    public boolean CreateSubBranch(Branch branch) {
        IBranchDAO branchDAO = new BranchDAO();
        return branchDAO.CreateBranch(branch);
    }

    @Override
    public ArrayList<Branch> GetAllSubBranch() {
        IBranchDAO branchDAO = new BranchDAO();
        return branchDAO.GetAllSubBranches();    
    }

    @Override
    public boolean UpdateSubBranch(Branch branch) {
       IBranchDAO branchDAO = new BranchDAO();
       return branchDAO.EditBranch(branch);
    }

    @Override
    public boolean DeleteSpecificSubBranch(int id) {
       IBranchDAO branchDAO = new BranchDAO();
       return branchDAO.DeleteBranch(id);
    }

    @Override
    public Branch GetBranchById(int id) {
       IBranchDAO branchDAO = new BranchDAO();
       Branch  branch= branchDAO.GetBranchById(id);
       ITransportDAO trnsportDAO = new TransportDAO();      
       branch.setVehicles(trnsportDAO.GetAllVehiclesUnderBranch(id));
       return branch;
    }

    @Override
    public ArrayList<Branch> GetAllBranchesExceptMe(int i) {
        IBranchDAO branchDAO = new BranchDAO();
        return branchDAO.GetAllBranchesExceptMe(i);  
    }

    @Override
    public ArrayList<DualBranchLocation> GetLocationsForRequestId(int i) {
        IBranchDAO branchDAO = new BranchDAO();
        return branchDAO.GetLocationsForRequestId(i); 
    }
    
}
