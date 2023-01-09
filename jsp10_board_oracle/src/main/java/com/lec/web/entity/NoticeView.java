package com.lec.web.entity;

import java.util.Date;

public class NoticeView extends Notice {

	public NoticeView(int num, String title, String writer, Date regdate, String content, 
			int hit, String files) {
		super(num, title, writer, regdate, content, hit, files);
	}

}

