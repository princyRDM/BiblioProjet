package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.ExemplaireModel;
import com.biblio.repository.ExemplaireRepository;

@Service
public class ExemplaireService {
    @Autowired
    private ExemplaireRepository exemplaireRepository;
    
    public List<ExemplaireModel> findAll(){
        return exemplaireRepository.findAll();
    }

    public ExemplaireModel findById(int idLivre){
        return exemplaireRepository.findById(idLivre).orElse(null);
    }

    public ExemplaireModel save(ExemplaireModel livre){
        return exemplaireRepository.save(livre);
    }

    public void delete(int idLivre){
        exemplaireRepository.deleteById(idLivre);;
    }
}
