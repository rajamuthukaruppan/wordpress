package com.test.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.test.CompanyMB;

@Component("companyDataManager")
public class CompanyDataManagerImpl implements CompanyDataManager {
	private static final Logger logger = LoggerFactory.getLogger(CompanyDataManagerImpl.class);

	@PersistenceContext 
	private EntityManager em;

	@Override
	public Company getCompany(Long companyId) {
		TypedQuery<Company> q = em.createQuery("SELECT c FROM Company c where c.id = :id", Company.class);
		q.setParameter("id", companyId);
		return q.getSingleResult();
	}
	
	
	@Override
	public List<Company> getAll() {
		logger.info("data manager instance: " + this.hashCode());
		return em.createQuery("SELECT c FROM Company c", Company.class).getResultList();
	}

	@Transactional
	@Override
	public Company update(Company selectedCompany) {
		Company mergedCompany = em.merge(selectedCompany);
		return mergedCompany;
	}

	@Transactional
	@Override
	public void delete(Company selectedCompany) {
		em.remove(em.contains(selectedCompany) ? selectedCompany : em.merge(selectedCompany));
	}

	@Transactional
	@Override
	public void deleteById(Long id) {
		Company c = em.find(Company.class, id);
		if(c==null) logger.info("Company not found.");
		em.remove(c);
	}
	
	@Transactional
	@Override
	public Company create() {
		Company c = new Company();
		em.persist(c);
		return c;
	}
}
