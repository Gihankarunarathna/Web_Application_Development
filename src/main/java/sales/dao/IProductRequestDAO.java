
package sales.dao;

import sales.models.ProductRequestDetail;
import sales.models.ProductRequest;
import java.util.ArrayList;


public interface IProductRequestDAO {
   int  CreateProductRequestHeader(ProductRequest productRequest);
   boolean  UpdateProductRequestHeader(String status, int id, int vehicle);
   boolean  CreateProductRequestDetail(ProductRequestDetail productRequestDetail);
   ArrayList<ProductRequest> GetProductRequestsUnderBranch(int branch);
   ArrayList<ProductRequest> GetProductRequestsUnderBranchReceived(int branch);
   ArrayList<ProductRequestDetail> GetProductRequestsDetaisUnderRequest(int request);
}
