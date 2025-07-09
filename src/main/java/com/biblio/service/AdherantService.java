package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.AdherantModel;
import com.biblio.repository.AdherantRepository;

@Service
public class AdherantService {
    @Autowired
    private AdherantRepository adherantRepository;

    public List<AdherantModel> findAll(){
        return adherantRepository.findAll();
    }

    public AdherantModel findById(int idAdherant){
        return adherantRepository.findById(idAdherant).orElse(null);
    }

    public AdherantModel save(AdherantModel adherant){
        return adherantRepository.save(adherant);
    }

    public void delete(int idAdherant){
        adherantRepository.deleteById(idAdherant);;
    }

    public AdherantModel authentification(String email, String password){
        return adherantRepository.findByEmailAndPassword(email, password);
    }
}
