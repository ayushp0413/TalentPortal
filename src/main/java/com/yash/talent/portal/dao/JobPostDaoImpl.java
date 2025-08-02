package com.yash.talent.portal.dao;

import com.yash.talent.portal.exceptions.JobPostException;
import com.yash.talent.portal.model.Company;
import com.yash.talent.portal.model.JobPost;
import com.yash.talent.portal.model.ShowJobs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public class JobPostDaoImpl implements JobPostDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional
    public void createJob(JobPost jobPost) throws JobPostException {
        this.hibernateTemplate.save(jobPost);
        System.out.println("Job post created...");
    }

    @Override
    @Transactional
    public void updateJob(JobPost jobPost) throws JobPostException {
        JobPost existingJobPost = this.hibernateTemplate.get(JobPost.class, jobPost.getId());
        if(existingJobPost != null)
        {
            existingJobPost.setName(jobPost.getName());
            existingJobPost.setEmail(jobPost.getEmail());
            existingJobPost.setDescription(jobPost.getDescription());
            existingJobPost.setTitle(jobPost.getTitle());
            existingJobPost.setSkills(jobPost.getSkills());
            existingJobPost.setSalary(jobPost.getSalary());
            existingJobPost.setRole(jobPost.getRole());
            this.hibernateTemplate.update(existingJobPost);
        } else {
            throw new JobPostException("Job post not found with id: " + jobPost.getId());
        }
    }

    @Override
    @Transactional
    public void deleteJobById(int id) throws JobPostException {
        this.hibernateTemplate.delete(this.hibernateTemplate.get(JobPost.class, id));
    }

    @Override
    public List<JobPost> getAllJobsByEmail(String email) {

        String hql = "FROM JobPost j WHERE j.email = :email ORDER BY j.id DESC";
        List<JobPost> jobPosts = (List<JobPost>) hibernateTemplate.findByNamedParam(hql, "email", email);
        return jobPosts;
    }

    @Override
    public List<ShowJobs> showAllJobs() {

        List<ShowJobs> showJobsList = new ArrayList<>();

        // get all the available jobs
        String hql = "FROM JobPost j, Company c WHERE j.name = c.name AND j.name IS NOT NULL ORDER BY j.id DESC";
        List<Object[]> results = (List<Object[]>) hibernateTemplate.find("FROM JobPost j, Company c WHERE j.name = c.name AND j.name IS NOT NULL ORDER BY j.id DESC");

        for (Object[] row : results) {
            JobPost job = (JobPost) row[0];
            Company company = (Company) row[1];

            // Populate ShowJobs now
            ShowJobs showJob = new ShowJobs();

            showJob.setId(job.getId());
            showJob.setCompanyName(company.getName());
            showJob.setCompanyProfile(company.getProfile());
            showJob.setCompanyWebsite(company.getWebsite());
            showJob.setJobTitle(job.getTitle());
            showJob.setJobDescription(job.getDescription());
            showJob.setJobRole(job.getRole());
            showJob.setJobSkills(job.getSkills());

            showJobsList.add(showJob);
        }
        return showJobsList;
    }

    @Override
    public JobPost showJobById(int id) {

        JobPost jobData = this.hibernateTemplate.get(JobPost.class, id);
        return jobData;
    }
}
