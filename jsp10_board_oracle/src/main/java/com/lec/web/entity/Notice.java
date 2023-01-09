package com.lec.web.entity;
//entity => dto의 역할
import java.util.Date;

public class Notice {

	private int num;
	private String title;
	private String writer;
	private Date regdate;
	private String content;
	private int hit;
	private String files;
	
	public Notice(int num, String title, String writer, Date regdate, String content, 
			int hit, String files) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
		this.content = content;
		this.hit = hit;
		this.files = files;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "Notice [num=" + num + ", title=" + title + ", writer=" + writer + ", regdate=" + regdate
				+ ", content=" + content + ", hit=" + hit + "]";
	}	
}
