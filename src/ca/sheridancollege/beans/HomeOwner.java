package ca.sheridancollege.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class HomeOwner implements Serializable {

	@Id
	@GeneratedValue
	private float id;
	private String name;
	private float phoneNumber;

	public HomeOwner() {
	}

	public HomeOwner(String name, float phoneNumber) {
		this.name = name;
		this.phoneNumber = phoneNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(float phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public float getId() {
		return id;
	}

}
