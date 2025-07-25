package com.biblio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biblio.model.ExemplaireModel;
import com.biblio.repository.ExemplaireRepository;

@Service
public class ExemplaireService {
    @Autowired
    private ExemplaireRepository exemplaireRepository;
    
    public List<ExemplaireModel> findAll(){
        return exemplaireRepository.findAll();
    }

    public List<ExemplaireModel> findAllByIdLivre(int idLivre){
        return exemplaireRepository.findByLivreIdLivre(idLivre);
    }

    public ExemplaireModel findById(int idLivre){
        return exemplaireRepository.findById(idLivre).orElse(null);
    }

    public ExemplaireModel save(ExemplaireModel livre){
        return exemplaireRepository.save(livre);
    }

    public void delete(int idLivre){
        exemplaireRepository.deleteById(idLivre);;
    }
    
    public void changerStatutExemplaire(int idExemplaire, String nouveauStatut) {
        ExemplaireModel exemplaire = exemplaireRepository.findById(idExemplaire)
                .orElseThrow(() -> new RuntimeException("Exemplaire introuvable"));

        exemplaire.setStatus(nouveauStatut);
        exemplaireRepository.save(exemplaire);
    }

}
