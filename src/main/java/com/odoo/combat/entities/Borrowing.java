package com.odoo.combat.entities;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Entity
@Data
public class Borrowing {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	private Users user;

	@ManyToOne
	private Inventory inventory;
	private Date borrowDate;
	private Date dueDate;
	private Date returnDate;
	private double lateFee;
}
