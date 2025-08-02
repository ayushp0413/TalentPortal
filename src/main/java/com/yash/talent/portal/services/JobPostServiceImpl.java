package com.yash.talent.portal.services;

import com.yash.talent.portal.dao.JobPostDao;
import com.yash.talent.portal.exceptions.JobPostException;
import com.yash.talent.portal.model.JobPost;
import com.yash.talent.portal.model.ShowJobs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobPostServiceImpl implements JobPostService{

    @Autowired
    private JobPostDao jobPostDao;

    @Override
    public void createJob(JobPost jobPost) throws JobPostException {
        this.jobPostDao.createJob(jobPost);
    }

    @Override
    public void updateJob(JobPost jobPost) throws JobPostException {
        this.jobPostDao.updateJob(jobPost);
    }

    @Override
    public void deleteJobById(int id) throws JobPostException {
        this.jobPostDao.deleteJobById(id);
    }

    @Override
    public List<ShowJobs> showAllJobs() {
        return this.jobPostDao.showAllJobs();
    }

    @Override
    public List<JobPost> getAllJobsByEmail(String email) {
        return this.jobPostDao.getAllJobsByEmail(email);
    }

    @Override
    public JobPost showJobById(int id) {
        return this.jobPostDao.showJobById(id);
    }
}
