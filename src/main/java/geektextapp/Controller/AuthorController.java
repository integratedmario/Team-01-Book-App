package geektextapp.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import geektextapp.Service.AuthorService;
import geektextapp.Entity.Author;

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
