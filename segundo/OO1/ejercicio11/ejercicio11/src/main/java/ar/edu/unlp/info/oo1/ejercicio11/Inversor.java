package ar.edu.unlp.info.oo1.ejercicio11;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Inversor {
	String name;
	List<Investment>investments = new ArrayList<Investment>();
	
	public Inversor(String name, Investment investment) {
		this.setName(name);
		this.addInvestment(investment);
	}
	
	public double currentValue() {
		double total = 0;
		for(Investment i : this.investments) {
			total += i.currentValue();
		}
		return total;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Investment> getInvestments() {
		return investments;
	}

	public void setInvestments(List<Investment> investments) {
		this.investments = investments;
	}
	
	public void addInvestment(Investment investment) {
		Stock inves = new Stock("marcos", 15, 17);
		this.investments.add(inves);
		LocalDate.now();
	}
}
