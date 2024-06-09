package com.bank.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bank.model.TransactionDetails;


@Service
public interface TransactionService {
	public void insertTransaction(TransactionDetails trans);
	public List<TransactionDetails> getAllTransactionById(int id);
	public List<TransactionDetails> getAllDetailsByCredit(String accno);
	public List<TransactionDetails> getAllTRansaction(int id,String accno);
	public List<TransactionDetails> getAllTransactionBetween(int id,String accno,Timestamp startofday,Timestamp endofday);

}
