package com.biblio.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import com.biblio.model.AbonnementModel;
import com.biblio.service.AbonnementService;

@RestController
@RequestMapping("/api/abonnement")
public class AbonnementApiController {
    @Autowired
    private AbonnementService abonnementService;

    @GetMapping("/getAbonnements")
    public ResponseEntity<List<AbonnementModel>> getAll() {
        return ResponseEntity.ok(abonnementService.findAll());
    }

    @GetMapping("/byAdherant")
    public ResponseEntity<List<AbonnementModel>> getByAdherant(@RequestParam("idAdherant") int idAdherant) {
        return ResponseEntity.ok(abonnementService.findByIdAdherant(idAdherant));
    }
}
