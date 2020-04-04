package com.kh.onefit.excercise.model.vo;

public class ExcerciseContent {
	
	private int exNum;
	private int jrNum;
	private String eName;
	private int count;
	private int set;
	private String memo;
	
	public ExcerciseContent() {}

	public int getExNum() {
		return exNum;
	}

	public void setExNum(int exNum) {
		this.exNum = exNum;
	}

	public int getJrNum() {
		return jrNum;
	}

	public void setJrNum(int jrNum) {
		this.jrNum = jrNum;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getSet() {
		return set;
	}

	public void setSet(int set) {
		this.set = set;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "ExcerciseContent [exNum=" + exNum + ", jrNum=" + jrNum + ", eName=" + eName + ", count=" + count
				+ ", set=" + set + ", memo=" + memo + "]";
	}
	
}
