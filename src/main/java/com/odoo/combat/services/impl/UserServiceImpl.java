package com.odoo.combat.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.odoo.combat.entities.Users;
import com.odoo.combat.entities.constants.UserRoles;
import com.odoo.combat.repositories.UserRepository;
import com.odoo.combat.services.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public Users createUser(Users user) {
		user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
		if (user.getRole() == null) {
			user.setRole(UserRoles.USER);
		}
		user.setStatus(Boolean.TRUE);
		return userRepository.save(user);
	}

	@Override
	public Users updateUser(Long userId, Users user) {
		Users u = userRepository.findById(userId).get();
		u.setEmail(user.getEmail());
		u.setName(user.getName());
		u.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
		return userRepository.save(u);
	}

	@Override
	public List<Users> getUsers() {
		return userRepository.findAll();
	}

	@Override
	public Users getUser(String username) {
		return userRepository.findByEmail(username).orElse(null);
	}

	@Override
	public void removeUser(Long userId) {
		userRepository.deleteById(userId);
	}

	@Override
	public Optional<Users> findById(Long userId) {
		return userRepository.findById(userId);
	}

}
