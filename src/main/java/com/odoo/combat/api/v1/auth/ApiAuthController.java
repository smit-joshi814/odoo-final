package com.odoo.combat.api.v1.auth;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.odoo.combat.config.auth.jwt.JwtHelper;
import com.odoo.combat.entities.Users;
import com.odoo.combat.services.UserService;
import com.odoo.combat.services.impl.UserDetailsServiceImpl;

@RestController
@RequestMapping("/api/v1/auth")
public class ApiAuthController {

	private final AuthenticationManager authenticationManager;
	private final UserDetailsService userDetailsService;
	private final JwtHelper jwtHelper;
	private final UserService userService;

	public ApiAuthController(AuthenticationManager authenticationManager, UserDetailsServiceImpl userDetailsService,
			JwtHelper jwtHelper, UserService userService) {
		this.authenticationManager = authenticationManager;
		this.userDetailsService = userDetailsService;
		this.jwtHelper = jwtHelper;
		this.userService = userService;
	}

	@PostMapping("/login")
	public ResponseEntity<AuthResponse> authenticateUser(@RequestBody AuthRequest authRequest) {

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(authRequest.email(), authRequest.password()));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		UserDetails userDetails = userDetailsService.loadUserByUsername(authRequest.email());

		String token = jwtHelper.generateToken(userDetails);

		Users u = userService.getUser(authRequest.email());
		return ResponseEntity.ok(new AuthResponse(token, jwtHelper.getExpirationDateFromToken(token),u.getRole().toString()));
	}

	@PostMapping("/signup")
	public ResponseEntity<AuthResponse> registerUser(@RequestBody SignUpRequest signUpRequest) {

		if(userService.createUser(Users.builder().email(signUpRequest.email()).phone(signUpRequest.phoneNumber()).password(signUpRequest.password())
				.name(signUpRequest.name()).role(signUpRequest.role())
				.build()) == null)
		 		    return new ResponseEntity<>(HttpStatus.ALREADY_REPORTED);

		UserDetails userDetails = userDetailsService.loadUserByUsername(signUpRequest.email());

		String token = jwtHelper.generateToken(userDetails);

		return ResponseEntity.ok(new AuthResponse(token, jwtHelper.getExpirationDateFromToken(token),""));
	}

	@GetMapping("/login")
	public ResponseEntity<String> authenticateUser() {
		return new ResponseEntity<>("Login Using Get Request Is Not Supported", HttpStatus.METHOD_NOT_ALLOWED);
	}

}