
package sales.utils;

import sales.models.Branch;
import sales.models.Customer;
import sales.models.Product;
import sales.models.ProductCompressed;
import java.util.ArrayList;


public class Requests_GetResponse {
      private ArrayList<Product> products;
      private ArrayList<Branch> branches;

    public Requests_GetResponse(ArrayList<Product> products, ArrayList<Branch> branches) {
        this.products = products;
        this.branches = branches;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    public ArrayList<Branch> getBranches() {
        return branches;
    }

    public void setBranches(ArrayList<Branch> branches) {
        this.branches = branches;
    }
      
      
}
