package com.kh.onefit.notice.model.vo;

import java.sql.Date;

public class Notice {

	private int noticeNum;
	private String title;
	private String content;
	private Date writeDate;
	private int userNum;
	private String status;
	private int count;
	private String filePath;
	private String originalFileName;
	private String renameFileName;
	
	public Notice(int noticeNum, String title, String content, Date writeDate, int userNum, String status, int count,
			String filePath, String originalFileName, String renameFileName) {
		super();
		this.noticeNum = noticeNum;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.userNum = userNum;
		this.status = status;
		this.count = count;
		this.filePath = filePath;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public Notice() {}

	public Notice(int noticeNum, String title, String content, Date writeDate, int userNum, String status, int count) {
		super();
		this.noticeNum = noticeNum;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.userNum = userNum;
		this.status = status;
		this.count = count;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Notice [noticeNum=" + noticeNum + ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + ", userNum=" + userNum + ", status=" + status + ", count=" + count + ", filePath="
				+ filePath + ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + "]";
	}
	
	
}
