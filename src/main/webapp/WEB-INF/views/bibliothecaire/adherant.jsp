<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css">
</head>
<body>
    <div class="dashboard">
        <div class="sidebar">
            <div class="sidebar-header">
                <h1> Biblio</h1>
            </div>
            <nav class="nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/bibliotheque/dashbord" class="active"> Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/livre/listes"> Livres</a></li>
                    <li><a href="${pageContext.request.contextPath}/abonnement/form"> Abonnements</a></li>
                    <li><a href="${pageContext.request.contextPath}/rendu/prim"> Retour de livres</a></li>
                    <li><a href="${pageContext.request.contextPath}/reservation/reserver"> Reservations</a></li>
                    <li><a href="${pageContext.request.contextPath}/bibliotheque/adherants">Adherants</a></li>
                    <li><a href="${pageContext.request.contextPath}/adherant/ajout">Inscription</a></li>
                </ul>            
            </nav>
        </div>

        <main class="main-content">
            <div>
                <h1>Liste des Adherants</h1>
            </div>
            <div style="margin-bottom:1.5rem;">
                <input type="text" id="searchInput" placeholder="Rechercher..." style="width: 320px; padding: 0.5rem; border-radius: 6px; border: 1px solid #ccc; font-size: 1rem;">
            </div>
            <div class="form-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Prenom</th>
                            <th>Email</th>
                            <th>Telephone</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </main>
    </div>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const tableBody = document.querySelector('tbody');
        const searchInput = document.getElementById('searchInput');
        const contextPath = '<%= request.getContextPath() %>';
        let adherantsData = [];

        function removeAccents(str) {
            return str.normalize('NFD').replace(/\p{Diacritic}/gu, '').toLowerCase();
        }

        function renderTable(data) {
            tableBody.innerHTML = '';
            data.forEach(adherant => {
                const row = document.createElement('tr');
                // ID sans lien
                const idCell = document.createElement('td');
                idCell.textContent = adherant.idAdherant;
                row.appendChild(idCell);
                // Nom avec lien
                const nomCell = document.createElement('td');
                const link = document.createElement('a');
                link.href = contextPath + '/bibliotheque/infoadherant?idAdherant=' + encodeURIComponent(adherant.idAdherant);
                link.textContent = adherant.nom;
                nomCell.appendChild(link);
                row.appendChild(nomCell);
                // Prénom
                const prenomCell = document.createElement('td');
                prenomCell.textContent = adherant.prenom || '';
                row.appendChild(prenomCell);
                // Email
                const emailCell = document.createElement('td');
                emailCell.textContent = adherant.email || '';
                row.appendChild(emailCell);
                // Téléphone
                const telCell = document.createElement('td');
                telCell.textContent = adherant.contact || '';
                row.appendChild(telCell);
                tableBody.appendChild(row);
            });
        }

        fetch(contextPath + '/api/adherant/getAdherants')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erreur de chargement des adhérants');
                }
                return response.json();
            })
            .then(data => {
                adherantsData = data;
                renderTable(adherantsData);
            })
            .catch(error => {
                tableBody.innerHTML = '<tr><td colspan="5">Erreur lors du chargement des données.</td></tr>';
            });

        searchInput.addEventListener('input', function() {
            const search = removeAccents(this.value.trim());
            if (!search) {
                renderTable(adherantsData);
                return;
            }
            const filtered = adherantsData.filter(adherant => {
                return [
                    adherant.idAdherant + '',
                    adherant.nom || '',
                    adherant.prenom || '',
                    adherant.email || '',
                    adherant.contact || ''
                ].some(field => removeAccents(field + '').includes(search));
            });
            renderTable(filtered);
        });
    });
</script>


</body>
</html>