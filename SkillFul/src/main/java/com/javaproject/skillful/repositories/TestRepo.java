package com.javaproject.skillful.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.javaproject.skillful.models.Tutor;
@Repository
public interface TestRepo extends CrudRepository<Tutor, Long>{
		
	@Query(value="SELECT tutors.first_name ,tutors.last_name,tutor_profiles.id,subjects.title FROM  tutors join tutor_profiles on tutors.id = tutor_profiles.tutor_id join tutor_subjects on tutor_profiles.id = tutor_subjects.tutor_profile_id join subjects on subjects.id = tutor_subjects.subject_id where subjects.title= :skill",nativeQuery = true)
	List<Object []> findByskills(String skill);
	
	@Query(value="SELECT tutors.first_name ,tutors.last_name,tutor_profiles.id,subjects.title FROM  tutors join tutor_profiles on tutors.id = tutor_profiles.tutor_id join tutor_subjects on tutor_profiles.id = tutor_subjects.tutor_profile_id join subjects on subjects.id = tutor_subjects.subject_id where subjects.title= :skill and tutor_profiles.location= :location",nativeQuery = true)
	List<Object []> findByskillsLocation(String skill,int location);
	
	@Query(value="SELECT tutors.first_name ,tutors.last_name,tutor_profiles.id,subjects.title FROM  tutors join tutor_profiles on tutors.id = tutor_profiles.tutor_id join tutor_subjects on tutor_profiles.id = tutor_subjects.tutor_profile_id join subjects on subjects.id = tutor_subjects.subject_id where subjects.title= :skill and tutor_subjects.level= :level",nativeQuery = true)
	List<Object []> findByskillsLevel(String skill,int level);
	
	@Query(value="SELECT tutors.first_name ,tutors.last_name,tutor_profiles.id,subjects.title FROM  tutors join tutor_profiles on tutors.id = tutor_profiles.tutor_id join tutor_subjects on tutor_profiles.id = tutor_subjects.tutor_profile_id join subjects on subjects.id = tutor_subjects.subject_id where subjects.title= :skill and tutor_profiles.location= :location and tutor_subjects.level= :level",nativeQuery = true)
	List<Object []> findByskillsLevelLocation(String skill,int location,int level);
	
}
