package com.mf;

import com.mf.alg.SlotMatchAlgorithm;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class JxcApplication {

	public static void main(String[] args) {
		SpringApplication.run(JxcApplication.class, args);
		SlotMatchAlgorithm.initMatrix();
	}
}
