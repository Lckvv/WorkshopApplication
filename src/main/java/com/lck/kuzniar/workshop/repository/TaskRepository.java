package com.lck.kuzniar.workshop.repository;

import com.lck.kuzniar.workshop.entities.Task;
import com.lck.kuzniar.workshop.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.io.Serializable;
import java.util.List;

public interface TaskRepository extends JpaRepository<Task,Serializable>{
    List<Task> findByUser(User user);
}
