package ca.sheridancollege.beans;

import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.NamedQuery;

@Entity
@NamedQuery(name="Unit.byHomeEnrollmentNumber", query="from Unit where homeEnrollmentNumber = :homeEnrollmentNumber")
public class Unit implements Serializable {

	@Id
	private long homeEnrollmentNumber;
	private int lotNumber;
	private String address;
	private HomeOwner homeOwner;
	private String projectName;
	private ArrayList<Deficiency> deficiencies;
	
	public Unit(){
		
	}
	
	public Unit(long homeEnrollmentNumber, int lotNumber, String address, HomeOwner homeOwner, String projectName) {
		this.homeEnrollmentNumber = homeEnrollmentNumber;
		this.lotNumber = lotNumber;
		this.address = address;
		this.homeOwner = homeOwner;
		this.projectName = projectName;
	}

	public Unit(long homeEnrollmentNumber, int lotNumber, String address, HomeOwner homeOwner, String projectName,
			ArrayList<Deficiency> deficiencies) {
		this.homeEnrollmentNumber = homeEnrollmentNumber;
		this.lotNumber = lotNumber;
		this.address = address;
		this.homeOwner = homeOwner;
		this.projectName = projectName;
		this.deficiencies = deficiencies;
	}

	public long getHomeEnrollmentNumber() {
		return homeEnrollmentNumber;
	}

	public void setHomeEnrollmentNumber(long homeEnrollmentNumber) {
		this.homeEnrollmentNumber = homeEnrollmentNumber;
	}

	public int getLotNumber() {
		return lotNumber;
	}

	public void setLotNumber(int lotNumber) {
		this.lotNumber = lotNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public HomeOwner getHomeOwner() {
		return homeOwner;
	}

	public void setHomeOwner(HomeOwner homeOwner) {
		this.homeOwner = homeOwner;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public ArrayList<Deficiency> getDeficiencies() {
		return deficiencies;
	}

	public void setDeficiencies(ArrayList<Deficiency> deficiencies) {
		this.deficiencies = deficiencies;
	}
	
	public void addDeficiency(int deficiencyId){
		//needs logic
	}

}
