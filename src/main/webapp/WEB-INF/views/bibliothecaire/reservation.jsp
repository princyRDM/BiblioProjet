<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation</title>
</head>
<body>
    <div class="container">
        <div class="nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/bibliotheque/dashbord">Dashbord</a></li>
                <li><a href="${pageContext.request.contextPath}/abonnement/form">Abonnement</a></li>
                <li><a href="${pageContext.request.contextPath}/livre/listes">Livre</a></li>
                <li><a href="${pageContext.request.contextPath}/rendu/prim">Rendre un livre</a></li>
            </ul>            
        </div>
        <h1>Reservation</h1>
        <div class="form-reservation">
            <div class="message">
                <c:if test="${not empty message}">
                    <p>${message}</p>
                </c:if>
            </div>
            <form action="${pageContext.request.contextPath}/reservation/ajout" method="post">
                <div>
                    <label for="">Adherant</label>
                    <select name="idAdherant" required>
                        <option value="">-- Choisissez un adherant --</option>
                        <c:forEach var="adherant" items="${adherants}">
                            <option value="${adherant.idAdherant}">${adherant.nom} ${adherant.prenom}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label for="">Exemplaire</label>
                    <select name="idExemplaire" required>
                        <option value="">-- Choisissez l exemplaire --</option>
                        <c:forEach var="exemplaire" items="${exemplaires}">
                            <option value="${exemplaire.idExemplaire}">${exemplaire.numExemplaire}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label for="">Date reservation</label>
                    <input type="date" name="dateReservation" required>
                </div>
                <input type="hidden" name="idLivre" value="${idLivre}">
                <button type="submit">Valider</button>
            </form>
        </div>
    </div>
</body>
</html>