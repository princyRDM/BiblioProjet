package com.biblio.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import com.biblio.model.PretModel;
import com.biblio.service.PretService;

@RestController
@RequestMapping("/api/pret")
public class PretApiController {
    @Autowired
    private PretService pretService;

    @GetMapping("/getPrets")
    public ResponseEntity<List<PretModel>> getAll() {
        return ResponseEntity.ok(pretService.findAll());
    }

    @GetMapping("/byAdherant")
    public ResponseEntity<List<PretModel>> getByAdherant(@RequestParam("idAdherant") int idAdherant) {
        return ResponseEntity.ok(pretService.findByIdAdherant(idAdherant));
    }

    @PostMapping("/ajout")
    public ResponseEntity<PretModel> addPret(@RequestBody PretModel pret) {
        PretModel saved = pretService.save(pret);
        return ResponseEntity.ok(saved);
    }
}
