package com.javaproject.skillful.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.javaproject.skillful.models.Tutor;
import com.javaproject.skillful.models.TutorProfile;

public interface TutorProfileRepository extends CrudRepository<TutorProfile, Long> {
	List<TutorProfile> findAll();
	
	TutorProfile findByTutorIs(Tutor tutor);
}
