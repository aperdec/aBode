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
	private WorkOrder workOrder;
	private HomeOwner homeOwner;
	private String formType;
	private User user;
	private String repName;
	//private Blob repSig;

	public Form() {

	}

	public Form(long id, Unit unit, WorkOrder workOrder, HomeOwner homeOwner, String formType, User user) {
		this.id = id;
		this.unit = unit;
		this.workOrder = workOrder;
		this.homeOwner = homeOwner;
		this.formType = formType;
		this.user = user;
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

	public WorkOrder getWorkOrder() {
		return workOrder;
	}

	public void setWorkOrder(WorkOrder workOrder) {
		this.workOrder = workOrder;
	}

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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
