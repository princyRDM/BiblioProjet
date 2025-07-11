package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.ReservationModel;
import com.biblio.repository.ReservationRepository;

@Service
public class ReservationService {
    @Autowired
    private ReservationRepository reservationRepository;

    public List<ReservationModel> findAll(){
        return reservationRepository.findAll();
    }

    public ReservationModel findById(int idReservation){
        return reservationRepository.findById(idReservation).orElse(null);
    }

    public ReservationModel save(ReservationModel Reservation){
        return reservationRepository.save(Reservation);
    }

    public void delete(int idReservation){
        reservationRepository.deleteById(idReservation);;
    }
}
