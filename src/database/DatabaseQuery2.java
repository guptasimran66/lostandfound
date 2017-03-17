package database;

import java.sql.*;
import java.util.*;
import admin.Admin;

public class DatabaseQuery2 extends DatabaseConnection{
	static Connection conn;
	
	 static HashMap<String, String> hm=new HashMap<String, String>();
	 static boolean hashmade=false;
	
	 public static void init()
		{
			try
			{
			conn = DatabaseConnection.connection();
			String str="Select college_id,password from admin";
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery(str);

		      if(!hashmade)
		      {
		    	  while(rs.next())
		    	  {
		    		  hm.put(rs.getString("college_id"), rs.getString("password"));
		    	  }
		    	  // create hash map for the first time
		    	  //write the sql query here, execute it, fetch the arrayset, insert each element in hashmap.!
		    	  hashmade=true;
		      }
			}
		      catch(SQLException se1)
		      {                      //Handle errors for JDBC
		         se1.printStackTrace();
		      }
			System.out.println("\nOUTPUT:-\n"+hm);
		}
	public static boolean addUser(Admin u) {
		
		PreparedStatement prestmt = null;
		
		String sqlquery="INSERT INTO ADMIN VALUES (?, ?, ?, ?, ?)";
		if(hm.containsKey(u.getCollege_id()))		// matching the college id
		{
			return false;
			// college id already in hash map, error in creating new account because user already exits
		}
		else{
		try {
			prestmt = conn.prepareStatement(sqlquery);
			prestmt.setString(1,u.getCollege_id());
			prestmt.setString(2,u.getName());
			prestmt.setString(3,u.getPassword());
			prestmt.setString(4,u.getEmailid());
			prestmt.setLong(5,u.getContactno());
			prestmt.executeUpdate();
			
			prestmt.close();
			hm.put(u.getCollege_id(), u.getPassword());
			
		    }catch(SQLException e){
	           e.printStackTrace();
		   }
		return true;
		}
	 }
			
	public static boolean login(String college_id,String password)
	{
		if(hm.containsKey(college_id))
		{
			System.out.println("yahn to aa rha h");
			
			if(password.equalsIgnoreCase(hm.get(college_id)))	//check for the corresponding password of college id from hashmap above
			{
				System.out.println("yahn bhi aa rha h");
				return true;// if both matches return true so as to create session in controller1 class(in login method)
			}
			else
				return false;
		}
		else
		{
			return false;//wrong user-password combination
		    
		}
	}
}	