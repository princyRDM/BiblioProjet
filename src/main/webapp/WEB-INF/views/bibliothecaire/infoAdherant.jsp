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
             <div style="margin-bottom:2rem;">
                <h2 id="adherantName"></h2>
                <div id="adherantType" style="margin-bottom:0.7rem;"></div>
                <div><b>Nombre de livres empruntes :</b> <span id="nbLivres">0</span></div>
            </div>
            <div style="margin-bottom:2rem;">
                <h3>Penalites</h3>
                <table class="pret-table">
                    <thead>
                        <tr><th>Date debut</th><th>Date fin</th></tr>
                    </thead>
                    <tbody id="penaliterTable"></tbody>
                </table>
            </div>
            <div>
                <h3>Abonnements</h3>
                <table class="pret-table">
                    <thead>
                        <tr><th>Date debut</th><th>Date fin</th></tr>
                    </thead>
                    <tbody id="abonnementTable"></tbody>
                </table>
            </div>
        </main>
    </div>
<script>
function getParam(name) {
    const url = new URL(window.location.href);
    return url.searchParams.get(name);
}
const idAdherant = getParam('idAdherant');
const contextPath = '${pageContext.request.contextPath}';
document.addEventListener('DOMContentLoaded', () => {
    // Affichage nom/prenom et type
    fetch(contextPath + '/api/adherant/byId?idAdherant=' + idAdherant)
        .then(r => r.json())
        .then(adherant => {
            document.getElementById('adherantName').textContent = adherant.nom + ' ' + adherant.prenom;
            const typeDiv = document.getElementById('adherantType');
            typeDiv.textContent = adherant.typeAdherant && adherant.typeAdherant ? 'Status adherant : ' + adherant.typeAdherant.libelle : '';
        });
    // Nombre de livres empruntes
    fetch(contextPath + '/api/pret/byAdherant?idAdherant=' + idAdherant)
        .then(r => r.json())
        .then(prets => {
            document.getElementById('nbLivres').textContent = prets.length;
        });
    // Tableau penalites
    fetch(contextPath + '/api/penaliter/byAdherant?idAdherant=' + idAdherant)
        .then(r => r.json())
        .then(data => {
            const tbody = document.getElementById('penaliterTable');
            while (tbody.firstChild) tbody.removeChild(tbody.firstChild);
            if (!data || data.length === 0) {
                const row = document.createElement('tr');
                const cell = document.createElement('td');
                cell.colSpan = 2;
                cell.textContent = 'Aucune penalite.';
                row.appendChild(cell);
                tbody.appendChild(row);
                return;
            }
            data.forEach(pen => {
                const row = document.createElement('tr');
                const d1 = document.createElement('td');
                d1.textContent = pen.dateDebut || '-';
                row.appendChild(d1);
                const d2 = document.createElement('td');
                d2.textContent = pen.dateFin || '-';
                row.appendChild(d2);
                tbody.appendChild(row);
            });
        });
    // Tableau abonnements
    fetch(contextPath + '/api/abonnement/byAdherant?idAdherant=' + idAdherant)
        .then(r => r.json())
        .then(data => {
            const tbody = document.getElementById('abonnementTable');
            while (tbody.firstChild) tbody.removeChild(tbody.firstChild);
            if (!data || data.length === 0) {
                const row = document.createElement('tr');
                const cell = document.createElement('td');
                cell.colSpan = 2;
                cell.textContent = 'Aucun abonnement.';
                row.appendChild(cell);
                tbody.appendChild(row);
                return;
            }
            data.forEach(ab => {
                const row = document.createElement('tr');
                const d1 = document.createElement('td');
                d1.textContent = ab.dateDebut || '-';
                row.appendChild(d1);
                const d2 = document.createElement('td');
                d2.textContent = ab.dateFin || '-';
                row.appendChild(d2);
                tbody.appendChild(row);
            });
        });
});
</script>
</body>
</html>