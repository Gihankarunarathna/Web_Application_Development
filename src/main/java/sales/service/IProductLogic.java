
package sales.service;

import sales.models.Product;
import sales.models.ProductType;
import sales.models.Return;
import sales.models.ReturnsSummary;
import java.util.ArrayList;


public interface IProductLogic {
    
    boolean CreateProductType(ProductType productType);
    boolean UpdateProductType(ProductType productType);
    boolean DeleteProductType(int productType);
    ProductType GetTypeById(int id);
    ArrayList<ProductType> GetAllTypes();
    
    boolean CreateProduct(Product product);
    boolean EditProductBasicDetails(Product product);
    boolean DeleteProductFromStores(int productType);
    ArrayList<Product> GetAllProducts(int branchId);
    ArrayList<Product> GetAllProductsUnderBranch(int branchId);
    
    int CreateUpdateReturn(Return ReturnObj);
    ArrayList<ReturnsSummary> GetReturnsByProducts();
    ArrayList<Product> GetAllProductsNew();
}
