package com.eventmanager.EventManager.user;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eventmanager.EventManager.event.Event;
import com.eventmanager.EventManager.event.EventRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class EnrolledEventController {
	
	@Autowired
	EnrolledEventRepository enrolledEventRepository;
	
	@Autowired
	EventRepository eventRepository;
	
	//from user homepage to user event list
	@RequestMapping("user-event-list")
	private String userEventPage(ModelMap model, HttpSession session) {
		String firstname = (String)session.getAttribute("firstname");
		
		List<EnrolledEvent> enrolledEvents = enrolledEventRepository.findByMemberName(firstname);
		Set<String> visitedEventNames = new HashSet<>();
		List<Event> events = enrolledEvents.stream()
		    .filter(enrolledEvent -> visitedEventNames.add(enrolledEvent.getEventName()))
		    .map(enrolledEvent -> eventRepository.findByEventName(enrolledEvent.getEventName()))
		    .collect(Collectors.toList());

		
		model.addAttribute("events", events);
			
		
		return "user_event_list";
	}
}
