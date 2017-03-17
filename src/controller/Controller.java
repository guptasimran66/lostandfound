package controller;
import javax.servlet.http.Part;

import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseConnection;
import database.DatabaseQuery;
import product.Product;

public class Controller extends HttpServlet{
		private static final long serialVersionUID = 1L;
		String method; 
		
		 public void init(ServletConfig config) throws ServletException {
			    super.init(config);
			    DatabaseQuery.init();
			  }
		public Controller() {
	        super();
	    }

		protected void doPost(HttpServletRequest request, HttpServletResponse response){
			method = request.getParameter("mode");	
			try {
				
				if(method.equalsIgnoreCase("addProduct")){
					addProduct(request, response);
				}else if(method.equalsIgnoreCase("editProduct")){
					editProduct(request, response);
				}
				else if(method.equalsIgnoreCase("search")){
					search(request, response);
				}
				}catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response){
			method = request.getParameter("mode");	
			try {
				
				 if(method.equalsIgnoreCase("display")){
					display(request, response);
				}else if(method.equalsIgnoreCase("admin_display")){
					admin_display(request, response);
				}else if(method.equalsIgnoreCase("delete")){
					deleteProduct(request, response);
				}else if(method.equalsIgnoreCase("approve")){
					approve(request, response);
				}else if(method.equalsIgnoreCase("notapprove")){
					notapprove(request, response);
				}else if(method.equalsIgnoreCase("move")){
					move(request, response);
				}	
				}catch (Exception e) {
					e.printStackTrace();
				}
		}
			
	public void addProduct(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		// get all the parameters
		
		String college_id = request.getParameter("college_id");
		String description = request.getParameter("description");
		String place = request.getParameter("place");
		String category = request.getParameter("category");
		String Status = request.getParameter("status");
		String time = request.getParameter("date_time");
		time=time.replace('T', ' ');
		/*	
		InputStream file=null;
		Part image_parts = request.getPart("image");
		file = image_parts.getInputStream();
		if(file!=null){
			
		}
	*/	
		int status=1;
		// create a product object and assign values to its attributes
		if(Status.equals("lost"))
		{
			 status=0;
		}
			Product pro = new Product( college_id, description, place, category, status,time);
		// check all validations and then send this to databaseQuery class
			DatabaseQuery.addProduct(pro);
			response.sendRedirect("index.jsp");
	}


	public void approve(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		// get all the parameters
		int product_id=Integer.parseInt(request.getParameter("id"));
		// check all validations and then send this to databaseQuery class
			DatabaseQuery.approve(product_id);
			response.sendRedirect("admin.jsp");
		
	}
	
	public void notapprove(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		// get all the parameters
		int Product_id = Integer.parseInt(request.getParameter("id"));
		// send this to databaseQuery class
			DatabaseQuery.notapprove(Product_id);
			response.sendRedirect("admin.jsp");
	}
	
	public void editProduct(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		// get all the parameters
		String college_id = null;
		String description = null;
		String place = null;
		String category = null;
		int status = 0;
		int Product_id = 0;
		String time = request.getParameter("date_time");
		time=time.replace('T', ' ');
		// create a product object and assign values to its attributes
		Product pro = new Product( college_id, description, place, category, status,time);
		// check all validations and then send this to databaseQuery class
			DatabaseQuery.editProduct(pro,Product_id);
	
	}

	public void deleteProduct(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		// get all the parameters
		int Product_id = Integer.parseInt(request.getParameter("id"));
		// send this to databaseQuery class
			if(DatabaseQuery.deleteProduct(Product_id))
			{
				response.sendRedirect("admin.jsp");
			}
			
	}

	public void move(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		// get all the parameters
		int id=Integer.parseInt(request.getParameter("id"));
		// check all validations and then send this to databaseQuery class
			DatabaseQuery.move(id);
		
	}

	public void display(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		String status=request.getParameter("status");
		ArrayList<Product> list;
		// send this to databaseQuery class
			list = DatabaseQuery.display(status);
			request.setAttribute("list",list); //list is an arraylist      contains object of class Product  
			if(status.equalsIgnoreCase("0"))
					request.getRequestDispatcher("Lost.jsp").forward(request,response);
			else
				request.getRequestDispatcher("Found.jsp").forward(request,response);
	}

	public void admin_display(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		String status=request.getParameter("status");
		ArrayList<Product> list;
		// send this to databaseQuery class
			list = DatabaseQuery.display(status);
			request.setAttribute("list",list); //list is an arraylist      contains object of class Product  
			if(status.equalsIgnoreCase("0"))
					request.getRequestDispatcher("admin_lost.jsp").forward(request,response);
			else
				request.getRequestDispatcher("admin_found.jsp").forward(request,response);
	}

	public void search(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		// get all the parameters
		String search = request.getParameter("search");
			ArrayList<Product> list;
			// send this to databaseQuery class
				list = DatabaseQuery.search(search);
				request.setAttribute("list",list); //list is an arraylist      contains object of class Product  
				request.getRequestDispatcher("search.jsp").forward(request,response);
		
	}
	
	public void recent(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
			
		// check all validations and then send this to databaseQuery class
			DatabaseQuery.recent();
	}
	
	public void destroy()
	{
		DatabaseConnection.finish();
	}
}