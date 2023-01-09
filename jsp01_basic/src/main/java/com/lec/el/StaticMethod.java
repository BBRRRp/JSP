package com.lec.el;
//1.7
import java.text.DecimalFormat;

public class StaticMethod {
	
	public static String staticMethod(long num, String pattern) {
		
		DecimalFormat ptrn = new DecimalFormat(pattern);
		return ptrn.format(num);
	}
}
