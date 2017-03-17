package database;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import product.Product;

public class DatabaseQuery extends DatabaseConnection{
	
	static Connection conn;
	
	/*public DatabaseQuery()
	{
		conn=DatabaseConnection.connection();
	}*/
	 public static void init()
		{
			conn = DatabaseConnection.connection();
		}
	public static void addProduct(Product pro) {
		PreparedStatement prestmt = null;
		FileInputStream image = null;
	//	System.out.println(pro.getCategory()+pro.getCollege_id()+pro.getDescription()+pro.getPlace()+pro.getStatus());
		String sqlquery="INSERT INTO Temp(college_id,description,place,category,status,time_date,reprting_time) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			
		    
//		    prestmt.setBinaryStream(3,pro.getFile());
	
			prestmt = conn.prepareStatement(sqlquery);
			prestmt.setString(1,pro.getCollege_id());
			prestmt.setString(2,pro.getDescription());
			prestmt.setString(3,pro.getPlace());
			prestmt.setString(4,pro.getCategory());
			prestmt.setLong(5,pro.getStatus());
			prestmt.setString(6,pro.getTime());
			Date dNow = new Date();
		      SimpleDateFormat ft = 
		      new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		      System.out.println("Current Date: " + ft.format(dNow));
			prestmt.setString(7, ft.format(dNow));
			prestmt.executeUpdate();
			
			prestmt.close();
			
		    }catch(SQLException e){
	           e.printStackTrace();
		   }
	 }
	
	public static void editProduct(Product pro,int Product_id)
	{
		PreparedStatement prestmt = null;
		
		String sqlquery="UPDATE TEMP SET college_id=?, description=?, place=?, category=?, status=?, WHERE Product_id="+Product_id+"";
		try {
			prestmt = conn.prepareStatement(sqlquery);
			prestmt.setString(1,pro.getCollege_id());
			prestmt.setString(2,pro.getDescription());
			prestmt.setString(3,pro.getPlace());
			prestmt.setString(4,pro.getCategory());
			prestmt.setLong(5,pro.getStatus());
			prestmt.setString(6,pro.getTime());
			prestmt.executeUpdate();		
	
			prestmt.close();
		    }catch(SQLException e){
	           e.printStackTrace();
		   }
	 }

	public static boolean deleteProduct(int Product_id)
	{

		Statement stmt = null;
		int i=0;
		String sqlquery="DELETE FROM PRODUCT WHERE Product_id="+Product_id+"";
		try{         
			stmt = conn.createStatement();      
			 i = stmt.executeUpdate(sqlquery);
			stmt.close();		 
			}catch(SQLException se4){
	           se4.printStackTrace();
		   }
		if(i!=0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public static void move(int product_id)
	{
		Statement stmt = null;
		try{
		String sqlquery="INSERT INTO Archive_Table SELECT * FROM PRODUCT WHERE product_id="+product_id+"";
		String sqlquery1="DELETE FROM PRODUCT WHERE product_id="+product_id+"";
		         
		stmt = conn.createStatement();
		stmt.execute(sqlquery);	
		stmt.execute(sqlquery1);
	    stmt.close();
	    }catch(SQLException se4){
	        se4.printStackTrace();
	    }		
	}
	
	public static ArrayList<Product> display(String status)
	{
		Statement stmt = null;
		ArrayList<Product> ProductList = new ArrayList<>();
		
		String sqlquery="SELECT * FROM PRODUCT WHERE status ="+status+"";
		try{         
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sqlquery);
		while(rs.next())
		{
			Product p = new Product();
			p.setCategory(rs.getString("category"));
			p.setCollege_id(rs.getString("college_id"));
			p.setDescription(rs.getString("description"));
			p.setPlace(rs.getString("place"));
			p.id=Integer.parseInt(rs.getString("product_id"));
			ProductList.add(p);
		}
			stmt.close();
		    }catch(SQLException se4){
	           se4.printStackTrace();
		   }
		return ProductList;
	}
	
	
	public static ArrayList<Product> search(String search)
	{

		Statement stmt = null;
		ArrayList<Product> productList = new ArrayList<Product>();
		
		String sqlquery="SELECT * FROM PRODUCT WHERE description LIKE '%"+search+"%'";
		try{         
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sqlquery);
	 
		while(rs.next())
		{
			Product p = new Product();
			p.setCategory(rs.getString("category"));
			p.setCollege_id(rs.getString("college_id"));
			p.setDescription(rs.getString("description"));
			p.setPlace(rs.getString("place"));
			p.setStatus(rs.getInt("status"));
			p.id=Integer.parseInt(rs.getString("product_id"));
			productList.add(p);
		}
		stmt.close();
	    }catch(SQLException se4){
	       se4.printStackTrace();
	    }
		return productList;
	}
	
	public static void approve(int product_id)
	{
		Connection conn = DatabaseConnection.connection();
		Statement stmt = null;
		try{
		String sqlquery="INSERT INTO PRODUCT SELECT * FROM TEMP WHERE product_id="+product_id+"";
		String sqlquery1="DELETE FROM TEMP WHERE product_id="+product_id+"";
		stmt = conn.createStatement();      
		stmt.execute(sqlquery);		
		stmt.execute(sqlquery1);
		stmt.close();
		}catch(SQLException se4){
	        se4.printStackTrace();
	    }		
	}
	
	public static void notapprove(int product_id)
	{
		Connection conn = DatabaseConnection.connection();
		Statement stmt = null;
		try{
		String sqlquery="DELETE FROM TEMP WHERE product_id="+product_id+"";
		stmt = conn.createStatement();      
		stmt.execute(sqlquery);		
		stmt.close();
		}catch(SQLException se4){
	        se4.printStackTrace();
	    }		
	}
	
	
	public static ArrayList<Product> recent()
	{
		
		Statement stmt = null;
		ArrayList<Product> productList = new ArrayList<Product>();
		Connection con = DatabaseConnection.connection();

		String sqlquery="SELECT * FROM PRODUCT LIMIT 10";
		try{         
		stmt = con.createStatement();
		            		    
		ResultSet rs = stmt.executeQuery(sqlquery);	 
		
		while(rs.next())
		{
			Product p = new Product();
			p.setCategory(rs.getString("category"));
			p.setCollege_id(rs.getString("college_id"));
			p.setDescription(rs.getString("description"));
			p.setPlace(rs.getString("place"));
			p.setStatus(rs.getInt("status"));
			p.id=Integer.parseInt(rs.getString("product_id"));
			productList.add(p);
		}
		stmt.close();
	    }catch(SQLException se4){
	       se4.printStackTrace();
	    }
		return productList;
	}

	public static ArrayList<Product> pending()
	{
		
		Statement stmt = null;
		ArrayList<Product> productList = new ArrayList<Product>();
		Connection con = DatabaseConnection.connection();

		String sqlquery="SELECT * FROM temp";
		try{         
		stmt = con.createStatement();
		            		    
		ResultSet rs = stmt.executeQuery(sqlquery);	 
		
		while(rs.next())
		{
			Product p = new Product();
			p.setCategory(rs.getString("category"));
			p.setCollege_id(rs.getString("college_id"));
			p.setDescription(rs.getString("description"));
			p.setPlace(rs.getString("place"));
			p.setStatus(rs.getInt("status"));
			p.id=Integer.parseInt(rs.getString("product_id"));
			productList.add(p);
		}
		stmt.close();
	    }catch(SQLException se4){
	       se4.printStackTrace();
	    }
		return productList;
	}
	
}