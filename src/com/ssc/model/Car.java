package com.ssc.model;

public class Car {
	private int id;
	private String carName;
	private String carKind;
	private int carPay;
	private int zoneNum;
	private String zoneName;
	private String carImg;
	private int limitStart;
	private int listCount;
	private String zoneLat;
	private String zoneLng;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarKind() {
		return carKind;
	}
	public void setCarKind(String carKind) {
		this.carKind = carKind;
	}
	public int getCarPay() {
		return carPay;
	}
	public void setCarPay(int carPay) {
		this.carPay = carPay;
	}
	public int getZoneNum() {
		return zoneNum;
	}
	public void setZoneNum(int zoneNum) {
		this.zoneNum = zoneNum;
	}
	public String getZoneName() {
		return zoneName;
	}
	public void setZoneName(String zoneName) {
		this.zoneName = zoneName;
	}
	public String getCarImg() {
		return carImg;
	}
	public void setCarImg(String carImg) {
		this.carImg = carImg;
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
	public String getZoneLat() {
		return zoneLat;
	}
	public void setZoneLat(String zoneLat) {
		this.zoneLat = zoneLat;
	}
	public String getZoneLng() {
		return zoneLng;
	}
	public void setZoneLng(String zoneLng) {
		this.zoneLng = zoneLng;
	}
	@Override
	public String toString() {
		return "Car [id=" + id + ", carName=" + carName + ", carKind=" + carKind + ", carPay=" + carPay + ", zoneNum="
				+ zoneNum + ", zoneName=" + zoneName + ", carImg=" + carImg + ", limitStart=" + limitStart
				+ ", listCount=" + listCount + ", zoneLat=" + zoneLat + ", zoneLng=" + zoneLng + "]";
	}
	
}
