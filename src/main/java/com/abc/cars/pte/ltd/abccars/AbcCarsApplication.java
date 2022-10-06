package com.abc.cars.pte.ltd.abccars;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@SpringBootApplication
@ComponentScan(basePackages = "com.abc.cars.pte.ltd.abccars")
public class AbcCarsApplication {

	public static void main(String[] args) {
		SpringApplication.run(AbcCarsApplication.class, args);
	}

	@Bean
	public CommonsMultipartResolver createMultipartResolver() {
	    CommonsMultipartResolver resolver = new CommonsMultipartResolver();
	    resolver.setDefaultEncoding("utf-8");
	    return resolver;
	}

}
