package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.TypeLivreModel;
import com.biblio.repository.TypeLivreRepository;

@Service
public class TypeLivreService {
    @Autowired
    private TypeLivreRepository typeLivreRepository;

    public List<TypeLivreModel> findAll(){
        return typeLivreRepository.findAll();
    }

    public TypeLivreModel findById(int idtypeLivre){
        return typeLivreRepository.findById(idtypeLivre).orElse(null);
    }
}
