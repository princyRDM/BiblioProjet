package com.biblio.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.biblio.model.AdherantModel;
import com.biblio.model.ExemplaireModel;
import com.biblio.model.JourFerierModel;
import com.biblio.model.ReservationModel;
import com.biblio.service.AdherantService;
import com.biblio.service.ExemplaireService;
import com.biblio.service.JourFerierService;
import com.biblio.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
    @Autowired
    private ExemplaireService exemplaireService;
    @Autowired
    private AdherantService adherantService;    
    @Autowired
    private JourFerierService jourFerierService;
        @Autowired
    private ReservationService reservationService;
 
    @GetMapping("/form")
    public String formulaire(
        @RequestParam("idLivre") int idLivre,
        Model model
    ){
        List<ExemplaireModel> exemplaire = exemplaireService.findAllByIdLivre(idLivre);
        List<AdherantModel> adherant = adherantService.findAll();
        model.addAttribute("exemplaires", exemplaire);
        model.addAttribute("adherants", adherant);
        model.addAttribute("idLivre", idLivre);
        return "bibliothecaire/reservation";
    }

    @PostMapping("/ajout")
    public String validation(
        @RequestParam("idAdherant") int idAdherant,
        @RequestParam("idExemplaire") int idExemplaire,
        @RequestParam("idLivre") int idLivre,
        @RequestParam("dateReservation") String datestr,
        RedirectAttributes redirectAttributes
    ){
        LocalDate dateReservation = LocalDate.parse(datestr);
        List<JourFerierModel> jourFerierModel = jourFerierService.findAll();
        redirectAttributes.addAttribute("idLivre", idLivre);
        for (JourFerierModel jf : jourFerierModel) {
            if (jf.getDate().equals(dateReservation)) {
                redirectAttributes.addFlashAttribute("message", jf.getDate()+" n est valide car c est "+jf.getDescription());
                return "redirect:/reservation/form";
            }
        }
        if (dateReservation.getDayOfWeek() == DayOfWeek.SUNDAY) {
            redirectAttributes.addFlashAttribute("message", "Cette date n est pas valide car c est un dimanche");
            return "redirect:/reservation/form";
        }else{
            redirectAttributes.addFlashAttribute("message", "La reservation a ete envoyer");
            ReservationModel rm = new ReservationModel();
            rm.setAdherant(adherantService.findById(idAdherant));
            rm.setExemplaire(exemplaireService.findById(idExemplaire));
            rm.setDateReservation(dateReservation);
            reservationService.save(rm);
            return "redirect:/reservation/form";
        }
    }
}
