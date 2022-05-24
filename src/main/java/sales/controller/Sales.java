
package sales.controller;

import sales.service.BranchLogic;
import sales.service.IBranchLogic;
import sales.service.IProductLogic;
import sales.service.ISalesLogic;
import sales.service.ProductLogic;
import sales.service.SalesLogic;
import sales.models.Customer;
import sales.models.ProductType;
import sales.utils.CUD_Response;
import sales.utils.Sales_GetResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Type;
import java.util.ArrayList;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import sales.models.SalesDetail;
import sales.models.SalesObject;
import sales.models.Ticket;
import sales.utils.MailSender;


@WebServlet(name = "Sales", urlPatterns = {"/Sales.sales"})
public class Sales extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Sales</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sales at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int UserBranch = Integer.parseInt(request.getSession().getAttribute("Branch").toString());
        
        String BranchType = request.getSession().getAttribute("BType").toString();
        String UserType = request.getSession().getAttribute("Type").toString();
      
        if(!BranchType.equals("Head")){ 
            IBranchLogic branchLogic = new BranchLogic();  
            request.setAttribute("products", branchLogic.GetAllSubBranch());
            request.getRequestDispatcher("/WEB-INF/views/sales.jsp").forward(request, response);
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
        
               
        // customer
        String name = request.getParameter("name");
        String nic =request.getParameter("nic");
        String email = request.getParameter("email");
        String address =request.getParameter("address");
        String phone = request.getParameter("phone");
        
        //Sales
        String objs =request.getParameter("objs");
        String customerid = request.getParameter("customer");
        String amount =request.getParameter("amount");
        String mode = request.getParameter("mode");
        String tomail= request.getParameter("tomail");
        String content= request.getParameter("content");
        
        ISalesLogic salesLogic = new SalesLogic(); 
        if(action.equals("GetAllProductsAndCustomersExists"))
        {
                                  
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            Sales_GetResponse obj =new Sales_GetResponse(salesLogic.GetProductsBranchStoresHas(UserBranch),salesLogic.GetCustomersAlreadyIn());
            out.print(new Gson().toJson(obj));
            out.flush();
        }
        if(action.equals("CreateCustomer"))
        {
            
            Customer customer = new Customer(0,name,address,nic,email,phone,"","");
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(salesLogic.RegisterNewCustomerInSystem(customer)));
            out.flush();
        }
        if(action.equals("LogSales"))
        {
            
            Type salesListType = new TypeToken<ArrayList<SalesDetail>>(){}.getType();
            ArrayList<SalesDetail> salesDetails = new Gson().fromJson(objs, salesListType); 
            if(customerid == null || customerid.trim().length()< 1)
            {   Customer customer = new Customer(0,name,address,nic,email,phone,"","");
                customerid=String.valueOf( salesLogic.RegisterNewCustomerInSystem(customer)); 
            }
            SalesObject objectSales=new SalesObject(0,UserBranch,Integer.parseInt(customerid),Float.parseFloat(amount),"",mode);
            objectSales.setProductDetails(salesDetails);
            CUD_Response CUDresponse = new CUD_Response (salesLogic.LogTicket(new Ticket()) && MailSender.sendMail(tomail, content, "Invoice Copy"));
            
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
