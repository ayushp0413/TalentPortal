package com.yash.talent.portal.dao;

import com.yash.talent.portal.exceptions.DuplicateCompanyException;
import com.yash.talent.portal.model.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class CompanyDaoImpl implements CompanyDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional
    public void addCompany(Company company) throws DuplicateCompanyException {

        System.out.println("Adding Company...");

        // check if the company already exists
        Company existingCompany = getCompanyByEmail(company.getEmail());
        if(existingCompany != null) {
            System.out.println("Company with this email already exists.");
            throw new DuplicateCompanyException("Company with this email already exists.");
        }

        // check if the number already exists or not
        Company existingByPhone = getCompanyByNumber(company.getNumber());
        if (existingByPhone != null) {
            System.out.println("Company with this phone number already exists.");
            throw new DuplicateCompanyException("Company with this phone number already exists.");
        }

        // all set

        this.hibernateTemplate.save(company);
        System.out.println("Company Added...");
    }

    @Override
    @Transactional
    public void updateCompany(Company company) throws DuplicateCompanyException {
        System.out.println("Updating Company profile...");

        // Load the existing company from DB by id
        Company existingCompany = this.hibernateTemplate.get(Company.class, company.getId());
        if (existingCompany == null) {
            throw new RuntimeException("Company not found");
        }

        // Check if new email is used by another company (iske alawa)
        Company companyWithEmail = getCompanyByEmail(company.getEmail());
        if (companyWithEmail != null && companyWithEmail.getId() !=  company.getId()) {
            System.out.println("Company with this email already exists.");
            throw new DuplicateCompanyException("Company with this email already exists.");
        }

        // Check if new phone number is used by another company (excluding this company)
        Company companyWithPhone = getCompanyByNumber(company.getNumber());
        if (companyWithPhone != null && companyWithPhone.getId() != (company.getId())) {
            System.out.println("Company with this phone number already exists.");
            throw new DuplicateCompanyException("Company with this phone number already exists.");
        }

        // updating the data
        if (company.getName() != null) {
            existingCompany.setName(company.getName());
        }

        if (company.getEmail() != null) {
            existingCompany.setEmail(company.getEmail());
        }

        if (company.getNumber() != null) {
            existingCompany.setNumber(company.getNumber());
        }

        if (company.getWebsite() != null) {
            existingCompany.setWebsite(company.getWebsite());
        }

        if (company.getAbout() != null) {
            existingCompany.setAbout(company.getAbout());
        }

        if (company.getProfile() != null && !company.getProfile().isEmpty()) {
            existingCompany.setProfile(company.getProfile());
        }

        // Save the updated company
        System.out.println("Company info in DAO, ready to UPDATE in DB : "+ existingCompany);

        this.hibernateTemplate.update(existingCompany);

        System.out.println("Company Profile Updated...");
    }

    @Override
    public Company getCompanyByEmail(String email) {

        // return this.hibernateTemplate.get(Company.class, email); // cannot use email directly as ID, need to query by email
        List<Company> companies = (List<Company>) this.hibernateTemplate.findByNamedParam("from Company where email=:email", "email", email);
        if(companies != null && !companies.isEmpty()) {
            return companies.get(0);
        }

        System.out.println("Internal server error: at getCompanyByEmail method in CompanyDaoImpl");
        return null;
    }

    @Override
    public Company getCompanyByNumber(String number) {
        List<Company> companies = (List<Company>) this.hibernateTemplate.findByNamedParam("from Company where number=:number", "number", number);
        if(companies != null && !companies.isEmpty()) {
            return companies.get(0);
        }

        System.out.println("Internal server error: at getCompanyByNumber method in CompanyDaoImpl");
        return null;
    }

    @Override
    public List<Company> getAllCompanies() {
       return this.hibernateTemplate.loadAll(Company.class);
    }

}
