package com.odoo.combat.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.odoo.combat.entities.Inventory;

public interface InventoryRepository  extends JpaRepository<Inventory, Long>{

}
