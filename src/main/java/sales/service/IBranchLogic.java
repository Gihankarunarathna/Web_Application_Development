
package sales.service;

import sales.models.Branch;
import sales.models.DualBranchLocation;
import java.util.ArrayList;


public interface IBranchLogic {
    
   boolean CreateSubBranch(Branch branch);
   ArrayList<Branch> GetAllSubBranch();
   boolean UpdateSubBranch(Branch branch);
   boolean DeleteSpecificSubBranch(int branchId);
   Branch GetBranchById(int id);
   ArrayList<Branch> GetAllBranchesExceptMe(int me);
   ArrayList<DualBranchLocation> GetLocationsForRequestId(int id);
}
