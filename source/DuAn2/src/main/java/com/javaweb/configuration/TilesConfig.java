/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp TilesConfig là lớp cấu hình Apache Tiles
* */
package com.javaweb.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;
@Configuration
public class TilesConfig {

	
	//Cấu hình Apache Title
	@Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer configurer = new TilesConfigurer();
        configurer.setDefinitions(new String[]{"WEB-INF/configtiles/layout-administrator-tiles.xml", "WEB-INF/configtiles/layout-default-tiles.xml"});
       // configurer.setDefinitions("WEB-INF/configtiles/layout-administrator-tiles.xml");
        configurer.setCheckRefresh(true);

        return configurer;
    }
    
    @Bean
    public TilesViewResolver tilesViewResolver() {
        TilesViewResolver resolver = new TilesViewResolver();
        resolver.setViewClass(TilesView.class);
        return resolver;
    }
}
