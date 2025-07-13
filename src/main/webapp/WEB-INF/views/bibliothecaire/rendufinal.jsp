<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Retour Livre</title>
    <style>
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            font-family: Arial;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="date"], input[type="time"] {
            width: 100%;
            padding: 8px;
        }
        button {
            margin-top: 20px;
            padding: 10px 15px;
        }
    </style>
    <script>
        function initialiserChamps() {
            const typePret = '${pret.typePret}';
            const datePret = '${pret.datePret}';
            const heurePret = '${pret.heurePret}';

            if (typePret === 'Domicile') {
                document.getElementById('dateRetour').setAttribute('min', datePret);
            } else if (typePret === 'SurPlace') {
                document.getElementById('heureRetour').setAttribute('min', heurePret);
                document.getElementById('heureRetour').setAttribute('max', '18:00');
            }
        }

        window.onload = initialiserChamps;
    </script>
</head>
<body>
    <div class="container">
        <h1>Rendu du livre</h1>
        <form action="${pageContext.request.contextPath}/rendu/valider" method="post">
            <input type="hidden" name="idPret" value="${pret.idPret}" />

            <p><strong>Adherant :</strong> ${pret.adherant.nom} ${pret.adherant.prenom}</p>
            <p><strong>Titre livre :</strong> ${pret.exemplaire.livre.titre} </p>
            <p><strong>Exemplaire :</strong> ${pret.exemplaire.numExemplaire}</p>
            <p><strong>Type de pret :</strong> ${pret.typePret}</p>
            <p><strong>Date de pret :</strong> ${pret.datePret}</p>

            <c:choose>
                <c:when test="${pret.typePret == 'Domicile'}">
                    <label for="dateRetour">Date de retour :</label>
                    <input type="date" id="dateRetour" name="dateRetour" required>
                </c:when>
                <c:when test="${pret.typePret == 'SurPlace'}">
                    <label for="heureRetour">Heure de pret :</label>
                    <input type="time" id="heurepret" name="heurepret" value="${pret.heurePret}" readonly><br>
                    <label for="heureRetour">Heure de retour :</label>
                    <input type="time" id="heureRetour" name="heureRetour" value="18:00" required>
                </c:when>
            </c:choose>

            <button type="submit">Valider le retour</button>
        </form>
    </div>
</body>
</html>
