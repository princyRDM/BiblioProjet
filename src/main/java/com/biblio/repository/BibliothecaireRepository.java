package com.biblio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.BibliothecaireModel;

public interface BibliothecaireRepository extends JpaRepository<BibliothecaireModel, Integer>{
        public BibliothecaireModel findByEmailAndPassword(String email, String password);

}
