<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>liste livre</title>
</head>
<body>
    <div class="container">
        <div class="nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/bibliotheque/dashbord">Dashbord</a></li>
                <li><a href="${pageContext.request.contextPath}/livre/listes">Livre</a></li>
                <li><a href="${pageContext.request.contextPath}/abonnement/form">Abonnement</a></li>
                <li><a href="${pageContext.request.contextPath}/rendu/prim">Rendre un livre</a></li>
            </ul>            
        </div>
        <div class="livres">
            <h1>Liste livre</h1>
            <p>
                <input type="text" name="recherche" id="recherche" placeholder="Faire une recherche">
            </p>
            <p>
                Faire une filtre :
                <select name="" id="">
                    <option value="">-- Type livre --</option>
                    <c:forEach var="type" items="${typelivres}">
                        <option value="">${type.libelle}</option>
                    </c:forEach>
                </select>
            </p>
            <table border="1">
                <thead>
                    <tr>
                        <th>Titre</th>
                        <th>Auteur</th>
                        <th>Type</th>
                        <th>Annee de publication</th>
                        <th>Langue</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="livre" items="${livres}">
                        <tr>
                            <td>${livre.titre}</td>
                            <td>${livre.auteur}</td>
                            <td>${livre.typeLivre.libelle}</td>
                            <td>${livre.anneePublication}</td>
                            <td>${livre.langue}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/pret/formulaire?idLivre=${livre.idLivre}">Preter</a>
                                <a href="${pageContext.request.contextPath}/reservation/form?idLivre=${livre.idLivre}">Reserver</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/listelivre.js"></script>
</body>
</html>