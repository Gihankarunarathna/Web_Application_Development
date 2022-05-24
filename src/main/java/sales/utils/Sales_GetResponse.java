
package sales.utils;

import sales.models.Customer;
import sales.models.ProductCompressed;
import java.util.ArrayList;


public class Sales_GetResponse {
    
    private ArrayList<ProductCompressed> products;
    private ArrayList<Customer> customers;

    public Sales_GetResponse(ArrayList<ProductCompressed> products, ArrayList<Customer> customers) {
        this.products = products;
        this.customers = customers;
    }

    public ArrayList<ProductCompressed> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<ProductCompressed> products) {
        this.products = products;
    }

    public ArrayList<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(ArrayList<Customer> customers) {
        this.customers = customers;
    }
    
    
}
