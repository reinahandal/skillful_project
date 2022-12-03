package com.javaproject.skillful.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaproject.skillful.models.TutorProfile;
import com.javaproject.skillful.models.TutorProfileSubjects;
import com.javaproject.skillful.repositories.TutorProfileSubjectRepository;

@Service
public class ProfileSubjectService {
	@Autowired
	TutorProfileSubjectRepository profileSubjectRepo;
	
	public void deleteprofileSubject(Long id) {
		profileSubjectRepo.deleteById(id);
	}
	
	// returns subjects this user teaches
	public List<TutorProfileSubjects> tutorSubjects(TutorProfile tp){
		return profileSubjectRepo.findAllByTutorProfile(tp);
	}
	
	public TutorProfileSubjects findProfileSubject(Long id) {
		Optional<TutorProfileSubjects> optionalSubject = profileSubjectRepo.findById(id);
		if (optionalSubject.isPresent()) {
			return optionalSubject.get();
		} else {
			return null;
		}
	}
	
	// adds subject to profile
	public TutorProfileSubjects addSubject(TutorProfileSubjects ps) {
		return profileSubjectRepo.save(ps);
	}
	
	// updates subject
	public TutorProfileSubjects updateprofileSubject(TutorProfileSubjects ps) {
		return profileSubjectRepo.save(ps);
	}
}
