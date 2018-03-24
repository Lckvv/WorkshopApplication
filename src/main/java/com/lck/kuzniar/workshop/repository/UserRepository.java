package com.lck.kuzniar.workshop.repository;


import com.lck.kuzniar.workshop.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User,String>{
    List<User> findByNameLike(String name);
}
