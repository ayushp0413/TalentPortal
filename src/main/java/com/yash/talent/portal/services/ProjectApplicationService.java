package com.yash.talent.portal.services;

import com.yash.talent.portal.exceptions.JobApplicationException;
import com.yash.talent.portal.exceptions.ProjectApplicationException;
import com.yash.talent.portal.model.JobApplication;
import com.yash.talent.portal.model.ProjectApplication;

import java.util.List;

public interface ProjectApplicationService {
    void createProjectApplication(ProjectApplication projectApplication) throws ProjectApplicationException;
    void updateProjectApplication(ProjectApplication projectApplication) throws ProjectApplicationException;
    ProjectApplication getProjectApplicationById(int id) throws ProjectApplicationException;
    List<ProjectApplication> getAllProjectApplications(String email);
    List<ProjectApplication> getAllAcceptedProjectApplications(String email);
    List<ProjectApplication> getAllRejectedProjectApplications(String email);
    List<ProjectApplication> getAllProjectApplicationsByCompanyEmail(String email);
}
