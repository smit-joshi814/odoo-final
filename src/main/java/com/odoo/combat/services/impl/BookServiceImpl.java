package com.odoo.combat.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.odoo.combat.api.v1.dtos.Root;
import com.odoo.combat.services.BookService;

@Service
public class BookServiceImpl implements BookService {

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
	public List<Root> getBookInfoByGenres(String genres) { 
	    String url = apiUrl + "?q=insubject:" + genres; 
	    return restTemplate.getForObject(url, List.class, Root.class); 
	}


}
