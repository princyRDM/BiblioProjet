<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des prets - Bibliotheque</title>
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
            <div class="page-header">
                <h2>Liste des prets de ${adherant.nom} ${adherant.prenom}</h2>
            </div>

            <h3 class="section-title">Prets a domicile</h3>
            <table class="pret-table">
                <thead>
                    <tr>
                        <th>Titre livre</th>
                        <th>Exemplaire</th>
                        <th>Date du pret</th>
                        <th>Date retour prevue</th>
                        <th>Statut</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pret" items="${pret}" varStatus="loop">
                        <c:if test="${pret.typePret == 'Domicile'}">
                            <tr>
                                <td>${pret.exemplaire.livre.titre}</td>
                                <td>${pret.exemplaire.numExemplaire}</td>
                                <td>${pret.datePret}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty pret.dateRetourPrevue}">
                                            ${pret.dateRetourPrevue}
                                        </c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="${pret.statut == 'En cours' ? 'en-cours' : 'rendu'}">${pret.statut}</td>
                                <td>
                                    <c:if test="${pret.statut == 'En cours'}">
                                        <form method="post" action="${pageContext.request.contextPath}/rendu/rendufinal">
                                            <input type="hidden" name="idPret" value="${pret.idPret}" />
                                            <button type="submit" class="rendre-btn">Rendre</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <h3 class="section-title">Prets sur place</h3>
            <table class="pret-table">
                <thead>
                    <tr>
                        <th>Titre livre</th>
                        <th>Exemplaire</th>
                        <th>Date du pret</th>
                        <th>Heure du pret</th>
                        <th>Statut</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pret" items="${pret}" varStatus="loop">
                        <c:if test="${pret.typePret == 'SurPlace'}">
                            <tr>
                                <td>${pret.exemplaire.livre.titre}</td>
                                <td>${pret.exemplaire.numExemplaire}</td>
                                <td>${pret.datePret}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty pret.heurePret}">
                                            ${pret.heurePret}
                                        </c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="${pret.statut == 'En cours' ? 'en-cours' : 'rendu'}">${pret.statut}</td>
                                <td>
                                    <c:if test="${pret.statut == 'En cours'}">
                                        <form method="post" action="${pageContext.request.contextPath}/rendu/rendufinal">
                                            <input type="hidden" name="idPret" value="${pret.idPret}" />
                                            <button type="submit" class="rendre-btn">Rendre</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>