package com.javaproject.skillful.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="subjects")
public class Subject {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	
	@NotEmpty(message="Title is required!")
	@Size(min=3, max=30, message="Title must be between 3 and 30 characters")
	private String title;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }


	public Subject() {
	}
	
	
	
	 @ManyToMany(fetch = FetchType.LAZY)
     @JoinTable(
         name = "tutor_subjects", 
         joinColumns = @JoinColumn(name = "subject_id"), 
         inverseJoinColumns = @JoinColumn(name = "tutor_profile_id")
     )     
    private List<TutorProfile> tprofile;


	public List<TutorProfile> getTprofile() {
		return tprofile;
	}


	public void setTprofile(List<TutorProfile> tprofile) {
		this.tprofile = tprofile;
	}
	
	
	
}
