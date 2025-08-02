package com.yash.talent.portal.dao;

import com.yash.talent.portal.exceptions.DuplicateCompanyException;
import com.yash.talent.portal.model.Company;

import java.util.List;

public interface CompanyDao {
    void addCompany(Company company) throws DuplicateCompanyException;
    void updateCompany(Company company) throws DuplicateCompanyException;
    Company getCompanyByEmail(String email);
    Company getCompanyByNumber(String number);
    List<Company> getAllCompanies();
}
