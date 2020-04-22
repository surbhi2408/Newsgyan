package com.newsgyan.demo.repository;

import com.newsgyan.demo.entity.Admin_login;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepos extends JpaRepository<Admin_login,Integer> {
    Admin_login findByUsernameAndPassword(String username,String password);
}
