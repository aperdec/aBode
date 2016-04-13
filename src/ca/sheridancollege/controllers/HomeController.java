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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ca.sheridancollege.beans.MyUserDetailsService;
import ca.sheridancollege.beans.Unit;
import ca.sheridancollege.beans.User;
import ca.sheridancollege.beans.UserRole;
import ca.sheridancollege.dao.DAO;

@Controller
public class HomeController {

	private DAO dao = new DAO();

	@RequestMapping("/")
	public String home(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
		    String currentUserName = authentication.getName();
		    
		    model.addAttribute("user", currentUserName);
		    
		    return "home";
		}
		
		return "loginForm"; 
	}
	
	@RequestMapping("/displayUnits")
	public String displayUnits(Model model) {
		
		List<Unit> unitList = dao.getAllUnits();
		
		model.addAttribute("unitList", unitList);
		
		return "displayUnits";
	}
	
	@RequestMapping("/displayUnitDeficiencies/{homeEnrollmentNumber}")
	public String viewSubject(Model model, @PathVariable long homeEnrollmentNumber) {

		List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);

		model.addAttribute("unit", unitList.get(0));

		return "displayUnitDeficiencies";
	}
	
	@RequestMapping("/displayUnitInfo")
	public String displayUnitInfo(Model model) {
		//dao.addTestData();
		return "displayUnitInfo";
	}
	
	@RequestMapping("/addSignOff")
	public String addSignOff(Model model) {
		return "addSignOff";
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
		
		return "home";
		
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
