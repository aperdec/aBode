package ca.sheridancollege.beans;

import org.hibernate.annotations.NamedQuery;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
@NamedQuery(name = "HomeOwner.byHomeEnrollmentNumber", query = "from HomeOwner where homeEnrollmentNumber = :homeEnrollmentNumber")
public class HomeOwner implements Serializable {

    private String name;
    @Id
    @GeneratedValue
    private long id;
    private String phoneNumber;
    private long homeEnrollmentNumber;

    public HomeOwner() {
    }

    public HomeOwner(String name, String phoneNumber) {
        this.name = name;
        this.phoneNumber = phoneNumber;
    }

    public HomeOwner(String name, String phoneNumber, long homeEnrollmentNumber) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.homeEnrollmentNumber = homeEnrollmentNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public long getHomeEnrollmentNumber() {
        return homeEnrollmentNumber;
    }

    public void setHomeEnrollmentNumber(long homeEnrollmentNumber) {
        this.homeEnrollmentNumber = homeEnrollmentNumber;
    }

}
