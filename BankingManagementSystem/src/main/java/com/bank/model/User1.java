package com.bank.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "user1")

public class User1 {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "name")
	private String name;
	@Column(name = "acno")
	private String acno;
	@Column(name = "branch")
	private String branch;
	@Column(name = "address")
	private String address;
	@Column(name = "panno")
	private String panno;
	@Column(name = "aadharno")
	private String aadharno;
	@Column(name = "password")
	private String password;

	// account information
	@Column(name = "accbalance")
	private double accbalance;
	// have to add customer id
	@Column(name = "custid")
	private int custid;

	@Column(name = "status")
	private String status;

	@Column(name = "ifsccode")
	private String ifsccode;

	public User1() {

	}

	public String getIfsccode() {
		return ifsccode;
	}

	public void setIfsccode(String ifsccode) {
		this.ifsccode = ifsccode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCustid() {
		return custid;
	}

	public void setCustid(int custid) {
		this.custid = custid;
	}

	@OneToMany(mappedBy = "user1", cascade = CascadeType.ALL)
	private List<TransactionDetails> transaction;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPanno() {
		return panno;
	}

	public void setPanno(String panno) {
		this.panno = panno;
	}

	public String getAcno() {
		return acno;
	}

	public void setAcno(String acno) {
		this.acno = acno;
	}

	public String getAadharno() {
		return aadharno;
	}

	public void setAadharno(String aadharno) {
		this.aadharno = aadharno;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getAccbalance() {
		return accbalance;
	}

	public void setAccbalance(double accbalance) {
		this.accbalance = accbalance;
	}

	public List<TransactionDetails> getTransaction() {
		return transaction;
	}

	public void setTransaction(List<TransactionDetails> transaction) {
		this.transaction = transaction;
	}

	@Override
	public String toString() {
		return "User1 [id=" + id + ", name=" + name + ", acno=" + acno + ", branch=" + branch + ", address=" + address
				+ ", panno=" + panno + ", aadharno=" + aadharno + ", password=" + password + ", accbalance="
				+ accbalance + ", custid=" + custid + ", status=" + status + ", transaction=" + transaction + "]";
	}

}
