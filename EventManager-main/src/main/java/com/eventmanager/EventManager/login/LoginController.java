package com.eventmanager.EventManager.login;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eventmanager.EventManager.Security.AuthentificationService;
import com.eventmanager.EventManager.TaskManager.Task;
import com.eventmanager.EventManager.TaskManager.TaskRepository;
import com.eventmanager.EventManager.event.Event;
import com.eventmanager.EventManager.event.EventRepository;
import com.eventmanager.EventManager.user.MemberRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("firstname")
public class LoginController {
	
	private AuthentificationService authentificationService;
	private TaskRepository taskRepository;
	private MemberRepository memberRepository;
	private EventRepository eventRepository;

	
	public LoginController(AuthentificationService authentificationService,TaskRepository taskRepository,MemberRepository memberRepository,EventRepository eventRepository) {
		super();
		this.authentificationService = authentificationService;
		this.taskRepository = taskRepository;
		this.memberRepository = memberRepository; 
		this.eventRepository = eventRepository;
	}

	// landing page
	@RequestMapping(value = "/", method = RequestMethod.GET)
	private String eventManagerLandingPage() {
		return "landing";
	}

	// Get-Method
	@RequestMapping(value = "loginpage", method = RequestMethod.GET)
	private String eventManagerLoginPage() {
		return "login";
	}

	// Post-Method
	@RequestMapping(value = "loginpage", method = RequestMethod.POST)
	private String eventManagerHomePage( ModelMap model,@RequestParam String firstname,@RequestParam String password, HttpSession session) {
			
			if(authentificationService.authenticateAdmin(firstname, password)) {
				List<Event> ongoingEvents = eventRepository.findByStatus("Ongoing");
				model.put("ongoingEvents", ongoingEvents);
				return "homepage";
			}
			else if(authentificationService.authenticateUser(firstname, password)) {
			session.setAttribute("firstname", firstname);
			// redirecting to homepage
			//taking tasks from repository and showing it in the user home page task list
			List<Task> tasks = taskRepository.findByMember(firstname);

			//filtering the task from pending to completed so as to show only pending task on the homepage
			List<Task> pendingTask = tasks.stream()
			    .filter(task -> !task.getisDone())
			    .collect(Collectors.toList());

					
			model.addAttribute("tasks",pendingTask);
			return "user_homepage";
		}
		else
		return "redirect:loginpage";
	}
	
	//from user homepage to user event list
//	@RequestMapping("user-event-list")
//	private String userEventPage() {
//		return "user_event_list";
//	}
	
	
	//from user navbar to homepage
	@RequestMapping("user_homepage")
	private String userHomePage(ModelMap model, HttpSession session) {
		String firstname = (String)session.getAttribute("firstname");
		
		List<Task> tasks = taskRepository.findByMember(firstname);
		
		//filtering the task from pending to completed so as to show only pending task on the homepage
		List<Task> pendingTask = tasks.stream()
		    .filter(task -> !task.getisDone())
		    .collect(Collectors.toList());
		
		model.addAttribute("tasks",pendingTask);
		
		return "user_homepage";
	}
	
	//from user homepage to user task list
	@RequestMapping("user-tasks-list")
	private String userTaskPage(ModelMap model, HttpSession session) {
		String firstname = (String)session.getAttribute("firstname");
		
		List<Task> tasks = taskRepository.findByMember(firstname);
		model.addAttribute("tasks",tasks);
		return "user_tasks_list";
	}
	
	
	//updating task status in user task list 
	@RequestMapping("update-user-tasks-list")
	private String userTaskUpdate(ModelMap model, HttpSession session,@RequestParam int id) {
		String firstname = (String)session.getAttribute("firstname");
		System.out.println("firstname "+firstname);
		List<Task> tasks = taskRepository.findByMember(firstname);
		
				Task tempTask= tasks.stream()
			    .filter(task -> task.getId()==id).findFirst().get();
				
				
				
				if(tempTask.getisDone()==false) {
					tempTask.setisDone(true);
				}else {
					tempTask.setisDone(false);
				}
				
				taskRepository.save(tempTask);
			
		    
		model.addAttribute("tasks",tasks);
		return "redirect:user-tasks-list";
	}
	

	
	@RequestMapping("homepage")
	private String eventManagerRedirectHomePage(ModelMap model) {
		List<Event> ongoingEvents = eventRepository.findByStatus("Ongoing");
		model.put("ongoingEvents", ongoingEvents);
		return "homepage";
	}

	//Redirecting to user profile page
	@RequestMapping("profile-page-user")
	private String eventManageUserProfilePage(ModelMap model, HttpSession session) {
		String firstname = (String)session.getAttribute("firstname");
		 
		model.addAttribute("member",memberRepository.findByFirstname(firstname));
		return "profile_user";
	}

	
	//Redirecting to admin profile page
	@RequestMapping("profile-page-admin")
	private String eventManageAdminProfilePage() {
		return "profile_admin";
	}



	// team page
	@RequestMapping("team-page")
	private String eventManageTeamPage() {
		return "team";
	}
  
	//Redirecting to landing page on logout
	@RequestMapping("landing-page")
	private String logoutLandingPage() {
		return "landing";
	}
	
	
	//Redirecting to about-us page
	@RequestMapping("about-us")
	private String eventManagerRedirectAboutPage() {
		return "about";
	}


	
}
