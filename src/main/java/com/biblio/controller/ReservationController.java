package com.biblio.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.biblio.model.AdherantModel;
import com.biblio.model.ExemplaireModel;
import com.biblio.model.JourFerierModel;
import com.biblio.model.PenaliterModel;
import com.biblio.model.ReservationModel;
import com.biblio.model.PretModel;
import com.biblio.service.AdherantService;
import com.biblio.service.ExemplaireService;
import com.biblio.service.JourFerierService;
import com.biblio.service.ReservationService;
import com.biblio.service.AbonnementService;
import com.biblio.service.PenaliterService;
import com.biblio.service.PretService;

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
    @Autowired
    private AbonnementService abonnementService;
    @Autowired
    private PenaliterService penaliterService;
    @Autowired
    private PretService pretService;
 
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

    @GetMapping("reserver")
    public String reserver(
        Model model
    ){
        List<ReservationModel> reservation = reservationService.findAll();
        model.addAttribute("reservations", reservation);
        return "bibliothecaire/listeReservation";
    }

   @GetMapping("/accepter")
    public String accepter(
        @RequestParam("idReservation") int idReservation,
        RedirectAttributes redirectAttributes
    ) {
        ReservationModel reservation = reservationService.findById(idReservation);
        LocalDate dateRes = reservation.getDateReservation();

        // Vérifier l'abonnement
        if (!abonnementService.estabonneCetteDate(reservation.getAdherant().getIdAdherant(), dateRes)) {
            redirectAttributes.addFlashAttribute("erreur", "L'adhérent n'est pas abonné à cette date.");
            return "redirect:/reservation/reserver";
        }

        // Vérifier les pénalités
        List<PenaliterModel> penalites = penaliterService.findByIdAdherant(reservation.getAdherant().getIdAdherant());
        if (penalites != null) {
            for (PenaliterModel p : penalites) {
                if ((p.getDateDebut().isBefore(dateRes) || p.getDateDebut().isEqual(dateRes)) &&
                    (p.getDateFin().isAfter(dateRes) || p.getDateFin().isEqual(dateRes))) {
                    redirectAttributes.addFlashAttribute("erreur", "L'adhérent est pénalisé à cette date.");
                    return "redirect:/reservation/reserver";
                }
            }
        }

        // Créer le prêt
        PretModel pret = new PretModel();
        pret.setAdherant(reservation.getAdherant());
        pret.setExemplaire(reservation.getExemplaire());
        pret.setDatePret(dateRes);
        pret.setDateRetourPrevue(dateRes); // Pour SurPlace, même jour
        pret.setTypePret("SurPlace");
        pret.setHeurePret(LocalTime.of(8, 0)); // Heure fixe ou personnalisable
        pret.setStatut("En cours");

        pretService.save(pret);

        // Marquer la réservation comme acceptée
        reservation.setStatus("acceptée");
        reservationService.save(reservation);

        redirectAttributes.addFlashAttribute("success", "Réservation acceptée avec succès.");
        return "redirect:/reservation/reserver";
    }


    @GetMapping("/refuser")
    public String refuser(
        @RequestParam("idReservation") int idReservation,
        RedirectAttributes redirectAttributes
    ){
        reservationService.delete(idReservation);
        return "redirect:/reservation/reserver";
    }
}
