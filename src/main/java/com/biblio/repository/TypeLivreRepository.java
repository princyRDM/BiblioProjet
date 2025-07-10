package com.biblio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.TypeLivreModel;

public interface TypeLivreRepository extends JpaRepository<TypeLivreModel, Integer>{
    
}
