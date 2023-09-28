package com.example.demo.Repository;

import com.example.demo.Entity.Author;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepo extends JpaRepository<Author, String> {
}
