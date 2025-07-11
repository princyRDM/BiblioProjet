package com.biblio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.ReservationModel;

public interface ReservationRepository extends JpaRepository<ReservationModel, Integer>{
    
}
