package ca.sheridancollege.tests;

import static org.junit.Assert.*;

import org.junit.Test;

import ca.sheridancollege.beans.Subject;
import ca.sheridancollege.dao.DAO;

public class DAOTest {
	
	DAO dao = new DAO();

	@Test
	public void testSaveSubject() {
		Subject testSubject = new Subject("Test", "This is a test", "tester");
		
		dao.saveSubject(testSubject);
		
		assertTrue("The subject was not added", !dao.getSubject(testSubject.getTitle()).isEmpty());
		
		fail("Not yet implemented");
	}

	@Test
	public void testGetSubjectList() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetSubject() {
		fail("Not yet implemented");
	}

}
