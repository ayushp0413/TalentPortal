package com.yash.talent.portal.services;

import com.yash.talent.portal.dao.ProjectApplicationDao;
import com.yash.talent.portal.exceptions.ProjectApplicationException;
import com.yash.talent.portal.model.ProjectApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectApplicationServiceImpl implements ProjectApplicationService {

    @Autowired
    private ProjectApplicationDao projectApplicationDao;

    @Override
    public void createProjectApplication(ProjectApplication projectApplication) throws ProjectApplicationException {
        this.projectApplicationDao.createProjectApplication(projectApplication);
    }

    @Override
    public void updateProjectApplication(ProjectApplication projectApplication) throws ProjectApplicationException {
        this.projectApplicationDao.updateProjectApplication(projectApplication);
    }

    @Override
    public ProjectApplication getProjectApplicationById(int id) throws ProjectApplicationException {
        return this.projectApplicationDao.getProjectApplicationById(id);
    }

    @Override
    public List<ProjectApplication> getAllProjectApplications(String email) {
        return this.projectApplicationDao.getAllProjectApplications(email);
    }

    @Override
    public List<ProjectApplication> getAllAcceptedProjectApplications(String email) {
        return this.projectApplicationDao.getAllAcceptedProjectApplications(email);
    }

    @Override
    public List<ProjectApplication> getAllRejectedProjectApplications(String email) {
        return this.projectApplicationDao.getAllRejectedProjectApplications(email);
    }

    @Override
    public List<ProjectApplication> getAllProjectApplicationsByCompanyEmail(String email) {
        return this.projectApplicationDao.getAllProjectApplicationsByCompanyEmail(email);
    }
}
