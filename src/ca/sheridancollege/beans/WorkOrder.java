package ca.sheridancollege.beans;

import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class WorkOrder implements Serializable {

	@Id
	@GeneratedValue
	private long id;
	private ConstructionPersonnel personnel;
	private ArrayList<Deficiency> deficiencies;
	// should this take a form or unit?

	public WorkOrder() {

	}

	public WorkOrder(long id, ConstructionPersonnel personnel, ArrayList<Deficiency> deficiencies) {
		this.id = id;
		this.personnel = personnel;
		this.deficiencies = deficiencies;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public ConstructionPersonnel getPersonnel() {
		return personnel;
	}

	public void setPersonnel(ConstructionPersonnel personnel) {
		this.personnel = personnel;
	}

	public ArrayList<Deficiency> getDeficiencies() {
		return deficiencies;
	}

	public void setDeficiencies(ArrayList<Deficiency> deficiencies) {
		this.deficiencies = deficiencies;
	}

}
