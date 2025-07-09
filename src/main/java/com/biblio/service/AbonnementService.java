package com.biblio.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.AbonnementModel;
import com.biblio.model.AdherantModel;
import com.biblio.repository.AbonnementRepository;

@Service
public class AbonnementService {
    @Autowired
    private AbonnementRepository abonnementRepository;

    public List<AbonnementModel> findAll(){
        return abonnementRepository.findAll();
    }

    public AbonnementModel findById(int idAbonnement){
        return abonnementRepository.findById(idAbonnement).orElse(null);
    }

    public AbonnementModel save(AbonnementModel abonnementModel){
        return abonnementRepository.save(abonnementModel);
    }

    public List<AbonnementModel> findByIdAdherant(int idAdherant){
        return abonnementRepository.findByAdherantIdAdherant(idAdherant);
    }

    public boolean abonnementValid(int idAdherant, LocalDate dateDebut, LocalDate dateFin){
        List<AbonnementModel> abonnements = abonnementRepository.findByAdherantIdAdherant(idAdherant);
        for (AbonnementModel a : abonnements) {
            if (!(a.getDateFin().isBefore(dateDebut) || a.getDateDebut().isAfter(dateFin))) {
                return false; 
            }
        }
        return true;
    }
}
