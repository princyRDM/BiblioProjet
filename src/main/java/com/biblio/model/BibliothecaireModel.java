package com.biblio.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "bibliothecaire")
public class BibliothecaireModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idBibliothecaire;
    private String nom;
    private String prenom;
    private String email;
    private String password;
}
