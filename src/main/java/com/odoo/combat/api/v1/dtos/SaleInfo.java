package com.odoo.combat.api.v1.dtos;

import java.util.ArrayList;

import lombok.Data;

@Data
public class SaleInfo {
	private String country;
	private String saleability;
	private boolean isEbook;
	private ListPrice listPrice;
	private RetailPrice retailPrice;
	private String buyLink;
	private ArrayList<Offer> offers;
}
