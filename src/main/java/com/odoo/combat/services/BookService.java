package com.odoo.combat.services;


import java.util.List;

import com.odoo.combat.api.v1.dtos.Root;

public interface BookService {
	public Root getBookInfoByIsbn(String isbn);
	
	public List<Root> getBookInfoByGenres(String Genres);

}
