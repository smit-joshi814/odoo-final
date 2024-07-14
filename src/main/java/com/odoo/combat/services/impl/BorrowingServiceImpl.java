package com.odoo.combat.services.impl;

import com.odoo.combat.entities.Borrowing;
import com.odoo.combat.entities.Inventory;
import com.odoo.combat.entities.Users;
import com.odoo.combat.repositories.InventoryRepository;
import com.odoo.combat.repositories.UserRepository;
import com.odoo.combat.services.BorrowingRepository;
import com.odoo.combat.services.BorrowingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

@Service
public class BorrowingServiceImpl implements BorrowingService {

	@Autowired
	private BorrowingRepository borrowingRepository;

	@Autowired
	private UserRepository usersRepository;

	@Autowired
	private InventoryRepository inventoryRepository;

	@Override
	public Borrowing borrowBook(Long userId, Long inventoryId) {
		Optional<Users> userOptional = usersRepository.findById(userId);
		Optional<Inventory> inventoryOptional = inventoryRepository.findById(inventoryId);

		if (userOptional.isPresent() && inventoryOptional.isPresent()) {
			Users user = userOptional.get();
			Inventory inventory = inventoryOptional.get();

			Borrowing borrowing = new Borrowing();
			inventory.setQuantity(inventory.getQuantity() - 1);

			borrowing.setUser(user);
			borrowing.setInventory(inventory);
			borrowing.setBorrowDate(new Date());
			borrowing.setDueDate(calculateDueDate(new Date())); // Example due date calculation

			inventoryRepository.save(inventory);

			return borrowingRepository.save(borrowing);
		} else {
			// Handle case where user or inventory is not found
			throw new RuntimeException("User or Inventory not found");
		}
	}

	@Override
	public Borrowing returnBook(Integer borrowingId) {
		Optional<Borrowing> borrowingOptional = borrowingRepository.findById(borrowingId);
		if (borrowingOptional.isPresent()) {
			Borrowing borrowing = borrowingOptional.get();
			Inventory inventory = inventoryRepository.findById(borrowing.getInventory().getId()).get();

			inventory.setQuantity(inventory.getQuantity() + 1);
			borrowing.setReturnDate(new Date());
			calculateLateFees(borrowingId);
			return borrowingRepository.save(borrowing);
		} else {
			// Handle case where borrowing record is not found
			throw new RuntimeException("Borrowing not found");
		}
	}

	@Override
	public List<Borrowing> getBorrowingsByUser(Long userId) {
		return borrowingRepository.findByUser(Users.builder().userId(userId).build());
	}

	@Override
	public List<Borrowing> getBorrowingsByInventory(Long inventoryId) {
		return borrowingRepository.findByInventory(Inventory.builder().id(inventoryId).build());
	}

	@Override
	public void calculateLateFees(Integer borrowingId) {
		Optional<Borrowing> borrowingOptional = borrowingRepository.findById(borrowingId);
		if (borrowingOptional.isPresent()) {
			Borrowing borrowing = borrowingOptional.get();
			if (borrowing.getReturnDate() != null && borrowing.getReturnDate().after(borrowing.getDueDate())) {
				long diffInMillies = Math.abs(borrowing.getReturnDate().getTime() - borrowing.getDueDate().getTime());
				long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
				borrowing.setLateFee(diff * 1.0);
				borrowingRepository.save(borrowing);
			}
		}
	}

	private Date calculateDueDate(Date borrowDate) {
		long borrowTime = borrowDate.getTime();
		long dueTime = borrowTime + TimeUnit.DAYS.toMillis(14);
		return new Date(dueTime);
	}
}
