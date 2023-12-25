package com.event.admin;

public class Event {
	
	private int eid;
	private String ename;
	private String ecategory;
	private String edesc;
	private String eprice;
	
	public Event(int eid, String ename, String ecategory, String edesc, String eprice) {
		
		this.eid = eid;
		this.ename = ename;
		this.ecategory = ecategory;
		this.edesc = edesc;
		this.eprice = eprice;
	}

	public int getEid() {
		return eid;
	}

	public String getEname() {
		return ename;
	}

	public String getEcategory() {
		return ecategory;
	}

	public String getEdesc() {
		return edesc;
	}

	public String getEprice() {
		return eprice;
	}




	
	
	
	
	

}
