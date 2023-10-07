package geektextapp.Service;

import geektextapp.Repository.AuthorRepo;
import geektextapp.Entity.Author;
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
