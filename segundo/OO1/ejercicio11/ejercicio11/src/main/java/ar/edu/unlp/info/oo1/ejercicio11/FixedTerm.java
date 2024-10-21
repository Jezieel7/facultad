package ar.edu.unlp.info.oo1.ejercicio11;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class FixedTerm implements Investment {
	LocalDate dateOfIncorporation;
	double depositedAmount;
	double dailyInterestRate;
	
	public FixedTerm(LocalDate dateOfIncorporation, double depositedAmount, double dailyInterestRate) {
		this.setDateOfIncorporation(dateOfIncorporation);
		this.setDepositedAmount(depositedAmount);
		this.setDailyInterestRate(dailyInterestRate);
	}
	
	private double interestInTheDay(double amount) {
		return amount * this.dailyInterestRate;
	}
	
	private double amountWithInterest(double amount) {
		return amount + this.interestInTheDay(amount);
	}
	
	private long daysInForce() {
		return this.dateOfIncorporation.until(LocalDate.now(), ChronoUnit.DAYS);
	}

	public double currentValue() {
		double totalAmount = this.depositedAmount;
		for(int day = 0; day < this.daysInForce(); day++) {
			totalAmount = this.amountWithInterest(totalAmount);
		}
		return totalAmount;
	}

	public LocalDate getDateOfIncorporation() {
		return dateOfIncorporation;
	}

	public void setDateOfIncorporation(LocalDate dateOfIncorporation) {
		this.dateOfIncorporation = dateOfIncorporation;
	}

	public double getDepositedAmount() {
		return depositedAmount;
	}

	public void setDepositedAmount(double depositedAmount) {
		this.depositedAmount = depositedAmount;
	}

	public double getDailyInterestRate() {
		return dailyInterestRate;
	}

	public void setDailyInterestRate(double dailyInterestRate) {
		this.dailyInterestRate = dailyInterestRate;
	}
}
