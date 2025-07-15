package com.biblio.model;

import javax.persistence.*;

import lombok.*;

@Entity
@Table(name = "quotaPret")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuotaPretModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idQuotaPret;

    private Integer quota;
    private Integer delaiPret;
    private Integer nbrJourPenaliter;

    @ManyToOne
    @JoinColumn(name = "idTypePret")
    private TypePretModel typePret;

    @ManyToOne
    @JoinColumn(name = "idTypeAdherant")
    private TypeAdherantModel typeAdherant; // a creer si non existant

}
