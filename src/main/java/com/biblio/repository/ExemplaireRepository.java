package com.biblio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblio.model.ExemplaireModel;

public interface ExemplaireRepository extends JpaRepository<ExemplaireModel, Integer>{
    public List<ExemplaireModel> findByLivreIdLivre(int idLivre);
}
