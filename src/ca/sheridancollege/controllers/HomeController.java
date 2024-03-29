package ca.sheridancollege.controllers;

import ca.sheridancollege.beans.Deficiency;
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

    @RequestMapping("/editDeficiency/{homeEnrollmentNumber}/{id}")
    public String editDeficiency(Model model, @PathVariable long homeEnrollmentNumber, @PathVariable int id) {

        model = controllerServices.editDeficiency(model, homeEnrollmentNumber, id);

        return "editDeficiency";
    }

    @RequestMapping("/addDeficiency2/{homeEnrollmentNumber}")
    public String addDeficiency2(Model model, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.addDeficiency(model, homeEnrollmentNumber);

        return "addDeficiency2";
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

    @RequestMapping("/deleteDeficiency2/{id}/{homeEnrollmentNumber}")
    public String deleteDeficiency2(Model model, @PathVariable int id, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.deleteDeficiency(model, id, homeEnrollmentNumber);

        return "displayUnitDeficiencies2";
    }


    @RequestMapping("/workOrderDeleteDeficiency/{id}/{homeEnrollmentNumber}")
    public String workOrderDeleteDeficiency(Model model, @PathVariable int id, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.deleteDeficiency(model, id, homeEnrollmentNumber);

        return "workOrderDisplayUnitDeficiencies";
    }

    @RequestMapping("/workOrderCompleteDeficiencyUnit/{id}/{homeEnrollmentNumber}")
    public String workOrderCompleteDeficiencyUnit(Model model, @PathVariable int id, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.completeDeficiencyUnit(model, id, homeEnrollmentNumber);

        return "workOrderDisplayUnitDeficiencies";
    }

    @RequestMapping("/workOrderCompleteDeficiency/{id}/{homeEnrollmentNumber}/{constructionPersonnel}")
    public String workOrderCompleteDeficiency(Model model, @PathVariable int id, @PathVariable long homeEnrollmentNumber, @PathVariable String constructionPersonnel) {

        model = controllerServices.completeDeficiency(model, id, homeEnrollmentNumber, constructionPersonnel);

        return "displayConstructionPersonnelDeficiencies";
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

    //new
    @RequestMapping("/displayUnitDeficiencies2/{homeEnrollmentNumber}")
    public String viewUnitDeficiencies2(Model model, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.displayUnitDeficiencies(model, homeEnrollmentNumber);

        return "displayUnitDeficiencies2";
    }

    @RequestMapping("/workOrderDisplayUnitDeficiencies/{homeEnrollmentNumber}")
    public String workOrderViewUnitDeficiencies(Model model, @PathVariable long homeEnrollmentNumber) {

        model = controllerServices.displayUnitDeficiencies(model, homeEnrollmentNumber);

        return "workOrderDisplayUnitDeficiencies";
    }

    @RequestMapping("/workOrderDisplayUnitDeficiencies")
    public String workOrderViewUnitDeficienciesNavBar(Model model, @RequestParam long homeEnrollmentNumber) {

        model = controllerServices.displayUnitDeficiencies(model, homeEnrollmentNumber);

        if (model.containsAttribute("errorUnit")) {
            return "displayBuildingProjects";
        } else {
            return "workOrderDisplayUnitDeficiencies";
        }
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

    @RequestMapping("/saveDeficiency2")
    public String saveDeficiency2(
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

        return "displayUnitDeficiencies2";
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
    
    @RequestMapping(value = "/saveUnit3", method = RequestMethod.POST)
    public String saveUnit3(
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

        return "displayUnitDeficiencies";
    }
    

    @RequestMapping("/buildInspection")
    public String buildInspection(Model model) {
        return "buildInspection";
    }

    @RequestMapping(value = "/displayUnitData2", method = RequestMethod.POST)
    public String displayUnitData2(Model model, @RequestParam long homeEnrollmentNumber) {

        model = controllerServices.displayUnitData(model, homeEnrollmentNumber, num);

        return "buildInspection";
    }

    @RequestMapping(value = "/saveUnit2", method = RequestMethod.POST)
    public String saveUnit2(
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

        model = controllerServices.saveUnit2(model, homeEnrollmentNumber, posessionDate, lotNumber, address, projectName, municipality, level, unitNum, plan, repName);

        return "displayUnitDeficiencies2";
    }

    @RequestMapping("/addSignOff/{homeEnrollmentNumber}")
    public String addSignOff(Model model, @PathVariable long homeEnrollmentNumber) {
        model = controllerServices.loadSignOff(model, homeEnrollmentNumber);
        return "addSignOff";
    }

    @RequestMapping(value = "/addSignOff", method = RequestMethod.POST)
    public String saveForm(Model model, @RequestParam long homeEnrollmentNumber, @RequestParam String desName) {

        model = controllerServices.saveForm(model, homeEnrollmentNumber, desName);

        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model) {
        return "loginForm";
    }

    @RequestMapping("/pdiReport")
    public String pdiReport(Model model) {

        //model = controllerServices.displayPdiReport(model);

        return "pdiReport";
    }

    @RequestMapping("/pdiReportData")
    public String pdiReportData(Model model, @RequestParam long homeEnrollmentNumber) {

        model = controllerServices.displayPdiReport(model, homeEnrollmentNumber);

        return "pdiReport";
    }

    @RequestMapping("/selectReport")
    public String selectReport(Model model) {
        return "selectReport";
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

    // this displays an image from the database
    @RequestMapping(value = "/imageDisplay/{homeEnrollmentNumber}")
    public void getImage(HttpServletResponse response, @PathVariable long homeEnrollmentNumber) throws IOException {

        response = controllerServices.getImage(response, homeEnrollmentNumber);
    }

    @RequestMapping(value = "/imageDisplay/{homeEnrollmentNumber}/2")
    public void getImage2(HttpServletResponse response, @PathVariable long homeEnrollmentNumber) throws IOException {

        response = controllerServices.getImage2(response, homeEnrollmentNumber);
    }

    // this displays an image from the database
    @RequestMapping(value = "defImage/{homeEnrollmentNumber}/{id}")
    public void getDefImage(HttpServletResponse response, @PathVariable long homeEnrollmentNumber, @PathVariable int id) throws IOException {

        response = controllerServices.getDefImage(response, homeEnrollmentNumber, id);
    }

    @RequestMapping("/displayDeficiencies/{id}")
    public String displayDeficienciesByConstructionPersonnel(Model model, @PathVariable int id) {

        model = controllerServices.displayDeficienciesByConstructionPersonnel(model, id);

        return "displayConstructionPersonnelDeficiencies";
    }

    @RequestMapping("/help")
    public String help(Model model) {

        return "help";
    }

}
