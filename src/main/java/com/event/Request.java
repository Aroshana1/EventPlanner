package com.event;

public class Request {
	private int rid;
	private String username;
	private String ename;
	private String rEmail;
	private String rphone;
	private int pid;
	private String rmessage;
	private String rdate;
	private String rstatus;
	
	public Request(int rid, String username, String ename, String rEmail, String rphone, int pid, String rmessage,
			String rdate, String rstatus) {
		super();
		this.rid = rid;
		this.username = username;
		this.ename = ename;
		this.rEmail = rEmail;
		this.rphone = rphone;
		this.pid = pid;
		this.rmessage = rmessage;
		this.rdate = rdate;
		this.rstatus = rstatus;
	}

	public int getRid() {
		return rid;
	}

	public String getUsername() {
		return username;
	}

	public String getEname() {
		return ename;
	}

	public String getrEmail() {
		return rEmail;
	}

	public String getRphone() {
		return rphone;
	}

	public int getPid() {
		return pid;
	}

	public String getRmessage() {
		return rmessage;
	}

	public String getRdate() {
		return rdate;
	}

	public String getRstatus() {
		return rstatus;
	}



	
	
	

}
