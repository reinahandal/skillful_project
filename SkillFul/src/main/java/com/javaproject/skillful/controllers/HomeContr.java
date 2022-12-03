package com.javaproject.skillful.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javaproject.skillful.models.Student;
import com.javaproject.skillful.models.TutorProfile;
import com.javaproject.skillful.models.TutorProfileSubjects;
import com.javaproject.skillful.services.ProfileSubjectService;
import com.javaproject.skillful.services.StudentService;
import com.javaproject.skillful.services.SubjectService;
import com.javaproject.skillful.services.TestServ;
import com.javaproject.skillful.services.TutorProfileService;
import com.javaproject.skillful.services.TutorService;

@Controller
public class HomeContr {
	@Autowired
	TestServ testServ;
	@Autowired
	TutorProfileService profileService;
	
	@Autowired
	TutorService tutorService;
	
	@Autowired
	SubjectService subjectService;
	
	@Autowired
	ProfileSubjectService ProfileSubjectService;
	@Autowired
	StudentService studentServ;
	
	
	// renders website home page
	@GetMapping("/skillful")
	public String searcPh() {
		
		return "skillfulHomepage.jsp";
	}
	
	// renders dashboard with search results
	@GetMapping("/dashboard")
	public String search(Model model,HttpSession session) {
	Student student =studentServ.findStudentById( (Long) session.getAttribute("studentId"));
		model.addAttribute("student", student);
		return "filter.jsp";
	}
	
	// executes search
	@PostMapping("/search")
	public String dashboard(@RequestParam("search") String search,@RequestParam("location") String location,@RequestParam("level") String level,Model model,RedirectAttributes redirectAttributes) {
			
		try {
		
			if(location.contains("None") && level.contains("All")) {
			
			return "redirect:/search/"+search;
			
			}
			
			else if (level.contains("All")){
				return "redirect:/search/"+search+"/"+location;

			}
			else if (location.contains("None") && !level.contains("All") && search != ""){
				return "redirect:/search/level/"+search+"/"+level;

			}
			else if (!location.contains("None") && !level.contains("All") && search != "") {
				return "redirect:/search/location/"+search+"/"+location+"/"+level;

			}
			else if (search == "" && !level.contains("All")) {
				return "redirect:/dashboard";

			}
			else if (search == "" && !location.contains("None")) {
				return "redirect:/dashboard";

			}
		} 
		catch(Exception e) {

		}
		return "redirect:/dashboard";
		
	}
	// renders search result
	@GetMapping("/search/{search}")
	public String search(@PathVariable("search") String search, Model model) {
		List<Object []> skills = testServ.findSkill(search);
		System.out.println(skills);
		model.addAttribute("skills", skills);
		return "filter.jsp";
	}
	
	@GetMapping("/search/{search}/{location}")
	public String search(@PathVariable("search") String search,@PathVariable("location") int location, Model model) {
		List<Object []> skills = testServ.findSkillLoc(search,location);
		System.out.println(skills);
		model.addAttribute("skills", skills);
		return "filter.jsp";
	}
	

	@GetMapping("/search/level/{search}/{level}")
	public String searchLevel(@PathVariable("search") String search,@PathVariable("level") int level, Model model) {
		List<Object []> skills = testServ.findSkillLevel(search,level);
		System.out.println(skills);
		model.addAttribute("skills", skills);
		return "filter.jsp";
	}
	
	@GetMapping("/search/location/{search}/{location}/{level}")
	public String searchLevel(@PathVariable("search") String search,@PathVariable("location") int location,@PathVariable("level") int level, Model model) {
		List<Object []> skills = testServ.findSkillLevellocation(search,location,level);
		System.out.println(skills);
		model.addAttribute("skills", skills);
		return "filter.jsp";
	}
	
	// renders tutor profile when student clicks on a tutor from the search results
	@GetMapping("/tutor/profile/{id}/{skill}")
	public String showProfile(
			@PathVariable("id") Long profileId,
			Model model,
			HttpSession session,
			@PathVariable("skill") String skill) {
		TutorProfile tutorProfile = profileService.findProfileById(profileId);
		List<TutorProfileSubjects> sub =ProfileSubjectService.tutorSubjects(tutorProfile);
		
		for(TutorProfileSubjects sub2:sub) {
			if(sub2.getSubject().getTitle().contains(skill)) {
				System.out.println(sub2.getSubject().getTitle());
				model.addAttribute("subjectsearch", sub2);

			}
		}
		model.addAttribute("profileSubjects", ProfileSubjectService.tutorSubjects(tutorProfile));
		model.addAttribute("tutorProfile", profileService.findProfileById(profileId));
		return "NewTutorProfile.jsp";
	}

}










