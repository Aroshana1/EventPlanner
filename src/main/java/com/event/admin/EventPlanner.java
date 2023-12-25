package com.event.admin;

public class EventPlanner {
	
	private int pid;
	private String pname;
	private String pexperience;
	private String peventtype;
	private String pphone;
	
	public EventPlanner(int pid, String pname, String pexperience, String peventtype, String pphone) {
		
		this.pid = pid;
		this.pname = pname;
		this.pexperience = pexperience;
		this.peventtype = peventtype;
		this.pphone = pphone;
	}

	public int getPid() {
		return pid;
	}

	public String getPname() {
		return pname;
	}

	public String getPexperience() {
		return pexperience;
	}

	public String getPeventtype() {
		return peventtype;
	}

	public String getPphone() {
		return pphone;
	}


}
