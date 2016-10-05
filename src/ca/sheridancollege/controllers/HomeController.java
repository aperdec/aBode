package ca.sheridancollege.controllers;

import ca.sheridancollege.beans.Builder;
import ca.sheridancollege.beans.Deficiency;
import ca.sheridancollege.beans.Form;
import ca.sheridancollege.beans.Unit;
import ca.sheridancollege.dao.DAO;
import ca.sheridancollege.services.ControllerServices;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@Controller
public class HomeController {

    private DAO dao = new DAO();
    private long num = 0;
    private ControllerServices controllerServices = new ControllerServices();

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

        model = controllerServices.updateDeficiency(model, deficiency, homeEnrollmentNumber);

        return "displayDeficiencies";
    }

    @RequestMapping("/addDeficiency/{homeEnrollmentNumber}")
    public String addDeficiency(Model model, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.addDeficiency(model, homeEnrollmentNumber);

        return "addDeficiency";
    }

    @RequestMapping("/workOrderAddDeficiency/{homeEnrollmentNumber}")
    public String workOrderAddDeficiency(Model model, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.addDeficiency(model, homeEnrollmentNumber);

        return "workOrderAddDeficiency";
    }

    @RequestMapping("/deleteDeficiency/{id}/{homeEnrollmentNumber}")
    public String deleteDeficiency(Model model, @PathVariable int id, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.deleteDeficiency(model, id, homeEnrollmentNumber);

        return "displayUnitDeficiencies";
    }

    @RequestMapping("/workOrderDeleteDeficiency/{id}/{homeEnrollmentNumber}")
    public String workOrderDeleteDeficiency(Model model, @PathVariable int id, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.deleteDeficiency(model, id, homeEnrollmentNumber);

        return "workOrderDisplayUnitDeficiencies";
    }

    @RequestMapping("/workOrderCompleteDeficiency/{id}/{homeEnrollmentNumber}")
    public String workOrderCompleteDeficiency(Model model, @PathVariable int id, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.completeDeficiency(model, id, homeEnrollmentNumber);

        return "workOrderDisplayUnitDeficiencies";
    }

    @RequestMapping("/displayUnits")
    public String displayUnits(Model model) {

        model = controllerServices.displayUnits(model);

        return "displayUnits";
    }


    @RequestMapping("/displayUnitDeficiencies/{homeEnrollmentNumber}")
    public String viewUnitDeficiencies(Model model, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.displayUnitDeficiencies(model, homeEnrollmentNumber);

        return "displayUnitDeficiencies";
    }

    @RequestMapping("/workOrderDisplayUnitDeficiencies/{homeEnrollmentNumber}")
    public String workOrderViewUnitDeficiencies(Model model, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.displayUnitDeficiencies(model, homeEnrollmentNumber);

        return "workOrderDisplayUnitDeficiencies";
    }

    @RequestMapping("/saveDeficiency")
    public String saveDeficiency(
            Model model,
            @RequestParam int id,
            @RequestParam String location,
            @RequestParam String description,
            @RequestParam String constructionPersonnel,
            @RequestParam String category,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date deadline,
            @RequestParam long homeEnrollmentNumber
    ) {

        model = controllerServices.saveDeficiency(model, id, location, description, constructionPersonnel, category, deadline, homeEnrollmentNumber);

        return "displayUnitDeficiencies";
    }

    @RequestMapping("/workOrderSaveDeficiency")
    public String workOrderSaveDeficiency(
            Model model,
            @RequestParam int id,
            @RequestParam String location,
            @RequestParam String description,
            @RequestParam String constructionPersonnel,
            @RequestParam String category,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date deadline,
            @RequestParam long homeEnrollmentNumber
    ) {

        model = controllerServices.saveDeficiency(model, id, location, description, constructionPersonnel, category, deadline, homeEnrollmentNumber);

        return "workOrderDisplayUnitDeficiencies";
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

    @RequestMapping(value = "/displayUnitData", method = RequestMethod.POST)
    public String displayUnitData(Model model, @RequestParam long homeEnrollmentNumber) {

        model = controllerServices.displayUnitData(model, homeEnrollmentNumber, num);

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

        model = controllerServices.saveUnit(model, homeEnrollmentNumber, posessionDate, lotNumber, address, projectName, municipality, level, unitNum, plan, repName);

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

        model = controllerServices.register(model, username, password);

        return "home";

    }

    @RequestMapping("/workOrderHome")
    public String workOrderHome(Model model) {

        return "workOrderHome";
    }

    @RequestMapping("/displayBuildingProjects")
    public String displayBuildingProjects(Model model) {

        model = controllerServices.displayBuildingProjects(model);

        return "displayBuildingProjects";
    }

    @RequestMapping("/displayConstructionPersonnel")
    public String displayConstructionPersonnel(Model model) {

        model = controllerServices.displayConstructionPersonnel(model);

        return "displayConstructionPersonnel";
    }

    @RequestMapping("/displayUnits/{project}")
    public String displayUnits(Model model, @PathVariable String project) {

        model = controllerServices.displayUnitsByProject(model, project);

        return "displayUnits";
    }

    //this displays an image from the database
    @RequestMapping(value = "/imageDisplay/{homeEnrollmentNumber}")
    public void getImage(HttpServletResponse response,@PathVariable long homeEnrollmentNumber) throws IOException {

        response = controllerServices.getImage(response, homeEnrollmentNumber);
    }

}
