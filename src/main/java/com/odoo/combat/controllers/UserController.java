package com.odoo.combat.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.odoo.combat.entities.Users;
import com.odoo.combat.services.UserService;

@Controller
@RequestMapping("/api/users")
public class UserController {

	@Autowired
	private UserService userService;

	@PostMapping("/create")
	public Users createUser(@RequestBody Users user) {
		return userService.createUser(user);
	}

	@PutMapping("/update/{userId}")
	public Users updateUser(@PathVariable Long userId, @RequestBody Users user) {
		return userService.updateUser(userId, user);
	}

	@GetMapping("/all")
	public List<Users> getUsers() {
		return userService.getUsers();
	}

	@GetMapping("/{username}")
	public Users getUser(@PathVariable String username) {
		return userService.getUser(username);
	}

	@DeleteMapping("/delete/{userId}")
	public void removeUser(@PathVariable Long userId) {
		userService.removeUser(userId);
	}

	@GetMapping("/{userId}")
	public Optional<Users> findById(@PathVariable Long userId) {
		return userService.findById(userId);
	}
}
