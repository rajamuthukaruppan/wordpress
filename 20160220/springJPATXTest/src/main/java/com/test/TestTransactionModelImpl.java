package com.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("testTransactionModel")
public class TestTransactionModelImpl implements TestTransactionModel {

	@Autowired
	private TestTransactionDataManager testTransactionDataManager;
	
	@Transactional
	@Override
	public void writeDataWithTxSuccess() {
		testTransactionDataManager.writeData("Writing data within a transactional method. You WILL see this record.");
	}

	public void writeDataWithOutTx(String message) {
		testTransactionDataManager.writeData("Writing data within a NON transactional method. You WILL NOT see this record.");
	}

	/**
	 * This method will throw a runtime exception and the data will be rolled
	 * back.
	 */
	@Transactional  // remember @Transaction for public methods only!
	public void writeDataWithTx(String message) {
		if(message == null) {
			message = "Writing data within a transactional method with an exception. You will NOT see this record.";
		}
		Number number = testTransactionDataManager.writeData(message);
		System.out.println("wrote item: " + number);
		throw new RuntimeException();
	}

	/**
	 * This method tests the capability of calling another method that is
	 * declared to be transactional where the second method throws an exception
	 * but this method still commits. This is important to know that calling nested
	 * transactional methods will not result in a commit.
	 */
	@Transactional
	public void writeDataWithMultipleCalls(String message) {
		String msg = "Suppressing runtimeexception and committing anyway you will see this record.";
		try {
			writeDataWithTx(msg);
		} catch(RuntimeException ex) {
			System.out.println(msg);
		}
	}
}