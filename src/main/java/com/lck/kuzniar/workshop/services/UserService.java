package com.lck.kuzniar.workshop.services;

import com.lck.kuzniar.workshop.entities.Role;
import com.lck.kuzniar.workshop.entities.User;
import com.lck.kuzniar.workshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.validation.constraints.Null;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void createUser(User user){
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Role userRole = new Role("USER");
        List<Role> roleList = new ArrayList<>();
        roleList.add(userRole);
        user.setRoles(roleList);
        userRepository.save(user);
    }

    public void createAdmin(User user){
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Role userRole = new Role("ADMIN");
        List<Role> roleList = new ArrayList<>();
        roleList.add(userRole);
        user.setRoles(roleList);
        userRepository.save(user);
    }

    public User findOne(String email){
        return userRepository.findOne(email);
    }

    public boolean isUserPresent(String email) {

        User user = userRepository.findOne(email);
        if(user != null){
            return true;
        }
        return false;
    }

    public List<User> findAll() {
        return  userRepository.findAll();

    }

    public List<User> findByName(String name) {
        return userRepository.findByNameLike("%"+name+"%");
    }
}
