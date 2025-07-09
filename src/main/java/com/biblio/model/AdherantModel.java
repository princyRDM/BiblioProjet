package com.biblio.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "adherant")
public class AdherantModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAderant;
    private String nom;
    private String prenom;
    private String contact;
    private String email;
    private String password;

    @ManyToOne
    @JoinColumn(name = "idTypeAdherant", nullable = false)
    private TypeAdherantModel typeAdherant;
}
