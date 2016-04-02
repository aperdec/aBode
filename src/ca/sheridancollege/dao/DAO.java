package ca.sheridancollege.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import ca.sheridancollege.beans.Subject;
import ca.sheridancollege.beans.User;

public class DAO {

	SessionFactory sessionFactory = new Configuration().configure("ca/sheridancollege/config/hibernate.cfg.xml")
			.buildSessionFactory();

	public void saveSubject(Subject subject) {

		Session session = sessionFactory.openSession();
		session.beginTransaction();

		session.saveOrUpdate(subject);

		session.getTransaction().commit();
		session.close();

	}

	public List<Subject> getSubjectList() {

		Session session = sessionFactory.openSession();
		session.beginTransaction();

		Query query = session.createQuery("from Subject");
		List<Subject> subjectList = (List<Subject>) query.list();

		session.getTransaction().commit();
		session.close();

		return subjectList;

	}

	public List<Subject> getSubject(String title) {

		Session session = sessionFactory.openSession();
		session.beginTransaction();

		Query query = session.getNamedQuery("Subject.byTitle");

		query.setString("title", title);

		List<Subject> subjectList = (List<Subject>) query.list();

		session.getTransaction().commit();
		session.close();

		return subjectList;

	}

	public void removeSubject(String title) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		List<Subject> subjectToDelete = getSubject(title);
		session.delete(subjectToDelete.get(0));

		session.getTransaction().commit();
		session.close();

	}

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

}
