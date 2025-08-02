package com.yash.talent.portal.services;

import com.yash.talent.portal.dao.FreelancerDao;
import com.yash.talent.portal.exceptions.DuplicateFreelancerException;
import com.yash.talent.portal.model.Freelancer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreelancerServiceImpl implements FreelancerService{

    @Autowired
    private FreelancerDao freelancerDao;

    @Override
    public void addFreelancer(Freelancer freelancer) throws DuplicateFreelancerException {
        this.freelancerDao.addFreelancer(freelancer);
    }

    @Override
    public void updateFreelancer(Freelancer freelancer) throws DuplicateFreelancerException {
        this.freelancerDao.updateFreelancer(freelancer);
    }

    @Override
    public Freelancer getFreelancerByEmail(String email) {
        return this.freelancerDao.getFreelancerByEmail(email);
    }

    @Override
    public Freelancer getFreelancerByNumber(String number) {
        return this.freelancerDao.getFreelancerByNumber(number);
    }

    @Override
    public List<Freelancer> getAllFreelancers() {
        return this.freelancerDao.getAllFreelancers();
    }
}
