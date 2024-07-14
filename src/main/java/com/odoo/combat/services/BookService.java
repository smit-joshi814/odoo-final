package com.odoo.combat.services;


import com.odoo.combat.api.v1.dtos.Root;

public interface BookService {
	public Root getBookInfoByIsbn(String isbn);
}
