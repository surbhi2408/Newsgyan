package com.newsgyan.demo.repository;

import com.newsgyan.demo.entity.User_login;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface loginRepos extends JpaRepository<User_login,Integer> {
    @Query("from User_login where status=:x")
    List<User_login> findBlock(@Param("x") int x);
    User_login findByUsernameAndPassword(String username,String password);
    User_login findByUsername(String username);
}
