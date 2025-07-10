package com.biblio.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "livre")
public class LivreModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idLivre;

    private String titre;
    private String auteur;
    private LocalDate anneePublication;

    @ManyToOne
    @JoinColumn(name = "idTypeLivre", nullable = false)
    private TypeLivreModel typeLivre;

    private String langue;
    private int accessibiliter;

}
