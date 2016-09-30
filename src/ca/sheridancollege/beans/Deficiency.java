package ca.sheridancollege.beans;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Date;

@Embeddable
public class Deficiency implements Serializable {

    private static final long serialVersionUID = 7277687991400754226L;
    private int id;
    private String location;
    @Column(name = "description", nullable = false, length = 1000)
    private String description;
    private String constructionPersonnel;
    private String category;
    private String[] categories;
    private Date deadline;
    private Boolean status;

    public Deficiency() {
        this(0, null, null, null, null, false);
    }

    public Deficiency(int id, String location, String description, String constructionPersonnel, String category, boolean status) {
        this(id, location, description, constructionPersonnel, category, null, status);
    }

    public Deficiency(int id, String location, String description, String constructionPersonnel, String category, Date deadline, Boolean status) {
        this.id = id;
        this.location = location;
        this.description = description;
        this.constructionPersonnel = constructionPersonnel;
        this.category = category;
        this.deadline = deadline;
        this.status = status;
        setCategories();
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

    public void setId(int id) {
        this.id = id;
    }

    public String getConstructionPersonnel() {
        return constructionPersonnel;
    }

    public void setConstructionPersonnel(String constructionPersonnel) {
        this.constructionPersonnel = constructionPersonnel;
    }

    public void setCategories() {
        categories = new String[]{"Add Categories"};
    }

}
