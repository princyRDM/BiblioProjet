<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des prets</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adherant.css">
</head>
<body>
    <div class="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/adherant/dashbord">Livre</a></li>
            <li><a href="${pageContext.request.contextPath}/adherant/livreEmprunt">Livre emprunter</a></li>
            <li><a href="${pageContext.request.contextPath}/adherant/livreRendu">Livre rendu</a></li>
        </ul>            
    </div>
    <h2>Liste des prets de ${adherant.nom} ${adherant.prenom}</h2>

    <h3>Prets a domicile</h3>
    <table>
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
                                    <button type="submit">Prolonger</button>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>

    <h3>Prets sur place</h3>
    <table>
        <thead>
            <tr>
                <th>Titre livre</th>
                <th>Exemplaire</th>
                <th>Date du pret</th>
                <th>Heure du pret</th>
                <th>Statut</th>
                <!-- <th>Action</th> -->
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
                        <!-- <td>
                            <c:if test="${pret.statut == 'En cours'}">
                                <form method="post" action="${pageContext.request.contextPath}/rendu/rendufinal">
                                    <input type="hidden" name="idPret" value="${pret.idPret}" />
                                    <button type="submit">Rendre</button>
                                </form>
                            </c:if>
                        </td> -->
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
