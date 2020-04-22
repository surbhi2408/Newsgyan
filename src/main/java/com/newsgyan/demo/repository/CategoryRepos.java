package com.newsgyan.demo.repository;

import com.newsgyan.demo.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepos extends JpaRepository<Category,Integer> {

}
