package pojo;

import java.io.Serializable;

import org.springframework.transaction.annotation.Transactional;
@Transactional 
public class StuInfo implements Serializable{
	private String stu_id;
	private String password;
	private String name;
	private String sex;
	private String department;
	private String dor_id;
	private String stu_phone;
	private String stu_class;

	
	
	public StuInfo(String stu_id, String password, String name,String sex,String department, String dor_id, String stu_phone,
			String stu_class) {
		super();
		this.stu_id = stu_id;
		this.password = password;
		this.name = name;
		this.sex=sex;
		this.department = department;
		this.dor_id = dor_id;
		this.stu_phone = stu_phone;
		this.stu_class = stu_class;
		
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDor_id() {
		return dor_id;
	}

	public void setDor_id(String dor_id) {
		this.dor_id = dor_id;
	}

	public String getStu_phone() {
		return stu_phone;
	}

	public void setStu_phone(String stu_phone) {
		this.stu_phone = stu_phone;
	}

	public String getStu_class() {
		return stu_class;
	}

	public void setStu_class(String stu_class) {
		this.stu_class = stu_class;
	}

	public static int getX(String x[]) {
			int j=0;
			while(j<x.length) {
				System.out.println(x[j]);
				j++;
			}
			return j;
			
				
	}
		

}
