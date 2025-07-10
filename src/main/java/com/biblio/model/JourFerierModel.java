package com.biblio.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "jourFerier")
public class JourFerierModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idJourFerier;

    private LocalDate date;
    private String description;
}
