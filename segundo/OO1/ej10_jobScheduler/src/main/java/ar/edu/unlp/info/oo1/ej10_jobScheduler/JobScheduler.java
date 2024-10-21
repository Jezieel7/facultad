package ar.edu.unlp.info.oo1.ej10_jobScheduler;


import java.util.ArrayList;
import java.util.List;

public class JobScheduler {
    protected List<JobDescription> jobs;
    protected Strategy strat;
     
    public JobScheduler (Strategy s) {
    	this.jobs = new ArrayList<>(); 
    	this.strat = s;
    }
    
    public void setStrat(Strategy s) {
    	
    	this.strat = s;
    }
    
    public Strategy getStrat() {
    	
    	return this.strat;
    }
    
    public void schedule(JobDescription job) {
    	this.jobs.add(job);
    }

    //Elimina el trabajo job
    public void unschedule(JobDescription job) {
    	if (job != null) {
    	   this.jobs.remove(job);
    	}
    }
    
    public List<JobDescription> getJobs(){
    	return jobs;
    }
    
    public JobDescription next() {
    	JobDescription nextJob = strat.next(jobs);
    	this.unschedule(nextJob);
    	
    	return nextJob;
    	 	
    }
    
}

