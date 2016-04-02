package ca.sheridancollege.beans;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.NamedQuery;

@Entity
@NamedQuery(name="Subject.byTitle", query="from Subject where title = :title")
public class Subject implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2010202024549268171L;
	@Id
	private String title;
	private String text;
	private Date dateLastModified;
	private String username;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDateLastModified() {
		return dateLastModified;
	}

	public void setDateLastModified() {
		this.dateLastModified = new Date();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Subject() {
		this.dateLastModified = new Date();
	}

	public Subject(String title, String text, String username) {
		this.title = title;
		this.text = text;
		this.dateLastModified = new Date();
		this.username = username;
	}

}
