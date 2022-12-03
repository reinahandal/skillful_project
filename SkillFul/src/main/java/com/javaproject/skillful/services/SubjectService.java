package com.javaproject.skillful.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaproject.skillful.models.Subject;
import com.javaproject.skillful.repositories.SubjectRepository;

@Service
public class SubjectService {
	
	@Autowired
	SubjectRepository subjectRepo;
	
    public ArrayList<Subject> allSubjects() {
        return (ArrayList<Subject>) subjectRepo.findAll();
    }

}
