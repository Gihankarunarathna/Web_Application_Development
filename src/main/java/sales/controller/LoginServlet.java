
package sales.controller;

import sales.service.BranchLogic;
import sales.service.IBranchLogic;
import sales.service.IUserLogic;
import sales.service.UserLogic;
import sales.models.Branch;
import sales.models.SystemUser;
import sales.utils.MailSender;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet.sales"})
public class LoginServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request,HttpServletResponse response)
    		throws ServletException, IOException {
        String BranchType=null, UserType=null;
        if(request.getSession().getAttribute("BType") != null){
         BranchType = request.getSession().getAttribute("BType").toString();
         UserType = request.getSession().getAttribute("Type").toString();
        }
        if(UserType != null && BranchType != null ){
            int UserBranch = Integer.parseInt(request.getSession().getAttribute("Branch").toString());
            if(UserType.equals("Administrator"))
                  response.sendRedirect(request.getContextPath() + "/BranchServlet.sales?branch="+UserBranch);
                else
                  response.sendRedirect(request.getContextPath() + "/BranchServlet.sales?branch="+UserBranch);   // "/Sales.sales"
        }
        else
        {
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
        
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String n = request.getParameter("name");
        String p = request.getParameter("password");
         
        IUserLogic userLogic = new UserLogic();
        SystemUser user =userLogic.getUserByEmailPassword(n, p);
        if(user != null){
                System.out.println("Entere to Zone");
                IBranchLogic branchLogic = new BranchLogic();
                Branch userBranch= branchLogic.GetBranchById(user.getBranchId());
//             RequestDispatcher rd = request.getRequestDispatcher("todo.jsp");
//             rd.forward(request,response);
        	request.getSession().setAttribute("name",n);
                request.getSession().setAttribute("Branch",user.getBranchId());
                request.getSession().setAttribute("Type",user.getUserType());
                request.getSession().setAttribute("User",user.getId());
                request.getSession().setAttribute("Name",user.getUsername());
                request.getSession().setAttribute("BType",userBranch.getType());
                request.getSession().setAttribute("Fname",user.getUsername());
		String originalUrl = request.getRequestURL().toString();
		String baseUrl = originalUrl.substring(0, originalUrl.length() - request.getRequestURI().length()) + request.getContextPath();
		if(user.getUserType().equals("Administrator"))
                  response.sendRedirect(baseUrl + "/BranchServlet.sales?branch="+user.getBranchId());
                else if(user.getUserType().contains("Staff"))
                  //response.sendRedirect(baseUrl + "/Sales.sales"); 
                    response.sendRedirect(baseUrl + "/BranchServlet.sales?branch="+user.getBranchId());
                else{
                    response.sendRedirect(baseUrl + "/UserServlet.sales"); 
                }
        }
        else{
            request.setAttribute("errorMessage", "Invalid Credentials!");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(
                    request, response);
        }

    }
}
