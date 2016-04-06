package ca.sheridancollege.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ConstructionPersonnel implements Serializable {

	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String trade;
	private long phoneNumber;
	private String email;

	public ConstructionPersonnel() {

	}

	public ConstructionPersonnel(int id, String name, String trade, long phoneNumber, String email) {
		this.id = id;
		this.name = name;
		this.trade = trade;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTrade() {
		return trade;
	}

	public void setTrade(String trade) {
		this.trade = trade;
	}

	public long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void getWorkOrder(int constructionPersonnelId) {
		// needs logic
	}

}
