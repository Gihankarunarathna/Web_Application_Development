
package sales.service;

import sales.models.ProductRequest;
import java.util.ArrayList;


public interface IProductRequestLogic {
    boolean LogRequests(ProductRequest productRequest);
    boolean  UpdateProductRequestHeader(String status, int id, int vehicle);
    ArrayList<ProductRequest> GetRequestsByBranch(int branch );
    ArrayList<ProductRequest> GetRequestsByBranchReceived(int branch );
    boolean StateRequest(int ProductRequest, int SourceBranch, int DestBrnch);
}
