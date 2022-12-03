package com.javaproject.skillful.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.javaproject.skillful.models.Tutor;

public interface TutorRepository extends CrudRepository<Tutor, Long> {
    Optional<Tutor> findByEmail(String email);
    List<Tutor> findAll();
}
