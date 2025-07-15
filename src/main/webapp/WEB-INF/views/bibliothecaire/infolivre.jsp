<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exemplaires du livre</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css">
</head>
<body>
<div class="dashboard">
    <div class="sidebar">
        <div class="sidebar-header">
            <h1>Info Livre</h1>
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
        <div id="exemplaireStats" align="center"></div>
        <div class="table">
            <table id="exemplairesTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Numero</th>
                        <th>Etat</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </main>
</div>
<script>
    function getParam(name) {
        const url = new URL(window.location.href);
        return url.searchParams.get(name);
    }

    const idLivre = getParam('idLivre');
    const contextPath = '<%= request.getContextPath() %>';

    const tableBody = document.querySelector('#exemplairesTable tbody');
    const statsDiv = document.getElementById('exemplaireStats');

    let total = 0, libres = 0, occupes = 0;

    function renderTable(data) {
        // Vider le tableau
        while (tableBody.firstChild) {
            tableBody.removeChild(tableBody.firstChild);
        }

        if (data.length === 0) {
            const row = document.createElement('tr');
            const cell = document.createElement('td');
            cell.setAttribute('colspan', '4');
            cell.textContent = 'Aucun exemplaire trouvé pour ce livre.';
            row.appendChild(cell);
            tableBody.appendChild(row);
            return;
        }

        for (let i = 0; i < data.length; i++) {
            const ex = data[i];
            const row = document.createElement('tr');

            const idCell = document.createElement('td');
            idCell.textContent = ex.idExemplaire;
            row.appendChild(idCell);

            const numCell = document.createElement('td');
            numCell.textContent = ex.numExemplaire;
            row.appendChild(numCell);

            const etatCell = document.createElement('td');
            etatCell.textContent = ex.etat;
            row.appendChild(etatCell);

            const statusCell = document.createElement('td');
            statusCell.textContent = ex.status;
            row.appendChild(statusCell);

            tableBody.appendChild(row);
        }
    }

    function updateStats() {
        if (!statsDiv) return;

        // Vider le contenu précédent
        while (statsDiv.firstChild) {
            statsDiv.removeChild(statsDiv.firstChild);
        }

        const totalLabel = document.createElement('b');
        totalLabel.textContent = 'Total :';
        statsDiv.appendChild(totalLabel);
        statsDiv.appendChild(document.createTextNode(' ' + total + ' | '));

        const libresLabel = document.createElement('b');
        libresLabel.textContent = 'Libres :';
        statsDiv.appendChild(libresLabel);
        statsDiv.appendChild(document.createTextNode(' ' + libres + ' | '));

        const occupesLabel = document.createElement('b');
        occupesLabel.textContent = 'Occupes :';
        statsDiv.appendChild(occupesLabel);
        statsDiv.appendChild(document.createTextNode(' ' + occupes));
    }

    document.addEventListener('DOMContentLoaded', () => {
        if (!idLivre) {
            const row = document.createElement('tr');
            const cell = document.createElement('td');
            cell.setAttribute('colspan', '4');
            cell.textContent = 'ID du livre manquant.';
            row.appendChild(cell);
            tableBody.appendChild(row);
            return;
        }

        // Charger tous les exemplaires
        fetch(contextPath + '/api/exemplaire/getExemplaires')
            .then(res => res.json())
            .then(data => {
                const exemplaires = data.filter(ex => ex.livre && ex.livre.idLivre == idLivre);
                renderTable(exemplaires);
            })
            .catch(error => {
                const row = document.createElement('tr');
                const cell = document.createElement('td');
                cell.setAttribute('colspan', '4');
                cell.textContent = 'Erreur lors du chargement des exemplaires.';
                row.appendChild(cell);
                tableBody.appendChild(row);
                console.error(error);
            });

        // Statistiques
        fetch(contextPath + '/api/exemplaire/countByLivre?idLivre=' + idLivre)
            .then(res => res.json())
            .then(data => { total = data; updateStats(); });

        fetch(contextPath + '/api/exemplaire/countLibreByLivre?idLivre=' + idLivre)
            .then(res => res.json())
            .then(data => { libres = data; updateStats(); });

        fetch(contextPath + '/api/exemplaire/countOccupeByLivre?idLivre=' + idLivre)
            .then(res => res.json())
            .then(data => { occupes = data; updateStats(); });
    });
</script>

</body>
</html>