package com.yash.talent.portal.dao;


import com.yash.talent.portal.exceptions.JobApplicationException;
import com.yash.talent.portal.model.JobApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class JobApplicationDaoImpl implements JobApplicationDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional
    public void createJobApplication(JobApplication jobApplication) throws JobApplicationException
    {
        if (hasAlreadyApplied(jobApplication.getFreelancerId(), jobApplication.getPosition(), jobApplication.getCompanyName()))
        {
            throw new JobApplicationException("You have already applied for this position at this company.");
        }
        System.out.println("Data at Job Application DAO: "+ jobApplication);
        this.hibernateTemplate.save(jobApplication);
    }

    @Override
    @Transactional
    public void updateJobApplication(JobApplication jobApplication) throws JobApplicationException {
        this.hibernateTemplate.update(jobApplication);
    }

    @Override
    public JobApplication getJobApplicationById(int id) throws JobApplicationException {
        JobApplication jobApplication = this.hibernateTemplate.get(JobApplication.class, id);
        if(jobApplication == null)
        {
            throw new JobApplicationException("Job Application not found");
        }
        return jobApplication;
    }

    @Override
    @Transactional
    public List<JobApplication> getAllJobApplications(String email) {
        System.out.println("Im in DAO");
        String hql = "from JobApplication ja where ja.freelancerEmail = :email";
        List<JobApplication> getAllJobApplications = (List<JobApplication>) this.hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("email", email).list();

        return getAllJobApplications;
    }

    @Override
    @Transactional
    public List<JobApplication> getAllJobApplicationsByCompanyEmail(String email) {
        String hql = "from JobApplication ja where ja.companyEmail = :email and ja.status = 'sent'";
        List<JobApplication> getAllJobApplications = (List<JobApplication>) this.hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("email", email).list();

        return getAllJobApplications;
    }

    @Override
    @Transactional
    public List<JobApplication> getAllAcceptedJobApplications(String email) {
        String hql = "from JobApplication ja where ja.companyEmail = :email and ja.status = 'Accepted'";

        List<JobApplication> getAllAcceptedJobApplications = (List<JobApplication>) this.hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("email", email).list();
        return getAllAcceptedJobApplications;
    }

    @Override
    @Transactional
    public List<JobApplication> getAllRejectedJobApplications(String email) {
        String hql = "from JobApplication ja where ja.companyEmail = :email and ja.status = 'Rejected'";

        List<JobApplication> getAllRejectedJobApplications = (List<JobApplication>) this.hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("email", email).list();
        return getAllRejectedJobApplications;
    }


    public boolean hasAlreadyApplied(int freelancerId, String position, String companyName) {
        String hql = "FROM JobApplication ja WHERE ja.freelancerId = :freelancerId AND ja.position = :position AND ja.companyName = :companyName";
        List<JobApplication> existingApplications = (List<JobApplication>) hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("freelancerId", freelancerId)
                .setParameter("position", position)
                .setParameter("companyName", companyName)
                .list();

        return existingApplications != null && !existingApplications.isEmpty();
    }
}
