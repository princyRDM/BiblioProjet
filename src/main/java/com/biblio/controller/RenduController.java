package com.biblio.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.biblio.model.AdherantModel;
import com.biblio.model.PenaliterModel;
import com.biblio.model.PretModel;
import com.biblio.model.QuotaPretModel;
import com.biblio.service.AdherantService;
import com.biblio.service.PretService;
import com.biblio.service.QuotaPretService;
import com.biblio.service.PenaliterService;

@Controller
@RequestMapping("/rendu")
public class RenduController {
    @Autowired
    private AdherantService adherantService;
    @Autowired
    private PretService pretService;
    @Autowired
    private PenaliterService penaliterService;
    @Autowired
    private QuotaPretService quotaPretService;

    @GetMapping("/prim")
    public String rendu1(
        Model model
    ){
        List<AdherantModel> adherant = adherantService.findAll();
        model.addAttribute("adherants", adherant);
        return "bibliothecaire/rendu1";
    }

    @PostMapping("/second")
    public String rendu2(
        @RequestParam("idAdherant") int idAdherant,
        Model model
    ){
        List<PretModel> pret = pretService.findByAdherant_IdAdherantAndStatut(idAdherant, "En cours");
        AdherantModel adherant = adherantService.findById(idAdherant);
        model.addAttribute("adherant", adherant);
        model.addAttribute("pret", pret);
        return "bibliothecaire/rendu2";
    }

    @PostMapping("/rendufinal")
    public String rendufinal(
        @RequestParam("idPret") int idPret,
        Model model
    ){
        PretModel pret = pretService.findById(idPret);
        model.addAttribute("pret", pret);
        return "bibliothecaire/rendufinal";
    }

    @PostMapping("/valider")
    public String validerRetour(
            @RequestParam int idPret,
            @RequestParam(required = false) String dateRetour,
            @RequestParam(required = false) String heureRetour
    ) {
        PretModel pret = pretService.findById(idPret);

        if (pret == null) {
            // Gerer le cas où le pret n'existe pas (facultatif mais propre)
            return "redirect:/rendu/prim?error=pret-inexistant";
        }

        // Traitement selon le type de pret
        if ("Domicile".equalsIgnoreCase(pret.getTypePret())) {
            pret.setDateRetourReelle(LocalDate.parse(dateRetour));
        } else if ("SurPlace".equalsIgnoreCase(pret.getTypePret())) {
            pret.setHeureRetourPrevue(LocalTime.parse(heureRetour));
        }

        // Mise a jour du statut du pret
        pret.setStatut("Rendu");

        // Mise a jour du statut de l'exemplaire
        pret.getExemplaire().setStatus("Libre");

        // Sauvegarde
        pretService.save(pret); // Attention : save() doit aussi sauver l'exemplaire si pas en cascade
        if (pret.getDateRetourReelle().isBefore(pret.getDateRetourPrevue())) {
            PenaliterModel p = new PenaliterModel();
            QuotaPretModel q = quotaPretService.findByIdTPandIdTA(1, pret.getAdherant().getTypeAdherant().getIdTypeAdherant());
            p.setAdherant(pret.getAdherant());
            p.setDateDebut(pret.getDateRetourReelle());
            p.setDateFin(pret.getDateRetourReelle().plusDays(q.getNbrJourPenaliter()));
            penaliterService.save(p);
            return "redirect:/rendu/prim?livre rendu plus penaliter pour l adherant";
        }
        return "redirect:/rendu/prim?success=1";
    }

}
