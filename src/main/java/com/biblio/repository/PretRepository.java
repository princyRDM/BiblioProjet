package com.biblio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.PretModel;

public interface PretRepository extends JpaRepository<PretModel, Integer>{
    int countByAdherant_IdAdherantAndStatut(int idAdherant, String statut);
}
