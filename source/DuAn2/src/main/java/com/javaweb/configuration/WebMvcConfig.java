package com.javaweb.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

	/*@Override
	public void addViewControllers(ViewControllerRegistry registry) {
	registry.addViewController("/home").setViewName("home123");
	registry.addViewController("/").setViewName("home");
	registry.addViewController("/hello").setViewName("hello");
	registry.addViewController("/login").setViewName("login");
	registry.addViewController("/403").setViewName("403");
	}*/
	
	//Cấu hình ViewResolver
	/*	@Bean
		public InternalResourceViewResolver getViewResolver() {
			InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
			viewResolver.setPrefix("/WEB-INF/views/");
			viewResolver.setSuffix(".jsp");
			return viewResolver;
			
		}*/
	


 // Cấu hình để sử dụng các file nguồn tĩnh (html, image, ..)
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/administrator/vendor/")
        .setCachePeriod(31556926);
        registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/resources/administrator/vendor/")
        .setCachePeriod(31556926);
        registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/files/images/")
        .setCachePeriod(31556926);
        registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/administrator/vendor/").setCachePeriod(31556926);
    }
    //Cấu hình servlet
	@Override
    public void configureDefaultServletHandling(
            DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

	
	
}
