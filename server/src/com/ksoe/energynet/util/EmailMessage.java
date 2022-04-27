package com.ksoe.energynet.util;

import java.util.ArrayList;

public class EmailMessage {
	private String from;
	private String subject = "²íôîðìàö³ÿ â³ä ÕÎÅ";
	private String text;
	private ArrayList<String> files = new ArrayList<String>();
	private String emailAddress;

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public ArrayList<String> getFiles() {
		return files;
	}

	public void setFiles(ArrayList<String> files) {
		this.files = files;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public void addFile(String fileName) {
		this.files.add(fileName);
	}
}
