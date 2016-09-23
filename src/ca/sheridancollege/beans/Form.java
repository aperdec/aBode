package ca.sheridancollege.beans;

import org.hibernate.annotations.NamedQuery;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@NamedQuery(name="Form.byHomeEnrollmentNumber", query="from Form where homeEnrollmentNumber = :homeEnrollmentNumber")
public class Form implements Serializable {

	@Id
	@GeneratedValue
	private long id;
	private long homeEnrollmentNumber;
//	private Unit unit;
//	private WorkOrder workOrder;
//	private HomeOwner homeOwner;
	private String formType;
//	private Builder builder;
	private String repName;
	//private Blob repSig;

	public Form() {

	}

	public Form(long homeEnrollmentNumber, String formType, String repName) {
		this.homeEnrollmentNumber = homeEnrollmentNumber;
		this.formType = formType;
		this.repName = repName;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
//
//	public Unit getUnit() {
//		return unit;
//	}
//
//	public void setUnit(Unit unit) {
//		this.unit = unit;
//	}

//	public WorkOrder getWorkOrder() {
//		return workOrder;
//	}
//
//	public void setWorkOrder(WorkOrder workOrder) {
//		this.workOrder = workOrder;
//	}
//
//	public HomeOwner getHomeOwner() {
//		return homeOwner;
//	}
//
//	public void setHomeOwner(HomeOwner homeOwner) {
//		this.homeOwner = homeOwner;
//	}

	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}
//
//	public Builder getBuilder() {
//		return builder;
//	}
//
//	public void setBuilder(Builder builder) {
//		this.builder = builder;
//	}

	public String getRepName() {
		return repName;
	}

	public void setRepName(String repName) {
		this.repName = repName;
	}
}
