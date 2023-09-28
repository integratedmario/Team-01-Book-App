package com.example.demo.Service;

import com.example.demo.Repository.AuthorRepo;
import com.example.demo.Entity.Author;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class AuthorService {

    @Autowired
    private AuthorRepo authorRepo;

    public Author getAuthorsByID(String AuthorID){
        return authorRepo.findById(AuthorID).orElse(null);
    }
}
