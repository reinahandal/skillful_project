package com.javaproject.skillful.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.javaproject.skillful.models.Session;
import com.javaproject.skillful.models.Student;
import com.javaproject.skillful.models.Tutor;
import com.javaproject.skillful.repositories.SessionRepository;
import com.javaproject.skillful.services.SessionService;
import com.javaproject.skillful.services.StudentService;
import com.javaproject.skillful.services.TutorProfileService;
import com.javaproject.skillful.services.TutorService;


//Note that the name of session "userId" is not exactly like that
@Controller
public class SessionController {
	@Autowired
	SessionService sessionService;
	
	@Autowired
	SessionRepository sessionRepository;
	
	@Autowired
	TutorProfileService tutorProfileService;
	
	@Autowired
	TutorService tutorServ;
	
	@Autowired
	StudentService studentService;
	
	//methods 
	//methods to add sessions 
	@GetMapping("/student/session/new/{id}") 
	public String allSessions(@ModelAttribute("newSession") Session newSession, HttpSession session,@PathVariable("id") Long id,Model model) {
		if (session.getAttribute("studentId") == null) {
			return "redirect:/";
		}else {
			/*
			 * TutorProfile tutors 
			 */
			Tutor tutor = tutorServ.findTutorById(id);
			model.addAttribute("tutors",tutor);
			return "add_session.jsp";
		}
	}
	
	@PostMapping("/student/session/new")
	public String createNewSession(@Valid @ModelAttribute("newSession") Session newSession, BindingResult result,HttpSession session) {
		if (result.hasErrors()) {
			return "add_session.jsp";
		} else {
		
			sessionService.createSession(newSession);
			return "redirect:/student/session/"+session.getAttribute("studentId");
		}
	}
	
	//methods to retrieve all Sessions
	@GetMapping("/student/session/{id}")
	public String mySessions(Model model, HttpSession session,@PathVariable("id") Long id) {
		if (session.getAttribute("studentId") == null) {
			return "redirect:/";
		}else {
			Student thisStudent = studentService.findStudentById(id);
			model.addAttribute("student", thisStudent);
			model.addAttribute("mySession", thisStudent.getSessions());
			return "my_session.jsp";
		}

	}
	
	//method to edit specific session 
	//first method to render edit page 
	@GetMapping("/student/sessoion/edit/{session_id}")
	public String editPage(@PathVariable("session_id") Long sessionId, HttpSession session, Model model) {
		if (session.getAttribute("studentId") == null) {
			return "redirect:/";
		}else {
			model.addAttribute("student", studentService.findStudentById((Long)session.getAttribute("studentId")));

			model.addAttribute("updatedSession", sessionService.findSession(sessionId));
			return "edit_session.jsp";
		}
	}
	
	//second method to edit a specific session
	@PutMapping("/student/session/edit/{session_id}")
	public String updateSession(@Valid @ModelAttribute("updatedSession") Session updatedSession, BindingResult result, @PathVariable("session_id") Long session_id,HttpSession session) {
		if (result.hasErrors()) {
			return "edit_session.jsp";
		}else {
			sessionService.createSession(updatedSession);
			return "redirect:/student/session/"+session.getAttribute("studentId");
		}
	}
	
	//method to delete a specific session
    @GetMapping("/student/delete/{session_id}")
    public String deleteBook(@PathVariable("session_id") Long session_id, HttpSession session) {
    	if(session.getAttribute("studentId") == null) {
			return "redirect:/";
    	}
			sessionService.deleteSession(session_id);
			return "redirect:/student/session/"+session.getAttribute("studentId");
    }
    
    //////////////////////////////////TutorSession///////////////////////////////////
    
    
    @GetMapping("/tutor/session/{id}")
	public String tutorSessions(Model model, HttpSession session,@PathVariable("id") Long id) {
		if (session.getAttribute("tutorId") == null) {
			return "redirect:/tutor/login";
		}else {
			Tutor tutorsessions = tutorServ.findTutorById(id);
			model.addAttribute("tutorsessions", tutorsessions);

			List<Session> sessions =tutorsessions.getSessions();
			model.addAttribute("mySession", sessions);
			
			return "Tutorsession.jsp";
		}

	}
    @GetMapping("/tutor/delete/{session_id}")
    public String deleteBookTutor(@PathVariable("session_id") Long session_id, HttpSession session) {
    	if(session.getAttribute("tutorId") == null) {
			return "redirect:/tutor/login";
    	}
			sessionService.deleteSession(session_id);
			return "redirect:/tutor/session/"+session.getAttribute("tutorId");
    }
    
	
}
