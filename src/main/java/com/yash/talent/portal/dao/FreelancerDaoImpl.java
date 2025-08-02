package com.yash.talent.portal.dao;


import com.yash.talent.portal.exceptions.DuplicateFreelancerException;
import com.yash.talent.portal.model.Freelancer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class FreelancerDaoImpl implements FreelancerDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional
    public void addFreelancer(Freelancer freelancer) throws DuplicateFreelancerException {

        System.out.println("I am in the Freelancer ADD DAO: "  + freelancer );

        // check if the Freelancer already exists
        Freelancer existingFreelancer = getFreelancerByEmail(freelancer.getEmail());
        if(existingFreelancer != null) {
            System.out.println("Freelancer with this email already exists.");
            throw new DuplicateFreelancerException("Freelancer with this email already exists.");
        }

        // check if the number already exists or not
        Freelancer existingByPhone = getFreelancerByNumber(freelancer.getNumber());
        if (existingByPhone != null) {
            System.out.println("Freelancer with this phone number already exists.");
            throw new DuplicateFreelancerException("Freelancer with this phone number already exists.");
        }

        // all set
        this.hibernateTemplate.save(freelancer);
        System.out.println("Freelancer Saved Succesfully!");

    }

    @Override
    @Transactional
    public void updateFreelancer(Freelancer freelancer) throws DuplicateFreelancerException {

        System.out.println("Update Freelancer: "+ freelancer);

        // Load the existing freelancer from DB by id
        Freelancer existingFreelancer = this.hibernateTemplate.get(Freelancer.class, freelancer.getId());
        if (existingFreelancer == null) {
            throw new RuntimeException("Freelancer not found");
        }

        // Check if new email is used by another freelancer (iske alawa)
        Freelancer freelancerWithEmail = getFreelancerByEmail(freelancer.getEmail());
        if (freelancerWithEmail != null && freelancerWithEmail.getId() !=  freelancer.getId()) {
            System.out.println("Freelancer with this email already exists.");
            throw new DuplicateFreelancerException("Freelancer with this email already exists.");
        }

        // Check if new phone number is used by another freelancer (excluding this freelancer)
        Freelancer freelancerWithPhone = getFreelancerByEmail(freelancer.getNumber());
        if (freelancerWithPhone != null && freelancerWithPhone.getId() != (freelancer.getId())) {
            System.out.println("Freelancer with this phone number already exists.");
            throw new DuplicateFreelancerException("Freelancer with this phone number already exists.");
        }

        // updating the data
        if (freelancer.getName() != null) {
            existingFreelancer.setName(freelancer.getName());
        }

        if (freelancer.getEmail() != null) {
            existingFreelancer.setEmail(freelancer.getEmail());
        }

        if (freelancer.getNumber() != null) {
            existingFreelancer.setNumber(freelancer.getNumber());
        }


        if (freelancer.getProfile() != null && !freelancer.getProfile().isEmpty()) {
            existingFreelancer.setProfile(freelancer.getProfile());
        }

        if (freelancer.getDob() != null) {
            existingFreelancer.setDob(freelancer.getDob());
        }

        if (freelancer.getLinkedin() != null) {
            existingFreelancer.setLinkedin(freelancer.getLinkedin());
        }

        if (freelancer.getEducation() != null) {
            existingFreelancer.setEducation(freelancer.getEducation());
        }

        // Update charge
        if (freelancer.getCharge() != null) {
            existingFreelancer.setCharge(freelancer.getCharge());
        }

        if (freelancer.getGender() != null) {
            existingFreelancer.setGender(freelancer.getGender());
        }

        if (freelancer.getSkills() != null) {
            existingFreelancer.setSkills(freelancer.getSkills());
        }


        // Save the updated Freelancer
        System.out.println("Freelancer info in DAO, ready to UPDATE in DB : "+ existingFreelancer);

        this.hibernateTemplate.update(existingFreelancer);
        System.out.println("Freelancer Profile Updated...");

    }

    @Override
    public Freelancer getFreelancerByEmail(String email) {
        List<Freelancer> freelancers = (List<Freelancer>) this.hibernateTemplate.findByNamedParam("from Freelancer where email=:email", "email", email);
        if(freelancers != null && !freelancers.isEmpty()) {
            return freelancers.get(0);
        }

        System.out.println("Internal server error: at getFreelanceByEmail method");
        return null;
    }

    @Override
    public Freelancer getFreelancerByNumber(String number) {
        List<Freelancer> freelancers = (List<Freelancer>) this.hibernateTemplate.findByNamedParam("from Freelancer where number=:number", "number", number);
        if(freelancers != null && !freelancers.isEmpty()) {
            return freelancers.get(0);
        }

        System.out.println("Internal server error: at getFreelancerByNumber method");
        return null;
    }

    @Override
    public List<Freelancer> getAllFreelancers() {
        List<Freelancer> freelancers = (List<Freelancer>) this.hibernateTemplate.loadAll(Freelancer.class);
        if(freelancers != null && !freelancers.isEmpty()) {
            return freelancers;
        }
        System.out.println("No freelancers found.");
        return null;
    }
}