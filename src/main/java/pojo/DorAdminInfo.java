package pojo;

import java.io.Serializable;

public class DorAdminInfo implements Serializable{
	private String dor_ad_id;
	private String password;
	private String dor_id;
	private String dor_ad_phone;
		
	public DorAdminInfo(String dor_ad_id, String password, String dor_id, String dor_ad_phone) {
		super();
		this.dor_ad_id = dor_ad_id;
		this.password = password;
		this.dor_id = dor_id;
		this.dor_ad_phone = dor_ad_phone;
	}
	
	public String getDor_ad_id() {
		return dor_ad_id;
	}
	public void setDor_ad_id(String dor_ad_id) {
		this.dor_ad_id = dor_ad_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDor_id() {
		return dor_id;
	}
	public void setDor_id(String dor_id) {
		this.dor_id = dor_id;
	}
	public String getDor_ad_phone() {
		return dor_ad_phone;
	}
	public void setDor_ad_phone(String dor_ad_phone) {
		this.dor_ad_phone = dor_ad_phone;
	}
	
	
}
