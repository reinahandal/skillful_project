package com.javaproject.skillful.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.javaproject.skillful.models.Subject;

public interface SubjectRepository extends CrudRepository<Subject, Long> {
	List<Subject> findAll();
}
