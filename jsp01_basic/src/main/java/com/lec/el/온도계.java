package com.lec.el;
//1.7

import java.util.HashMap;
import java.util.Map;

public class 온도계 {

	private Map<String, Double> map = new HashMap<>();
		
	public String getInfo() {
		return "섭씨/화씨 온도를 변환하는 온도계";
	}
	
	public String getXxx() {
		return "임의의 문자열";
	}
	
	public void setCelsius(String city, Double val) {
		map.put(city, val);
	}

	public Double getCelsius(String city) {
		return map.get(city);
	}
	
	public Double getFahrenheit(String city) {
		Double celsius = getCelsius(city);
		if(celsius ==null) return null;
		return celsius.doubleValue() * 1.8 + 32.0;
	}
	
}
