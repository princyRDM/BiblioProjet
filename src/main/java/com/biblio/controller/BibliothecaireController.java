package com.biblio.controller;

// import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// import com.biblio.model.PretModel;
import com.biblio.service.PretService;

@Controller
@RequestMapping("/bibliotheque")
public class BibliothecaireController {
    @Autowired
    private PretService pretService;

    @GetMapping("/dashbord")
    public String index(
        Model model
    ){
        int nbrLivreEmpreunter = pretService.countByStatut("En cours");
        int nbrLivreRendu = pretService.countByStatut("Rendu");
        int nbrLivreEmprunterDomicile = pretService.countByTypePretAndStatut("Domicile","En cours");
        int nbrLivreEmprunterSurPlace = pretService.countByTypePretAndStatut("SurPlace","En cours");
        model.addAttribute("livreEmprunter", nbrLivreEmpreunter);
        model.addAttribute("livreRendu", nbrLivreRendu);
        model.addAttribute("nbrLED",nbrLivreEmprunterDomicile);
        model.addAttribute("nbrLES",nbrLivreEmprunterSurPlace);
        return "/bibliothecaire/dashbord";
    }
}
