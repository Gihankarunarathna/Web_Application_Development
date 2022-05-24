
package sales.service;

import sales.models.Customer;
import sales.models.ProductCompressed;
import sales.models.SalesObject;
import sales.models.Ticket;
import java.util.ArrayList;


public interface ISalesLogic {
    
    int RegisterNewCustomerInSystem(Customer customer);
    boolean UpdateCustomerInSystem(Customer customer);
    boolean RemoveCustomerFromSystem(int customer);
    Customer GetCustomer(int id);   
    Customer GetCustomer(String name);
    boolean LogTicket(Ticket salesObject);
    ArrayList<Customer> GetCustomersAlreadyIn();
    boolean RemoveTicket(int id);
    ArrayList<ProductCompressed> GetProductsBranchStoresHas(int branchId);  
    
    boolean UpdateStoresAfterReceived(int product, float amount, int branch);
    boolean CreateStores(int product, float amount, int branch);
    
    ArrayList<Ticket> GetAllTicketsBooked(int flight);
    ArrayList<Ticket> GetAllTicketsBooked();
    
}
