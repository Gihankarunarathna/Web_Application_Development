
package sales.dao;

import sales.models.Branch;
import sales.models.Customer;
import sales.models.ProductCompressed;
import sales.models.SalesDetail;
import sales.models.SalesObject;
import sales.models.Ticket;
import sales.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import org.apache.commons.lang.NotImplementedException;


public class SalesDAO implements ISalesDAO{
    PreparedStatement pst = null;
    ResultSet rs = null;
    Connection connection = null;
    boolean status = false;
    
    @Override
    public int RegisterCustomer(Customer customer) {
        int result=0;
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("INSERT INTO customer ( `name`, `address`, `NIC`, `contact`, `email`, `password`,`updated`) VALUES ( ?,?,?,?, ?,?,?);", Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, customer.getName());
            pst.setString(2, customer.getAddress());
            pst.setString(3, customer.getPassport());
            pst.setString(4, customer.getPhone());
            pst.setString(5, customer.getEmail());
            pst.setString(6, customer.getPassword());
            pst.setString(7, customer.getUpdatedBy());
            
           int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                rs = pst.getGeneratedKeys();
                if (rs.next()) {
                  result = rs.getInt(1);                 
                }
                
            }  
        }
        catch (Exception e) {
            e.printStackTrace();
            
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }

    @Override
    public ArrayList<Customer> GetAllCustomers() {
       ArrayList<Customer> result= new ArrayList<Customer>();
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Select * from customer;");
            
           
            rs = pst.executeQuery();
            int count = 0;
 
            while (rs.next()){
                int id = rs.getInt(1);
                String nic = rs.getString(2);
                String name = rs.getString(3);
                String address = rs.getString(4);
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String pwd = rs.getString(7);
                String updted = rs.getString(8);
                result.add(new Customer(id,name,address,nic,email,phone, pwd, updted));

            } 
        }
        catch (Exception e) {
            e.printStackTrace();
            
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }

    @Override
    public Customer GetCustomer(int _id) {
       ArrayList<Customer> result= new ArrayList<Customer>();
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Select * from customer where Id= ?;");
            pst.setInt(1, _id);
           
            rs = pst.executeQuery();
            int count = 0;
 
            while (rs.next()){
                int id = rs.getInt(1);
                String nic = rs.getString(2);
                String name = rs.getString(3);
                String address = rs.getString(4);
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String pwd = rs.getString(7);
                String updted = rs.getString(8);
                result.add(new Customer(id,name,address,nic,email,phone, pwd, updted));

            } 
        }
        catch (Exception e) {
            e.printStackTrace();
            
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        if(result.size()> 0)
            return result.get(0);
        else
            return null;
    }
    
    
    @Override
    public Customer GetCustomer(String _id) {
       ArrayList<Customer> result= new ArrayList<Customer>();
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Select * from customer where name= ?;");
            pst.setString(1, _id);
           
            rs = pst.executeQuery();
            int count = 0;
 
            while (rs.next()){
                int id = rs.getInt(1);
                String nic = rs.getString(2);
                String name = rs.getString(3);
                String address = rs.getString(4);
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String pwd = rs.getString(7);
                String updted = rs.getString(8);
                result.add(new Customer(id,name,address,nic,email,phone, pwd, updted));

            } 
        }
        catch (Exception e) {
            e.printStackTrace();
            
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        if(result.size()> 0)
            return result.get(0);
        else
            return null;
    }
    
    
    @Override
    public boolean RemoveTicket(int id){
        boolean result=false;
        try
        {
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Delete from tickets where `id` = ?;");
            
            pst.setInt(1, id);
           
            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                result= true;
            }  
        }
        catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }
    
    @Override
    public int LogTicket(Ticket tk) {
       int result= 0;
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("INSERT INTO tickets ( `flight`,`customer`,`seatno`,`createdby`,`price`,`customer_`, `flight_`) VALUES (?, ?,?,?,?, ?,?);", Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, tk.getFlight());
            pst.setInt(2, tk.getCustomer());
            pst.setString(3, tk.getSeatNo() );
            pst.setFloat(5, tk.getPrice());
            pst.setString(4, tk.getCreatedBy());
            pst.setString(6, tk.getCustomerName());
            pst.setString(7, tk.getFlightName());
           
            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                rs = pst.getGeneratedKeys();
                if (rs.next()) {
                  result = rs.getInt(1);                 
                }
                
            }  
        }
        catch (Exception e) {
            e.printStackTrace();
            
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }

    @Override
    public boolean LogSalesDetails(SalesDetail sd) {
       return false;
    }

    @Override
    public ArrayList<ProductCompressed> GetAllProductsUnderBranch(int id) {
        throw new NotImplementedException();
    }
    
    @Override
    public ArrayList<Ticket> GetAllTicketsBooked() {
        ArrayList<Ticket> result= new ArrayList<Ticket>();
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Select * from tickets;");
            //pst.setInt(1, flight);
           
            rs = pst.executeQuery();
            int count = 0;
 
            while (rs.next()){
                int id = rs.getInt(1);
                int flightid = rs.getInt(2);
                int cusId = rs.getInt(3);
                String seatno = rs.getString(4);
                String createdby = rs.getString(5);
                Float price = rs.getFloat(6);
                String cus = rs.getString(7);
                String flightname = rs.getString(8);
                result.add(new Ticket(id,price,cusId,flightid,cus,flightname,createdby,seatno));

            } 
        }
        catch (Exception e) {
            e.printStackTrace();
            
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        
            return result;
        
    }

    @Override
    public ArrayList<Ticket> GetAllTicketsBooked(int flight) {
        ArrayList<Ticket> result= new ArrayList<Ticket>();
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Select * from tickets where flight= ?;");
            pst.setInt(1, flight);
           
            rs = pst.executeQuery();
            int count = 0;
 
            while (rs.next()){
                int id = rs.getInt(1);
                int flightid = rs.getInt(2);
                int cusId = rs.getInt(3);
                String seatno = rs.getString(4);
                String createdby = rs.getString(5);
                Float price = rs.getFloat(6);
                String cus = rs.getString(7);
                String flightname = rs.getString(8);
                result.add(new Ticket(id,price,cusId,flightid,cus,flightname,createdby,seatno));

            } 
        }
        catch (Exception e) {
            e.printStackTrace();
            
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        
            return result;
        
    }
    
    
    @Override
    public boolean UpdateStoresAfterSales(int product, float amount, int branch) {
        System.out.println("value-"+product+" -"+amount+" -"+branch);
        boolean result=false;
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Update stores set  `quantity` =(quantity- ?) where `branch`=? and `product`=?;");
            pst.setFloat(1, amount);
            pst.setInt(2, branch);
            pst.setInt(3, product);
            
            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                result= true;
            }  
        }
        catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }

    @Override
    public boolean UpdateStoresAfterReceived(int product, float amount, int branch) {
       boolean result=false;
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Update stores set  `quantity` =(quantity+ ?) where `branch`=? and `product`=?;");
            pst.setFloat(1, amount);
            pst.setInt(2, branch);
            pst.setInt(3, product);
            
            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                result= true;
            }  
        }
        catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }

    @Override
    public boolean CreateStores(int product, float amount, int branch) {
        boolean result=false;
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("insert into stores (`quantity`, `branch`, `product`) values(?,?,?) ;");
            pst.setFloat(1, amount);
            pst.setInt(2, branch);
            pst.setInt(3, product);
            
            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                result= true;
            }  
        }
        catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }

    @Override
    public boolean UpdateStores(int product, float amount, int branch) {
        boolean result=false;
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Update stores set  `quantity` = ? where `branch`=? and `product`=?;");
            pst.setFloat(1, amount);
            pst.setInt(2, branch);
            pst.setInt(3, product);
            
            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                result= true;
            }  
        }
        catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }

    @Override
    public boolean UpdateCustomer(Customer customer) {
        boolean result=false;
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Update customer set `name`=?, `address`=?, `NIC`=?, `contact`=?, `email`=?, `updated`=? where `Id`=?;");
            pst.setString(1, customer.getName());
            pst.setString(2, customer.getAddress());
            pst.setString(3, customer.getPassport());
            pst.setString(4, customer.getPhone());
            pst.setString(5, customer.getEmail());
            pst.setString(6, customer.getUpdatedBy());
            pst.setInt(7, customer.getId());            
           
            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                result= true;
            }  
        }
        catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }

    @Override
    public boolean RemoveCustomer(int customerId) {
        boolean result=false;
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("Delete from customer where `Id`=?;");
            
            pst.setInt(1, customerId);            
           
            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                result= true;
            }  
        }
        catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }

    @Override
    public int RetreiveAvailableQuantity(int branch, int product) {
        int result= 0;
        try
        {
            
            connection = DBConnection.getInstance().connection;        
            pst = connection.prepareStatement("select quantity from stores where product = ? and branch =?;");
            pst.setInt(1, product);
            pst.setInt(2, branch);
           
            rs = pst.executeQuery();
            int count = 0;
 
            while (rs.next()){
                result = rs.getInt(1);
            } 
        }
        catch (Exception e) {
            e.printStackTrace();
            
        }

        finally {
        	if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
           
        }
        System.out.println("amount here -"+result);
        System.out.println("values here -"+branch +","+product);
        return result;
    }

    
    
}
