package com.biblio.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.biblio.model.QuotaPretModel;
// import com.biblio.model.TypeAdherantModel;
// import com.biblio.model.TypePretModel;

public interface QuotaPretRepository extends JpaRepository<QuotaPretModel, Integer>{
    @Query("SELECT q FROM QuotaPretModel q WHERE q.typePret.idTypePret = :typePret AND q.typeAdherant.idTypeAdherant = :typeAdherant")
    QuotaPretModel findByTypePretAndTypeAdherant(@Param("typePret") int typePret, @Param("typeAdherant") int typeAdherant);
}
