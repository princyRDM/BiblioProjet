package com.biblio.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import com.biblio.model.AdherantModel;
import com.biblio.service.AdherantService;

@RestController
@RequestMapping("/api/adherant")
public class AdherantApiController {
    @Autowired
    private AdherantService adherantService;

    @GetMapping("/getAdherants")
    public ResponseEntity<List<AdherantModel>> getAll() {
        return ResponseEntity.ok(adherantService.findAll());
    }

    @GetMapping("/byId")
    public ResponseEntity<AdherantModel> getById(@RequestParam("idAdherant") int idAdherant) {
        return ResponseEntity.ok(adherantService.findById(idAdherant));
    }
}
