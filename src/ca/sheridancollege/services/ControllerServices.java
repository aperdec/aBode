package ca.sheridancollege.services;

import ca.sheridancollege.beans.*;
import ca.sheridancollege.dao.DAO;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * Created by Perds on 9/30/2016.
 */
public class ControllerServices {

    private DAO dao = new DAO();

    public Model displayUnitDeficiencies(Model model, Long homeEnrollmentNumber) {
        List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);
        Unit unit = unitList.get(0);
        unit.setDeficiencies(sortDeficiencyList(unit.getDeficiencies()));
        model.addAttribute("unit", unit);

        return model;
    }

    public Model saveDeficiency(Model model, int id, String location, String description, String constructionPersonnel, String category, Date deadline, long homeEnrollmentNumber) {
        constructionPersonnel = constructionPersonnel.substring(constructionPersonnel.indexOf("-")).replace("-", "").trim();
        System.out.println("construction personnel substring: " + constructionPersonnel);
        Deficiency deficiency = new Deficiency(id, location, description, constructionPersonnel, category, deadline, false, homeEnrollmentNumber);
        List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);
        System.out.println("Unit Size:" + unitList.size() + homeEnrollmentNumber);
        unitList.get(0).addDeficiency(deficiency);

        dao.saveOrUpdateUnit(unitList.get(0));

        unitList = dao.getUnit(homeEnrollmentNumber);
        Unit unit = unitList.get(0);
        unit.setDeficiencies(sortDeficiencyList(unit.getDeficiencies()));

        model.addAttribute("unit", unit);

        return model;
    }

    public Model displayUnitData(Model model, long homeEnrollmentNumber, long num) {
        String builderUserName = this.getUserName();

        List<Unit> returns = dao.getUnit(homeEnrollmentNumber);
        Unit match = returns.get(0);
        //System.out.println("testing " + match.getAddress());
        model.addAttribute("unit", match);
        num = match.getHomeEnrollmentNumber();

        List<Builder> returnsBuilder = dao.getBuilder(builderUserName);
        Builder matchBuilder = returnsBuilder.get(0);
        model.addAttribute("builder", matchBuilder);

        List<Form> form = dao.getForm(homeEnrollmentNumber);
        if (form.size() > 0) {
            model.addAttribute("form", form.get(0));

            //this downloads it to your computer -- good for testing
            /*
            try{
            	FileOutputStream input = new FileOutputStream("C:\\abode\\refSigTWO.png");
            	String st = input.toString();
            	System.out.print(st);
            	input.write(form.get(0).getRepSig());
            	input.close();
            } catch(Exception e){
            	e.printStackTrace();
            }*/
        } else {
            model.addAttribute("form", new Form());
        }

        //String img = form.get(0).getRepSig().toString();

        return model;
    }

    public String getUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            return currentUserName;
        }
        return null;
    }

    public Model saveUnit(Model model, long homeEnrollmentNumber, Date posessionDate, int lotNumber, String address, String projectName, String municipality, int level, int unitNum, String plan, String repName) {
        Unit unit = new Unit(homeEnrollmentNumber, lotNumber, address, projectName, posessionDate, municipality, level, unitNum, plan);

        dao.saveOrUpdateUnit(unit);
        String builderUserName = this.getUserName();

        List<Unit> returns = dao.getUnit(homeEnrollmentNumber);
        model.addAttribute("unit", returns.get(0));

        List<Builder> returnsBuilder = dao.getBuilder(builderUserName);
        Builder b = returnsBuilder.get(0);
        model.addAttribute("builder", returnsBuilder.get(0));

        Form form;

        List<Form> formList = dao.getForm(homeEnrollmentNumber);
        if (formList.size() > 0) {
            form = formList.get(0);
            form.setRepName(repName);
        } else {
            form = new Form(homeEnrollmentNumber, "PDI", repName);
        }

        List<HomeOwner> returnPurch = dao.getHomeOwner(homeEnrollmentNumber);
        HomeOwner ho = returnPurch.get(0);

        form.setPurchName(ho.getName());
        form.setBuilderRefNum(b.getBuilderRefNum());

        File sig = new File("C:\\abode\\refSig.png");
        byte[] sigImg = new byte[(int) sig.length()];

        try {
            FileInputStream input = new FileInputStream(sig);
            input.read(sigImg);
            input.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        form.setRepSig(sigImg);

        dao.saveOrUpdateForm(form);
        model.addAttribute("form", form);

        return model;
    }

    public Model saveForm(Model model, long homeEnrollmentNumber, String desName) {

        List<Form> returns = dao.getForm(homeEnrollmentNumber);
        Form addSignOff = returns.get(0);

        addSignOff.setDesName(desName);

        File sig = new File("C:\\abode\\purSig.png");
        byte[] sigImg = new byte[(int) sig.length()];

        try {
            FileInputStream input = new FileInputStream(sig);
            input.read(sigImg);
            input.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        addSignOff.setFinalSig(sigImg);
        model.addAttribute("form", addSignOff);

        dao.saveOrUpdateForm(addSignOff);

        return model;
    }

    public Model loadSignOff(Model model, long homeEnrollmentNumber) {

        List<Form> returns = dao.getForm(homeEnrollmentNumber);
        Form addSignOff = returns.get(0);

        List<HomeOwner> home = dao.getHomeOwner(homeEnrollmentNumber);
        HomeOwner ho = home.get(0);

        addSignOff.setPurchName(ho.getName());
        model.addAttribute("form", addSignOff);

        dao.saveOrUpdateForm(addSignOff);

        return model;
    }

    public Model register(Model model, String username, String password) {
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

        return model;
    }

    public Model addDeficiency(Model model, long homeEnrollmentNumber) {
        List<ConstructionPersonnel> constructionPersonnelList = dao.getAllConstructionPersonnel();
        List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);
        Unit unit = unitList.get(0);
        unit.setDeficiencies(sortDeficiencyList(unit.getDeficiencies()));
        Deficiency deficiency = new Deficiency();
        if (unit.getDeficiencies().size() > 0) {
            deficiency.setId(unit.getDeficiencies().get(unit.getDeficiencies().size() - 1).getId() + 1);
        } else {
            deficiency.setId(1);
        }
        Category categories = new Category();

        model.addAttribute("categories", categories);
        model.addAttribute("unit", unit);
        model.addAttribute("deficiency", deficiency);
        model.addAttribute("constructionPersonnelList", constructionPersonnelList);

        return model;
    }

    public Model deleteDeficiency(Model model, int id, long homeEnrollmentNumber) {
        dao.deleteDeficiency(id, homeEnrollmentNumber);

        List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);
        Unit unit = unitList.get(0);
        unit.setDeficiencies(sortDeficiencyList(unit.getDeficiencies()));

        model.addAttribute("unit", unit);

        return model;
    }

    public Model updateDeficiency(Model model, Deficiency deficiency, long homeEnrollmentNumber) {
        dao.saveOrUpdate(deficiency);

        List<Unit> unitList = dao.getUnit(homeEnrollmentNumber);
        Unit unit = unitList.get(0);
        unit.setDeficiencies(sortDeficiencyList(unit.getDeficiencies()));

        model.addAttribute("unit", unit);

        return model;
    }

    public Model displayUnits(Model model) {
        List<Unit> unitList = dao.getAllUnits();

        model.addAttribute("unitList", unitList);

        return model;
    }

    public Model displayBuildingProjects(Model model) {
        List<String> projectList = new ArrayList<>();

        // Fake project
        projectList.add("Blue Skys Project");

        //Condominiums by Times Group Inc
        projectList.add("Eden Park II");
        projectList.add("River Park");
        projectList.add("River Walk East");

        //Coming soon
        projectList.add("Luxr Towns");
        projectList.add("Village Park Phase II");
        projectList.add("River Side");
        model.addAttribute("projectList", projectList);

        return model;
    }

    public Model displayUnitsByProject(Model model, String project) {
        List<Unit> unitList = dao.getUnitsByProject(project);

        model.addAttribute("unitList", unitList);

        return model;
    }

    //gets first sig
    public HttpServletResponse getImage(HttpServletResponse response, long homeEnrollmentNumber) throws IOException {
        response.setContentType("image/png");
        List<Form> form = dao.getForm(homeEnrollmentNumber);
        Form f = form.get(0);
        byte[] imageBytes = f.getRepSig();
        response.getOutputStream().write(imageBytes);
        response.getOutputStream().flush();

        return response;
    }

    //get final sig
    public HttpServletResponse getImage2(HttpServletResponse response, long homeEnrollmentNumber) throws IOException {
        response.setContentType("image/png");
        List<Form> form = dao.getForm(homeEnrollmentNumber);
        Form f = form.get(0);
        byte[] imageBytes = f.getFinalSig();
        response.getOutputStream().write(imageBytes);
        response.getOutputStream().flush();

        return response;
    }

    public Model completeDeficiency(Model model, int id, long homeEnrollmentNumber) {
        Unit unit = dao.completeDeficiency(id, homeEnrollmentNumber);
        unit.setDeficiencies(sortDeficiencyList(unit.getDeficiencies()));

        model.addAttribute("unit", unit);

        return model;
    }

    public Model displayPdiReport(Model model, long homeEnrollmentNumber) {

        List<Unit> unit = dao.getUnit(homeEnrollmentNumber);
        List<Form> form = dao.getForm(homeEnrollmentNumber);
        List<Builder> builder = dao.getBuilderRefNum("batman");

        model.addAttribute("form", form.get(0));
        model.addAttribute("unit", unit.get(0));
        model.addAttribute("builder", builder.get(0));

        return model;
    }

    public Model displayConstructionPersonnel(Model model) {
        List<ConstructionPersonnel> constructionPersonnelList = dao.getAllConstructionPersonnel();
        List<Unit> unitList = dao.getAllUnits();

        List<TotalDeficiencies> totalDeficiencies = new ArrayList<>();

        for (ConstructionPersonnel constructionPersonnel : constructionPersonnelList){
            int count = 0;
            for (Unit unit : unitList) {
                for (Deficiency deficiency : unit.getDeficiencies()) {
                    if (deficiency.getConstructionPersonnel().equals(constructionPersonnel.getName())) {
                        count++;
                    }
                }
            }
            totalDeficiencies.add(new TotalDeficiencies(constructionPersonnel.getId(), constructionPersonnel.getName(), count));
        }

        model.addAttribute("constructionPersonnelList", totalDeficiencies);

        return model;
    }

    public Model displayDeficienciesByConstructionPersonnel(Model model, int id) {
        List<Deficiency> deficiencyList = new ArrayList<>();
        List<Unit> unitList = dao.getAllUnits();
        List<ConstructionPersonnel> constructionPersonnelList = dao.getConstructionPersonnel(id);
        ConstructionPersonnel constructionPersonnel = constructionPersonnelList.get(0);

        for (Unit unit : unitList) {
            for (Deficiency deficiency : unit.getDeficiencies()) {
                if (deficiency.getConstructionPersonnel().equals(constructionPersonnel.getName())) {
                    deficiencyList.add(deficiency);
                }
            }
        }

        model.addAttribute("deficiencyList", deficiencyList);

        return model;
    }

    public List<Deficiency> sortDeficiencyList(List<Deficiency> deficiencyList) {

        Collections.sort(deficiencyList);

        return deficiencyList;
    }
}
