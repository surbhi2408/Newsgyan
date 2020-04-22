package com.newsgyan.demo.repository;

import com.newsgyan.demo.entity.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface newsRepos extends JpaRepository<News,Integer> {
    @Query("from News where category_id=:x and status=:y")
    List<News> getAll(@Param("x") int a,@Param("y") int b);
    News getById(int id);
}
