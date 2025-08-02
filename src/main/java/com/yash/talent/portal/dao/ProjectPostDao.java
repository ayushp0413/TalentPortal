package com.yash.talent.portal.dao;

import com.yash.talent.portal.exceptions.ProjectPostException;
import com.yash.talent.portal.model.ProjectPost;

import java.util.List;

public interface ProjectPostDao {

    void createProject(ProjectPost projectPost) throws ProjectPostException;
    void deleteProjectById(int id) throws ProjectPostException;
    List<ProjectPost> showAllProjects();
    List<ProjectPost> getAllProjectsByEmail(String email);
    ProjectPost showProjectById(int id);

}
