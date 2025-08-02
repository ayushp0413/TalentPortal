package com.yash.talent.portal.services;

import com.yash.talent.portal.dao.ProjectPostDao;
import com.yash.talent.portal.exceptions.ProjectPostException;
import com.yash.talent.portal.model.ProjectPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectPostServiceImpl implements ProjectPostService{

    @Autowired
    private ProjectPostDao projectPostDao;

    @Override
    public void createProject(ProjectPost projectPost) throws ProjectPostException {
        this.projectPostDao.createProject(projectPost);
    }

    @Override
    public void deleteProjectById(int id) throws ProjectPostException {
        this.projectPostDao.deleteProjectById(id);
    }

    @Override
    public List<ProjectPost> getAllProjectsByEmail(String email) {
        return this.projectPostDao.getAllProjectsByEmail(email);
    }

    @Override
    public List<ProjectPost> showAllProjects() {
        return this.projectPostDao.showAllProjects();
    }

    @Override
    public ProjectPost showProjectById(int id) {
        return this.projectPostDao.showProjectById(id);
    }
}
