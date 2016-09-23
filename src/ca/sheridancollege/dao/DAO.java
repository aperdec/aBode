package ca.sheridancollege.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import ca.sheridancollege.beans.Builder;
import ca.sheridancollege.beans.Deficiency;
import ca.sheridancollege.beans.Form;
import ca.sheridancollege.beans.HomeOwner;
import ca.sheridancollege.beans.Unit;
import ca.sheridancollege.beans.User;

public class DAO {

    SessionFactory sessionFactory = new Configuration().configure("ca/sheridancollege/config/hibernate.cfg.xml")
            .buildSessionFactory();

    public User findByUserName(String username) {
        List<User> users = sessionFactory.openSession().createQuery("from User where username=:user")
                .setParameter("user", username).list();
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

        //session.saveOrUpdate(t);
        //this.createUser(t);
        session.saveOrUpdate(u);
        session.saveOrUpdate(b);

        session.getTransaction().commit();
        session.close();
    }

    public void deleteDeficiency(int id) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.getNamedQuery("Deficiency.byId");

        query.setLong("id", id);

        List<Deficiency> deficiencyList = (List<Deficiency>) query.list();

        session.delete(deficiencyList.get(0));

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

        Query query = session.getNamedQuery("HomeOwner.byHomeEnrollmentId");

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
}
