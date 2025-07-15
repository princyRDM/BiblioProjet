<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion d'abonnement - Bibliotheque</title>
    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css">
</head>
<body>
    <div class="dashboard">
        <!-- Sidebar -->
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
                    <li><a href="${pageContext.request.contextPath}/reservation/reserver">Reservations</a></li>
                    <li><a href="${pageContext.request.contextPath}/bibliotheque/adherants">Adherants</a></li>
                    <li><a href="${pageContext.request.contextPath}/adherant/ajout">Inscription</a></li>
                </ul>            
            </nav>
        </div>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Message -->
            <div class="message">
                <c:if test="${not empty message}">
                    <p>${message}</p>
                </c:if>
            </div>

            <!-- Formulaire d'abonnement -->
            <div class="form-container">
                <h1 align="center">Nouvel Abonnement</h1>
                <form action="${pageContext.request.contextPath}/abonnement/ajout" method="post">
                    <div class="form-group">
                        <label for="idAdherant">Adherent</label>
                        <select name="idAdherant" id="idAdherant" required>
                            <option value="">-- Selectionner un Adherent --</option>
                            <c:forEach var="adherant" items="${adherants}">
                                <option value="${adherant.idAdherant}">${adherant.nom} ${adherant.prenom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="dateDebut">Date de debut</label>
                        <input type="date" name="dateDebut" id="dateDebut" required>
                    </div>
                    <div class="form-group">
                        <label for="dateFin">Date de fin</label>
                        <input type="date" name="dateFin" id="dateFin" required>
                    </div>
                    <button type="submit" class="btn-submit">Valider l'abonnement</button>
                </form>
            </div>
        </main>
    </div>
</body>
</html>