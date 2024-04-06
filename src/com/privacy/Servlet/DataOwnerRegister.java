package com.privacy.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.privacy.Implementation.Implementation;
import com.privacy.Interface.Interface;
import com.privacy.bean.Register;

/**
 * Servlet implementation class DataOwnerRegister
 */
@WebServlet("/DataOwnerRegister")
public class DataOwnerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataOwnerRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		if(password.equals(confirmPassword))
		{
			Register reg = new Register();
			reg.setName(name);
			reg.setEmail(email);
			reg.setPassword(password);
			
			Interface inter = new Implementation();
			int t = inter.DataOwnerRegister(reg);
			
			if(t!=0)
			{
				response.sendRedirect("DataOwnerRegister.jsp?success=1");
				
				
			}
			
		}
		
	}

}
