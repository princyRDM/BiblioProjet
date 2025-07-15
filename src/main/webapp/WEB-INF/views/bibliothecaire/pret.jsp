<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <title>Formulaire de pret</title>
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
    </style>
    <style>
    .hidden { display: none; }
    </style>
</head>
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
                </ul>            
            </nav>
        </div>

        <main class="main-content">
        <h1>Pret</h1>

            <form id="formPret" action="${pageContext.request.contextPath}/pret/ajout" method="post">
                <div>
                    <label for="">Prete a </label>
                    <select name="idAdherant" required>
                        <option value="">-- Choisissez l'Adherant --</option>
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
                            <option value="${exemplaire.idExemplaire}" data-status="${exemplaire.status}">
                                ${exemplaire.numExemplaire} (${exemplaire.status})
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label for="typePret">Type de pret :</label>
                    <select id="typePret" name="typePret" required>
                        <option value="">-- Type de pret --</option>
                        <option value="Domicile">Domicile</option>
                        <option value="SurPlace">Sur place</option>
                    </select>
                </div>
                
                <div>
                    <label>Date du pret :</label>
                    <input type="date" id="datePret" name="datePret" required />
                </div>

                <div id="heurePretSurPlaceDiv" class="hidden">
                    <label>Heure du pret :</label>
                    <input type="time" id="heurePret" name="heurePret" min="08:00" max="17:30" />
                </div>


                <button type="submit">Valider le pret</button>
            </form>
        </div>
    </main>
    
    <script src="${pageContext.request.contextPath}/js/pret.js"></script>

</body>
</html>
