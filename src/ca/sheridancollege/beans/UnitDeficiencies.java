package ca.sheridancollege.beans;

/**
 * Created by Perds on 10/20/2016.
 */
public class UnitDeficiencies {

    private long homeEnrollmentNumber;
    private int unitNum;
    private String address;
    private int deficienciesOpen;

    public UnitDeficiencies() {
    }

    public UnitDeficiencies(long homeEnrollmentNumber, int unitNum, String address, int deficienciesOpen) {
        this.homeEnrollmentNumber = homeEnrollmentNumber;
        this.unitNum = unitNum;
        this.address = address;
        this.deficienciesOpen = deficienciesOpen;
    }

    public long getHomeEnrollmentNumber() {
        return homeEnrollmentNumber;
    }

    public void setHomeEnrollmentNumber(long homeEnrollmentNumber) {
        this.homeEnrollmentNumber = homeEnrollmentNumber;
    }

    public int getUnitNum() {
        return unitNum;
    }

    public void setUnitNum(int unitNum) {
        this.unitNum = unitNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getDeficienciesOpen() {
        return deficienciesOpen;
    }

    public void setDeficienciesOpen(int deficienciesOpen) {
        this.deficienciesOpen = deficienciesOpen;
    }
}
