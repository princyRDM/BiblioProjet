package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.PretModel;
import com.biblio.repository.PretRepository;

@Service
public class PretService {
    @Autowired
    private PretRepository pretRepository;

    public List<PretModel> findAll() {
        return pretRepository.findAll();
    }

    public PretModel findById(int idPret) {
        return pretRepository.findById(idPret).orElse(null);
    }

    public PretModel save(PretModel pret) {
        return pretRepository.save(pret);
    }

    public void delete(int idPret) {
        pretRepository.deleteById(idPret);
    }

    public int countByAdherant_IdAdherantAndStatut(int idAdherant, String statut){
        return pretRepository.countByAdherant_IdAdherantAndStatut(idAdherant, statut);
    }

    public int countByAdherant_IdAdherantAndTypePretAndStatut(int idAdherant, String typePret, String statut){
        return pretRepository.countByAdherant_IdAdherantAndTypePretAndStatut(idAdherant, typePret, statut);
    }

    
    public int countByStatut(String statut){
        return pretRepository.countByStatut(statut);
    }

    public int countByTypePretAndStatut(String typePret, String statut){
        return pretRepository.countByTypePretAndStatut(typePret, statut);
    }

    public List<PretModel> findByAdherant_IdAdherantAndStatut(int idAdherant, String statut){
        return pretRepository.findByAdherant_IdAdherantAndStatut(idAdherant, statut);
    }
}
