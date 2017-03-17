package controller;
import user.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseConnection;
import database.DatabaseQuery1;

public class Controller1 extends HttpServlet{
	private static final long serialVersionUID = 1L;
	String method;
	public Controller1() {
        super();
    }
	 public void init(ServletConfig config) throws ServletException {
		    super.init(config);
		  }
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		method = request.getParameter("mode");	
		try {
			
			if(method.equalsIgnoreCase("signup")){
				addUser(request, response);
			}
			else if(method.equalsIgnoreCase("edituser")){
				editUser(request, response);
			}
			else if(method.equalsIgnoreCase("login")){
				login(request, response);
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		method = request.getParameter("mode");	
		try {
			if(method.equalsIgnoreCase("logout")){
			System.out.println("reached here");
				logout(request, response);
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
	}
	public void addUser(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		// get all the parameters
		DatabaseQuery1.init();
		String college_id=request.getParameter("college_id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String batch=request.getParameter("batch");
		String email=request.getParameter("email");
		long contactno=Long.parseLong(request.getParameter("number"));
		
		// create a product object and assign values to its attributes
		User u = new User( college_id, password,name,batch,email,contactno);    
		// check all validations and then send this to databaseQuery class
		if(DatabaseQuery1.addUser(u))
		{
			HttpSession session = request.getSession();
			session.setAttribute("college_id",college_id);
			/*String s =(String) session.getAttribute("college_id");*/
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
		else
		{
			request.setAttribute("error","User already Exists..!");
			/*RequestDispatcher rd=request.getRequestDispatcher("login.jsp");            
			rd.include(request, response);*/
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
	}

	public void editUser(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		// get all the parameters
		String college_id=request.getParameter("college_id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String batch=request.getParameter("batch");
		String email=request.getParameter("email");
		int contactno=Integer.parseInt(request.getParameter("number"));
		//int User_id = 0;
		// create a product object and assign values to its attributes
		User u = new User(college_id, password,name,batch,email,contactno);
		// check all validations and then send this to databaseQuery class
		DatabaseQuery1.editUser(u,college_id);
	
	}

	public void login(HttpServletRequest request,
	HttpServletResponse response)throws Exception {
		//get all the parameters
		DatabaseQuery1.init();
		String college_id = request.getParameter("college_id");
		String password = request.getParameter("password");;
		boolean auth = DatabaseQuery1.login(college_id, password);
		if(auth)
		{
			HttpSession session = request.getSession();
			session.setAttribute("college_id",college_id);
			/*String s =(String) session.getAttribute("college_id");*/
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
		else{
			
			request.setAttribute("error","Invalid username password combination..!");
			/*RequestDispatcher rd=request.getRequestDispatcher("login.jsp");            
			rd.include(request, response);*/
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	public void logout(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		
		HttpSession session = request.getSession(false);
		if(session != null)
		    session.invalidate();
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}
	
	public void destroy()
	{
		DatabaseConnection.finish();
	}
}