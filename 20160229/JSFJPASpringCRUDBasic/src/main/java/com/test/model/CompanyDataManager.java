package com.test.model;

import java.util.List;

public interface CompanyDataManager {
	// C
	Company create();
	// R
	List<Company> getAll();
	Company getCompany(Long companyId);
	// U
	Company update(Company selectedCompany);
	// D
	void delete(Company selectedCompany);
	void deleteById(Long id);
	
	
}
