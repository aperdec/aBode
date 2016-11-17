package ca.sheridancollege.beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Perds on 11/17/2016.
 */
public class ConstructionPersonnelDeficiencies {

    private int id;
    private String location;
    private String description;
    private String constructionPersonnel;
    private String category;
    private Date deadline;
    private Boolean status;
    private long homeEnrollmentNumber;
    private int lotNumber;
    private String address;
    private String projectName;
    private Date posessionDate;
    private int unitNum;
    private String plan;

    public ConstructionPersonnelDeficiencies() {
    }

    public ConstructionPersonnelDeficiencies(Deficiency d, Unit u) {
        id = d.getId();
        location = d.getLocation();
        description = d.getDescription();
        constructionPersonnel = d.getConstructionPersonnel();
        category = d.getCategory();
        deadline = d.getDeadline();
        status = d.getStatus();
        homeEnrollmentNumber = u.getHomeEnrollmentNumber();
        lotNumber = u.getLotNumber();
        address = u.getAddress();
        projectName = u.getProjectName();
        posessionDate = u.getPosessionDate();
        unitNum = u.getUnitNum();
        plan = u.getPlan();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getConstructionPersonnel() {
        return constructionPersonnel;
    }

    public void setConstructionPersonnel(String constructionPersonnel) {
        this.constructionPersonnel = constructionPersonnel;
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

    public long getHomeEnrollmentNumber() {
        return homeEnrollmentNumber;
    }

    public void setHomeEnrollmentNumber(long homeEnrollmentNumber) {
        this.homeEnrollmentNumber = homeEnrollmentNumber;
    }

    public int getLotNumber() {
        return lotNumber;
    }

    public void setLotNumber(int lotNumber) {
        this.lotNumber = lotNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Date getPosessionDate() {
        return posessionDate;
    }

    public void setPosessionDate(Date posessionDate) {
        this.posessionDate = posessionDate;
    }

    public int getUnitNum() {
        return unitNum;
    }

    public void setUnitNum(int unitNum) {
        this.unitNum = unitNum;
    }

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }
}
