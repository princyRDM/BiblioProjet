package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.BibliothecaireModel;
import com.biblio.repository.BibliothecaireRepository;

@Service
public class BibliothecaireService {
    @Autowired
    private BibliothecaireRepository bibliothecaireRepository;

    public List<BibliothecaireModel> findAll(){
        return bibliothecaireRepository.findAll();
    }

    public BibliothecaireModel findById(int idBibliothecaire){
        return bibliothecaireRepository.findById(idBibliothecaire).orElse(null);
    }
    public BibliothecaireModel authentification(String email, String password){
        return bibliothecaireRepository.findByEmailAndPassword(email, password);
    }
} 