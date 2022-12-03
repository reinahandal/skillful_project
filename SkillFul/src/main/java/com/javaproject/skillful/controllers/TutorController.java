package com.javaproject.skillful.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.javaproject.skillful.models.LoginTutor;
import com.javaproject.skillful.models.Tutor;
import com.javaproject.skillful.services.TutorService;

@Controller
public class TutorController {
    
    @Autowired
    private TutorService tutorService;
    
    @GetMapping("/tutor/register")
    public String tutorRegister(Model model) {

        model.addAttribute("newTutor", new Tutor());
        return "TutorRegistration.jsp";
    }
    
    @PostMapping("/tutor/register")
    public String register(@Valid @ModelAttribute("newTutor") Tutor newTutor, 
            BindingResult result, Model model, HttpSession session) {
        
    	tutorService.register(newTutor, result);
        
        if(result.hasErrors()) {
            return "TutorRegistration.jsp";
        }
        else {
        	session.setAttribute("tutorId", newTutor.getId());
    		Long loggedTutorId = (Long) session.getAttribute("tutorId");
    		Tutor thisTutor =	tutorService.findTutorById(loggedTutorId);
    		session.setAttribute("thisTutor", thisTutor);
        	return "redirect:/tutor/profile/create";
        }

    }
    
    @GetMapping("/tutor/login")
    public String tutorLogin(Model model) {
        model.addAttribute("newLogin", new LoginTutor());
        return "TutorLogin.jsp";
    }
    
    @PostMapping("/tutor/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginTutor newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        Tutor tutor = tutorService.login(newLogin, result);
         
        if(result.hasErrors()) {
            return "TutorLogin.jsp";
        }
        else {
        	session.setAttribute("tutorId", tutor.getId());
    		Long loggedTutorId = (Long) session.getAttribute("tutorId");
    		Tutor thisTutor =	tutorService.findTutorById(loggedTutorId);
    		session.setAttribute("thisTutor", thisTutor);
    		session.getAttribute("prof");
    		
            return "redirect:/tutor/profile/"+thisTutor.getTutorProfile().getId();

        }
    }
    
    // logs out tutor
    @GetMapping("/tutor/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("tutorId");
		session.removeAttribute("thisTutor");

		return "redirect:/skillful";
		
	}
}
