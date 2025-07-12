package com.biblio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.biblio.model.AdherantModel;
import com.biblio.model.PretModel;
import com.biblio.service.AdherantService;
import com.biblio.service.PretService;

@Controller
@RequestMapping("/rendu")
public class RenduController {
    @Autowired
    private AdherantService adherantService;
        @Autowired
    private PretService pretService;

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
}
