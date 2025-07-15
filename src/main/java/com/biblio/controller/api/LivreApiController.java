package com.biblio.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.biblio.model.LivreModel;
import com.biblio.service.LivreService;

@RestController
@RequestMapping("/api/livre")
public class LivreApiController {
    @Autowired
    private LivreService livreService;

    @GetMapping(value = "/getLivres")
    public ResponseEntity<List<LivreModel>> liste() {
        List<LivreModel> livre = livreService.findAll();
        return ResponseEntity.ok(livre);
    }
}