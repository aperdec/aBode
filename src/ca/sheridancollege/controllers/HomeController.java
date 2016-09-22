package ca.sheridancollege.controllers;

import java.util.Date;
import java.util.List;

import javax.persistence.Embedded;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ca.sheridancollege.beans.Builder;
import ca.sheridancollege.beans.Deficiency;
import ca.sheridancollege.beans.HomeOwner;
import ca.sheridancollege.beans.MyUserDetailsService;
import ca.sheridancollege.beans.Unit;
import ca.sheridancollege.beans.User;
import ca.sheridancollege.beans.UserRole;
import ca.sheridancollege.dao.DAO;

@Controller
public class HomeController {

	//public static String builderUserName = "Testnow";
	
	private DAO dao = new DAO();
	private long num = 0;
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
	
	@RequestMapping("/saveOrUpdateDeficiency")
	public String saveOrUpdateDeficiency(Model model, @ModelAttribute Deficiency deficiency, @ModelAttribute long homeEnrollmentNumber) {
		
		dao.saveOrUpdate(deficiency);
		
		List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);

		model.addAttribute("unit", unitList.get(0));
		
		return "displayDeficiencies";
	}
	
	@RequestMapping("/addDeficiency/{homeEnrollmentNumber}")
	public String addDeficiency(Model model, @PathVariable long homeEnrollmentNumber) {
		
		Deficiency deficiency = new Deficiency();
		
		List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);

		model.addAttribute("unit", unitList.get(0));
		model.addAttribute("deficiency", deficiency);
		
		return "addDeficiency";
	}
	
	@RequestMapping("/deleteDeficiency/{id}/{homeEnrollmentNumber}")
	public String deleteDeficiency(Model model, @PathVariable int id, @PathVariable long homeEnrollmentNumber) {
		
		dao.deleteDeficiency(id);

		List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);

		model.addAttribute("unit", unitList.get(0));

		return "displayUnitDeficiencies";
	}
	
	@RequestMapping("/displayUnits")
	public String displayUnits(Model model) {
		
		List<Unit> unitList = dao.getAllUnits();
		
		model.addAttribute("unitList", unitList);
		
		return "displayUnits";
	}
	

	@RequestMapping("/displayUnitDeficiencies/{homeEnrollmentNumber}")
	public String viewUnitDeficiencies(Model model, @PathVariable long homeEnrollmentNumber) {

		List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);
		model.addAttribute("unit", unitList.get(0));
//		model.addAttribute("def", new Deficiency());

		return "displayUnitDeficiencies";
	}

	@RequestMapping("/saveDeficiency")
	public String saveDeficiency(Model model, @ModelAttribute Deficiency deficiency) {

		List<Unit> unit = dao.getUnit(deficiency.getHomeEnrollmentNumber());
		unit.get(0).addDeficiency(deficiency);

//		dao.saveOrUpdateUnit(unit.get(0));

		List<Unit> unitList = dao.getUnit(deficiency.getHomeEnrollmentNumber());
		model.addAttribute("unit", unitList.get(0));
//		model.addAttribute("def", new Deficiency());

		return "displayUnitDeficiencies";
	}
	
	@RequestMapping("/displayUnitInfo")
	public String displayUnitInfo(Model model) {
		dao.addTestData();
		model.addAttribute("unit", new Unit());
		model.addAttribute("builder", new Builder());
		//dao.getUnit(homeEnrollmentNumber);
		return "displayUnitInfo";
	}
	
	//@RequestMapping("/displayUnitData")
	@RequestMapping(value="/displayUnitData", method=RequestMethod.POST)
	public String displayUnitData(Model model, @RequestParam long homeEnrollmentNumber) {
		
		String builderUserName = this.getUserName();
		
		List<Unit>returns = dao.getUnit(homeEnrollmentNumber);
		Unit match = returns.get(0);
		//System.out.println("testing " + match.getAddress());
		model.addAttribute("unit", match);
		num = match.getHomeEnrollmentNumber();
		
		List<Builder>returnsBuilder = dao.getBuilder(builderUserName);
		Builder matchBuilder = returnsBuilder.get(0);
		model.addAttribute("builder",matchBuilder);
		
		return "displayUnitInfo";
	}

	@RequestMapping("/saveUnit")
	public String saveUnit(Model model, @ModelAttribute Unit u) {
		List<Unit>returns = dao.getUnit(num);
		Unit match = returns.get(0);
		//match.setLotNumber(lotNumber);
		match.setAddress(u.getAddress());
		//match.setProjectName(projectName);
		//match.setMunicipality(municipality);
		//match.setLevel(level);
		//match.setPlan(plan);
		//match.setUnitNum(unitNum);
		dao.saveOrUpdateUnit(match);
		System.out.println("testing SAVE" + u.getAddress());
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
