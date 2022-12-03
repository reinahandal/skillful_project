package com.javaproject.skillful.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaproject.skillful.repositories.TestRepo;
@Service
public class TestServ {
		@Autowired 
		TestRepo testRepo;
		
		public List<Object []> findSkill(String skill){
			return testRepo.findByskills(skill);
		}
		
		public List<Object []> findSkillLoc(String skill,int loc){
			return testRepo.findByskillsLocation(skill,loc);
		}
		
		public List<Object []> findSkillLevel(String skill,int level){
			return testRepo.findByskillsLevel(skill,level);
		}
		public List<Object []> findSkillLevellocation(String skill,int location,int level){
			return testRepo.findByskillsLevelLocation(skill,location,level);
		}
}
