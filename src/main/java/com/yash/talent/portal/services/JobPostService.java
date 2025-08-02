package com.yash.talent.portal.services;

import com.yash.talent.portal.exceptions.JobPostException;
import com.yash.talent.portal.model.JobPost;
import com.yash.talent.portal.model.ShowJobs;

import java.util.List;

public interface JobPostService {
    void createJob(JobPost jobPost) throws JobPostException;
    void updateJob(JobPost jobPost) throws JobPostException;
    void deleteJobById(int id) throws JobPostException;
    List<ShowJobs> showAllJobs();
    List<JobPost> getAllJobsByEmail(String email);
    JobPost showJobById(int id);
}
