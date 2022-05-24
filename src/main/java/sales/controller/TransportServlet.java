
package sales.controller;

import com.google.gson.Gson;
import sales.service.BranchLogic;
import sales.service.IBranchLogic;
import sales.service.ITransportLogic;
import sales.service.TransportLogic;
import sales.models.Branch;
import sales.models.Driver;
import sales.models.Vehicle;
import sales.utils.CUD_Response;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sales.models.Ticket;
import sales.service.ISalesLogic;
import sales.service.SalesLogic;


@WebServlet(name = "TransportServlet", urlPatterns = {"/TransportServlet.sales"})
public class TransportServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TransportServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransportServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        int UserBranch = Integer.parseInt(request.getSession().getAttribute("Branch").toString());
       
        String action = request.getParameter("action");
        String id =request.getParameter("id");
        String model = request.getParameter("model");
        String flightname =request.getParameter("name");
        String departure = request.getParameter("departure");
        String to =request.getParameter("to");
        String seats = request.getParameter("seats");
        
        String branch = request.getParameter("branch");
        String driver = request.getParameter("driver");
        String date= request.getParameter("adate");
        
        String fullName = request.getParameter("fullname");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String contact = request.getParameter("contact");
        String vehicleId = request.getParameter("vehicle");
        
        String fno = request.getParameter("fno");
        String cno = request.getParameter("cno");
        String price = request.getParameter("price");
        String seatno = request.getParameter("seatno");
        
        if(driver != null)
        {
        if(driver.trim().length()< 1)   driver = "0";
        }
        else if(driver == null)
        {
           driver = "0";
        }
        
        if(vehicleId != null)
        {
        if(vehicleId.trim().length()< 1)   vehicleId = "0";
        }
        else if(vehicleId == null)
        {
           vehicleId = "0";
        }
        
        
        
        if(action.equals("CreateVehicle"))
        {
            ITransportLogic transportLogic = new TransportLogic();
            Vehicle vehicle = new Vehicle(0,model,flightname,to,Integer.parseInt(seats),departure,"");
            CUD_Response CUDresponse = new CUD_Response (transportLogic.RegisterVehicleInSystem(vehicle));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("EditVehicle"))
        {
            ITransportLogic transportLogic = new TransportLogic();
            Vehicle vehicle = new Vehicle(Integer.parseInt(id),model,flightname,to,Integer.parseInt(seats),departure,"");
            CUD_Response CUDresponse = new CUD_Response (transportLogic.UpdateVehicleProfile(vehicle));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("DeleteVehicle"))
        {
            ITransportLogic transportLogic = new TransportLogic();
            //Vehicle vehicle = new Vehicle(Integer.parseInt(id),plate,chassis,Float.parseFloat(kms),fuel, transmission,Integer.parseInt(branch),0 ,Integer.parseInt(driver));
            CUD_Response CUDresponse = new CUD_Response (transportLogic.DeleteVehicleFromSystem(Integer.parseInt(id)));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("CreateDriver"))
        {
            boolean res = false;
            ISalesLogic salesLogic = new SalesLogic();
            int seatsCount = Integer.parseInt(seatno);
            for(int x= 0; x< seatsCount; x++){
                String flightName= new TransportLogic().GetVehicleById(Integer.parseInt(fno)).getName();
                String seat_ = flightName +(salesLogic.GetAllTicketsBooked(Integer.parseInt(fno)).size()+1);
                String cusName = salesLogic.GetCustomer(Integer.parseInt(cno)).getName();
                Ticket salesObject = new Ticket(0,Float.parseFloat(price),Integer.parseInt(cno),Integer.parseInt(fno),cusName,flightName,"",seat_);
                res = salesLogic.LogTicket(salesObject);
            }
            CUD_Response CUDresponse = new CUD_Response (res);
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        if(action.equals("EditDriver"))
        {
            ITransportLogic transportLogic = new TransportLogic();
            Driver driverObj = new Driver(Integer.parseInt(id), fullName,address,nic,contact,Integer.parseInt(branch),Integer.parseInt(vehicleId));
            CUD_Response CUDresponse = new CUD_Response (transportLogic.UpdateDriverProfile(driverObj));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        
        if(action.equals("DeleteDriver"))
        {
            ISalesLogic salesLogic = new SalesLogic();
            //Vehicle vehicle = new Vehicle(Integer.parseInt(id),plate,chassis,Float.parseFloat(kms),fuel, transmission,Integer.parseInt(branch),0 ,Integer.parseInt(driver));
            CUD_Response CUDresponse = new CUD_Response (salesLogic.RemoveTicket(Integer.parseInt(id)));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
        }
        
        if(action.equals("GetFreeVehicles"))
        {
            ITransportLogic transportLogic = new TransportLogic();
            //Vehicle vehicle = new Vehicle(Integer.parseInt(id),plate,chassis,Float.parseFloat(kms),fuel, transmission,Integer.parseInt(branch),0 ,Integer.parseInt(driver));
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(transportLogic.GetFreeVehiclesUnderBranch(UserBranch)));
            out.flush();
        }
        
        if(action.equals("GetVehicleForDriver"))
        {
            ITransportLogic transportLogic = new TransportLogic();
            //Vehicle vehicle = new Vehicle(Integer.parseInt(id),plate,chassis,Float.parseFloat(kms),fuel, transmission,Integer.parseInt(branch),0 ,Integer.parseInt(driver));
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(transportLogic.GetVehicleById(Integer.parseInt(driver))));
            out.flush();
        }
        
        if(action.equals("GetDriverForVehicle"))
        {
            ITransportLogic transportLogic = new TransportLogic();
            //Vehicle vehicle = new Vehicle(Integer.parseInt(id),plate,chassis,Float.parseFloat(kms),fuel, transmission,Integer.parseInt(branch),0 ,Integer.parseInt(driver));
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(transportLogic.GetDriverForVehicle(Integer.parseInt(vehicleId))));
            out.flush();
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
