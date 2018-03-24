package com.lck.kuzniar.workshop;
import static org.junit.Assert.assertNotNull;

import com.lck.kuzniar.workshop.entities.Task;
import com.lck.kuzniar.workshop.entities.User;
import com.lck.kuzniar.workshop.services.TaskService;
import com.lck.kuzniar.workshop.services.UserService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WorkshopApplicationTests {

	@Autowired
	private UserService userService;
	@Autowired
	private TaskService taskService;

	@Before
	public void initDb() {
		{
			User user = new User("testUser@email.com", "testUserName", "testUserPasswoed");
			userService.createUser(user);
		}
		{
			User user = new User("testAdmin@email.com", "testAdminName", "testAdminPasswoed");
			userService.createUser(user);
		}

		Task task = new Task("24/03/2018","20:00","04:00","exchange scissors");
		User user = userService.findOne("testUser@email.com");
		taskService.addTask(task,user);
	}

	@Test
	public void testUser(){
		User user = userService.findOne("testUser@email.com");
		assertNotNull(user);
		User admin = userService.findOne("testAdmin@email.com");
		Assert.assertEquals(admin.getEmail(),"testAdmin@email.com");

	}

	@Test
	public void testTask() {
		User user = userService.findOne("testUser@email.com");
		List<Task> task = taskService.findUserTask(user);
		assertNotNull(task);

	}
}
