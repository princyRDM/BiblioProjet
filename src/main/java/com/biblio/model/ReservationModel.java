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
@Table(name = "reservation")
public class ReservationModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idReservation;

    @ManyToOne
    @JoinColumn(name = "idAdherant", nullable = false)
    private AdherantModel adherant;

    @ManyToOne
    @JoinColumn(name = "idExemplaire", nullable = false)
    private ExemplaireModel exemplaire;

    private LocalDate dateReservation;
    private String status;

}
