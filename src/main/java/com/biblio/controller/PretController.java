package com.biblio.controller;

import com.biblio.model.*;
import com.biblio.service.AbonnementService;
import com.biblio.service.AdherantService;
import com.biblio.service.ExemplaireService;
import com.biblio.service.PretService;
import com.biblio.service.QuotaPretService;

import javax.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Controller
@RequestMapping("/pret")
@RequiredArgsConstructor
public class PretController {
    @Autowired
    private PretService pretService;
    @Autowired
    private AbonnementService abonnementService;
    @Autowired
    private AdherantService adherantService;
    @Autowired
    private ExemplaireService exemplaireService;
    @Autowired
    private QuotaPretService quotaPretService;

    @GetMapping("/formulaire")
    public String formualire(
        @RequestParam("idLivre") int idLivre,
        Model model
    ){
        List<AdherantModel> adherant = adherantService.findAll();
        List<ExemplaireModel> exemplaire = exemplaireService.findAllByIdLivre(idLivre);
        model.addAttribute("exemplaires", exemplaire);
        model.addAttribute("adherants", adherant);
        return "bibliothecaire/pret";
    }

    @PostMapping("/ajout")
    public String ajouterPret(HttpServletRequest request) {
        Integer idAdherant = Integer.parseInt(request.getParameter("idAdherant"));
        Integer idExemplaire = Integer.parseInt(request.getParameter("idExemplaire"));
        String typePret = request.getParameter("typePret");
        String datePretStr = request.getParameter("datePret");
        String heurePretStr = request.getParameter("heurePret"); // null si domicile

        AdherantModel adherant = adherantService.findById(idAdherant);
        ExemplaireModel exemplaire = exemplaireService.findById(idExemplaire);
        List<AbonnementModel> abonnement = abonnementService.findByIdAdherant(adherant.getIdAdherant());
        LocalDate date = LocalDate.parse(datePretStr);
        QuotaPretModel quota1 = quotaPretService.findByIdTPandIdTA(1, idAdherant);
        QuotaPretModel quota2 = quotaPretService.findByIdTPandIdTA(2, idAdherant);
        int nbrlivrePreterDomicile = pretService.countByAdherant_IdAdherantAndTypePretAndStatut(idAdherant, "Domicile","En cours");
        int nbrlivrePreterSurPlace = pretService.countByAdherant_IdAdherantAndTypePretAndStatut(idAdherant, "Sur place","En cours");
        if (abonnement.isEmpty()) {
            return "redirect:/livre/listes?Pas encore abonne";
        }else{
            for (AbonnementModel ab : abonnement) {
                if (ab.getDateDebut().isBefore(date) && ab.getDateFin().isAfter(date)) {
                    return "redirect:/livre/listes?Abonnement expirer sur cette date";
                }
            }
        }
        if (exemplaire.getStatus().equals("Occupé")) {
            return "redirect:/livre/listes?livre deja occuper";
        }else{
            // Initialiser le prêt
            PretModel pret = new PretModel();
            pret.setAdherant(adherant);
            pret.setExemplaire(exemplaire);
            pret.setTypePret(typePret);
            pret.setDatePret(LocalDate.parse(datePretStr));
            pret.setStatut("En cours");

            if ("SurPlace".equals(typePret)) {
                if (nbrlivrePreterSurPlace == quota2.getQuota()) {
                    return "redirect:/livre/listes?Quota deja atteint";
                }else{
                    pret.setHeurePret(LocalTime.parse(heurePretStr));
                    pret.setDateRetourPrevue(date);
                }
            } else if ("Domicile".equals(typePret)) {
                if (nbrlivrePreterDomicile == quota1.getQuota()) {
                    return "redirect:/livre/listes?Quota deja atteint";
                }else{
                    TypeAdherantModel typeAdherant = adherant.getTypeAdherant();
                    QuotaPretModel quota = quotaPretService.findByIdTPandIdTA(1, typeAdherant.getIdTypeAdherant());
                    LocalDate dateRetourPrevue = LocalDate.parse(datePretStr).plusDays(quota.getDelaiPret());
                    pret.setDateRetourPrevue(dateRetourPrevue);
                }
            }

            // Enregistrer le prêt
            pretService.save(pret);
            exemplaireService.changerStatutExemplaire(idExemplaire, "Occupé");
            return "redirect:/livre/listes?pret valider";
        }
        
    }
}
