package com.redolfi.demolfi;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@ActiveProfiles("test")  // <- Esto fuerza a usar application-test.properties
class DemolfiApplicationTests {

	@Test
	void contextLoads() {
	}

}
