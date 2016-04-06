package ca.sheridancollege.beans;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;

public class Deficiency implements Serializable {

	private int id;
	private String location;
	@Column(name = "description", nullable = false, length = 1000)
	private String description;
	private String category;
	private String[] categories;
	private Date deadline;
	private Unit unit;
	private Boolean status;

	public Deficiency() {
		categories = new String[] { "" };
	}

	public Deficiency(String location, String description, String category, Date deadline, Unit unit) {
		this.location = location;
		this.description = description;
		this.category = category;
		categories = new String[] { "" };
		this.deadline = deadline;
		this.unit = unit;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public String[] getCategories() {
		return categories;
	}

}
