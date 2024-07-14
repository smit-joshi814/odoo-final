package com.odoo.combat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.odoo.combat.api.v1.dtos.Root;
import com.odoo.combat.services.BookService;

@RestController
@RequestMapping("/books")
public class BookController {

	
	@Autowired
    private BookService bookService;

    @GetMapping("/isbn/{isbn}")
    public Root getBookByIsbn(@PathVariable String isbn) {
        return bookService.getBookInfoByIsbn(isbn);
    }
}
