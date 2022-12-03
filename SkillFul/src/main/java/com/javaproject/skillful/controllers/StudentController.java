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

import com.javaproject.skillful.models.LoginStudent;
import com.javaproject.skillful.models.Student;
import com.javaproject.skillful.services.StudentService;

@Controller
public class StudentController {
    
     @Autowired
     private StudentService studentService;
    
    @GetMapping("/student/register")
    public String studentRegister(Model model) {
        model.addAttribute("newStudent", new Student());
        return "studentRegistration.jsp";
    }
    
    @PostMapping("/student/register")
    public String register(@Valid @ModelAttribute("newStudent") Student newStudent, 
            BindingResult result, Model model, HttpSession session) {
        
    	studentService.register(newStudent, result);
        
        if(result.hasErrors()) {
            return "studentRegistration.jsp";
        }
        else {
        	session.setAttribute("studentId", newStudent.getId());
    		Long loggedStudentId = (Long) session.getAttribute("studentId");
    		Student thisStudent =	studentService.findStudentById(loggedStudentId);
    		session.setAttribute("thisStudent", thisStudent);
    		
        	return "redirect:/student/login";
        }
    }
    
    @GetMapping("/student/login")
    public String studentLogin(Model model) {
    	model.addAttribute("newLogin", new LoginStudent());
    	return "studentLogin.jsp";
    }
       
    @PostMapping("/student/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginStudent newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        Student student = studentService.login(newLogin, result);
         
        if(result.hasErrors()) {

            return "studentLogin.jsp";
        }
        else {

        	session.setAttribute("studentId", student.getId());
    		Long loggedStudentId = (Long) session.getAttribute("studentId");
    		Student thisStudent =	studentService.findStudentById(loggedStudentId);
    		session.setAttribute("thisStudent", thisStudent);
        }
        return "redirect:/dashboard";
    }
	
	// logs out student
	@GetMapping("/student/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("thisStudent");
		session.removeAttribute("studentId");

		return "redirect:/skillful";	
	}
}
