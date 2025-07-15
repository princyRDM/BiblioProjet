package com.biblio.controller;

import java.lang.reflect.Type;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.biblio.model.AdherantModel;
import com.biblio.model.LivreModel;
import com.biblio.model.PretModel;
import com.biblio.model.*;
import com.biblio.service.AdherantService;
import com.biblio.service.LivreService;
import com.biblio.service.PretService;
import com.biblio.service.*;

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
    private TypeAdherantService typeAdherantService;
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

    @GetMapping("/ajout")
    public String ajoutAdherantForm(Model model) {
        List<TypeAdherantModel> types = typeAdherantService.findAll();
        model.addAttribute("types", types);
        return "bibliothecaire/inscription";
    }

    @PostMapping("/ajout2")
    public String ajouterAdherant(
        @RequestParam("nom") String nom,
        @RequestParam("prenom") String prenom,
        @RequestParam("contact") String contact,
        @RequestParam("email") String email,
        @RequestParam("password") String password,
        @RequestParam("idtypeAdherant") int idTypeAdherant,
        Model model
    ){
        AdherantModel adherant = new AdherantModel();
        TypeAdherantModel type = typeAdherantService.findById(idTypeAdherant);
        adherant.setNom(nom);
        adherant.setPrenom(prenom);
        adherant.setContact(contact);
        adherant.setEmail(email);
        adherant.setPassword(password);
        adherant.setTypeAdherant(type);
        adherantService.save(adherant);
        model.addAttribute("message", "Adhérent ajouté avec succès !");
        return "redirect:/bibliotheque/adherants";
    }
}
