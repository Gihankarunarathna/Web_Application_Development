
package sales.service;

import sales.dao.IProductDAO;
import sales.dao.ISalesDAO;
import sales.dao.ITransportDAO;
import sales.dao.IUserDAO;
import sales.dao.ProductDAO;
import sales.dao.SalesDAO;
import sales.dao.TransportDAO;
import sales.dao.UserDAO;
import sales.models.Product;
import sales.models.ProductType;
import sales.models.Return;
import sales.models.ReturnsSummary;
import java.util.ArrayList;


public class ProductLogic implements IProductLogic {

    @Override
    public boolean CreateProductType(ProductType productType) {
       IProductDAO productDAO = new ProductDAO();
       return productDAO.CreateProductType(productType);  
    }

    @Override
    public boolean UpdateProductType(ProductType productType) {
       IProductDAO productDAO = new ProductDAO();
       return productDAO.UpdateProductType(productType);    
    }

    @Override
    public boolean DeleteProductType(int productType) {
        IProductDAO productDAO = new ProductDAO();
        return productDAO.DeleteProductType(productType);
    }

    @Override
    public ProductType GetTypeById(int id) {
        IProductDAO productDAO = new ProductDAO();
        return productDAO.GetTypeById(id);
    }

    @Override
    public ArrayList<ProductType> GetAllTypes() {
       IProductDAO productDAO = new ProductDAO();
       return productDAO.GetAllTypes();  
    }

    @Override
    public boolean CreateProduct(Product prdct) {
       IProductDAO productDAO = new ProductDAO();
       ISalesDAO salesDAO = new SalesDAO();
       int id=productDAO.CreateProduct(prdct);
       if(id > 0)
       return salesDAO.CreateStores(id ,  prdct.getAvailbleUnits(),  prdct.getBranchId());
       else
       return false;
    }

    @Override
    public boolean EditProductBasicDetails(Product prdct) {
       IProductDAO productDAO = new ProductDAO();
       ISalesDAO salesDAO = new SalesDAO();
       return productDAO.UpdateProductDetails(prdct) && salesDAO.UpdateStores(prdct.getId(), prdct.getAvailbleUnits(),  prdct.getBranchId());
    }

    @Override
    public boolean DeleteProductFromStores(int id) {
      IProductDAO productDAO = new ProductDAO();
      return productDAO.DeleteProduct(id);
    }

    @Override
    public ArrayList<Product> GetAllProducts(int branch) {
      IProductDAO productDAO = new ProductDAO();
      return productDAO.GetAllProducts(branch);
    }

    @Override
    public ArrayList<Product> GetAllProductsUnderBranch(int branch) {
      IProductDAO productDAO = new ProductDAO();
      return productDAO.GetProductsUnderBranch(branch);
    }

    @Override
    public int CreateUpdateReturn(Return r) {
        IProductDAO productDAO = new ProductDAO();
      return productDAO.CreateUpdateReturn(r);
    }

    @Override
    public ArrayList<ReturnsSummary> GetReturnsByProducts() {
        IProductDAO productDAO = new ProductDAO();
      return productDAO.GetReturnsByProducts();
    }

    @Override
    public ArrayList<Product> GetAllProductsNew() {
        IProductDAO productDAO = new ProductDAO();
        return productDAO.GetAllProductsNew();
    }
    
    
    
    
}
