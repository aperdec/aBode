package ca.sheridancollege.controllers;

import java.util.Date;
import java.util.List;

import javax.persistence.Embedded;

import ca.sheridancollege.beans.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.SystemWideSaltSource;
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
		
		dao.deleteDeficiency(id, homeEnrollmentNumber);

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

		return "displayUnitDeficiencies";
	}

	@RequestMapping("/saveDeficiency")
	public String saveDeficiency(Model model, @ModelAttribute Deficiency deficiency, @RequestParam long homeEnrollmentNumber) {

		List<Unit> unit = dao.getUnit(homeEnrollmentNumber);
		System.out.println("Unit Size:" + unit.size() + homeEnrollmentNumber);
		unit.get(0).addDeficiency(deficiency);

		dao.saveOrUpdateUnit(unit.get(0));

		List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);
		model.addAttribute("unit", unitList.get(0));

		return "displayUnitDeficiencies";
	}
	
	@RequestMapping("/displayUnitInfo")
	public String displayUnitInfo(Model model) {
		dao.addTestData();
		model.addAttribute("unit", new Unit());
		model.addAttribute("builder", new Builder());
		model.addAttribute("form", new Form());
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

		List<Form> form = dao.getForm(homeEnrollmentNumber);
		if (form.size() > 0) {
			model.addAttribute("form", form.get(0));
		} else {
			model.addAttribute("form", new Form());
		}
		
		return "displayUnitInfo";
	}

	@RequestMapping(value = "/saveUnit", method = RequestMethod.POST)
	public String saveUnit(
			Model model,
			@RequestParam long homeEnrollmentNumber,
			@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date posessionDate,
			@RequestParam int lotNumber,
			@RequestParam String address,
			@RequestParam String projectName,
			@RequestParam String municipality,
			@RequestParam int level,
			@RequestParam int unitNum,
			@RequestParam String plan,
			@RequestParam String repName
	) {

		Unit unit = new Unit(homeEnrollmentNumber, lotNumber, address, projectName, posessionDate, municipality, level, unitNum, plan);

		dao.saveOrUpdateUnit(unit);
		String builderUserName = this.getUserName();

		List<Unit>returns = dao.getUnit(homeEnrollmentNumber);
		model.addAttribute("unit", returns.get(0));

		List<Builder>returnsBuilder = dao.getBuilder(builderUserName);
		model.addAttribute("builder", returnsBuilder.get(0));

		Form form = new Form(homeEnrollmentNumber, "PDI", repName);

		dao.createForm(form);
		model.addAttribute("form", form);

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
