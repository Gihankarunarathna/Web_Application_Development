
package sales.controller;

import com.google.gson.Gson;
import sales.service.BranchLogic;
import sales.service.IBranchLogic;
import sales.service.IProductLogic;
import sales.service.ProductLogic;
import sales.models.Branch;
import sales.models.Product;
import sales.models.ProductType;
import sales.utils.CUD_Response;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sales.service.IUserLogic;
import sales.service.UserLogic;


@WebServlet(name = "ProductRegister", urlPatterns = {"/ProductRegister.sales"})
public class ProductRegister extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int UserBranch = Integer.parseInt(request.getSession().getAttribute("Branch").toString());
        String BranchType = request.getSession().getAttribute("BType").toString();
        String UserType = request.getSession().getAttribute("Type").toString();
        
        if(UserType.equals("Administrator") && BranchType.equals("Head")){ 
            IUserLogic uLogic = new UserLogic();           
            request.setAttribute("types", uLogic.GetLogs());         
            request.getRequestDispatcher("/WEB-INF/views/productRegister.jsp").forward(request, response);
        }
        else
        {
            request.getRequestDispatcher("/WEB-INF/views/error404.jsp").forward(request, response);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int UserBranch = Integer.parseInt(request.getSession().getAttribute("Branch").toString());
        
        String action = request.getParameter("action");
        String id =request.getParameter("id");
        String type = request.getParameter("type");
        
        String unitprice =request.getParameter("price");
        String description = request.getParameter("description");
        String stock =request.getParameter("stock");
        String product = request.getParameter("product");
        String measure =request.getParameter("measure");
        //String phone = request.getParameter("contact");
        
        if(action.equals("GetAllProductTypes"))
        {
            IProductLogic productLogic = new ProductLogic();                       
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(productLogic.GetAllTypes()));
            out.flush();
        }
        if(action.equals("CreateType"))
        {
            IProductLogic productLogic = new ProductLogic();
            ProductType productType = new ProductType(0,type,description);
            CUD_Response CUDresponse = new CUD_Response (productLogic.CreateProductType(productType));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("EditType"))
        {
            IProductLogic productLogic = new ProductLogic();
            ProductType productType = new ProductType(Integer.parseInt(id),type,description);
            CUD_Response CUDresponse = new CUD_Response (productLogic.UpdateProductType(productType));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("DeleteType"))
        {
            IProductLogic productLogic = new ProductLogic();
            //ProductType productType = new ProductType(Integer.parseInt(id),type);
            CUD_Response CUDresponse = new CUD_Response (productLogic.DeleteProductType(Integer.parseInt(id)));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        
        
        if(action.equals("CreateProduct"))
        {
            IProductLogic productLogic = new ProductLogic();
           
            Product productObj = new Product(0,Integer.parseInt(type),product,description,0,Float.parseFloat(unitprice),Integer.parseInt(stock),UserBranch,measure," ");
            CUD_Response CUDresponse = new CUD_Response (productLogic.CreateProduct(productObj));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("EditProduct"))
        {
            IProductLogic productLogic = new ProductLogic();
            //Product productObj = new Product(Integer.parseInt(id),Integer.parseInt(type),product,description,Float.parseFloat(unitprice),measure," ");            
            Product productObj = new Product(Integer.parseInt(id),Integer.parseInt(type),product,description,0,Float.parseFloat(unitprice),Integer.parseInt(stock),UserBranch,measure," ");               
            CUD_Response CUDresponse = new CUD_Response (productLogic.EditProductBasicDetails(productObj));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("DeleteProduct"))
        {
            IProductLogic productLogic = new ProductLogic();
            //ProductType productType = new ProductType(Integer.parseInt(id),type);
            CUD_Response CUDresponse = new CUD_Response (productLogic.DeleteProductFromStores(Integer.parseInt(id)));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
