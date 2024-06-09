package com.bank.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bank.model.User1;

@Service
public interface UserService {
	public List<User1> findAll();
	public User1 findById(int id);
	public void insertUser(User1 user);
	public int getCustomerId();
	public void updateUser(User1 user);
	public Long numberOfUsers();
	public double summOfAllBalance();
	public User1 findByCusId(int cusid);
	public long activeUser();
	public long  inActiveUser();
	public double activeTotalSalary();
	public double inActiveTotalSalary();

}
