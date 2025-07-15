package com.biblio.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.biblio.model.AdherantModel;
import com.biblio.model.BibliothecaireModel;
import com.biblio.model.LivreModel;
import com.biblio.model.TypeLivreModel;
import com.biblio.service.AdherantService;
import com.biblio.service.BibliothecaireService;
import com.biblio.service.LivreService;
import com.biblio.service.TypeLivreService;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private BibliothecaireService bibliothecaireService;
    @Autowired
    private AdherantService adherantService;
    @Autowired
    private LivreService livreService;
    @Autowired
    private TypeLivreService typelivreService;

    @PostMapping("/authentification")
    public String Auth(
        @RequestParam("email") String email,
        @RequestParam("password") String password,
        @RequestParam("role") String role,
        HttpSession session,
        Model model
    ){
        if (role.equals("user")) {
            AdherantModel adherant = adherantService.authentification(email, password);
            List<LivreModel> livre = livreService.findAll();
            List<TypeLivreModel> typelivre = typelivreService.findAll();
            if (adherant != null) {
                session.setAttribute("user", adherant);
                model.addAttribute("livres", livre);
                model.addAttribute("typelivres", typelivre);
                return "/adherant/dashbord";
            }else{
                model.addAttribute("message", "Utilisateur non trouver");
                return "/index";
            }
        } else if (role.equals("admin")) {
            BibliothecaireModel biblio = bibliothecaireService.authentification(email, password);
            if (biblio != null) {
                session.setAttribute("user", biblio);
                return "/bibliothecaire/dashbord";
            }else{
                model.addAttribute("message", "Utilisateur non trouver");
                return "/index";
            }
        }
        return "/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // ➖ Supprime toutes les donnees en session
        return "redirect:/index";
    }

}
