package com.javaproject.skillful.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="tutor_subjects")
public class TutorProfileSubjects {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	 	@NotNull
	    private Double hourlyRate;
	 	
	 	@NotNull
	    private Level level;
	
	   	@Column(updatable=false)
	    private Date createdAt;
	    private Date updatedAt;
	    
	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="subject_id")
	    private Subject subject;
	    
	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="tutor_profile_id")
	    private TutorProfile tutorProfile;
	    
	    public TutorProfileSubjects() {
	    	
	    }
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public Double getHourlyRate() {
			return hourlyRate;
		}
		public void setHourlyRate(Double hourlyRate) {
			this.hourlyRate = hourlyRate;
		}

		public Level getLevel() {
			return level;
		}
		public void setLevel(Level level) {
			this.level = level;
		}
		public Date getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}
		public Date getUpdatedAt() {
			return updatedAt;
		}
		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}
		public Subject getSubject() {
			return subject;
		}
		public void setSubject(Subject subject) {
			this.subject = subject;
		}
		public TutorProfile getTutorProfile() {
			return tutorProfile;
		}
		public void setTutorProfile(TutorProfile tutorProfile) {
			this.tutorProfile = tutorProfile;
		}
		
		@PrePersist
		protected void onCreate(){
			this.createdAt = new Date();
		}
		@PreUpdate
		protected void onUpdate(){
			this.updatedAt = new Date();
		}    
}
