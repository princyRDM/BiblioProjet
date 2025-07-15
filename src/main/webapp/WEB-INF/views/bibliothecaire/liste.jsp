<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblio - Liste des Livres</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css">
</head>
<style>
    /* Style pour les boutons d'action */
.btn-action {
  display: inline-block;
  padding: 8px 16px;
  background: #27ae60;
  color: #fff;
  border-radius: 5px;
  text-decoration: none;
  font-weight: 500;
  transition: background 0.2s;
}
.btn-action2 {
  display: inline-block;
  padding: 8px 16px;
  background: #ffb300;
  color: #fff;
  border-radius: 5px;
  text-decoration: none;
  font-weight: 500;
  transition: background 0.2s;
}
.btn-action:hover {
  background: #219150;
}
</style>
<body>
    <div class="dashboard">
        <div class="sidebar">
            <div class="sidebar-header">
                <h1> Biblio</h1>
            </div>
            <nav class="nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/bibliotheque/dashbord"> Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/livre/listes" class="active"> Livres</a></li>
                    <li><a href="${pageContext.request.contextPath}/abonnement/form"> Abonnements</a></li>
                    <li><a href="${pageContext.request.contextPath}/rendu/prim"> Retour de livres</a></li>
                    <li><a href="${pageContext.request.contextPath}/reservation/reserver"> Reservations</a></li>
                    <li><a href="${pageContext.request.contextPath}/bibliotheque/adherants">Adherants</a></li>
                    <li><a href="${pageContext.request.contextPath}/adherant/ajout">Inscription</a></li>
                </ul>
            </nav>
        </div>

        <main class="main-content">
            <div class="page-header">
                <h1>Liste des livres</h1>

                <div class="search-filter">
                    <div class="search-box">
                        <input type="text" name="recherche" id="recherche" placeholder="Rechercher un livre...">
                    </div>
                    <div class="filter-box">
                        <select name="typeFilter" id="typeFilter">
                            <option value="">-- Filtrer par type --</option>
                            <c:forEach var="type" items="${typelivres}">
                                <option value="${type.idtypeLivre}">${type.libelle}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div><br>

            <div>
                <table id="livresTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Titre</th>
                            <th>Auteur</th>
                            <th>Annee de publication</th>
                            <th>Langue</th>
                            <th>Type</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </main>
    </div>
<script>
    const contextPath = '<%= request.getContextPath() %>';
    document.addEventListener('DOMContentLoaded', () => {
        const tableBody = document.querySelector('#livresTable tbody');
        const searchInput = document.getElementById('recherche');
        let livresData = [];

        function renderTable(data) {
            tableBody.innerHTML = '';
            for (let i = 0; i < data.length; i++) {
                const livre = data[i];
                const row = document.createElement('tr');

                const idCell = document.createElement('td');
                idCell.textContent = livre.idLivre;
                row.appendChild(idCell);

                const titreCell = document.createElement('td');
                const titreLink = document.createElement('a');
                titreLink.textContent = livre.titre;
                titreLink.href = contextPath + '/livre/infoLivre?idLivre=' + livre.idLivre;
                titreLink.className = 'titre-link';
                titreCell.appendChild(titreLink);
                row.appendChild(titreCell);

                const auteurCell = document.createElement('td');
                auteurCell.textContent = livre.auteur;
                row.appendChild(auteurCell);

                const anneeCell = document.createElement('td');
                anneeCell.textContent = livre.anneePublication[0];
                row.appendChild(anneeCell);

                const langueCell = document.createElement('td');
                langueCell.textContent = livre.langue;
                row.appendChild(langueCell);

                const typeLivreCell = document.createElement('td');
                typeLivreCell.textContent = livre.typeLivre.libelle;
                row.appendChild(typeLivreCell);

                // Bouton Pret
                const pretCell = document.createElement('td');
                const pretBtn = document.createElement('a');
                pretBtn.textContent = 'Preter';
                pretBtn.href = contextPath + '/pret/formulaire?idLivre=' + livre.idLivre;
                pretBtn.className = 'btn-action';
                pretBtn.style.marginRight = '8px';
                pretCell.appendChild(pretBtn);

                // Bouton Reserver
                const reserverBtn = document.createElement('a');
                reserverBtn.textContent = 'Reserver';
                reserverBtn.href = contextPath + '/reservation/form?idLivre=' + livre.idLivre;
                reserverBtn.className = 'btn-action2';
                pretCell.appendChild(reserverBtn);

                row.appendChild(pretCell);
                tableBody.appendChild(row);
            }
        }

        fetch(contextPath + '/api/livre/getLivres')
            .then(response => {
                if (!response.ok) {
                    throw new Error("Erreur lors du chargement des livres");
                }
                return response.json();
            })
            .then(data => {
                livresData = data;
                renderTable(livresData);
            })
            .catch(error => {
                console.error("Erreur :", error);
                tableBody.innerHTML = `<tr><td colspan="4">Impossible de charger les livres.</td></tr>`;
            });

        searchInput.addEventListener('input', function() {
            const searchValue = this.value.toLowerCase();
            const filtered = livresData.filter(livre => {
                return (
                    livre.idLivre.toString().includes(searchValue) ||
                    livre.titre.toLowerCase().includes(searchValue) ||
                    livre.auteur.toLowerCase().includes(searchValue) ||
                    (livre.anneePublication[0] && livre.anneePublication[0].toString().includes(searchValue)) ||
                    livre.langue.toLowerCase().includes(searchValue) ||
                    (livre.typeLivre && livre.typeLivre.libelle && livre.typeLivre.libelle.toLowerCase().includes(searchValue))
                );
            });
            renderTable(filtered);
        });
    });
</script>
</body>
</html>