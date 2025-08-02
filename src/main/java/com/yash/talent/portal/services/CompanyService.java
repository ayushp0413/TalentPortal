package com.yash.talent.portal.services;

import com.yash.talent.portal.exceptions.DuplicateCompanyException;
import com.yash.talent.portal.model.Company;

import java.util.List;


public interface CompanyService {
    void addCompany(Company company) throws DuplicateCompanyException;
    void updateCompany(Company company) throws DuplicateCompanyException;
    Company getCompanyByEmail(String email);
    List<Company> getAllCompanies();
}
