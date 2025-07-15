<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblio - Liste des Livres</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css">
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
        .bt{
            width: 100px;
            height: 50px;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <!-- Sidebar -->
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
                </ul>            
            </nav>
        </div>

        <!-- Main Content -->
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
            </div>

            <table class="books-table">
                <thead>
                    <tr>
                        <th>Titre</th>
                        <th>Auteur</th>
                        <th>Type</th>
                        <th>Annee</th>
                        <th>Langue</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                    <tbody id="booksTableBody">
                        <c:forEach var="livre" items="${livres}">
                            <tr data-type-id="${livre.typeLivre.idtypeLivre}">
                                <td>${livre.titre}</td>
                                <td>${livre.auteur}</td>
                                <td>${livre.typeLivre.libelle}</td>
                                <td>${livre.anneePublication}</td>
                                <td>${livre.langue}</td>
                                <td>
                                    <div class="action-links">
                                        <a href="${pageContext.request.contextPath}/pret/formulaire?idLivre=${livre.idLivre}"><button class="bt" style="background: rgb(18, 162, 18); ">Preter</button></a>
                                        <a href="${pageContext.request.contextPath}/reservation/form?idLivre=${livre.idLivre}"><button class="bt" style="background: rgb(218, 255, 6); ">Reserver</button></a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
            </table>
        </main>
    </div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const searchInput = document.getElementById('recherche');
        const typeFilter = document.getElementById('typeFilter');
        const tableBody = document.getElementById('booksTableBody');

        // Fonction utilitaire pour supprimer les accents et convertir en minuscules
        function normalizeText(text) {
            return text
                .normalize("NFD") // decompose les accents
                .replace(/[\u0300-\u036f]/g, "") // supprime les accents
                .toLowerCase(); // rend insensible a la casse
        }

        function filterBooks() {
            const searchTerm = normalizeText(searchInput.value);
            const selectedType = typeFilter.value;
            const rows = tableBody.getElementsByTagName('tr');

            Array.from(rows).forEach(row => {
                const cells = row.getElementsByTagName('td');
                const typeId = row.getAttribute('data-type-id');

                if (cells.length > 0) {
                    // Concatene tout le texte visible de la ligne
                    const rowText = Array.from(cells).map(cell => cell.textContent).join(' ');
                    const normalizedRowText = normalizeText(rowText);

                    const matchesSearch = normalizedRowText.includes(searchTerm);
                    const matchesType = selectedType === '' || typeId === selectedType;

                    if (matchesSearch && matchesType) {
                        row.style.display = '';
                        row.style.animation = 'fadeInUp 0.3s ease forwards';
                    } else {
                        row.style.display = 'none';
                    }
                }
            });

            const visibleRows = Array.from(rows).filter(row => row.style.display !== 'none');
            if (visibleRows.length === 0) {
                showEmptyState();
            } else {
                hideEmptyState();
            }
        }

        function showEmptyState() {
            const existing = document.querySelector('.empty-state');
            if (!existing) {
                const emptyState = document.createElement('div');
                emptyState.className = 'empty-state';
                emptyState.innerHTML = 'Aucun livre trouve pour cette recherche';
                tableBody.parentNode.parentNode.appendChild(emptyState);
            }
        }

        function hideEmptyState() {
            const existing = document.querySelector('.empty-state');
            if (existing) {
                existing.remove();
            }
        }

        // evenements
        searchInput.addEventListener('input', filterBooks);
        typeFilter.addEventListener('change', filterBooks);

        // Animation au chargement
        const rows = tableBody.getElementsByTagName('tr');
        Array.from(rows).forEach((row, index) => {
            row.style.animationDelay = `${index * 0.1}s`;
        });
    });
</script>
</body>
</html>