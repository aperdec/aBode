package ca.sheridancollege.beans;

import org.hibernate.annotations.NamedQuery;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@NamedQuery(name = "FormBI.byHomeEnrollmentNumber", query = "from FormBI where homeEnrollmentNumber = :homeEnrollmentNumber")
public class FormBI implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private long homeEnrollmentNumber;
    private String formType;
    private String repName;
    @Column(columnDefinition="mediumblob")
    private byte[] repSig;
    private String desName;
    private String date;
    private String purchName;
    @Column(columnDefinition="mediumblob")
    private byte[] finalSig;
    private long builderRefNum;

	public FormBI() {
		Date today = new Date();
        this.date = new SimpleDateFormat("yyyy-M-dd").format(today);
    }

    public FormBI(long homeEnrollmentNumber, String formType, String repName) {
        this.homeEnrollmentNumber = homeEnrollmentNumber;
        this.formType = formType;
        this.repName = repName;
        Date today = new Date();
        this.date = new SimpleDateFormat("yyyy-mm-dd").format(today);
    }
    
    public FormBI(long homeEnrollmentNumber, String formType, String repName, byte[] repSig) {
		this.homeEnrollmentNumber = homeEnrollmentNumber;
		this.formType = formType;
		this.repName = repName;
		this.repSig = repSig;
	}

	public String byteString(byte[] repSig){
    	 String sigImgData = repSig.toString();
    	return sigImgData;
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
    
    public long getHomeEnrollmentNumber() {
		return homeEnrollmentNumber;
	}

	public void setHomeEnrollmentNumber(long homeEnrollmentNumber) {
		this.homeEnrollmentNumber = homeEnrollmentNumber;
	}

	public byte[] getRepSig() {
		return repSig;
	}

	public void setRepSig(byte[] repSig) {
		this.repSig = repSig;
	}

	public String getDesName() {
		return desName;
	}

	public void setDesName(String desName) {
		this.desName = desName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPurchName() {
		return purchName;
	}

	public void setPurchName(String purchName) {
		this.purchName = purchName;
	}

	public byte[] getFinalSig() {
		return finalSig;
	}

	public void setFinalSig(byte[] finalSig) {
		this.finalSig = finalSig;
	}

	public long getBuilderRefNum() {
		return builderRefNum;
	}

	public void setBuilderRefNum(long builderRefNum) {
		this.builderRefNum = builderRefNum;
	}

	
}
