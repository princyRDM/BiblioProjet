package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.TypeAdherantModel;
import com.biblio.repository.TypeAdherantRepository;

@Service
public class TypeAdherantService {
    @Autowired
    private TypeAdherantRepository typeAdherantRepository;

    public List<TypeAdherantModel> findAll(){
        return typeAdherantRepository.findAll();
    }

    public TypeAdherantModel findById(int idTypeAdherant){
        return typeAdherantRepository.findById(idTypeAdherant).orElse(null);
    }
}
