package com.yash.talent.portal.dao;

import com.yash.talent.portal.exceptions.JobPostException;
import com.yash.talent.portal.model.JobPost;
import com.yash.talent.portal.model.ShowJobs;

import java.util.List;

public interface JobPostDao {

    void createJob(JobPost jobPost) throws JobPostException;
    void updateJob(JobPost jobPost) throws JobPostException;
    void deleteJobById(int id) throws JobPostException;
    List<JobPost> getAllJobsByEmail(String email);
    List<ShowJobs> showAllJobs();
    JobPost showJobById(int id);
}
