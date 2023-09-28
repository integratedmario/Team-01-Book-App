package com.example.demo.Entity;

import jakarta.persistence.*;


@Entity
@Table(name = "authors")
public class Author {

    public Author(String AuthorID, String FirstName, String LastName){
        this.AuthorID = AuthorID;
        this.FirstName = FirstName;
        this.LastName = LastName;
    }

    public Author(){
    }

    @Id
    @Column(name = "AuthorID")
    private String AuthorID;

    @Column(name = "FirstName")
    private String FirstName;

    @Column(name = "LastName")
    private String LastName;

    public String getAuthorID(){
        return this.AuthorID;
    }

    public String getFirstName(){
        return this.FirstName;
    }

    public String getLastName(){
        return this.LastName;
    }
}
