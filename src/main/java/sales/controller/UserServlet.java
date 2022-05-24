
package sales.controller;

import com.google.gson.Gson;
import sales.service.BranchLogic;
import sales.service.IBranchLogic;
import sales.service.IUserLogic;
import sales.service.UserLogic;
import sales.models.Branch;
import sales.models.SystemUser;
import sales.utils.CUD_Response;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sales.models.Customer;
import sales.models.Ticket;
import sales.service.ISalesLogic;
import sales.service.ITransportLogic;
import sales.service.SalesLogic;
import sales.service.TransportLogic;


@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet.sales"})
public class UserServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ISalesLogic salesLogic = new SalesLogic();
        ITransportLogic transportLogic = new TransportLogic();
        List<Ticket> filteredArticleList= new ArrayList<Ticket>();
        List<Customer> filteredcus= new ArrayList<Customer>();
        for(Ticket t : salesLogic.GetAllTicketsBooked() ){
            if(t.getCustomerName().equals(request.getSession().getAttribute("Name"))){
                  filteredArticleList.add(t);
            }
        }
        for(Customer t : salesLogic.GetCustomersAlreadyIn() ){
            if(t.getEmail().equals(request.getSession().getAttribute("name"))){
                  filteredcus.add(t);
            }
        }
        request.setAttribute("cus", filteredcus);
        request.setAttribute("vehicles", transportLogic.GetVehiclesUnderBranch(3));
        if(filteredArticleList.size() > 0)
         request.setAttribute("drivers", filteredArticleList);
        else
         request.setAttribute("drivers", null);
        request.getRequestDispatcher("/WEB-INF/views/productDetails.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String id =request.getParameter("id");        String username = request.getParameter("username");
        String branch =request.getParameter("branch");
        String address = request.getParameter("address");
        String userType =request.getParameter("type");
        String nic = request.getParameter("nic");
        String email =request.getParameter("email");
        String phone = request.getParameter("contact");
        String password = request.getParameter("password"); 
        String salt = request.getParameter("salt");
        String stat = request.getParameter("status");
        String name = request.getParameter("name");
        if(action.equals("CreateUser"))
        {
            IUserLogic userLogic = new UserLogic();
            SystemUser systemUser = new SystemUser(0,username,email,password,Integer.parseInt(branch),phone,"",userType,nic,address, Integer.parseInt(stat));
            CUD_Response CUDresponse = new CUD_Response (userLogic.RegisterUserinSystem(systemUser));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("EditUser"))
        {
            IUserLogic userLogic = new UserLogic();
            SystemUser systemUser = new SystemUser(Integer.parseInt(id),username,email,password,Integer.parseInt(branch),phone,salt,userType,nic,address, Integer.parseInt(stat));
            CUD_Response CUDresponse = new CUD_Response (userLogic.UpdateUserinSystem(systemUser));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("DeleteUser"))
        {
            IUserLogic userLogic = new UserLogic();
            //SystemUser systemUser = new SystemUser(Integer.parseInt(id),username,email,password,Integer.parseInt(branch),phone,"",userType);
            CUD_Response CUDresponse = new CUD_Response (userLogic.RemoveUserFromSystem(Integer.parseInt(id)));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        else{
            // register logic
            System.out.println("entere to register zone");
            IUserLogic userLogic = new UserLogic();
            SystemUser systemUser = new SystemUser(0,username,email,password,3,phone,"Ef6enz4Pdj",userType,nic,"", 0);
            userLogic.RegisterUserinSystem(systemUser);
            
            if(!userType.contains("Staff")){
                // for customers create customer profile
                ISalesLogic salesLogic = new SalesLogic();
                salesLogic.RegisterNewCustomerInSystem(new Customer(0,name,"",nic,email,phone,password,email));
            }
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(
                    request, response);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
