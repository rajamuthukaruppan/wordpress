package com.test.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

@Component("companyDataManager")
public class CompanyDataManagerImpl implements CompanyDataManager {
	@PersistenceContext 
	private EntityManager em;

	@Override
	public List<Company> getAll() {
		return em.createQuery("SELECT c FROM Company c", Company.class).getResultList();
	}

	@Override
	public Company update(Company selectedCompany) {
		Company mergedCompany = em.merge(selectedCompany);
		return mergedCompany;
	}

	@Override
	public void delete(Company selectedCompany) {
		em.remove(em.contains(selectedCompany) ? selectedCompany : em.merge(selectedCompany));
	}
	
	public Company create(Company selectedCompany) {
		em.persist(selectedCompany);
		return selectedCompany;
	}
	
}
