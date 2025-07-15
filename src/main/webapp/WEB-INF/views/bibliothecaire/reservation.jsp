<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation - Bibliotheque</title>
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
                    <li><a href="${pageContext.request.contextPath}/abonnement/form">Abonnements</a></li>
                    <li><a href="${pageContext.request.contextPath}/livre/listes">Livres</a></li>
                    <li><a href="${pageContext.request.contextPath}/rendu/prim">Retour de livres</a></li>
                    <li><a href="${pageContext.request.contextPath}/reservation/reserver">Reservations</a></li>
                </ul>            
            </nav>
        </div>

        <!-- Main Content -->
        <main class="main-content">
            <div class="page-header">
                <h1>Reservation</h1>
            </div>

            <div class="form-container">
                <div class="message">
                    <c:if test="${not empty message}">
                        <p>${message}</p>
                    </c:if>
                </div>

                <form action="${pageContext.request.contextPath}/reservation/ajout" method="post">
                    <div class="form-group">
                        <label for="idAdherant">Adherant</label>
                        <select name="idAdherant" id="idAdherant" required>
                            <option value="">-- Choisissez un adherant --</option>
                            <c:forEach var="adherant" items="${adherants}">
                                <option value="${adherant.idAdherant}">${adherant.nom} ${adherant.prenom}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="idExemplaire">Exemplaire</label>
                        <select name="idExemplaire" id="idExemplaire" required>
                            <option value="">-- Choisissez l exemplaire --</option>
                            <c:forEach var="exemplaire" items="${exemplaires}">
                                <option value="${exemplaire.idExemplaire}">${exemplaire.numExemplaire} ${exemplaire.status}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="dateReservation">Date reservation</label>
                        <input type="date" name="dateReservation" id="dateReservation" required>
                    </div>

                    <input type="hidden" name="idLivre" value="${idLivre}">
                    <button type="submit" class="submit-btn">Valider</button>
                </form>
            </div>
        </main>
    </div>
</body>
</html>