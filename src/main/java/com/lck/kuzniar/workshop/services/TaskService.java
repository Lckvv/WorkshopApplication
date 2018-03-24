package com.lck.kuzniar.workshop.services;

import com.lck.kuzniar.workshop.entities.Task;
import com.lck.kuzniar.workshop.entities.User;
import com.lck.kuzniar.workshop.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {

    @Autowired
    private TaskRepository taskRepository;

    public void addTask(Task task, User user){
        task.setUser(user);
        taskRepository.save(task);
    }

    public List<Task> findUserTask(User user){

        return taskRepository.findByUser(user);
    }
}
