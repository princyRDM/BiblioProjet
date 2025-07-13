package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.PenaliterModel;
import com.biblio.repository.PenaliterRepository;

@Service
public class PenaliterService {
    @Autowired
    private PenaliterRepository penaliterRepository;

    public List<PenaliterModel> findAll(){
        return penaliterRepository.findAll();
    }

    public List<PenaliterModel> findByIdAdherant(int idAdherant){
        return penaliterRepository.findByAdherant_IdAdherant(idAdherant);
    }

    public PenaliterModel findById(int idPenaliter){
        return penaliterRepository.findById(idPenaliter).orElse(null);
    }

    public PenaliterModel save(PenaliterModel Penaliter){
        return penaliterRepository.save(Penaliter);
    }

    public void delete(int idPenaliter){
        penaliterRepository.deleteById(idPenaliter);
    }
}
