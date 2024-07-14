package com.odoo.combat.config.general;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestConfiguration {

	@Bean
	RestTemplate getRestTemplate() {
		return new RestTemplate();
	}
}
