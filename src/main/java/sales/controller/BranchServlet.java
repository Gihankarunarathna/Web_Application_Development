
package sales.controller;

import com.google.gson.Gson;
import sales.service.BranchLogic;
import sales.service.IBranchLogic;
import sales.service.IProductRequestLogic;
import sales.service.ITransportLogic;
import sales.service.IUserLogic;
import sales.service.ProductRequestLogic;
import sales.service.TransportLogic;
import sales.service.UserLogic;
import sales.models.Branch;
import sales.models.Driver;
import sales.models.Vehicle;
import sales.utils.CUD_Response;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sales.service.ISalesLogic;
import sales.service.SalesLogic;


@WebServlet(name = "BranchServlet", urlPatterns = {"/BranchServlet.sales"})
public class BranchServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BranchServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BranchServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int UserBranch = Integer.parseInt(request.getSession().getAttribute("Branch").toString());
        String branchId =request.getParameter("branch");
        String BranchType = request.getSession().getAttribute("BType").toString();
        String UserType = request.getSession().getAttribute("Type").toString();
        System.out.println("Object values "+BranchType+UserType); // && UserType.equals("Administrator")    && UserType.equals("Administrator")
        if((BranchType.equals("Head") ) || (UserBranch==Integer.parseInt(branchId)) ){
        String oid = request.getParameter("oid");
        IBranchLogic branchLogic = new BranchLogic();
        ITransportLogic transportLogic = new TransportLogic();
        ISalesLogic salesLogic = new SalesLogic();
        IUserLogic userLogic = new UserLogic();
        IProductRequestLogic productRequestLogic = new ProductRequestLogic();
        request.setAttribute("systemUsers", userLogic.GetAllUsersUnderBranch(Integer.parseInt(branchId)));
        request.setAttribute("drivers", salesLogic.GetAllTicketsBooked());
        request.setAttribute("cus", salesLogic.GetCustomersAlreadyIn());
        request.setAttribute("vehicles", transportLogic.GetVehiclesUnderBranch(UserBranch));
        request.setAttribute("branch_detail", branchLogic.GetBranchById(Integer.parseInt(branchId)));
        request.setAttribute("free_drivers", new ArrayList<Driver>());
        request.setAttribute("vehicles_noD", new ArrayList<Vehicle>());
        request.setAttribute("own_requests", new ArrayList<ProductRequest>());
        request.setAttribute("r_requests", productRequestLogic.GetRequestsByBranchReceived(Integer.parseInt(branchId)));
        
        if(oid != null )
        {
           ArrayList<sales.models.ProductRequest> secondList = new ArrayList<sales.models.ProductRequest>();

                for( sales.models.ProductRequest item : productRequestLogic.GetRequestsByBranch(Integer.parseInt(branchId))) { 
                // or equalsIgnoreCase or whatever your conditon is
                if (item.getId() == Integer.parseInt(oid)  ) {
                // do something 
                secondList.add(item);
                }
                } 
           
           request.setAttribute("own_request", secondList);
        }
        request.getRequestDispatcher("/WEB-INF/views/branch.jsp").forward(request, response);
        }
        else
        {
            request.getRequestDispatcher("/WEB-INF/views/error404.jsp").forward(request, response);
        }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        String action = request.getParameter("action");
        String id =request.getParameter("id");
        String name = request.getParameter("name");
        String city =request.getParameter("city");
        String address = request.getParameter("address");
        String longtitude =request.getParameter("long");
        String latitude = request.getParameter("lati");
        String email =request.getParameter("email");
        String phone = request.getParameter("contact");
        
        
                
                
        String branchid = request.getParameter("branch");
        
        Branch branch = new Branch(0,name,city,longtitude, latitude,address, phone,email, "Sub");
        if(action.equals("oidget"))
        {
            IProductRequestLogic productRequestLogic = new ProductRequestLogic();
            ArrayList<sales.models.ProductRequest> secondList = new ArrayList<sales.models.ProductRequest>();

                for( sales.models.ProductRequest item : productRequestLogic.GetRequestsByBranch(Integer.parseInt(branchid))) { 
                // or equalsIgnoreCase or whatever your conditon is
                if (item.getId() == Integer.parseInt(id)  ) {
                // do something 
                secondList.add(item);
                }
                } 
   
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(secondList));
            out.flush();
        }
        
        if(action.equals("ridget"))
        {
            IProductRequestLogic productRequestLogic = new ProductRequestLogic();
            ArrayList<sales.models.ProductRequest> secondList = new ArrayList<sales.models.ProductRequest>();

                for( sales.models.ProductRequest item : productRequestLogic.GetRequestsByBranchReceived(Integer.parseInt(branchid))) { 
                // or equalsIgnoreCase or whatever your conditon is
                if (item.getId() == Integer.parseInt(id)  ) {
                // do something 
                secondList.add(item);
                }
                } 
   
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(secondList));
            out.flush();
        }
        
        
        
        if(action.equals("CreateBranch"))
        {
            IBranchLogic branchLogic = new BranchLogic();
            
            CUD_Response CUDresponse = new CUD_Response (branchLogic.CreateSubBranch((Branch)branch.getCloneObject()));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("EditBranch"))
        {
            IBranchLogic branchLogic = new BranchLogic();
            branch.setId(Integer.parseInt(id));
            CUD_Response CUDresponse = new CUD_Response (branchLogic.UpdateSubBranch((Branch)branch.getCloneObject()));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("DeleteBranch"))
        {
            IBranchLogic branchLogic = new BranchLogic();
            CUD_Response CUDresponse = new CUD_Response (branchLogic.DeleteSpecificSubBranch(Integer.parseInt(id)));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        
        if(action.equals("GetLocations"))
        {
            IBranchLogic branchLogic = new BranchLogic();
            //Branch branch = new Branch(0,name,city,longtitude, latitude,address, phone,email, "Sub");
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(branchLogic.GetLocationsForRequestId(Integer.parseInt(id))));
            out.flush();
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
