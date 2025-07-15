package com.biblio.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import com.biblio.model.PenaliterModel;
import com.biblio.service.PenaliterService;

@RestController
@RequestMapping("/api/penaliter")
public class PenaliterApiController {
    @Autowired
    private PenaliterService penaliterService;

    @GetMapping("/getPenaliters")
    public ResponseEntity<List<PenaliterModel>> getAll() {
        return ResponseEntity.ok(penaliterService.findAll());
    }

    @GetMapping("/byAdherant")
    public ResponseEntity<List<PenaliterModel>> getByAdherant(@RequestParam("idAdherant") int idAdherant) {
        return ResponseEntity.ok(penaliterService.findByIdAdherant(idAdherant));
    }
}
