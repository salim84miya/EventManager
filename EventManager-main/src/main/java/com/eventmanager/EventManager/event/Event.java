package com.eventmanager.EventManager.event;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.Size;

@Entity
public class Event {

	public Event() {
		
	}
	
	
	
	public Event(int eventId, String eventName, String description, LocalDate startDate, LocalDate endDate, String status) {
		super();
		this.eventId = eventId;
		this.eventName = eventName;
		this.description = description;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}



	@Id
	@GeneratedValue
	private int eventId;
	
	@Size(min = 5, message = "Enter atleast 5 character!")
	private String eventName;
	
    @Size(min = 5, max = 500, message = "Description must be between 5 and 500 characters")
    private String description;

    @Future(message = "Enter a valid start date.")
    private LocalDate startDate;
    
 	private LocalDate endDate;
	
	private String status;
	
	
	
	public int getEventId() {
		return eventId;
	}



	public void setEventId(int eventId) {
		this.eventId = eventId;
	}



	public String getEventName() {
		return eventName;
	}



	public void setEventName(String eventName) {
		this.eventName = eventName;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public LocalDate getStartDate() {
		return startDate;
	}



	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}



	public LocalDate getEndDate() {
		return endDate;
	}



	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "Event [eventId=" + eventId + ", eventName=" + eventName + ", description=" + description
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + "]";
	}
	
	
	
	
	
	
	
	
	
}
