package com.yash.talent.portal.dao;

import com.yash.talent.portal.exceptions.JobApplicationException;
import com.yash.talent.portal.model.JobApplication;

import java.util.List;

public interface JobApplicationDao {

    void createJobApplication(JobApplication jobApplication) throws JobApplicationException;
    void updateJobApplication(JobApplication jobApplication) throws JobApplicationException;
    JobApplication getJobApplicationById(int id) throws JobApplicationException;
    List<JobApplication> getAllJobApplications(String email);
    List<JobApplication> getAllJobApplicationsByCompanyEmail(String email);
    List<JobApplication> getAllAcceptedJobApplications(String email);
    List<JobApplication> getAllRejectedJobApplications(String email);

}
