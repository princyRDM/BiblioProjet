package com.biblio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.PenaliterModel;

public interface PenaliterRepository extends JpaRepository<PenaliterModel, Integer>{
    List<PenaliterModel> findByAdherant_IdAdherant(int idAdherant);
}
