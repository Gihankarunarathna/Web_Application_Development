
package sales.dao;

import sales.models.Customer;
import sales.models.ProductCompressed;
import sales.models.SalesDetail;
import sales.models.SalesObject;
import sales.models.Ticket;
import java.util.ArrayList;


public interface ISalesDAO {
    
    int RegisterCustomer(Customer customer);
    boolean UpdateCustomer(Customer customer);
    boolean RemoveCustomer(int customerId);
    Customer GetCustomer(String _id);

    Customer GetCustomer(int _id);
    ArrayList<Customer> GetAllCustomers();
    ArrayList<ProductCompressed> GetAllProductsUnderBranch(int branch);
    int LogTicket(Ticket tk);
    boolean RemoveTicket(int id);
    boolean LogSalesDetails(SalesDetail salesDetail);
    boolean UpdateStoresAfterSales(int product, float amount, int branch);
    boolean UpdateStoresAfterReceived(int product, float amount, int branch);
    boolean CreateStores(int product, float amount, int branch);
    boolean UpdateStores(int product, float amount, int branch);
    int RetreiveAvailableQuantity(int branch , int product);
    
    ArrayList<Ticket> GetAllTicketsBooked(int flight);
    ArrayList<Ticket> GetAllTicketsBooked();
    
}
