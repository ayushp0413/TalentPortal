package com.yash.talent.portal.services;

import com.yash.talent.portal.dao.CompanyDao;
import com.yash.talent.portal.exceptions.DuplicateCompanyException;
import com.yash.talent.portal.model.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService{

    @Autowired
    private CompanyDao companyDao;

    @Override
    public void addCompany(Company company) throws DuplicateCompanyException {
        this.companyDao.addCompany(company);
    }

    @Override
    public void updateCompany(Company company) throws DuplicateCompanyException {
        this.companyDao.updateCompany(company);
    }

    @Override
    public Company getCompanyByEmail(String email) {
        return this.companyDao.getCompanyByEmail(email);
    }

    @Override
    public List<Company> getAllCompanies() {
        return this.companyDao.getAllCompanies();
    }
}
