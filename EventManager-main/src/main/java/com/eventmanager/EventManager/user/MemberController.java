package com.eventmanager.EventManager.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eventmanager.EventManager.TaskManager.TaskRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MemberController {


	private MemberRepository memberRepository;
	private TaskRepository taskRepository;
	

	public MemberController(MemberRepository memberRepository,TaskRepository taskRepository) {
		super();
		this.memberRepository = memberRepository;
		this.taskRepository= taskRepository;
	}

	@RequestMapping(value="signup-page",method = RequestMethod.GET)
	public String gotoSignupPage (ModelMap model, HttpSession session) {
		
		// Retrieve the existing list of firstnames from the session
	    List<String> firstnames = (List<String>) session.getAttribute("firstnames");

	    if (firstnames == null) {
	        // If the list doesn't exist in the session, create a new one
	        firstnames = new ArrayList<>();
	    }

	    // Add the new "firstname" to the list
	    String firstname = (String) session.getAttribute("firstname");
	    firstnames.add(firstname);

	    // Store the updated list back in the session
	    session.setAttribute("firstnames", firstnames);

		
		Member member = new Member(0,"","","",18,"");
			model.addAttribute("member", member);
			
			 // Set or update the "firstnames" attribute in the model
		    model.addAttribute("firstnames", firstnames);
			
		return "sign_up_form";
	}
	
	@RequestMapping(value="signup-page",method = RequestMethod.POST)
	public String gotoLoginPage (ModelMap model, @Valid Member member, BindingResult result,HttpSession session) {
		if(result.hasErrors()) {
			return "sign_up_form";
		}
		Member memberSave = new Member(0, member.getFirstname(), member.getLastname(), 
				member.getSkill(), member.getAge(), member.getPassword());
		 
		
		memberRepository.save(memberSave);
		session.setAttribute("firstname", member.getFirstname());
		return "redirect:loginpage";
	}
	

	

	
}
