
package com.biblio.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;

import com.biblio.model.ExemplaireModel;
import com.biblio.service.ExemplaireService;

@RestController
@RequestMapping("/api/exemplaire")
public class ExemplaireApiController {
    @Autowired
    private ExemplaireService exemplaireService;

    @GetMapping("/getExemplaires")
    public ResponseEntity<List<ExemplaireModel>> liste() {
        List<ExemplaireModel> exemplaires = exemplaireService.findAll();
        return ResponseEntity.ok(exemplaires);
    }

    @GetMapping("/byLivre")
    public ResponseEntity<List<ExemplaireModel>> getByLivre(@RequestParam("idLivre") int idLivre) {
        List<ExemplaireModel> exemplaires = exemplaireService.findAllByIdLivre(idLivre);
        return ResponseEntity.ok(exemplaires);
    }

    @GetMapping("/countByLivre")
    public ResponseEntity<Integer> countByLivre(@RequestParam("idLivre") int idLivre) {
        int count = exemplaireService.findAllByIdLivre(idLivre).size();
        return ResponseEntity.ok(count);
    }

    @GetMapping("/countLibreByLivre")
    public ResponseEntity<Integer> countLibreByLivre(@RequestParam("idLivre") int idLivre) {
        long count = exemplaireService.findAllByIdLivre(idLivre)
            .stream()
            .filter(ex -> ex.getStatus() != null && ex.getStatus().equalsIgnoreCase("libre"))
            .count();
        return ResponseEntity.ok((int)count);
    }

    @GetMapping("/countOccupeByLivre")
    public ResponseEntity<Integer> countOccupeByLivre(@RequestParam("idLivre") int idLivre) {
        long count = exemplaireService.findAllByIdLivre(idLivre)
            .stream()
            .filter(ex -> ex.getStatus() != null && ex.getStatus().equalsIgnoreCase("Occupé"))
            .count();
        return ResponseEntity.ok((int)count);
    }
}
