package com.lec.member.dto;

import java.util.Date;

public class Member {

	private String id;
	private String password;
	private String name;
	private String regNumber;
	private int mileage;
	private Date regDate;
	
	public Member(String id, String password, String name, String regNumber, int mileage) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.regNumber = regNumber;
		this.mileage = mileage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegNumber() {
		return regNumber;
	}

	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + "]";
	}

	@Override
	public boolean equals(Object obj) {
		
		if(this == obj) return true;
		if(obj == null) return false;
		
		Member other = (Member) obj;
		
		if(id == null) {
			if(other.id != null) return false;
		} else if(!id.equals(other.id))  {
			return false;
		}
	
		if(name == null) {
			if(other.name != null) return false;
		} else if(!name.equals(other.name))  {
			return false;
		}
		
		if(password == null) {
			if(other.password != null) return false;
		} else if(!password.equals(other.password))  {
			return false;
		}
		
		if(regNumber == null) {
			if(other.regNumber != null) return false;
		} else if(!regNumber.equals(other.regNumber))  {
			return false;
		}
		
		if(regDate == null) {
			if(other.regDate != null) return false;
		} else if(!regDate.equals(other.regDate))  {
			return false;
		}
		
		if(mileage != other.mileage) return false;
		
		return true;
	}
	
	@Override
	public int hashCode() {
		final int seed = 42;
		int result = 1;
		
		result = seed * result + ((id==null) ? 0 : id.hashCode());
		result = seed * result + ((name==null) ? 0 : name.hashCode());
		result = seed * result + ((password==null) ? 0 : password.hashCode());
		result = seed * result + ((regNumber==null) ? 0 : regNumber.hashCode());
		result = seed * result + ((regDate==null) ? 0 : regDate.hashCode());
		result = seed * result + mileage;
		
		return result;
	}
}



















