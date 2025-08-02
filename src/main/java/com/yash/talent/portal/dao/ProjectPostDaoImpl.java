package com.yash.talent.portal.dao;

import com.yash.talent.portal.exceptions.ProjectPostException;
import com.yash.talent.portal.model.ProjectPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class ProjectPostDaoImpl implements ProjectPostDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional
    public void createProject(ProjectPost projectPost) throws ProjectPostException {
        System.out.println("Data at Dao to post project: "+ projectPost);
        this.hibernateTemplate.save(projectPost);
        System.out.println("ProjectPost created!");
    }

    @Override
    @Transactional
    public void deleteProjectById(int id) throws ProjectPostException {
        ProjectPost projectPost = this.hibernateTemplate.get(ProjectPost.class, id);
        if (projectPost != null) {
            this.hibernateTemplate.delete(projectPost);
            System.out.println("ProjectPost deleted with ID: " + id);
        } else {
            throw new ProjectPostException("ProjectPost with ID " + id + " not found.");
        }
    }

    // displaying all the available projects
    @Override
    public List<ProjectPost> showAllProjects() {

        List<ProjectPost> projects = this.hibernateTemplate.loadAll(ProjectPost.class);
        return projects;
    }

    @Override
    public List<ProjectPost> getAllProjectsByEmail(String email) {
        String hql = "FROM ProjectPost p WHERE p.companyEmail = :email ORDER BY p.id DESC";
        List<ProjectPost> projectPosts = (List<ProjectPost>) hibernateTemplate.findByNamedParam(hql, "email", email);
        return projectPosts;
    }

    @Override
    public ProjectPost showProjectById(int id) {
        ProjectPost projects = this.hibernateTemplate.get(ProjectPost.class, id);
        return projects;
    }


}

