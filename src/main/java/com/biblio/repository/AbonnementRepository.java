package com.biblio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.AbonnementModel;

public interface AbonnementRepository extends JpaRepository<AbonnementModel, Integer>{
    public List<AbonnementModel> findByAdherantIdAdherant(int idAdherant);
}
