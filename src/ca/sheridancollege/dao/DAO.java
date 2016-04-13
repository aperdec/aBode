package ca.sheridancollege.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

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

}
