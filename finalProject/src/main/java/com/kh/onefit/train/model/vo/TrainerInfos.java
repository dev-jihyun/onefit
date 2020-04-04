package com.kh.onefit.train.model.vo;

public class TrainerInfos {    
	private String trName;
	private String career;
	private String chName;
	private int cate;
	private int numbs;
	private int trNum;
	
	public TrainerInfos() {}

	public TrainerInfos(String trName, String career, String chName, int cate, int numbs, int trNum) {
		super();
		this.trName = trName;
		this.career = career;
		this.chName = chName;
		this.cate = cate;
		this.numbs = numbs;
		this.trNum = trNum;
	}

	public String getTrName() {
		return trName;
	}

	public void setTrName(String trName) {
		this.trName = trName;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
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

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}

	@Override  
	public String toString() {
		return "TrainerInfos [trName=" + trName + ", career=" + career + ", chName=" + chName + ", cate=" + cate
				+ ", numbs=" + numbs + ", trNum=" + trNum + "]";
	}
	
	
	

}
