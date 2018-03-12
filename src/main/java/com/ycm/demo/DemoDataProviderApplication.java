package com.ycm.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2
public class DemoDataProviderApplication {

	public static void main(String[] args) throws Exception {
		SpringApplication.run(DemoDataProviderApplication.class, args);
	}
}
