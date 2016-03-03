package com.test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Random;

import javax.faces.bean.ManagedBean;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.test.model.Company;
import com.test.model.CompanyDataManager;

import au.com.bytecode.opencsv.CSVReader;


/**
 * The following is a JSF Managed Bean that is actually managed by Spring.
 */

@Controller
@Scope(value="view") // you can not use JSF Scoped values here since its a spring managed bean
@ManagedBean	// use this to indicate that its a JSF Bean (managed by spring)
public class CompanyMB {

	private static final Logger logger = LoggerFactory.getLogger(CompanyMB.class);

	@Inject
	private CompanyDataManager companyDataManager;
	
	private Company selectedCompany;
	private List<Company> all;
	private Boolean addState = false;
	
	public List<Company> getAll() { // getters should NEVER implement DB fetch logic.
		if(all==null) loadAll();
		return all;
	}

	/**
	 * This method will be called by the page during preRenderView. Example:
	 * <f:event type="preRenderView" listener="#{companyMB.loadAll}"/>
	 */
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void loadAll() {
    	logger.info("getting All");
		if(companyDataManager==null) throw new NullPointerException("dataManager is null");
		all = companyDataManager.getAll();
	}

	public CompanyDataManager getCompanyDataManager() {
		return companyDataManager;
	}


	public Company getSelectedCompany() {
		return selectedCompany;
	}


	public void setSelectedCompany(Company selectedCompany) {
		this.selectedCompany = selectedCompany;
	}
	
	private int countLines(InputStream file) {
		if(file==null) throw new NullPointerException("file stream should not be null.");
		int lines = 0;
		try (BufferedReader reader = new BufferedReader(new InputStreamReader(file))) {
			while (reader.readLine() != null) lines++;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return lines;
	}
	@Transactional
	public void newCompany() {
		Company c = getRandomCompany(); //TODO: fix this
		selectedCompany = companyDataManager.create();
		addState = true;
	}

	private Company getRandomCompany() {
		final String DUMMY_COMPANY_LIST_CSV = "/dummyCompanyList.csv";

		Company c = new Company();
		InputStream is = getClass().getResourceAsStream(DUMMY_COMPANY_LIST_CSV);
		if(is==null) return c;
		int lines = countLines(is);
		int randomLine = new Random().nextInt(lines - 2) + 1;
		int index = 0;
		is = getClass().getResourceAsStream(DUMMY_COMPANY_LIST_CSV);
		try (CSVReader reader = new CSVReader(new InputStreamReader(is))) {
			String[] nextLine = null;
			while((nextLine=reader.readNext()) != null) {
				if(index >= randomLine) {
					c.setName(nextLine[0]);
					c.setShipToAddress(nextLine[3]);
					c.setShipToCity(nextLine[4]);
					c.setShipToProvence(nextLine[5]);
					c.setShipToZip(nextLine[6]);
					break;
				}
				index++;
			}
		} catch (Exception ex) {
			throw new RuntimeException("unable to read random address CSV file.", ex);
		}
		return c;
	}
	
	@Transactional
	public void updateSelectedCompany() {
		logger.debug("update Selected Company called.");
		companyDataManager.update(selectedCompany);
	}
	@Transactional
	public void deleteSelectedCompany() {
		logger.debug("delete Selected Company called.");
		companyDataManager.delete(selectedCompany);
	}
	
	@Transactional
	public void cancel() {
		if(addState) {
			deleteSelectedCompany();
			addState=false;
		}
	}
}
