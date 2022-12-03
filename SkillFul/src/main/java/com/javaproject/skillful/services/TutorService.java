package com.javaproject.skillful.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.javaproject.skillful.models.LoginTutor;
import com.javaproject.skillful.models.Student;
import com.javaproject.skillful.models.Tutor;
import com.javaproject.skillful.repositories.TutorRepository;

@Service
public class TutorService {
	@Autowired
	TutorRepository tutorRepo;
	
    public Tutor register(Tutor newTutor, BindingResult result) {
        if(tutorRepo.findByEmail(newTutor.getEmail()).isPresent()) {
        	result.rejectValue("email", "Unique", "This email is already registered");
        }
        if(!newTutor.getPassword().equals(newTutor.getConfirm())) {
        	result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        if(result.hasErrors()) {
            return null;
        }
        else {

        	String hashed = BCrypt.hashpw(newTutor.getPassword(), BCrypt.gensalt());
        	newTutor.setPassword(hashed);
        	return tutorRepo.save(newTutor);
        }
    }

    public Tutor login(LoginTutor newLogin, BindingResult result) {

    	if(result.hasErrors()) {
            return null;
        }

    	Optional<Tutor> potentialTutor = tutorRepo.findByEmail(newLogin.getEmail());

    	if (!potentialTutor.isPresent()){
    		result.rejectValue("email", "Unique", "This email is not registered!");
    		return null;
    	}

    	Tutor tutor = potentialTutor.get();

    	if(!BCrypt.checkpw(newLogin.getPassword(), tutor.getPassword())) {
    	    result.rejectValue("password", "Matches", "Password is incorrect!");
    	    return null;
    	}
        if(result.hasErrors()) {
            return null;
        } else {
        	return tutor;
        }
    }
    
    public Tutor findTutorById(Long tutorId) {
    	Optional<Tutor> thisTutor = tutorRepo.findById(tutorId);
    	if (thisTutor.isPresent()) {
    		return thisTutor.get();
    	}
    	else {
    		return null ;
    	}
    }
    public List<Tutor> findAll() {
    	return tutorRepo.findAll();
    }
    public void deleteTutor(Long id) {
    	tutorRepo.deleteById(id);
	}
}
