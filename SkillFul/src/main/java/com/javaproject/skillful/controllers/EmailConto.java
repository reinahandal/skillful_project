package com.javaproject.skillful.controllers;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaproject.skillful.models.Tutor;
import com.javaproject.skillful.services.EmailSenderService;
import com.javaproject.skillful.services.SubjectService;
import com.javaproject.skillful.services.TestServ;
import com.javaproject.skillful.services.TutorProfileService;
import com.javaproject.skillful.services.TutorService;
@Controller
public class EmailConto {
	@Autowired
	private EmailSenderService senderService;

	@Autowired
	TestServ testServ;
	@Autowired
	TutorProfileService profileService;
	
	@Autowired
	TutorService tutorService;
	
	@Autowired
	SubjectService subjectService;
	
	// renders contact form for a specific tutor
	@GetMapping("/student/send/email/{id}")
	public String email(@PathVariable("id")Long id,Model model,HttpSession session) {
		Tutor tutor = tutorService.findTutorById(id);
		model.addAttribute("tutor", tutor);
		session.setAttribute("mail", tutor.getId());
		return "Email.jsp";
	}
	
	// sends email to tutor
	@PostMapping("/student/email/{id}")
	public String sendEmail(@RequestParam("subject") String subject,@RequestParam("message") String message,@PathVariable("id")Long id,HttpSession session,@RequestParam("name") String name) {
		Long is =(Long) session.getAttribute("mail");

		Tutor tutor = tutorService.findTutorById(is);

		senderService.sendSimpleEmail(tutor.getEmail(),subject,
				
				"My Name : "+name+" "+"\r\n" +message);
		return "redirect:/student/send/email/"+is;
	}
	
	@RequestMapping("/mails")
	public void triggerMail() throws MessagingException {
		senderService.sendSimpleEmail("yassi3766@gmail.com",
				"This is email body",
				"This is email subject");
	
	}
}