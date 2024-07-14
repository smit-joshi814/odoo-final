package com.odoo.combat.services;


import java.util.List;

import com.odoo.combat.api.v1.dtos.Root;

public interface BookService {
	
	public List<Root> getBookInfoBySearch(String search);

	public Root getBookInfoByIsbn(String isbn);
	public Root getBookInfoByBookName(String bookname);

	public List<Root> getBookInfoByGenres(String Genres);
	
	public List<Root> getBookInfoByAuthor(String author);
	
	


}
