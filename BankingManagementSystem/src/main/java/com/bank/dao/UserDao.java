package com.bank.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bank.model.User1;
import com.bank.service.UserService;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

@Repository
@Transactional
public class UserDao implements UserService {

	@Autowired
	EntityManager entitymanager;

	@Override
	public List<User1> findAll() {
		System.out.println("inside find all--------------->");
		List<User1> listofuser = entitymanager.createQuery("from User1").getResultList();
		System.out.println("after query findall");
		return listofuser;
	}

	@Override
	public void insertUser(User1 user) {
		System.out.println("inside insert user query---------->");
		entitymanager.persist(user);

	}

	@Override
	public int getCustomerId() {
		System.out.println("inside customer id---------------->");

		User1 user = (User1) entitymanager.createQuery("from User1 where id=(select MAX(id) from User1)")
				.getSingleResult();

		return user.getCustid();
	}

	@Override
	public void updateUser(User1 user) {
		System.out.println("inside update user--------------->");
		entitymanager.merge(user);

	}

	@Override
	public User1 findById(int id) {
		User1 user = (User1) entitymanager.createQuery("from User1 where id=:id").setParameter("id", id)
				.getSingleResult();
		return user;
	}

	@Override
	public Long numberOfUsers() {
		System.out.println("inside number of users query-------------->");
		String jpql = "SELECT COUNT(e) FROM User1 e";
		TypedQuery<Long> query = entitymanager.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}

	@Override
	public double summOfAllBalance() {
		System.out.println("inside sum of all balance query--------------->");
		String jpql = "SELECT SUM(i.accbalance) FROM User1 i";
		TypedQuery<Double> query = entitymanager.createQuery(jpql, Double.class);
		return query.getSingleResult();

	}

	@Override
	public User1 findByCusId(int cusid) {
		User1 user = (User1) entitymanager.createQuery("from User1 where custid=:cusid").setParameter("cusid", cusid)
				.getSingleResult();
		return user;
	}

	@Override
	public long activeUser() {
		System.out.println("inside active user query----->");
		TypedQuery<Long> query = entitymanager.createQuery("SELECT COUNT(u) FROM User1 u WHERE u.status = 'active'",
				Long.class);
		Long count = query.getSingleResult();
		return count;
	}

	@Override
	public long inActiveUser() {
		System.out.println("inside in active user query----->");
		TypedQuery<Long> query = entitymanager.createQuery("SELECT COUNT(u) FROM User1 u WHERE u.status = 'inactive'",
				Long.class);
		Long count = query.getSingleResult();
		return count;
	}

	@Override
	public double activeTotalSalary() {
		String jpql = "SELECT SUM(i.accbalance) FROM User1 i WHERE i.status='active'";
		TypedQuery<Double> query = entitymanager.createQuery(jpql, Double.class);
		return query.getSingleResult();
	}

	@Override
	public double inActiveTotalSalary() {
		String jpql = "SELECT SUM(i.accbalance) FROM User1 i WHERE i.status='inactive'";
		TypedQuery<Double> query = entitymanager.createQuery(jpql, Double.class);
		return query.getSingleResult();
	}

}
