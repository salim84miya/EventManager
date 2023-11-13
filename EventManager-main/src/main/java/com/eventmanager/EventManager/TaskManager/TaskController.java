package com.eventmanager.EventManager.TaskManager;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eventmanager.EventManager.event.Event;
import com.eventmanager.EventManager.event.EventRepository;
import com.eventmanager.EventManager.user.EnrolledEvent;
import com.eventmanager.EventManager.user.EnrolledEventRepository;
import com.eventmanager.EventManager.user.Member;
import com.eventmanager.EventManager.user.MemberRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class TaskController {
	
	private EnrolledEventRepository enrolledEventRepository;
	
	private TaskRepository taskRepository;
	private EventRepository eventRepository;
	private MemberRepository memberRepository;
	public TaskController(TaskRepository taskRepository, MemberRepository memberRepository , 
			EventRepository eventRepository, EnrolledEventRepository enrolledEventRepository) {
		super();
		this.taskRepository = taskRepository;
		this.memberRepository = memberRepository;
		this.eventRepository = eventRepository;
		this.enrolledEventRepository = enrolledEventRepository;
	}

	// Task list method
	@RequestMapping("admin-tasks-list")
	public String eventManagerTaskListPage(ModelMap model) {
		List<Task> tasks = taskRepository.findByUsername("admin");
		List<Event> events = eventRepository.findAll();
		
		
		List<Task> completedTasks = new ArrayList<>();
		List<Task> ongoingTasks = new ArrayList<>();
		List<Task> overdueTasks = new ArrayList<>();

		
			for(Task task : tasks) {
				if (task.getisDone()) {
			    completedTasks.add(task);
			  } else if (LocalDate.now().isAfter(task.getDeadline())) {
				  overdueTasks.add(task);
				  
			  } else {
				  ongoingTasks.add(task);
			  }
		}
		
		model.addAttribute("completedTasks",completedTasks);
		model.addAttribute("ongoingTasks",ongoingTasks);
		model.addAttribute("overdueTasks",overdueTasks);
		return "tasks_list";
	}
	
	// Get-Method
	//for task form
		@RequestMapping(value="task-form",method=RequestMethod.GET)
		public String eventManagerTaskFormPage(ModelMap model,HttpSession session) {
			
			// Retrieve the existing list of firstnames from the session
//		    List<String> firstnames = (List<String>) session.getAttribute("firstnames");
		 
			Task task = new Task(0,0,"","admin","","",LocalDate.now(),"",false,"");
			List<Member> members = memberRepository.findAll();
			List<Event> events = eventRepository.findByStatus("Upcoming");
			events.addAll(eventRepository.findByStatus("Ongoing"));
			model.addAttribute("members", members); 		//model.addAttribute("firstnames",firstnames);

			model.put("task", task);	
			model.put("events", events);	
			return "task_form";
		}
		
		
	//Post-method 
	//post method for task form
		@RequestMapping(value="task-form",method=RequestMethod.POST)
		public String eventManagerTaskSubmitPage(ModelMap model,@Valid Task task , BindingResult result) {
			
			if(result.hasErrors()) {
				return "task_form";
			}
			
			
			enrolledEventRepository.save(new EnrolledEvent(0, 
					task.getEventname(), task.getMember(), task.getTaskName()));
			
			List<Task> tasks = taskRepository.findByUsername("admin");
			
		
			task.setUsername("admin");
			taskRepository.save(task);
			model.addAttribute("tasks",tasks );
			return "redirect:admin-tasks-list";
		}
	
		
		// Get-Method
		//for task form
		@RequestMapping(value="task-form-from-event",method=RequestMethod.GET)
		public String eventViewTaskForm(ModelMap model, @RequestParam(required = true) String eventName, @RequestParam(required=true) int eventId,HttpSession session) {
			
			// Retrieve the existing list of firstnames from the session
			List<Member> members = memberRepository.findAll();
			List<Event> tempevents = eventRepository.findByStatus("upcoming");
			tempevents.addAll(eventRepository.findByStatus("ongoing"));
			tempevents.addAll(eventRepository.findByStatus("completed"));
			
			List<Event> events = tempevents.stream()
				    .filter(event -> event.getEventName().equals(eventName))
				    .collect(Collectors.toList());
			
			
			model.addAttribute("members", members);
			model.addAttribute("events",events);

			Task task = new Task(0,eventId ,eventName,"admin","","",LocalDate.now(),"",false,"");
					
			model.put("task", task);
			return "task_form";
		}
		
		//Post-method 
		//post method for task form
		@RequestMapping(value="task-form-from-event",method=RequestMethod.POST)
		public String eventViewTaskSubmitPage(ModelMap model, Task task) {
			
			//mapping the member with the event
			enrolledEventRepository.save(new EnrolledEvent(0, 
					task.getEventname(), task.getMember(), task.getTaskName()));
			
			List<Task> tasks = taskRepository.findByUsername("admin");
			
			task.setUsername("admin");
			taskRepository.save(task);
			model.addAttribute("tasks",tasks );
			return "redirect:event-view?eventName="+ task.getEventname()+"&eventId="+task.getEventId();
		}
		
		// Get-Method for updating Event
		// it shows the event form page

		@RequestMapping(value = "update-task", method = RequestMethod.GET)
		private String getUpdateEventForm(ModelMap model, @RequestParam int id,@RequestParam(required = true) String eventName) {
		    Optional<Task> tempTask = taskRepository.findById(id);
		    
		    
		    if (tempTask.isPresent()) {
		        model.addAttribute("task", tempTask.get()); // Add "task" to the model
				List<Member> members = memberRepository.findAll();
				List<Event> tempevents = eventRepository.findAll();
				
				List<Event> events = tempevents.stream()
					    .filter(event -> event.getEventName().equals(eventName))
					    .collect(Collectors.toList());
				
				model.addAttribute("members", members);
				model.addAttribute("events", events);
		        return "task_form";
		    } else {
		        // Handle the case where the task with the given ID is not found
		        return "redirect:admin-tasks-list"; // or show an error page
		    }
		}
		
		// Post-Method for Updating the  Event
		// use to update the existing event in the list
		
		@RequestMapping(value = "update-task", method = RequestMethod.POST)
		private String postUpdateEventForm(ModelMap model, @Valid Task task) {
			int id = task.getId();
			
			taskRepository.deleteById(id);
			
			taskRepository.save(new Task(id, 0,task.getEventname(), "admin",task.getTaskName(),task.getDescription(), 
					task.getDeadline(),task.getDomain(), task.getisDone(),task.getMember()));
			
//			eventService.updateEvent(event);
			return "redirect:admin-tasks-list";
		}
		
		@RequestMapping(value = "update-update-task", method = RequestMethod.GET)
		private String getUpdateTaskForm(ModelMap model, @RequestParam int id,@RequestParam(required = true) String eventName) {
		    Optional<Task> tempTask = taskRepository.findById(id);
		    
		    
		    if (tempTask.isPresent()) {
		        model.addAttribute("task", tempTask.get()); // Add "task" to the model
				List<Member> members = memberRepository.findAll();
				List<Event> tempevents = eventRepository.findAll();
				
				List<Event> events = tempevents.stream()
					    .filter(event -> event.getEventName().equals(eventName))
					    .collect(Collectors.toList());
				model.addAttribute("members", members);
				model.addAttribute("events", events);
		        return "task_form2";
		    } else {
		        // Handle the case where the task with the given ID is not found
		        return "redirect:event-view"; // or show an error page
		    }
		}
		
		@RequestMapping(value = "update-update-task", method = RequestMethod.POST)
		private String postUpdateTaskForm(ModelMap model, @Valid Task task) {
			
			int id = task.getId();
			
			taskRepository.deleteById(id);
			
			taskRepository.save(new Task(id, task.getEventId(),task.getEventname(), "admin",task.getTaskName(),task.getDescription(), 
					task.getDeadline(),task.getDomain(), task.getisDone(),task.getMember()));
			
//			eventService.updateEvent(event);
			return "redirect:event-view?eventId="+task.getEventId() + "&eventName="+task.getEventname();
			
		}
		
		//for deleting tasks
		@RequestMapping("delete-task")
		private String deleteTask(@RequestParam(required = true) int taskId) {
			
			String taskName = taskRepository.findById(taskId).get().getTaskName();
			//deleting the enrolled event to the member as the task is being deleted
			enrolledEventRepository.delete(enrolledEventRepository.findByTaskName(taskName));
			
			taskRepository.deleteById(taskId);
			return "redirect:admin-tasks-list";
		}
		
		@RequestMapping("delete-task-from-view")
		private String deleteTaskFromView(ModelMap model,@Valid Task task,@RequestParam(required = true) int taskId) {
			
			//deleting the enrolled event to the member as the task is being deleted
			enrolledEventRepository.delete(enrolledEventRepository.findByTaskName(task.getTaskName()));
			
			int eventId = task.getEventId();
			
//			System.out.println("eventName:"+eventName);
			
			Event event = eventRepository.findByEventId(eventId);
			List<Task> tasks = taskRepository.findByEventId(eventId);
			
			taskRepository.deleteById(taskId);
//			System.out.println("eventId :"+eventId);
			
//			tasks.add(new Task(9, 9, "Party", "user", "games", "gkabf", LocalDate.now().plusYears(2), "Management", true));
			model.put("event", event);
			model.put("tasks", tasks);
			System.out.println("eventId:"+task.getEventId());
			return "redirect:event-view?eventId="+eventId + "&eventName="+event.getEventName();
		}
		
		//shows the user task view
		@RequestMapping("user-task-view")
		private String showUserTaskView(ModelMap model, @RequestParam int taskId) {
			Task task = taskRepository.findById(taskId).get();
			
			String taskStatus;
			if(task.getisDone())taskStatus = "Completed";
			else if(LocalDate.now().isBefore(task.getDeadline())) taskStatus = "Overdue!";
			else taskStatus = "Pending";
			model.put("taskStatus", taskStatus);
			model.put("task", task);
			return "user_task_view";
		}
		
		
}
