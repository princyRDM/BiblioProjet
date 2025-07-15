<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adh-dash</title>
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
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    <script src="${pageContext.request.contextPath}/js/listelivre.js"></script>
</body>
</html>