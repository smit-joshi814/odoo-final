package com.odoo.combat.services;

import java.util.List;
import java.util.Optional;

import com.odoo.combat.entities.Users;

public interface UserService {

	public Users createUser(Users user);
	
	public Optional<Users> findById(Long userId);

	public Users updateUser(Long userId, Users user);

	public List<Users> getUsers();
	
	public Users getUser(String username);

	public void removeUser(Long userId);

}
