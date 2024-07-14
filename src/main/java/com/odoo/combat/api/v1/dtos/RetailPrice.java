package com.odoo.combat.api.v1.dtos;

import lombok.Data;

@Data
public class RetailPrice {
	  private double amount;
	    private String currencyCode;
	    private Object amountInMicros;
}
