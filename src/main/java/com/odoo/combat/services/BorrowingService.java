package com.odoo.combat.services;

import com.odoo.combat.entities.Borrowing;
import java.util.List;

public interface BorrowingService {
    Borrowing borrowBook(Long userId, Long inventoryId);
    Borrowing returnBook(Integer borrowingId);
    List<Borrowing> getBorrowingsByUser(Long userId);
    List<Borrowing> getBorrowingsByInventory(Long inventoryId);
    void calculateLateFees(Integer borrowingId);
}
