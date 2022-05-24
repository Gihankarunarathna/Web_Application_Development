
package sales.service;

import sales.models.SystemUser;
import java.util.ArrayList;
import sales.models.Log;


public interface IUserLogic {
    
    SystemUser getUserById(int Id);
    SystemUser getUserByEmailPassword(String Email, String Password);
    ArrayList<SystemUser> GetAllUsersUnderBranch(int branchId);
    boolean RemoveUserFromSystem(int UserId);
    boolean RegisterUserinSystem(SystemUser systemUser);
    boolean UpdateUserinSystem(SystemUser systemUser);
   
    int CreateLogDetails(Log log);
    ArrayList<Log> GetLogs();
}
