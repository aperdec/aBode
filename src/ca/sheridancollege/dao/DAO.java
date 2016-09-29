package ca.sheridancollege.dao;

import ca.sheridancollege.beans.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Date;
import java.util.List;

public class DAO {

    SessionFactory sessionFactory = new Configuration().configure("ca/sheridancollege/config/hibernate.cfg.xml").buildSessionFactory();

    public User findByUserName(String username) {
        List<User> users = sessionFactory.openSession().createQuery("from User where username=:user").setParameter("user", username).list();
        if (users.size() > 0)
            return users.get(0);
        else
            return null;
    }

    public void createUser(User user) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        session.save(user);

        session.getTransaction().commit();
        session.close();
    }

    public List<Unit> getAllUnits() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.createQuery("from Unit");
        List<Unit> unitList = (List<Unit>) query.list();

        session.getTransaction().commit();
        session.close();

        return unitList;
    }

    public List<Unit> getUnit(long homeEnrollmentNumber) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.getNamedQuery("Unit.byHomeEnrollmentNumber");
        query.setLong("homeEnrollmentNumber", homeEnrollmentNumber);
        List<Unit> unitList = (List<Unit>) query.list();

        session.getTransaction().commit();
        session.close();

        return unitList;
    }

    public List<Builder> getBuilder(String builderUserName) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.getNamedQuery("Builder.byUserName");
        query.setString("users_username", builderUserName);
        List<Builder> builderList = (List<Builder>) query.list();

        session.getTransaction().commit();
        session.close();

        return builderList;
    }


    public void addTestData() {
        // adding testing data
        String password = "1234";
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Unit u = new Unit(1234, 1, "12 Forest Lane", "Blue Skys Project", 7, "2 bedroom", 721);
        //Fix this security, needs to hash the password and submit the user to the database
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(password);

        User t = new User("batman", hashedPassword, true);
        Builder b = new Builder("Lyn Green", 223344, "Times Group Inc", "12895550909", "Lyn@TimesGroup.com");
        b.setUser(t);
        Date fillerDate = new Date();
        //session.saveOrUpdate(ho);

        HomeOwner homeOwner = new HomeOwner("Billy Mayes", "9058881212", 1234);

        //session.saveOrUpdate(t);
        //this.createUser(t);
        session.saveOrUpdate(u);
        session.saveOrUpdate(b);
        session.saveOrUpdate(homeOwner);

        session.getTransaction().commit();
        session.close();
    }

    public void deleteDeficiency(int id, long homeEnrollmentNumber) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.getNamedQuery("Unit.byHomeEnrollmentNumber");
        query.setLong("homeEnrollmentNumber", homeEnrollmentNumber);
        List<Unit> unitList = (List<Unit>) query.list();
        Unit unit = unitList.get(0);
        List<Deficiency> deficiencies = unit.getDeficiencies();

        for (Deficiency deficiency : unit.getDeficiencies()) {
            if (deficiency.getId() == id) {
                deficiencies.remove(deficiency);
            }
        }
        unit.setDeficiencies(deficiencies);

        session.saveOrUpdate(unit);
        session.getTransaction().commit();
        session.close();
    }

    public void saveOrUpdate(Deficiency deficiency) {

        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.saveOrUpdate(deficiency);
        session.getTransaction().commit();
        session.close();
    }

    public void saveOrUpdateUnit(Unit unit) {

        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.saveOrUpdate(unit);
        unit.getAddress();
        session.getTransaction().commit();
        session.close();
    }

    public void saveOrUpdateForm(Form form) {

        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.saveOrUpdate(form);
        session.getTransaction().commit();
        session.close();
    }

    public List<HomeOwner> getHomeOwner(long homeEnrollmentNumber) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.getNamedQuery("HomeOwner.byHomeEnrollmentNumber");
        query.setLong("homeEnrollmentNumber", homeEnrollmentNumber);
        List<HomeOwner> homeOwnerList = (List<HomeOwner>) query.list();

        session.getTransaction().commit();
        session.close();

        return homeOwnerList;
    }

    public void createForm(Form form) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        session.save(form);

        session.getTransaction().commit();
        session.close();
    }

    public List<Form> getForm(long homeEnrollmentNumber) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.getNamedQuery("Form.byHomeEnrollmentNumber");
        query.setLong("homeEnrollmentNumber", homeEnrollmentNumber);
        List<Form> formList = (List<Form>) query.list();

        session.getTransaction().commit();
        session.close();

        return formList;
    }

    public List<Unit> getUnitsByProject(String project) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.getNamedQuery("Unit.byProjectName");
        query.setString("projectName", project);
        List<Unit> unitList = (List<Unit>) query.list();

        session.getTransaction().commit();
        session.close();

        return unitList;
    }
}
