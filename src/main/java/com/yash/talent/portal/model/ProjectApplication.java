package com.yash.talent.portal.model;

import javax.persistence.*;

@Entity
public class ProjectApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private int freelancerId;

    private String freelancerName;

    private String freelancerEmail;

    private String freelancerResume;

    private String projectName;

    private String companyName;

    private String companyEmail;

    @Column(name = "application_status")
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFreelancerId() {
        return freelancerId;
    }

    public void setFreelancerId(int freelancerId) {
        this.freelancerId = freelancerId;
    }

    public String getFreelancerName() {
        return freelancerName;
    }

    public void setFreelancerName(String freelancerName) {
        this.freelancerName = freelancerName;
    }

    public String getFreelancerEmail() {
        return freelancerEmail;
    }

    public void setFreelancerEmail(String freelancerEmail) {
        this.freelancerEmail = freelancerEmail;
    }

    public String getFreelancerResume() {
        return freelancerResume;
    }

    public void setFreelancerResume(String freelancerResume) {
        this.freelancerResume = freelancerResume;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ProjectApplication{" +
                "id=" + id +
                ", freelancerId=" + freelancerId +
                ", freelancerName='" + freelancerName + '\'' +
                ", freelancerEmail='" + freelancerEmail + '\'' +
                ", freelancerResume='" + freelancerResume + '\'' +
                ", projectName='" + projectName + '\'' +
                ", companyName='" + companyName + '\'' +
                ", companyEmail='" + companyEmail + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
