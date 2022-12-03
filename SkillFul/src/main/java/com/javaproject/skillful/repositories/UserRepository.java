package com.javaproject.skillful.repositories;

import org.springframework.data.repository.CrudRepository;

import com.javaproject.skillful.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByUsername(String username);
}
