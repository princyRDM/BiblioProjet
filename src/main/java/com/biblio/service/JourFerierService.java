package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.JourFerierModel;
import com.biblio.repository.JourFerierRepository;

@Service
public class JourFerierService{
    @Autowired
    private JourFerierRepository jourFerierRepository;

    public List<JourFerierModel> findAll(){
        return jourFerierRepository.findAll();
    }

    public JourFerierModel save(JourFerierModel jourFerierModel){
        return jourFerierRepository.save(jourFerierModel);
    }
}
