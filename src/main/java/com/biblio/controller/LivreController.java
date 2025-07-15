package com.biblio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.biblio.model.LivreModel;
import com.biblio.model.TypeLivreModel;
import com.biblio.service.LivreService;
import com.biblio.service.TypeLivreService;

@Controller
@RequestMapping("/livre")
public class LivreController {
    @Autowired
    private LivreService livreService;
    @Autowired
    private TypeLivreService typeLivreService;

    @GetMapping("/listes")
    public String liste(Model model){
        // List<LivreModel> livres = livreService.findAll();
        // List<TypeLivreModel> typelivres = typeLivreService.findAll();
        // model.addAttribute("livres", livres);
        // model.addAttribute("typelivres", typelivres);
        return "bibliothecaire/liste";
    }

    @GetMapping("/infoLivre")
    public String infoLivre(){
        return "bibliothecaire/infolivre";
    }
}
