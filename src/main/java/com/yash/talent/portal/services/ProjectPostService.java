package com.yash.talent.portal.services;

import com.yash.talent.portal.exceptions.ProjectPostException;
import com.yash.talent.portal.model.JobPost;
import com.yash.talent.portal.model.ProjectPost;

import java.util.List;

public interface ProjectPostService {

    void createProject(ProjectPost projectPost) throws ProjectPostException;
    void deleteProjectById(int id) throws ProjectPostException;
    List<ProjectPost> getAllProjectsByEmail(String email);
    List<ProjectPost> showAllProjects();
    ProjectPost showProjectById(int id);
}
