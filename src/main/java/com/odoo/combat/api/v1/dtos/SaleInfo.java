package com.odoo.combat.api.v1.dtos;

import lombok.Data;

@Data
public class SaleInfo {
	private String country;
	private String saleability;
	private boolean isEbook;
}
