package com.bank.model;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "transaction")
public class TransactionDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "reciename")
	private String reciename;
	@Column(name = "recieaccno")
	private String recieaccno;
	@Column(name = "recieifsccode")
	private String recieifsccode;
	@Column(name = "recieamount")
	private double recieamount;

	@Column(name = "transferdatetime")
	private Timestamp transferdatetime;

	public Timestamp getTransferdatetime() {
		return transferdatetime;
	}

	public void setTransferdatetime(Timestamp transferdatetime) {
		this.transferdatetime = transferdatetime;
	}

	@ManyToOne
	@JoinColumn(name = "user1_id")
	private User1 user1;

	public User1 getUser1() {
		return user1;
	}

	public void setUser1(User1 user1) {
		this.user1 = user1;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReciename() {
		return reciename;
	}

	public void setReciename(String reciename) {
		this.reciename = reciename;
	}

	public String getRecieaccno() {
		return recieaccno;
	}

	public void setRecieaccno(String recieaccno) {
		this.recieaccno = recieaccno;
	}

	public String getRecieifsccode() {
		return recieifsccode;
	}

	public void setRecieifsccode(String recieifsccode) {
		this.recieifsccode = recieifsccode;
	}

	public double getRecieamount() {
		return recieamount;
	}

	public void setRecieamount(double recieamount) {
		this.recieamount = recieamount;
	}

	@Override
	public String toString() {
		return "TransactionDetails [id=" + id + ", reciename=" + reciename + ", recieaccno=" + recieaccno
				+ ", recieifsccode=" + recieifsccode + ", recieamount=" + recieamount + ", user1=" + user1 + "]";
	}

}
