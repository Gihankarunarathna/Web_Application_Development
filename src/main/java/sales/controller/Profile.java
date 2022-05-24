/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sales.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sales.models.Customer;
import sales.models.Log;
import sales.service.SalesLogic;
import sales.service.UserLogic;
import sales.utils.CUD_Response;

/**
 *
 * @author VSAWMRU
 */
@WebServlet(name = "Profile", urlPatterns = {"/Profile.sales"})
public class Profile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Profile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Profile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("cust", new SalesLogic().GetCustomer(request.getSession().getAttribute("Name").toString()));
        request.getRequestDispatcher("/WEB-INF/views/profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nic = request.getParameter("nic");
        String email =request.getParameter("email");
        String phone = request.getParameter("contact");
        String address = request.getParameter("address");        
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        System.out.println(nic+","+email+","+phone+","+address+","+name+","+id);
        Customer customer = new SalesLogic().GetCustomer(Integer.parseInt(id));
        Customer cus = new Customer(Integer.parseInt(id),name,address,nic,email,phone,customer.getPassword(),email);
        
        String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        new UserLogic().CreateLogDetails(new Log(0,email+" user updated his profile at- "+ date));
        
        CUD_Response CUDresponse = new CUD_Response (new SalesLogic().UpdateCustomerInSystem(cus));
            
            response.setContentType("application/json");
            // Get the printwriter object from response to write the required json object to the output stream      
            PrintWriter out = response.getWriter();
            // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
            out.print(new Gson().toJson(CUDresponse));
            out.flush();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
