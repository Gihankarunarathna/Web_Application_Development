
package sales.service;

import sales.dao.IProductDAO;
import sales.dao.ISalesDAO;
import sales.dao.ProductDAO;
import sales.dao.SalesDAO;
import sales.models.Customer;
import sales.models.ProductCompressed;
import sales.models.SalesDetail;
import sales.models.SalesObject;
import sales.models.Ticket;
import java.util.ArrayList;


public class SalesLogic implements ISalesLogic{

    @Override
    public int RegisterNewCustomerInSystem(Customer customer) {
       ISalesDAO salesDAO = new SalesDAO();
       return salesDAO.RegisterCustomer(customer);      
    }

    @Override
    public boolean LogTicket(Ticket salesObject) {
        
        ISalesDAO salesDAO = new SalesDAO();
        int result = salesDAO.LogTicket(salesObject);
        
        if(result > 0) return true;
        else return false;
    }
    
    @Override
    public Customer GetCustomer(int id){
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.GetCustomer(id);
    }
    
    @Override
    public Customer GetCustomer(String name){
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.GetCustomer(name);
    }

    @Override
    public ArrayList<Customer> GetCustomersAlreadyIn() {
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.GetAllCustomers();
    }
    
    @Override
    public boolean RemoveTicket(int id){
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.RemoveTicket(id);
    }

    @Override
    public ArrayList<ProductCompressed> GetProductsBranchStoresHas(int branchId) {
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.GetAllProductsUnderBranch(branchId);    
    }

    @Override
    public boolean UpdateStoresAfterReceived(int product, float amount, int branch) {
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.UpdateStoresAfterReceived(product,  amount,  branch);
    }

    @Override
    public boolean CreateStores(int product, float amount, int branch) {
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.CreateStores(product,  amount,  branch);
    }

    @Override
    public boolean UpdateCustomerInSystem(Customer customer) {
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.UpdateCustomer(customer);
    }

    @Override
    public boolean RemoveCustomerFromSystem(int customer) {
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.RemoveCustomer(customer);
    }
    @Override
    public ArrayList<Ticket> GetAllTicketsBooked(int flight){
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.GetAllTicketsBooked(flight);
    }
    
    @Override
    public ArrayList<Ticket> GetAllTicketsBooked(){
        ISalesDAO salesDAO = new SalesDAO();
        return salesDAO.GetAllTicketsBooked();
    }
    
}
