package com.javaproject.skillful.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.javaproject.skillful.models.Session;

@Repository
public interface SessionRepository extends CrudRepository<Session, Long>{
	List<Session> findAll();
}
