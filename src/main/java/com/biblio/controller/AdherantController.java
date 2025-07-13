package com.biblio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biblio.model.AdherantModel;
import com.biblio.model.LivreModel;
import com.biblio.model.PretModel;
import com.biblio.model.TypeLivreModel;
import com.biblio.service.AdherantService;
import com.biblio.service.LivreService;
import com.biblio.service.PretService;
import com.biblio.service.TypeLivreService;

@Controller
@RequestMapping("/adherant")
public class AdherantController {
    @Autowired
    private LivreService livreService;
    @Autowired
    private PretService pretService;
    @Autowired
    private TypeLivreService typelivreService;
    @Autowired
    private AdherantService adherantService;

    @GetMapping("/dashbord")
    public String dashbord(
        Model model
    ){
        List<LivreModel> livre = livreService.findAll();
        List<TypeLivreModel> typelivre = typelivreService.findAll();
        model.addAttribute("livres", livre);
        model.addAttribute("typelivres", typelivre);
        return "adherant/dashbord";
    }

    @GetMapping("/livreEmprunt")
    public String livrePret(
        Model model
    ){
        List<PretModel> pret = pretService.findByAdherant_IdAdherantAndStatut(1, "En cours");
        AdherantModel adherant = adherantService.findById(1);
        model.addAttribute("adherant", adherant);
        model.addAttribute("pret", pret);
        return "adherant/livrepret";
    }

    @GetMapping("/livreRendu")
    public String livrerendu(
        Model model
    ){
        List<PretModel> pret = pretService.findByAdherant_IdAdherantAndStatut(1, "Rendu");
        model.addAttribute("pret", pret);
        return "adherant/livrerendu";
    }
}
