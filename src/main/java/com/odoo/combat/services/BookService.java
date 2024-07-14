package com.odoo.combat.services;



import com.odoo.combat.api.v1.dtos.Root;

public interface BookService {
	
	public Root getBookInfoBySearch(String search);

	public Root getBookInfoByIsbn(String isbn);
	public Root getBookInfoByBookName(String bookname);

	public Root getBookInfoByGenres(String Genres);
	
	public Root getBookInfoByAuthor(String author);
	
	


}
