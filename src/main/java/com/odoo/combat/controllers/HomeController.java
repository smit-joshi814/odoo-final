package com.odoo.combat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.odoo.combat.api.v1.dtos.Root;
import com.odoo.combat.services.BookService;

@Controller
public class HomeController {

	@Autowired
	private BookService bookService;

	@GetMapping("/home")
	public ModelAndView home(ModelAndView mv, @RequestParam(name = "search",required = false) String search) {
		Root root = bookService.getBookInfoByGenres(search != null ? search : "philosophy");
		System.out.println(root.getTotalItems());
		mv.addObject("books", root);
		mv.setViewName("index");
		return mv;
	}

	@GetMapping("/")
	public String home() {
		return "redirect:/home";
	}
}
