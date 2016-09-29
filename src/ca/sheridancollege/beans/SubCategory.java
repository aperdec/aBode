package ca.sheridancollege.beans;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Perds on 9/29/2016.
 */
public class SubCategory {

    private List<String> subCategoryList = new ArrayList<>();
    private String subCategoryName;

    public SubCategory(List<String> subCategoryList, String subCategoryName) {
        this.subCategoryList = subCategoryList;
        this.subCategoryName = subCategoryName;
    }

    public List<String> getSubCategoryList() {
        return subCategoryList;
    }

    public void setSubCategoryList(List<String> subCategoryList) {
        this.subCategoryList = subCategoryList;
    }

    public String getSubCategoryName() {
        return subCategoryName;
    }

    public void setSubCategoryName(String subCategoryName) {
        this.subCategoryName = subCategoryName;
    }
}
