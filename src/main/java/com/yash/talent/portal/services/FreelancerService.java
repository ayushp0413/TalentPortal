package com.yash.talent.portal.services;

import com.yash.talent.portal.exceptions.DuplicateFreelancerException;
import com.yash.talent.portal.model.Freelancer;

import java.util.List;

public interface FreelancerService {

    void addFreelancer(Freelancer freelancer) throws DuplicateFreelancerException;
    void updateFreelancer(Freelancer freelancer) throws DuplicateFreelancerException;
    Freelancer getFreelancerByEmail(String email);
    Freelancer getFreelancerByNumber(String number);
    List<Freelancer> getAllFreelancers();
}
