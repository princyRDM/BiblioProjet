<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rendu de livre - Bibliotheque</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css">
    <script>
        function filterAdherants() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let rows = document.querySelectorAll(".adherant-table tbody tr");
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
                    <li><a href="${pageContext.request.contextPath}/bibliotheque/adherants">Adherants</a></li>
                    <li><a href="${pageContext.request.contextPath}/adherant/ajout">Inscription</a></li>
                </ul>            
            </nav>
        </div>

        <!-- Main Content -->
        <main class="main-content">
            <div class="page-header">
                <h1>Rendu de livre</h1>
                
                <div class="search-box">
                    <input type="text" id="searchInput" onkeyup="filterAdherants()" 
                           placeholder="Rechercher par ID, nom ou prenom...">
                </div>
            </div>

            <form id="renduForm" action="${pageContext.request.contextPath}/rendu/second" method="post">
                <input type="hidden" name="idAdherant" id="idAdherant">
            </form>

            <table class="adherant-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prenom</th>
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
                                <button type="button" class="select-btn" 
                                        onclick="selectAdherant('${adherant.idAdherant}')">
                                    Choisir
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>