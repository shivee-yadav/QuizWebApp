package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Reg;

/**
 * Servlet implementation class Regcontroller
 */
@WebServlet("/Regcontroller")
public class Regcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regcontroller() {
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
		PrintWriter out=response.getWriter();
		
		try {
			String email=request.getParameter("email");
			String pass=request.getParameter("pwd");
			String uname=request.getParameter("uname");
			String mobile=request.getParameter("mobile");
			
			 Reg r = new Reg(email, pass, uname, mobile);
		      r.InsertReg();
		      HttpSession session = request.getSession();
		      session.setAttribute("uname", uname);
		      session.setAttribute("email", email);
		      response.sendRedirect("Welcome.jsp");
			
			
			
		}
		catch(Exception ex) {
			out.println(ex);
		}
	}

}
