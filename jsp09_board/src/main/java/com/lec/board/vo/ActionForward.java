package com.lec.board.vo;
//path .redirect를 결정할것임.
public class ActionForward {
	
	private boolean isRedirect = false;
	private String path = null;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public String getPath() {
		return path;
	}
	
	public void setPath(String path) { //경로가 어디로 갈것인지 지정
		this.path = path;
	}
	
}
