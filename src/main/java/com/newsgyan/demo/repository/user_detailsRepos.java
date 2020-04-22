package com.newsgyan.demo.repository;

import com.newsgyan.demo.entity.User_details;
import org.springframework.data.jpa.repository.JpaRepository;

public interface user_detailsRepos extends JpaRepository<User_details,Integer> {
    User_details findByEmail(String email);
    User_details findById(int id);
}
