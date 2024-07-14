package com.odoo.combat.services.impl;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.odoo.combat.api.exceptions.ApiErrorResponse;
import com.odoo.combat.api.exceptions.ApiException;
import com.odoo.combat.api.v1.dtos.Root;
import com.odoo.combat.entities.Inventory;
import com.odoo.combat.repositories.InventoryRepository;
import com.odoo.combat.services.BookService;
import com.odoo.combat.services.InventoryService;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	private InventoryRepository inventoryRepository;

	@Autowired
	private BookService bookService;

	@Override
	public Inventory createInventory(Inventory inventory) {
		String isbn = "";
		if (Objects.nonNull(inventory.getIsbn10())) {
			isbn = inventory.getIsbn10();
		} else {
			isbn = inventory.getIsbn13();
		}
		Root book = bookService.getBookInfoByIsbn(isbn);
		if (Objects.nonNull(book)) {
			inventory.setIsbn10(
					book.getItems().get(0).getVolumeInfo().getIndustryIdentifiers().get(0).getIdentifier());
			inventory.setIsbn13(
					book.getItems().get(0).getVolumeInfo().getIndustryIdentifiers().get(1).getIdentifier());
		} else {
			throw new ApiException(new ApiErrorResponse("Invalid ISBN", HttpStatus.NOT_FOUND));
		}
		return inventoryRepository.save(inventory);
	}

	@Override
	public Inventory updateInventory(Long id, Inventory inventory) {
		Optional<Inventory> existingInventoryOpt = inventoryRepository.findById(id);
		if (existingInventoryOpt.isPresent()) {
			Inventory existingInventory = existingInventoryOpt.get();
			existingInventory.setIsbn10(inventory.getIsbn10());
			existingInventory.setIsbn13(inventory.getIsbn13());
			existingInventory.setQuantity(inventory.getQuantity());
			return inventoryRepository.save(existingInventory);
		} else {
			throw new RuntimeException("Inventory not found with id: " + id);
		}
	}

	@Override
	public void deleteInventory(Long id) {
		inventoryRepository.deleteById(id);
	}

	@Override
	public Inventory getInventoryById(Long id) {
		return inventoryRepository.findById(id)
				.orElseThrow(() -> new RuntimeException("Inventory not found with id: " + id));
	}

	@Override
	public List<Inventory> getAllInventories() {
		return inventoryRepository.findAll();
	}
}
