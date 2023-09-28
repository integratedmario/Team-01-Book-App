package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.Service.AuthorService;
import com.example.demo.Entity.Author;

@RestController
public class AuthorController {

    private AuthorService authorService;

    public AuthorController(AuthorService authorService) {
        this.authorService = authorService;
    }

    @GetMapping("/getAuthor/{AuthorID}")
    public Author getDetails(@PathVariable String AuthorID){
        return authorService.getAuthorsByID(AuthorID);
    }
}
