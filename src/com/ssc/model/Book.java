package com.ssc.model;

public class Book {
    private int bid;
    private String startDate;
    private String endDate;
    private int carId;
    private String carName;
    private int userId;
    private String zoneName;
    private String uId;
    private int limitStart;
    private int listCount;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getCarId() {
		return carId;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getZoneName() {
		return zoneName;
	}
	public void setZoneName(String zoneName) {
		this.zoneName = zoneName;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int getLimitStart() {
		return limitStart;
	}
	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	@Override
	public String toString() {
		return "Book [bid=" + bid + ", startDate=" + startDate + ", endDate=" + endDate + ", carId=" + carId
				+ ", carName=" + carName + ", userId=" + userId + ", zoneName=" + zoneName + ", uId=" + uId
				+ ", limitStart=" + limitStart + ", listCount=" + listCount + "]";
	}
    
    
    
}
