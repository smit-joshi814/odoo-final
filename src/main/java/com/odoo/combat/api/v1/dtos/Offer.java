package com.odoo.combat.api.v1.dtos;

import lombok.Data;

@Data
public class Offer {
		private int finskyOfferType;
	    private ListPrice listPrice;
	    private RetailPrice retailPrice;
}
