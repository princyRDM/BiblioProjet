package com.biblio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.biblio.service.AdherantService;
import com.biblio.service.BibliothecaireService;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private BibliothecaireService bibliothecaireService;
    @Autowired
    private AdherantService adherantService;

    @PostMapping("/authentification")
    public String Auth(
        @RequestParam("email") String email,
        @RequestParam("password") String password,
        @RequestParam("role") String role,
        Model model
    ){
        return "/";
    }

}
