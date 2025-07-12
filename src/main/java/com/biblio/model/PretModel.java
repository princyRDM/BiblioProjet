package com.biblio.model;

import javax.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "pret")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PretModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPret;

    @ManyToOne
    @JoinColumn(name = "idExemplaire", nullable = false)
    private ExemplaireModel exemplaire;

    @ManyToOne
    @JoinColumn(name = "idAdherant", nullable = false)
    private AdherantModel adherant;

    private LocalDate datePret;
    private LocalDate dateRetourPrevue;
    private LocalDate dateRetourReelle;
    private String typePret; // 'Domicile' ou 'SurPlace'
    private LocalTime heurePret;
    private LocalTime heureRetourPrevue;
    private String statut; // 'En cours' ou 'Rendu'
}
