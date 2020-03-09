package pojo;

import java.io.Serializable;

public class DorInfo implements Serializable{
	private String dor_id;
	private String dor_phone;
	private String resident_num;
	private String occupied_num;
	public DorInfo(String dor_id, String dor_phone, String resident_num, String occupied_num) {
		super();
		this.dor_id = dor_id;
		this.dor_phone = dor_phone;
		this.resident_num = resident_num;
		this.occupied_num = occupied_num;
	}
	public String getDor_id() {
		return dor_id;
	}
	public void setDor_id(String dor_id) {
		this.dor_id = dor_id;
	}
	public String getDor_phone() {
		return dor_phone;
	}
	public void setDor_phone(String dor_phone) {
		this.dor_phone = dor_phone;
	}
	public String getResident_num() {
		return resident_num;
	}
	public void setResident_num(String resident_num) {
		this.resident_num = resident_num;
	}
	public String getOccupied_num() {
		return occupied_num;
	}
	public void setOccupied_num(String occupied_num) {
		this.occupied_num = occupied_num;
	}
}
