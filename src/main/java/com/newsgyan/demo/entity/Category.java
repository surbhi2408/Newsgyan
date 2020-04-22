package com.newsgyan.demo.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String category_name;
    private int status;
    @OneToMany(mappedBy = "category",cascade = CascadeType.ALL)
    private List<News> news;

    public Category(int id, String category_name, int status,List<News> news) {
        this.id = id;
        this.category_name = category_name;
        this.status = status;
        this.news = news;
    }

    public Category() {
    }

    public List<News> getNews() {
        return news;
    }

    public void setNews(List<News> news) {
        this.news = news;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
