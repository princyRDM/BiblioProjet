<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Rendu1</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1em;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
        }
        th {
            background-color: #f0f0f0;
        }
        #searchInput {
            margin-top: 10px;
            padding: 6px;
            width: 100%;
        }
    </style>
    <script>
        function filterAdherants() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let rows = document.querySelectorAll("#adherantTable tbody tr");
            rows.forEach(row => {
                let id = row.querySelector(".id").textContent.toLowerCase();
                let nom = row.querySelector(".nom").textContent.toLowerCase();
                let prenom = row.querySelector(".prenom").textContent.toLowerCase();
                row.style.display = (id.includes(input) || nom.includes(input) || prenom.includes(input)) ? "" : "none";
            });
        }

        function selectAdherant(id) {
            document.getElementById("idAdherant").value = id;
            document.getElementById("renduForm").submit();
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Rendu livre</h1>
        <input type="text" id="searchInput" onkeyup="filterAdherants()" placeholder="Rechercher par ID, nom ou prénom...">
        
        <form id="renduForm" action="${pageContext.request.contextPath}/rendu/second" method="post">
            <input type="hidden" name="idAdherant" id="idAdherant">
        </form>

        <table id="adherantTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="adherant" items="${adherants}">
                    <tr>
                        <td class="id">${adherant.idAdherant}</td>
                        <td class="nom">${adherant.nom}</td>
                        <td class="prenom">${adherant.prenom}</td>
                        <td>
                            <button type="button" onclick="selectAdherant('${adherant.idAdherant}')">Choisir</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
