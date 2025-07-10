package com.biblio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bibliotheque")
public class BibliothecaireController {
    @GetMapping("/dashbord")
    public String index(){
        return "/bibliothecaire/dashbord";
    }
}
