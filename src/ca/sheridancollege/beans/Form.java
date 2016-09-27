package ca.sheridancollege.beans;

import org.hibernate.annotations.NamedQuery;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
@NamedQuery(name = "Form.byHomeEnrollmentNumber", query = "from Form where homeEnrollmentNumber = :homeEnrollmentNumber")
public class Form implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private long homeEnrollmentNumber;
    private String formType;
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

    public String getFormType() {
        return formType;
    }

    public void setFormType(String formType) {
        this.formType = formType;
    }

    public String getRepName() {
        return repName;
    }

    public void setRepName(String repName) {
        this.repName = repName;
    }
}
