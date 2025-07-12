package com.biblio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.PretModel;

public interface PretRepository extends JpaRepository<PretModel, Integer>{
    int countByAdherant_IdAdherantAndStatut(int idAdherant, String statut);
    int countByAdherant_IdAdherantAndTypePretAndStatut(int idAdherant, String typePret, String statut);
    List<PretModel> findByAdherant_IdAdherantAndStatut(int idAdherant, String statut);
}
