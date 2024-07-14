package com.odoo.combat.api.v1.dtos;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Root {
		private String kind;
	    private int totalItems;
	    private ArrayList<Item> items;
}
