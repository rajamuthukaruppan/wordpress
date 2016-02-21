package com.test;

public interface TestTransactionModel {
	void writeDataWithOutTx(String message);
	void writeDataWithMultipleCalls(String message);
	void writeDataWithTx(String message);
	void writeDataWithTxSuccess();
}