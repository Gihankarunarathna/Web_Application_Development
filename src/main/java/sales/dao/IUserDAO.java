
package sales.dao;

import sales.models.SystemUser;
import java.util.ArrayList;
import sales.models.Log;


public interface IUserDAO {
    SystemUser GetUserById(int Id);
    SystemUser GetUserByEmailPassword(String Email, String Password);
    ArrayList<SystemUser> GetUsersUnderBranch(int branchId);
    boolean UpdateUserDetails(SystemUser systemUser);
    int CreateUserDetails(SystemUser systemUser);
    boolean DeleteUserDetails(int userId);
    int CreateLogDetails(Log log);
    ArrayList<Log> GetLogs();
    
}
