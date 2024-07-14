package com.odoo.combat.services;

import java.util.List;

import com.odoo.combat.entities.Inventory;

public interface InventoryService {
    Inventory createInventory(Inventory inventory);
    Inventory updateInventory(Long id, Inventory inventory);
    void deleteInventory(Long id);
    Inventory getInventoryById(Long id);
    List<Inventory> getAllInventories();

}
