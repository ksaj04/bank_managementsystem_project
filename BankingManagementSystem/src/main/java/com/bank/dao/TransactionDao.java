package com.bank.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bank.model.TransactionDetails;
import com.bank.model.User1;
import com.bank.service.TransactionService;

import jakarta.persistence.EntityManager;

import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

@Repository
@Transactional
public class TransactionDao implements TransactionService {

	@Autowired
	EntityManager entity;

	@Override
	public void insertTransaction(TransactionDetails trans) {
		System.out.println("inside insert query trans--------->");
		entity.persist(trans);
	}

	@Override
	public List<TransactionDetails> getAllTransactionById(int id) {
		System.out.println("inside list of trans query --------->");

		TypedQuery<TransactionDetails> query = entity
				.createQuery("SELECT t FROM TransactionDetails t WHERE t.user1.id = :userId", TransactionDetails.class);
		query.setParameter("userId", id);

		return query.getResultList();
	}

	@Override
	public List<TransactionDetails> getAllDetailsByCredit(String acno) {
		System.out.println("inside list of credit query --------->");

		TypedQuery<TransactionDetails> query = entity.createQuery(
				"SELECT t FROM TransactionDetails t WHERE  t.recieaccno = :acno", TransactionDetails.class);
		query.setParameter("acno", acno);

		return query.getResultList();
	}

	@Override
	public List<TransactionDetails> getAllTRansaction(int id, String accno) {
		System.out.println("inside list of all transaction query --------->");

		TypedQuery<TransactionDetails> query = entity.createQuery(
				"SELECT t FROM TransactionDetails t WHERE t.user1.id = :userId OR t.recieaccno = :acno",
				TransactionDetails.class);
		query.setParameter("acno", accno);
		query.setParameter("userId", id);
		System.out.println("after inside list of all transaction query --------->");

		return query.getResultList();
	}

	@Override
	public List<TransactionDetails> getAllTransactionBetween(int id, String accno, Timestamp startofday,
			Timestamp endofday) {
		System.out.println("inside transaction between days");

		TypedQuery<TransactionDetails> query = entity.createQuery(
				"SELECT t FROM TransactionDetails t WHERE (t.user1.id = :userId OR t.recieaccno = :acno) AND t.transferdatetime BETWEEN :startofday AND :endofday",
				TransactionDetails.class);
		query.setParameter("acno", accno);
		query.setParameter("userId", id);
		query.setParameter("startofday", startofday);
		query.setParameter("endofday", endofday);

		return query.getResultList();
	}

}
