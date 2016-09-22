package ca.sheridancollege.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.NamedQuery;

@Entity
@NamedQuery(name="Builder.byUserName", query="from Builder where users_username = :users_username")
public class Builder implements Serializable {
//test
	
	

	private String builderEmail;
	private String builderName;
	@Id
	private long builderRefNum;
	private String builderCompany;
	private String builderPhoneNumber;

	@OneToOne
	@JoinColumn(name="users_username")
	private User user;
	
	public Builder() {

	}

	public Builder(String builderName, long builderRefNum,
			String builderCompany, String builderPhoneNumber, String builderEmail) {
		this.builderName = builderName;
		this.builderRefNum = builderRefNum;
		this.builderCompany = builderCompany;
		this.builderPhoneNumber = builderPhoneNumber;
		this.builderEmail = builderEmail;
	}

	public String getBuilderName() {
		return builderName;
	}

	public void setBuilderName(String builderName) {
		this.builderName = builderName;
	}

	public long getBuilderRefNum() {
		return builderRefNum;
	}

	public void setBuilderRefNum(long builderRefNum) {
		this.builderRefNum = builderRefNum;
	}

	public String getBuilderCompany() {
		return builderCompany;
	}

	public void setBuilderCompany(String builderCompany) {
		this.builderCompany = builderCompany;
	}

	public String getBuilderPhoneNumber() {
		return builderPhoneNumber;
	}

	public void setBuilderPhoneNumber(String builderPhoneNumber) {
		this.builderPhoneNumber = builderPhoneNumber;
	}

	public String getBuilderEmail() {
		return builderEmail;
	}

	public void setBuilderEmail(String builderEmail) {
		this.builderEmail = builderEmail;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	

}
