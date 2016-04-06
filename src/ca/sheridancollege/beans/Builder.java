package ca.sheridancollege.beans;

import java.io.Serializable;

public class Builder implements Serializable {
	
	private String vendorName;
	private String vendorAddress;
	private long vendorRefNum;
	private String builderName;
	private long builderRefNum;
	private String builderAddress;
	private int builderPhoneNumber;
	
	public Builder(){
		
	}
	
	public Builder(String vendorName, String vendorAddress, long vendorRefNum, String builderName, long builderRefNum,
			String builderAddress, int builderPhoneNumber) {
		this.vendorName = vendorName;
		this.vendorAddress = vendorAddress;
		this.vendorRefNum = vendorRefNum;
		this.builderName = builderName;
		this.builderRefNum = builderRefNum;
		this.builderAddress = builderAddress;
		this.builderPhoneNumber = builderPhoneNumber;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getVendorAddress() {
		return vendorAddress;
	}
	public void setVendorAddress(String vendorAddress) {
		this.vendorAddress = vendorAddress;
	}
	public long getVendorRefNum() {
		return vendorRefNum;
	}
	public void setVendorRefNum(long vendorRefNum) {
		this.vendorRefNum = vendorRefNum;
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
	public String getBuilderAddress() {
		return builderAddress;
	}
	public void setBuilderAddress(String builderAddress) {
		this.builderAddress = builderAddress;
	}
	public int getBuilderPhoneNumber() {
		return builderPhoneNumber;
	}
	public void setBuilderPhoneNumber(int builderPhoneNumber) {
		this.builderPhoneNumber = builderPhoneNumber;
	}
	
	
	
	

}
