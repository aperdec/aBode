package ca.sheridancollege.controllers;

import java.util.List;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ca.sheridancollege.beans.MyUserDetailsService;
import ca.sheridancollege.beans.Subject;
import ca.sheridancollege.beans.User;
import ca.sheridancollege.beans.UserRole;
import ca.sheridancollege.dao.DAO;

@Controller
public class HomeController {

	private DAO dao = new DAO();

	@RequestMapping("/")
	public String home(Model model) {

		// dao.saveSubject(new Subject("Test", "This is a test subject.",
		// "aperdec"));

		model.addAttribute("subjectList", dao.getSubjectList());
		
		String username = getUserName();
		System.out.println(username);

		return "displaySubjects"; 
	}

	@RequestMapping("saveSubject")
	public String saveStudent(Model model, @ModelAttribute Subject subject) {

		dao.saveSubject(subject);

		model.addAttribute("subjectList", dao.getSubjectList());

		return "displaySubjects";
	}

	@RequestMapping("editSubject/{title}")
	public String editSubject(Model model, @PathVariable String title) {

		List<Subject> subjectList = dao.getSubject(title);

		model.addAttribute("subject", subjectList.get(0));

		return "addSubject";
	}

	@RequestMapping("addSubject")
	public String addSubject(Model model) {

		model.addAttribute("subject", new Subject());

		return "addSubject";
	}

	@RequestMapping("viewSubject/{title}")
	public String viewSubject(Model model, @PathVariable String title) {

		List<Subject> subjectList = dao.getSubject(title);

		model.addAttribute("subject", subjectList.get(0));

		return "viewSubject";
	}
	
	@RequestMapping("deleteSubject/{title}")
	public String deleteSubject(Model model, @PathVariable String title) {
		
		dao.removeSubject(title);

		model.addAttribute("subjectList", dao.getSubjectList());

		return "displaySubjects";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {

		return "loginForm";
	}
	
	@RequestMapping("/createAccount")
	public String createAccount(Model model) {
		return "createAccount";
	}
	
	@RequestMapping("/register")
	public String register(Model model, @RequestParam String username, @RequestParam String password) {

		String encryptedPassword = new BCryptPasswordEncoder().encode(password);
		User user = new User(username, encryptedPassword, true);

		UserRole userRole = new UserRole(user, "ROLE_USER");
		user.getUserRole().add(userRole);

		DAO dao = new DAO();
		dao.createUser(user);

		UserDetails userDetails = new MyUserDetailsService().loadUserByUsername(username);
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userDetails,
				encryptedPassword, userDetails.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);

		model.addAttribute("accountCreated", true);
		
		model.addAttribute("subjectList", dao.getSubjectList());

		return "displaySubjects";
		
	}
	
	public String getUserName() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
		    String currentUserName = authentication.getName();
		    return currentUserName;
		}
		return null;
	}

}
