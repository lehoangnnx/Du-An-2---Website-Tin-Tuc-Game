package com.javaweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@SpringBootApplication
public class DuAn2WebsiteTinTucGameApplication {
	
	@RequestMapping("/hi")
	String hello() {
		return "123";
	}
	
	
	public static void main(String[] args) {
		SpringApplication.run(DuAn2WebsiteTinTucGameApplication.class, args);
	}
}
