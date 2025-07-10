package com.biblio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.LivreModel;

public interface LivreRepository extends JpaRepository<LivreModel, Integer>{
    
}
