package com.javaproject.skillful.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaproject.skillful.models.Session;
import com.javaproject.skillful.repositories.SessionRepository;

@Service
public class SessionService {
	@Autowired
	SessionRepository sessionRepository;
	
	
	//methods
	//method to retrieve all sessions
	public List<Session> allSessions() {
		return sessionRepository.findAll();
	}
	
	//method to find specific session
	public Session findSession(Long id) {
		Optional<Session> sessions = sessionRepository.findById(id);
		if (sessions.isPresent()) {
			return sessions.get();
		}else {
			return null;
		}
	}
	
	// method to create a session
	public Session createSession(Session session) {
		return sessionRepository.save(session);
	}
	
	//method to delete a session
	public void deleteSession(Long id) {
		sessionRepository.deleteById(id);
	}
}
