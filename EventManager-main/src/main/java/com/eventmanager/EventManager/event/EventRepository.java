package com.eventmanager.EventManager.event;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;



public interface EventRepository extends JpaRepository<Event, Integer> {
	
	public Event findByEventName(String name);
	
	
	public List<Event> findByStatus(String status);
	public Event findByEventId(int id);

}
