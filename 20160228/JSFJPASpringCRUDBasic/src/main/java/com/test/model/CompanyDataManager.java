package com.test.model;

import java.util.List;

public interface CompanyDataManager {
	// C
	Company create(Company selectedCompany);
	// R
	List<Company> getAll();
	// U
	Company update(Company selectedCompany);
	// D
	void delete(Company selectedCompany);
}
