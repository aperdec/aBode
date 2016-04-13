package ca.sheridancollege.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Embedded;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.NamedQuery;

@Entity
@NamedQuery(name="Unit.byHomeEnrollmentNumber", query="from Unit where homeEnrollmentNumber = :homeEnrollmentNumber")
public class Unit implements Serializable {

	@Id
	private long homeEnrollmentNumber;
	private int lotNumber;
	private String address;
	//@OneToOne(mappedBy="homeOwner")
	//need to pass pk and fk relationship not the whole object for this annotation to work.
	@Embedded
	private HomeOwner homeOwner;
	private String projectName;
	@ElementCollection
	private List<Deficiency> deficiencies;
	
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
			List<Deficiency> deficiencies) {
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

	public List<Deficiency> getDeficiencies() {
		return deficiencies;
	}

	public void setDeficiencies(List<Deficiency> deficiencies) {
		this.deficiencies = deficiencies;
	}
	
	public void addDeficiency(int deficiencyId){
		//needs logic
	}

}
