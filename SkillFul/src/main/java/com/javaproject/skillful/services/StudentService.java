package com.javaproject.skillful.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.javaproject.skillful.models.LoginStudent;
import com.javaproject.skillful.models.Student;
import com.javaproject.skillful.repositories.StudentRepository;

@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepo;
    
    public Student register(Student newStudent, BindingResult result) {
        if(studentRepo.findByEmail(newStudent.getEmail()).isPresent()) {
        	result.rejectValue("email", "Unique", "This email is already registered");
        }
        if(!newStudent.getPassword().equals(newStudent.getConfirm())) {
        	result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        if(result.hasErrors()) {
            return null;
        }
        else {
        	String hashed = BCrypt.hashpw(newStudent.getPassword(), BCrypt.gensalt());
        	newStudent.setPassword(hashed);
        	return studentRepo.save(newStudent);
        }
    }
    public Student login(LoginStudent newLogin, BindingResult result) {

    	if(result.hasErrors()) {
            return null;
        }
    	Optional<Student> potentialStudent = studentRepo.findByEmail(newLogin.getEmail());

    	if (!potentialStudent.isPresent()){
    		result.rejectValue("email", "Unique", "This email is not registered!");
    		return null;
    	}

    	Student student = potentialStudent.get();
    	if(!BCrypt.checkpw(newLogin.getPassword(), student.getPassword())) {
    	    result.rejectValue("password", "Matches", "Password is incorrect!");
    	    return null;
    	}
        if(result.hasErrors()) {
            return null;
        } else {
        	return student;
        }
    }
    
    public Student findStudentById(Long studentId) {
    	Optional<Student> thisStudent = studentRepo.findById(studentId);
    	if (thisStudent.isPresent()) {
    		return thisStudent.get();
    	}
    	else {
    		return null ;
    	}
    }
    public List<Student> findAll() {
    	return studentRepo.findAll();
    }
    public void deleteStudent(Long id) {
    	studentRepo.deleteById(id);
	}
}