package product;

import java.io.InputStream;

public class Product {
	
	protected String college_id;
	private String description;
	private String place;
	private String category;
	private int status;
	private String time;
//	private InputStream file;
	public int id;
	/*-- Constructor --*/
	public Product()
	{
		college_id=null;
		description=null;
		place=null;
		category=null;
		status=0;
//		file=null;
	}

	public 	Product(String college_id,String description,String place,String category,int status,String time)
	{
		this.college_id=college_id;
		this.description=description;
		this.place=place;
		this.category=category;
		this.status=0;
		this.time=time;
//		this.file=file;
	}
	
	/*-- Constructor --*/
	
	/* --GETTER n SETTER-- */
	
	public String getCollege_id() {
		return college_id;
	}
	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	

	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	
/*	public InputStream getFile() {
		return file;
	}

	public void setFile(InputStream file) {
		this.file = file;
	}
*/	/* --GETTER n SETTER-- */
}
