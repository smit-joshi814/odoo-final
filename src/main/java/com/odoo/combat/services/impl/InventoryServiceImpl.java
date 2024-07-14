package com.odoo.combat.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.odoo.combat.entities.Inventory;
import com.odoo.combat.repositories.InventoryRepository;
import com.odoo.combat.services.InventoryService;

@Service
public class InventoryServiceImpl implements InventoryService {

    @Autowired
    private InventoryRepository inventoryRepository;

    @Override
    public Inventory createInventory(Inventory inventory) {
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
