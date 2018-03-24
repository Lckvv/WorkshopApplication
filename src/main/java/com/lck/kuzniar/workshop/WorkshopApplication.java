package com.lck.kuzniar.workshop;

import com.lck.kuzniar.workshop.entities.User;
import com.lck.kuzniar.workshop.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WorkshopApplication implements CommandLineRunner{

	@Autowired
	UserService userService = new UserService();

	public static void main(String[] args) {
		SpringApplication.run(WorkshopApplication.class, args);
	}

	@Override
	public void run(String... strings) throws Exception {
		{
		User newAdmin = new User("admin@mail.com", "Admin", "12345");
		userService.createAdmin(newAdmin);}
	}
}
