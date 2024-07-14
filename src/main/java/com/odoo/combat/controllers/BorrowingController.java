package com.odoo.combat.controllers;

import com.odoo.combat.entities.Borrowing;
import com.odoo.combat.services.BorrowingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/borrowings")
public class BorrowingController {

    @Autowired
    private BorrowingService borrowingService;

    @PostMapping("/borrow")
    public ResponseEntity<Borrowing> borrowBook(@RequestParam Long userId, @RequestParam Long inventoryId) {
        try {
            Borrowing borrowing = borrowingService.borrowBook(userId, inventoryId);
            return new ResponseEntity<>(borrowing, HttpStatus.CREATED);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/return/{borrowingId}")
    public ResponseEntity<Borrowing> returnBook(@PathVariable Long borrowingId) {
        try {
            Borrowing borrowing = borrowingService.returnBook(borrowingId);
            return new ResponseEntity<>(borrowing, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<Borrowing>> getBorrowingsByUser(@PathVariable Long userId) {
        try {
            List<Borrowing> borrowings = borrowingService.getBorrowingsByUser(userId);
            if (borrowings.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(borrowings, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/inventory/{inventoryId}")
    public ResponseEntity<List<Borrowing>> getBorrowingsByInventory(@PathVariable Long inventoryId) {
        try {
            List<Borrowing> borrowings = borrowingService.getBorrowingsByInventory(inventoryId);
            if (borrowings.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(borrowings, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
