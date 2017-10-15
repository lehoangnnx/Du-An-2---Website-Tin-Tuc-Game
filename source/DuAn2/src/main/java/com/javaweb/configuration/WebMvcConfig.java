package com.javaweb.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter{

	/*@Override
	public void addViewControllers(ViewControllerRegistry registry) {
	registry.addViewController("/home").setViewName("home123");
	registry.addViewController("/").setViewName("home");
	registry.addViewController("/hello").setViewName("hello");
	registry.addViewController("/login").setViewName("login");
	registry.addViewController("/403").setViewName("403");
	}*/
	@Bean
	public InternalResourceViewResolver getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
		
	}
	
	@Override
    public void configureDefaultServletHandling(
            DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }  
}
