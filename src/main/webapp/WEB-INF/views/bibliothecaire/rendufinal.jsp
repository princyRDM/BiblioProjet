<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retour Livre - Bibliotheque</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css">
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 40px;
        }
        table, th, td {
            border: 1px solid black;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .en-cours {
            color: red;
        }
        .rendu {
            color: green;
        }
    </style>
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
                </ul>            
            </nav>
        </div>

        <!-- Main Content -->
        <main class="main-content">
            <div class="form-container">
                <h1 class="form-title">Retour du livre</h1>
                
                <div class="info-display">
                    <p><strong>Adherant :</strong> ${pret.adherant.nom} ${pret.adherant.prenom}</p>
                    <p><strong>Titre livre :</strong> ${pret.exemplaire.livre.titre}</p>
                    <p><strong>Exemplaire :</strong> ${pret.exemplaire.numExemplaire}</p>
                    <p><strong>Type de pret :</strong> ${pret.typePret}</p>
                    <p><strong>Date de pret :</strong> ${pret.datePret}</p>
                </div>

                <form action="${pageContext.request.contextPath}/rendu/valider" method="post">
                    <input type="hidden" name="idPret" value="${pret.idPret}" />

                    <c:choose>
                        <c:when test="${pret.typePret == 'Domicile'}">
                            <div class="form-group">
                                <label for="dateRetour">Date de retour :</label>
                                <input type="date" id="dateRetour" name="dateRetour" required>
                            </div>
                        </c:when>
                        <c:when test="${pret.typePret == 'SurPlace'}">
                            <div class="form-group">
                                <label for="heurepret">Heure de pret :</label>
                                <input type="time" id="heurepret" name="heurepret" value="${pret.heurePret}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="heureRetour">Heure de retour :</label>
                                <input type="time" id="heureRetour" name="heureRetour" value="18:00" required>
                            </div>
                        </c:when>
                    </c:choose>

                    <button type="submit" class="submit-btn">Valider le retour</button>
                </form>
            </div>
        </main>
    </div>
</body>
</html>