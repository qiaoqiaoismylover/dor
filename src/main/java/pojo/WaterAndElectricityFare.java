package pojo;

import java.io.Serializable;

public class WaterAndElectricityFare implements Serializable{
	int bill_id;
	String dor_id;
	String time;
	String water_consum;
	String water_charge;
	String electricity_consum;
	String electricity_charge;
	int is_pay;
	
	public WaterAndElectricityFare(int bill_id, String dor_id, String time, String water_consum, String water_charge,
			String electricity_consum, String electricity_charge, int is_pay) {
		super();
		this.bill_id = bill_id;
		this.dor_id = dor_id;
		this.time = time;
		this.water_consum = water_consum;
		this.water_charge = water_charge;
		this.electricity_consum = electricity_consum;
		this.electricity_charge = electricity_charge;
		this.is_pay = is_pay;
	}
	
	public int getBill_id() {
		return bill_id;
	}
	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}
	public String getDor_id() {
		return dor_id;
	}
	public void setDor_id(String dor_id) {
		this.dor_id = dor_id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getWater_consum() {
		return water_consum;
	}
	public void setWater_consum(String water_consum) {
		this.water_consum = water_consum;
	}
	public String getWater_charge() {
		return water_charge;
	}
	public void setWater_charge(String water_charge) {
		this.water_charge = water_charge;
	}
	public String getElectricity_consum() {
		return electricity_consum;
	}
	public void setElectricity_consum(String electricity_consum) {
		this.electricity_consum = electricity_consum;
	}
	public String getElectricity_charge() {
		return electricity_charge;
	}
	public void setElectricity_charge(String electricity_charge) {
		this.electricity_charge = electricity_charge;
	}
	public int getIs_pay() {
		return is_pay;
	}
	public void setIs_pay(int is_pay) {
		this.is_pay = is_pay;
	}
	
	
} 
