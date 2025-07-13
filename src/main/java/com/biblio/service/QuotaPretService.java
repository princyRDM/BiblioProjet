package com.biblio.service;

import com.biblio.model.*;
import com.biblio.repository.QuotaPretRepository;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class QuotaPretService {

    @Autowired
    private QuotaPretRepository quotaPretRepository;

    public List<QuotaPretModel> findAll() {
        return quotaPretRepository.findAll();
    }

    public QuotaPretModel findById(int idPret) {
        return quotaPretRepository.findById(idPret).orElse(null);
    }

    public QuotaPretModel save(QuotaPretModel pret) {
        return quotaPretRepository.save(pret);
    }

    public void delete(int idPret) {
        quotaPretRepository.deleteById(idPret);
    }

    public QuotaPretModel findByIdTPandIdTA(int typePret, int typeAdherant){
        return quotaPretRepository.findByTypePretAndTypeAdherant(typePret, typeAdherant);
    }
}
