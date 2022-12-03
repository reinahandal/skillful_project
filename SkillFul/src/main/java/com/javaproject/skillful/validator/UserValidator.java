package com.javaproject.skillful.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.javaproject.skillful.models.User;
import com.javaproject.skillful.repositories.UserRepository;

@Component
public class UserValidator implements Validator {
    
	@Autowired
	UserRepository userRepo;
	
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {

            errors.rejectValue("confirm", "Match");
        }
        
//        if(userRepo.findByEmail(user.getEmail())) {
//        	
//        	errors.rejectValue("email", "Unique");
//        }
    }
}