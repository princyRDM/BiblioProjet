package com.biblio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.TypePretModel;
import com.biblio.repository.TypePretRepository;

@Service
public class TypePretService {
    @Autowired
    private TypePretRepository typePretRepository;

    public TypePretModel findById(int idTypePret){
        return typePretRepository.findById(idTypePret).orElse(null);
    }
}
