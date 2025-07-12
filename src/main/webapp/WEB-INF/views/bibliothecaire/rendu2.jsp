<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des prets</title>
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
    <h2>Liste des prets de ${adherant.nom} ${adherant.prenom}</h2>

    <h3>Prets à domicile</h3>
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Exemplaire</th>
                <th>Date du pret</th>
                <th>Date retour prévue</th>
                <th>Statut</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="pret" items="${pret}" varStatus="loop">
                <c:if test="${pret.typePret == 'Domicile'}">
                    <tr>
                        <td>${loop.index + 1}</td>
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
                                <form method="post" action="${pageContext.request.contextPath}/pret/rendre">
                                    <input type="hidden" name="idPret" value="${pret.idPret}" />
                                    <button type="submit">Rendre</button>
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
                <th>#</th>
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
                        <td>${loop.index + 1}</td>
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
                                <form method="post" action="${pageContext.request.contextPath}/pret/rendre">
                                    <input type="hidden" name="idPret" value="${pret.idPret}" />
                                    <button type="submit">Rendre</button>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
