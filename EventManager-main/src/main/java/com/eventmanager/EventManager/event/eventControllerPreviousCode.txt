package com.eventmanager.EventManager.event;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eventmanager.EventManager.TaskManager.Task;
import com.eventmanager.EventManager.TaskManager.TaskRepository;

import jakarta.validation.Valid;

@Controller
@SessionAttributes("firstname")
public class EventController {

	private EventService eventService;
	private TaskRepository taskRepository;
	private EventRepository eventRepository;

	public EventController(EventService eventService, TaskRepository taskRepository, EventRepository eventRepository) {
		super();
		this.eventService = eventService;
		this.taskRepository = taskRepository;
		this.eventRepository =eventRepository;
	}

	// Get, Post - Method for Listing all the events
	// here we are passing the list based upon the username of the user which we
	// will be taking
	// during the login page

	@RequestMapping("event-list")
	private String eventManagerEventListPage(ModelMap model) {

		model.addAttribute("events", eventRepository.findAll());
		return "event_list";
	}

	// Get-Method for Creating Event
	// it shows the event form page

	@RequestMapping(value = "create-event", method = RequestMethod.GET)
	private String getCreateEventForm(ModelMap model) {
		Event tempEvent = new Event(0, "", "" , LocalDate.now().plusMonths(2), LocalDate.now().plusYears(1), "Upcoming");
		model.put("event",tempEvent);
		return "event_form";
	}

	// Post-Method for Creating Event
	// use to add a new event in the list

	@RequestMapping(value = "create-event", method = RequestMethod.POST)
	private String postCreateEventForm(ModelMap model, @Valid Event event, BindingResult result) {
		if(result.hasErrors()) {
			return "event_form";
		}
		Event tempEvent = new Event(0, event.getEventName(), event.getDescription(), LocalDate.now().plusMonths(2), 
				LocalDate.now().plusYears(1), event.getStatus());
		eventRepository.save(tempEvent);
//		eventService.addNewEvent(tempEvent);
		return "redirect:event-list";
	}
	
	
	// Get-Method for updating Event
	// it shows the event form page

	@RequestMapping(value = "update-event", method = RequestMethod.GET)
	private String getUpdateEventForm(ModelMap model , @RequestParam int id) {
//		Event tempEvent = eventService.findById(id);
		Optional<Event> tempEvent = eventRepository.findById(id);
		model.put("event",tempEvent);
		return "event_form";
	}
	
	// Post-Method for Updating the  Event
	// use to update the existing event in the list
	
	@RequestMapping(value = "update-event", method = RequestMethod.POST)
	private String postUpdateEventForm(ModelMap model, @Valid Event event) {
		int id = event.getEventId();
		
		eventRepository.deleteById(id);
		
		eventRepository.save(new Event(id, event.getEventName(), event.getDescription(), 
				event.getStartDate(), event.getEndDate(), event.getStatus()));
		
//		eventService.updateEvent(event);
		return "redirect:event-list";
	}
	
	
	
	// Get-Method for viewing Event
	// it shows the event page
	@RequestMapping(value = "event-view", method = RequestMethod.GET)
	private String getEventView(ModelMap model , @RequestParam String name) {
		
//		Event event = eventService.findByName(name);
		Event event = eventRepository.findByEventName(name);
		List<Task> tasks = taskRepository.findByEventname(name);
		
//		tasks.add(new Task(9, 9, "Party", "user", "games", "gkabf", LocalDate.now().plusYears(2), "Management", true));
		model.put("event", event);
		model.put("tasks", tasks);
		return "event_view";
	}
	
	
	// Post-Method for viewing the  Event
	// use to view the existing event in the list
	@RequestMapping(value = "event-view", method = RequestMethod.POST)
	private String postEventView(ModelMap model, @Valid Event event) {
		eventService.updateEvent(event);
		return "redirect:event-list";
	}

}
