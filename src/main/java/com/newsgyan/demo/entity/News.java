package com.newsgyan.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "news")
public class News {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(columnDefinition = "text")
    private String title;
    @Column(columnDefinition = "text")
    private String description;
    private String photos;
    private int status;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(referencedColumnName = "id",name = "category_id")
    private Category category;

    public News(int id, String title, String description, String photos, int status,Category category) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.photos = photos;
        this.status = status;
        this.category = category;
    }

    public News() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhotos() {
        return photos;
    }

    public void setPhotos(String photos) {
        this.photos = photos;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
