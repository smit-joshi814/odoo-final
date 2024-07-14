package com.odoo.combat.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.odoo.combat.entities.Borrowing;
import com.odoo.combat.entities.Inventory;
import com.odoo.combat.entities.Users;

public interface BorrowingRepository  extends JpaRepository<Borrowing, Long>{

	List<Borrowing> findByUser(Users user);
	List<Borrowing> findByInventory(Inventory inventory);
}
