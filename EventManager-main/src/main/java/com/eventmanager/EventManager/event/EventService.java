package com.eventmanager.EventManager.event;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventService {
	
	@Autowired
	private EventRepository  eventRepository;
	
	
	private static int eventCount = -1;
	 
	private static List<Event> events = new ArrayList<Event>();
	
	static {
		events.add(new Event(++eventCount, "Party", "", LocalDate.now().plusYears(1), LocalDate.now().plusYears(2), "Upcoming"));
		events.add(new Event(++eventCount, "Wedding", "", LocalDate.now().plusYears(1), LocalDate.now().plusYears(2), "Upcoming"));
		events.add(new Event(++eventCount, "Department Day", "", LocalDate.now().plusYears(1), LocalDate.now().plusYears(2), "Upcoming"));
		events.add(new Event(++eventCount, "Fresher's", "", LocalDate.now().plusYears(1), LocalDate.now().plusYears(2), "Upcoming"));
		events.add(new Event(++eventCount, "Webinar", "", LocalDate.now().plusYears(1), LocalDate.now().plusYears(2), "Upcoming"));
	}
	
	public List<Event> getByUsername(String username){
		return events;
	}
	
	public Event findById(int id) {
		Predicate<? super Event> predicate = event -> event.getEventId() == id;
		Event event = events.stream().filter(predicate).findFirst().get();
		return event;
	}
	public Event findByName(String name) {
		Predicate<? super Event> predicate = event -> event.getEventName().equalsIgnoreCase(name);
		Event event = events.stream().filter(predicate).findFirst().get();
		
		return event;
	}
	
	public void addNewEvent(Event event){
		events.add(new Event(++eventCount, event.getEventName(), event.getDescription(), event.getStartDate(), event.getEndDate(), event.getStatus()));
	}
	
	public void deleteById(int id){
		Predicate<? super Event> predicate = event -> event.getEventId() == id;
		events.removeIf(predicate);
	}
	
	//Service for updating event
		public void updateEvent(Event event) {

		}
}
