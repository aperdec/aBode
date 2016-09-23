package ca.sheridancollege.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Form implements Serializable {

	@Id
	@GeneratedValue
	private long id;
	private Unit unit;
//	private WorkOrder workOrder;
	private HomeOwner homeOwner;
	private String formType;
	private Builder builder;
	private String repName;
	//private Blob repSig;

	public Form() {

	}

	public Form(Unit unit, HomeOwner homeOwner, String formType, Builder builder, String repName) {
		this.unit = unit;
		this.homeOwner = homeOwner;
		this.formType = formType;
		this.builder = builder;
		this.repName = repName;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}

//	public WorkOrder getWorkOrder() {
//		return workOrder;
//	}
//
//	public void setWorkOrder(WorkOrder workOrder) {
//		this.workOrder = workOrder;
//	}

	public HomeOwner getHomeOwner() {
		return homeOwner;
	}

	public void setHomeOwner(HomeOwner homeOwner) {
		this.homeOwner = homeOwner;
	}

	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}

	public Builder getBuilder() {
		return builder;
	}

	public void setBuilder(Builder builder) {
		this.builder = builder;
	}

}
