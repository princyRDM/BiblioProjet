package com.biblio.model;

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
@Table(name = "exemplaire")
public class ExemplaireModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idExemplaire;

    @ManyToOne
    @JoinColumn(name = "idLivre", nullable = false)
    private LivreModel livre;

    private String numExemplaire;
    private String etat;
}
