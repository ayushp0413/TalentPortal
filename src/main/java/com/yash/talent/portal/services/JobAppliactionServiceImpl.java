package com.yash.talent.portal.services;

import com.yash.talent.portal.dao.JobApplicationDao;
import com.yash.talent.portal.exceptions.JobApplicationException;
import com.yash.talent.portal.model.JobApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobAppliactionServiceImpl implements JobApplicationService{

    @Autowired
    private JobApplicationDao jobApplicationDao;

    @Override
    public void createJobApplication(JobApplication jobApplication) throws JobApplicationException {
        this.jobApplicationDao.createJobApplication(jobApplication);
    }

    @Override
    public void updateJobApplication(JobApplication jobApplication) throws JobApplicationException {
        this.jobApplicationDao.updateJobApplication(jobApplication);
    }

    @Override
    public JobApplication getJobApplicationById(int id) throws JobApplicationException {
        return this.jobApplicationDao.getJobApplicationById(id);
    }

    @Override
    public List<JobApplication> getAllJobApplications(String email) {
        return this.jobApplicationDao.getAllJobApplications(email);
    }

    @Override
    public List<JobApplication> getAllJobApplicationsByCompanyEmail(String email) {
        return this.jobApplicationDao.getAllJobApplicationsByCompanyEmail(email);
    }

    @Override
    public List<JobApplication> getAllAcceptedJobApplications(String email) {
        return this.jobApplicationDao.getAllAcceptedJobApplications(email);
    }

    @Override
    public List<JobApplication> getAllRejectedJobApplications(String email) {
        return this.jobApplicationDao.getAllRejectedJobApplications(email);
    }
}
