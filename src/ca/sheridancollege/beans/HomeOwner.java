package ca.sheridancollege.beans;

import org.hibernate.annotations.NamedQuery;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

//@Entity
@Entity
@NamedQuery(name="HomeOwner.byHomeEnrollmentNumber", query="from HomeOwner where homeEnrollmentNumber = :homeEnrollmentNumber")
public class HomeOwner implements Serializable {

	//@Id
	//@GeneratedValue
	//private float id;
	private String name;
	@Id
	private String phoneNumber;
	private long homeEnrollmentNumber;

	public HomeOwner() {
	}

	//test push
	public HomeOwner(String name, String phoneNumber) {
		this.name = name;
		this.phoneNumber = phoneNumber;
	}

	public HomeOwner(String name, String phoneNumber, long homeEnrollmentNumber) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.homeEnrollmentNumber = homeEnrollmentNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public long getHomeEnrollmentNumber() {
		return homeEnrollmentNumber;
	}

	public void setHomeEnrollmentNumber(long homeEnrollmentNumber) {
		this.homeEnrollmentNumber = homeEnrollmentNumber;
	}

	/*
	public float getId() {
		return id;
	} */

}
