package com.eventmanager.EventManager.user;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class EnrolledEvent {
	
	EnrolledEvent(){
		
	}
	
	public EnrolledEvent(int enrolledId, String eventName, String memberName, String taskName) {
		super();
		this.enrolledId = enrolledId;
		this.eventName = eventName;
		this.memberName = memberName;
		this.taskName = taskName;
	}
	
	@Id
	@GeneratedValue
	private int enrolledId;
	private String eventName;
	private String memberName;
	private String taskName;
	public int getEnrolledId() {
		return enrolledId;
	}
	public void setEnrolledId(int enrolledId) {
		this.enrolledId = enrolledId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	@Override
	public String toString() {
		return "EnrolledEvent [enrolledId=" + enrolledId + ", eventName=" + eventName + ", memberName=" + memberName
				+ ", taskName=" + taskName + "]";
	}
	
	
	
}
