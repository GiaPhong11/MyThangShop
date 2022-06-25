package com.example.Shop.dto;

public class ResponseChartDTO {
	private Object obj;
	
	private double sl;

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public double getSl() {
		return sl;
	}

	public void setSl(double sl) {
		this.sl = sl;
	}

	public ResponseChartDTO(Object obj, double sl) {
		super();
		this.obj = obj;
		this.sl = sl;
	}
	
	
	
}
