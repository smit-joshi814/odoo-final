package com.odoo.combat.services.impl;


import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.odoo.combat.api.v1.dtos.Root;
import com.odoo.combat.entities.Inventory;
import com.odoo.combat.services.BookService;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	InventoryServiceImpl in;

	@Value("${google.books.api.url}")
	private String apiUrl;

	@Autowired
	private RestTemplate restTemplate;

	@Override
	public Root getBookInfoByIsbn(String isbn) {
		String url = apiUrl + "?q=isbn:" + isbn;
		return restTemplate.getForObject(url, Root.class);
	}

	@Override
	public Root getBookInfoBySearch(String search) {
		String url = apiUrl + "?q=	:" + search;
		return restTemplate.getForObject(url, Root.class);
	}

	@Override
	public Root getBookInfoByBookName(String bookname) {
		String url = apiUrl + "?q=title:" + bookname;
		return restTemplate.getForObject(url, Root.class);
	}

	@Override
	public Root getBookInfoByGenres(String genres) {
		String url = apiUrl + "?q=categories:" + genres;
		return restTemplate.getForObject(url, Root.class);
	}

	@Override
	public Root getBookInfoByAuthor(String author) {
		String url = apiUrl + "?q=authors:" + author;
		return restTemplate.getForObject(url, Root.class);
	}

	@Override
	public Root getAllBooks() {
		Root r = new Root();
		r.setKind("");
		for (Inventory i : in.getAllInventories()) {
			Root root = getBookInfoByIsbn(i.getIsbn13());
			r.setTotalItems(r.getTotalItems() + root.getTotalItems());
			r.getItems().addAll(root.getItems());

		}
		return r;
	}

}
