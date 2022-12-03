package com.javaproject.skillful.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.javaproject.skillful.models.TutorProfile;
import com.javaproject.skillful.models.TutorProfileSubjects;

public interface TutorProfileSubjectRepository extends CrudRepository<TutorProfileSubjects, Long> {
	List<TutorProfileSubjects> findAllByTutorProfile(TutorProfile p);
}
