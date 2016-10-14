package ca.sheridancollege.beans;

/**
 * Created by Perds on 10/14/2016.
 */
public class TotalDeficiencies {

    private int id;
    private String constructionPersonnelName;
    private int deficiencyCount;

    public TotalDeficiencies() {
    }

    public TotalDeficiencies(int id, String constructionPersonnelName, int deficiencyCount) {
        this.id = id;
        this.constructionPersonnelName = constructionPersonnelName;
        this.deficiencyCount = deficiencyCount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getConstructionPersonnelName() {
        return constructionPersonnelName;
    }

    public void setConstructionPersonnelName(String constructionPersonnelName) {
        this.constructionPersonnelName = constructionPersonnelName;
    }

    public int getDeficiencyCount() {
        return deficiencyCount;
    }

    public void setDeficiencyCount(int deficiencyCount) {
        this.deficiencyCount = deficiencyCount;
    }
}
