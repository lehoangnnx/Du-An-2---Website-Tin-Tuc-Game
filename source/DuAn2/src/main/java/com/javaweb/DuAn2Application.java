package com.javaweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class DuAn2Application extends SpringBootServletInitializer {
	// Khởi tạo dự án bằng Spring Boot
	public static void main(String[] args) {
		SpringApplication.run(DuAn2Application.class, args);
	}


	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(DuAn2Application.class);
	}
}
