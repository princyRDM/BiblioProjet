package com.biblio.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.biblio.model.AbonnementModel;
import com.biblio.service.AbonnementService;
import com.biblio.service.AdherantService;

@Controller
@RequestMapping("/abonnement")
public class AbonnementController {
    @Autowired
    private AbonnementService abonnementService;
    @Autowired 
    private AdherantService adherantService;

    @GetMapping("/form")
    public String formulaire(Model model){
        model.addAttribute("adherants", adherantService.findAll());
        return "bibliothecaire/abonnement";
    }

    @PostMapping("/ajout")
    public String validation(
        @RequestParam("idAdherant") int idAdherant,
        @RequestParam("dateDebut") String dateDebutStr,
        @RequestParam("dateFin") String dateFinStr,
        RedirectAttributes redirectAttributes
    ) {
        LocalDate dateDebut = LocalDate.parse(dateDebutStr);
        LocalDate dateFin = LocalDate.parse(dateFinStr);

        if (abonnementService.abonnementValid(idAdherant, dateDebut, dateFin)) {
            AbonnementModel ab = new AbonnementModel();
            ab.setAdherant(adherantService.findById(idAdherant));
            ab.setDateDebut(dateDebut);
            ab.setDateFin(dateFin);
            abonnementService.save(ab);
            redirectAttributes.addFlashAttribute("message", "Abonnement ajouter avec succes");
        }else{
            redirectAttributes.addFlashAttribute("message", "La date se chevauche sur cette periode!");
        }
        return "redirect:/abonnement/form";
    }
}
