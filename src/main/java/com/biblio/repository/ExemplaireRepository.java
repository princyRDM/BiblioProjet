package com.biblio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.ExemplaireModel;

public interface ExemplaireRepository extends JpaRepository<ExemplaireModel, Integer>{
    
}
