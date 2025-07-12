<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        <div class="message">
            <c:if test="${not empty message}">
                <p>${message}</p>
            </c:if>
        </div>
        <h1>Abonnement</h1>
        <form action="${pageContext.request.contextPath}/abonnement/ajout" method="post">
            <div>
                <select name="idAdherant" required>
                    <option value="">-- Selectionner un Adherant --</option>
                    <c:forEach var="adherant" items="${adherants}">
                        <option value="${adherant.idAdherant}">${adherant.nom} ${adherant.prenom}</option>
                    </c:forEach>
                </select>
            </div>
            <div>
                <label for="">dateDebut</label>
                <input type="date" name="dateDebut" required>
            </div>
            <div>
                <label for="">dateFin</label>
                <input type="date" name="dateFin" required>
            </div>
            <button type="submit">Valider</button>
        </form>
    </div>
</body>
</html>