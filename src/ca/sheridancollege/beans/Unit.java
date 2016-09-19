package ca.sheridancollege.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Embedded;
import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

import org.apache.commons.lang.time.DateUtils;
import org.hibernate.annotations.NamedQuery;
import org.springframework.transaction.annotation.Transactional;

@Transactional
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
	private Date posessionDate;
	private String municipality;
	private int level;
	private int unitNum;
	private String plan;
	//@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
	@ElementCollection(fetch = FetchType.EAGER)
	private List<Deficiency> deficiencies;

	public Unit(){
		
	}
	
	public Unit(long homeEnrollmentNumber){
		
	}
	
	public Unit(long homeEnrollmentNumber, int lotNumber, String address, HomeOwner homeOwner, String projectName, int level, String plan, int unitNum) {
		this.homeEnrollmentNumber = homeEnrollmentNumber;
		this.lotNumber = lotNumber;
		this.address = address;
		this.homeOwner = homeOwner;
		this.projectName = projectName;
		this.posessionDate = DateUtils.addMonths(new Date(), 1);
		this.municipality = "Markham";
		this.level = level;
		this.unitNum = unitNum;
		this.plan = plan;
		this.deficiencies = new ArrayList<Deficiency>(4);
	}

	public Unit(long homeEnrollmentNumber, int lotNumber, String address, HomeOwner homeOwner, String projectName, int level, String plan, int unitNum,
			List<Deficiency> deficiencies) {
		this.homeEnrollmentNumber = homeEnrollmentNumber;
		this.lotNumber = lotNumber;
		this.address = address;
		this.homeOwner = homeOwner;
		this.projectName = projectName;
		this.deficiencies = deficiencies;
	}
	

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getMunicipality() {
		return municipality;
	}

	public void setMunicipality(String municipality) {
		this.municipality = municipality;
	}

	public Date getPosessionDate() {
		return posessionDate;
	}

	public void setPosessionDate(Date posessionDate) {
		this.posessionDate = posessionDate;
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
	
	public int getUnitNum() {
		return unitNum;
	}

	public void setUnitNum(int unitNum) {
		this.unitNum = unitNum;
	}

	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}

}
