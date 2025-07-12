package com.biblio.model;

import javax.persistence.*;
import lombok.*;

@Entity
@Table(name = "typePret")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TypePretModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idTypePret;

    private String libelle;
}
