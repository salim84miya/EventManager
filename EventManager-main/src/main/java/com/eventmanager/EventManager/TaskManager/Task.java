package com.eventmanager.EventManager.TaskManager;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Size;

@Entity
public class Task {
	
	public Task() {
		
	}

	@Id
	@GeneratedValue
	private int id;
	
	private int eventId;
	private String eventname;
	private String username;
	

    @Size(min = 5, message ="should have atleast 5 Character")
	private String taskName;

    @Size(min = 5, max = 500)
	private String description;
	private LocalDate deadline;
	private String domain;
	private boolean isDone;
	
	
//    @Size(min = 1, message = "select atleast one member")
	private String member;
	
	public Task(int id, int eventId, String eventname, String username, String taskName, String description,
			LocalDate deadline, String domain, boolean isDone,String member) {
		super();
		this.id = id;
		this.eventId = eventId;
		this.eventname = eventname;
		this.username = username;
		this.taskName = taskName;
		this.description = description;
		this.deadline = deadline;
		this.domain = domain;
		this.isDone = isDone;
		this.member = member;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getEventname() {
		return eventname;
	}
	public void setEventname(String eventname) {
		this.eventname = eventname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public LocalDate getDeadline() {
		return deadline;
	}
	public void setDeadline(LocalDate deadline) {
		this.deadline = deadline;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public boolean getisDone() {
		return isDone;
	}
	public void setisDone(boolean isDone) {
		this.isDone = isDone;
	}
	
	public String getMember() {
		return member;
	}
	
	public void setMember(String member) {
		this.member=member;
	}
	@Override
	public String toString() {
		return "Task [id=" + id + ", eventId=" + eventId + ", eventname=" + eventname + ", username=" + username
				+ ", taskName=" + taskName + ", description=" + description + ", deadline=" + deadline + ", domain="
				+ domain + ", isDone=" + isDone + ",member=" + member +"]";
	}
	

	
	


	
	
	
	
	
}
