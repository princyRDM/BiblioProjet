package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.LivreModel;
import com.biblio.repository.LivreRepository;

@Service
public class LivreService {
    @Autowired
    private LivreRepository livreRepository;

    public List<LivreModel> findAll(){
        return livreRepository.findAll();
    }

    public LivreModel findById(int idLivre){
        return livreRepository.findById(idLivre).orElse(null);
    }

    public LivreModel save(LivreModel livre){
        return livreRepository.save(livre);
    }

    public void delete(int idLivre){
        livreRepository.deleteById(idLivre);;
    }
}
