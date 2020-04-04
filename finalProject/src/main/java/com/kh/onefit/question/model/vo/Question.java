package com.kh.onefit.question.model.vo;

import java.sql.Date;

public class Question {
	private int askNum;
	private String title;
	private String content;
	private Date writeDate;
	private int trNum;
	
	private String answer;
	
	private Date answerDate;
	private int cate;
	private int writer;
	private int userNum;
	private String status;//글삭제여부
	private String astatus;//답변여부
	
	private String filePath;
	private String originalFileName;
	private String renameFileName;
	
	private String userId;
	
	public Question() {}
	
	

	public Question(int askNum, String title, String content, Date writeDate, String answer, Date answerDate, int cate,
			int writer, int userNum, String status, String astatus, String filePath, String originalFileName,
			String renameFileName, String userId) {
		super();
		this.askNum = askNum;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.answer = answer;
		this.answerDate = answerDate;
		this.cate = cate;
		this.writer = writer;
		this.userNum = userNum;
		this.status = status;
		this.astatus = astatus;
		this.filePath = filePath;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.userId = userId;
	}

	public Question(int askNum, String title, String content, Date writeDate, String answer, Date answerDate, int cate,
			int writer, int userNum, String status, String filePath, String originalFileName, String renameFileName) {
		super();
		this.askNum = askNum;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.answer = answer;
		this.answerDate = answerDate;
		this.cate = cate;
		this.writer = writer;
		this.userNum = userNum;
		this.status = status;
		this.filePath = filePath;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}
	public Question(int askNum, String title, String content, Date writeDate, int trNum, String answer, Date answerDate,
			int cate, int writer, int userNum, String status, String astatus, String filePath, String originalFileName,
			String renameFileName, String userId) {
		super();
		this.askNum = askNum;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.trNum = trNum;
		this.answer = answer;
		this.answerDate = answerDate;
		this.cate = cate;
		this.writer = writer;
		this.userNum = userNum;
		this.status = status;
		this.astatus = astatus;
		this.filePath = filePath;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.userId = userId;
	}

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}

	public String getAstatus() {
		return astatus;
	}


	public void setAstatus(String astatus) {
		this.astatus = astatus;
	}


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAskNum() {
		return askNum;
	}


	public void setAskNum(int askNum) {
		this.askNum = askNum;
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


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public Date getAnswerDate() {
		return answerDate;
	}


	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}


	public int getCate() {
		return cate;
	}


	public void setCate(int cate) {
		this.cate = cate;
	}


	public int getWriter() {
		return writer;
	}


	public void setWriter(int writer) {
		this.writer = writer;
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


	@Override
	public String toString() {
		return "Question [askNum=" + askNum + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", trNum=" + trNum + ", answer=" + answer + ", answerDate=" + answerDate + ", cate=" + cate
				+ ", writer=" + writer + ", userNum=" + userNum + ", status=" + status + ", astatus=" + astatus
				+ ", filePath=" + filePath + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", userId=" + userId + "]";
	}

}
