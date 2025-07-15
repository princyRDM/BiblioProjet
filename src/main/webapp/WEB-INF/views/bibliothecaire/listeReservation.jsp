<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblio - Reservations</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css">
</head>
<body>
    <div class="dashboard">
        <!-- Sidebar identique -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h1>Biblio</h1>
            </div>
            <nav class="nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/bibliotheque/dashbord">Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/livre/listes">Livres</a></li>
                    <li><a href="${pageContext.request.contextPath}/abonnement/form">Abonnements</a></li>
                    <li><a href="${pageContext.request.contextPath}/rendu/prim">Retour de livres</a></li>
                    <li><a href="${pageContext.request.contextPath}/reservation/reserver" class="active">Reservations</a></li>
                    <li><a href="${pageContext.request.contextPath}/bibliotheque/adherants">Adherants</a></li>
                    <li><a href="${pageContext.request.contextPath}/adherant/ajout">Inscription</a></li>
                </ul>            
            </nav>
        </div>

        <!-- Main Content adapté pour les réservations -->
        <main class="main-content">
            <div class="header">
                <h2>Liste des Reservations</h2>
                <p>Gestion des demandes de reservation</p>
            </div>
            
            <div class="reservations-table">
                <table>
                    <thead>
                        <tr>
                            <th>Adherant</th>
                            <th>Exemplaire</th>
                            <th>Date de reservation</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="reservation" items="${reservations}">
                            <tr>
                                <td>${reservation.adherant.nom} ${reservation.adherant.prenom}</td>
                                <td>${reservation.exemplaire.numExemplaire}</td>
                                <td>${reservation.dateReservation}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/reservation/accepter?idReservation=${reservation.idReservation}" class="action-btn accept-btn">Accepter</a>
                                    <a href="${pageContext.request.contextPath}/reservation/refuser?idReservation=${reservation.idReservation}" class="action-btn reject-btn">Refuser</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>