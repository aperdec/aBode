package ca.sheridancollege.beans;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;

import org.hibernate.annotations.NamedQuery;

@Embeddable
@NamedQuery(name="Deficiency.byId", query="from Deficiency where id = :id")
public class Deficiency implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7277687991400754226L;
	private int id;
	private String location;
	@Column(name = "description", nullable = false, length = 1000)
	private String description;
	private String category;
	private String[] categories;
	private Date deadline;
	private Boolean status;

	public Deficiency() {
		categories = new String[] {"Add Categories"};
	}

	public Deficiency(String location, String description, String category, Date deadline) {
		this.location = location;
		this.description = description;
		this.category = category;
		categories = new String[] {"Add Categories"};
		this.deadline = deadline;
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
