package com.javaproject.skillful.controllers;

import java.security.Principal;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaproject.skillful.models.User;
import com.javaproject.skillful.services.StudentService;
import com.javaproject.skillful.services.TutorService;
import com.javaproject.skillful.services.UserService;
import com.javaproject.skillful.validator.UserValidator;

@Controller
public class UserController {
    
    private UserValidator userValidator;
    
    private UserService userService;
    
    @Autowired
    StudentService studentService;
    
    @Autowired
    TutorService tutorService;
    
    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }
    
    //renders admin registration page
    @RequestMapping("/registration")
    public String registerForm(@ModelAttribute("user") User user) {
        return "/admin/adminregistration.jsp";
    }
    
    // processes registration form, registers user as admin
    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {

        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "/admin/adminregistration.jsp";
        }
        userService.saveUserWithAdminRole(user);
        return "redirect:/login";
    }
    
    // admin login
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "/admin/adminlogin.jsp";

    }
    
    // renders home page
    @RequestMapping(value ={"/", "/home"})
    public String home(Principal principal, Model model) {
    	
    	String username = principal.getName();
    	model.addAttribute("currentUser", userService.findByUsername(username));
    	model.addAttribute("students", studentService.findAll());
    	model.addAttribute("tutors", tutorService.findAll());
    	
    	return "/admin/adminHomePage.jsp";
    }
    
    // renders admin dashboard
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
    	String username = principal.getName();
    	model.addAttribute("currentUser", userService.findByUsername(username));
    	   model.addAttribute("currentUser", userService.findByUsername(username));
           model.addAttribute("students", studentService.findAll());
           model.addAttribute("tutors", tutorService.findAll());
    	return "/admin/adminPage.jsp";
    }
    
    // delete student account
    @GetMapping("/delete/student/{id}")
    public String deleteStudent(@PathVariable("id") Long id, HttpSession session) {
    	studentService.deleteStudent(id);
			return "redirect:/home";
    }
    
    // delete admin account
    @GetMapping("/delete/tutor/{id}")
    public String deleteTutor(@PathVariable("id") Long id, HttpSession session) {
    	tutorService.deleteTutor(id);
			return "redirect:/home";
    }
}
