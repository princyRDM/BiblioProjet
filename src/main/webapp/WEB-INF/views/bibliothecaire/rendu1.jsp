  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rendu1</title>
</head>
<body>
    <div class="container">
        <h1>Rendu livre</h1>
        <form action="${pageContext.request.contextPath}/rendu/second" method="post">
            <div>
                <label for="">Adherant</label>
                <select name="idAdherant" required>
                    <option value="">-- Choisissez l'Adherant --</option>
                    <c:forEach var="adherant" items="${adherants}">
                        <option value="${adherant.idAdherant}">${adherant.nom} ${adherant.prenom}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit">Valider</button>
        </form>
    </div>
</body>
</html>