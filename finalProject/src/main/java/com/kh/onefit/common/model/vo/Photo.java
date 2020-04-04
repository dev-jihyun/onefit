package com.kh.onefit.common.model.vo;

public class Photo {

	private int photoNum;
	private String orgName;
	private String chName;
	private int cate;
	private int numbs;
	
	public Photo() { }

	public Photo(int photoNum, String orgName, String chName, int cate, int numbs) {
		super();
		this.photoNum = photoNum;
		this.orgName = orgName;
		this.chName = chName;
		this.cate = cate;
		this.numbs = numbs;
	}

	public int getPhotoNum() {
		return photoNum;
	}

	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getChName() {
		return chName;
	}

	public void setChName(String chName) {
		this.chName = chName;
	}

	public int getCate() {
		return cate;
	}

	public void setCate(int cate) {
		this.cate = cate;
	}

	public int getNumbs() {
		return numbs;
	}

	public void setNumbs(int numbs) {
		this.numbs = numbs;
	}

	@Override
	public String toString() {
		return "Photo [photoNum=" + photoNum + ", orgName=" + orgName + ", chName=" + chName + ", cate=" + cate
				+ ", numbs=" + numbs + "]";
	}
	
	
}
