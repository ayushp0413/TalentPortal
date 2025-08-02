package com.yash.talent.portal.dao;


import com.yash.talent.portal.exceptions.JobApplicationException;
import com.yash.talent.portal.exceptions.ProjectApplicationException;
import com.yash.talent.portal.model.JobApplication;
import com.yash.talent.portal.model.ProjectApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class ProjectApplicationDaoImpl implements ProjectApplicationDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public boolean hasAlreadyApplied(int freelancerId, String projectName, String companyName) {
        String hql = "FROM ProjectApplication pa WHERE pa.freelancerId = :freelancerId AND pa.projectName = :projectName AND pa.companyName = :companyName";
        List<ProjectApplication> existingApplications = (List<ProjectApplication>) hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("freelancerId", freelancerId)
                .setParameter("projectName", projectName)
                .setParameter("companyName", companyName)
                .list();

        return existingApplications != null && !existingApplications.isEmpty();
    }

    @Override
    @Transactional
    public void createProjectApplication(ProjectApplication projectApplication) throws ProjectApplicationException {

        if (hasAlreadyApplied(projectApplication.getFreelancerId(), projectApplication.getProjectName(), projectApplication.getCompanyName()))
        {
            throw new ProjectApplicationException("You have already applied for this project at this company.");
        }
        System.out.println("Data at Project Application DAO: "+ projectApplication);
        this.hibernateTemplate.save(projectApplication);
    }

    @Override
    @Transactional
    public void updateProjectApplication(ProjectApplication projectApplication) throws ProjectApplicationException {
        this.hibernateTemplate.update(projectApplication);
    }

    @Override
    public ProjectApplication getProjectApplicationById(int id) throws ProjectApplicationException {
        ProjectApplication projectApplication = this.hibernateTemplate.get(ProjectApplication.class, id);
        if(projectApplication == null)
        {
            throw new ProjectApplicationException("Project application not found");
        }
        return projectApplication;
    }

    @Override
    @Transactional
    public List<ProjectApplication> getAllProjectApplications(String email) {
        String hql = "from ProjectApplication pa where pa.freelancerEmail = :email";
        List<ProjectApplication> getAllProjectApplications = (List<ProjectApplication>) this.hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("email", email).list();

        return getAllProjectApplications;
    }

    @Override
    @Transactional
    public List<ProjectApplication> getAllAcceptedProjectApplications(String email) {
        String hql = "from ProjectApplication pa where pa.companyEmail = :email and pa.status = 'Accepted'";

        List<ProjectApplication> getAllAcceptedProjectApplications = (List<ProjectApplication>) this.hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("email", email).list();
        return getAllAcceptedProjectApplications;
    }

    @Override
    @Transactional
    public List<ProjectApplication> getAllRejectedProjectApplications(String email) {
        String hql = "from ProjectApplication pa where pa.companyEmail = :email and pa.status = 'Rejected'";

        List<ProjectApplication> getAllRejectedProjectApplications = (List<ProjectApplication>) this.hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("email", email).list();
        return getAllRejectedProjectApplications;
    }

    @Override
    @Transactional
    public List<ProjectApplication> getAllProjectApplicationsByCompanyEmail(String email) {
        String hql = "from ProjectApplication pa where pa.companyEmail = :email and pa.status = 'sent'";
        List<ProjectApplication> getAllProjectApplications = (List<ProjectApplication>) this.hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createQuery(hql)
                .setParameter("email", email).list();

        return getAllProjectApplications;
    }
}
