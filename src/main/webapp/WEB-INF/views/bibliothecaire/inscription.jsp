<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h1 align="center">Inscription Adherants</h1>
            </div>
            <div class="formulaire">
                <form action="${pagecontext.request.contextPath}/adherant/ajout2" method="post">
                    <div>
                        <label for="">Nom</label>
                        <input type="text" name="nom" required>
                    </div>
                    <div>
                        <label for="">Prenom</label>
                        <input type="text" name="prenom" required>
                    </div>
                    <div>
                        <label for="">Contact</label>
                        <input type="text" name="contact" required>
                    </div>
                    <div>
                        <label for="">Email</label>
                        <input type="email" name="email" required>
                    </div>
                    <div>
                        <label for="">Password</label>
                        <input type="password" name="password" required>
                    </div>
                    <div>
                        <label for="">Type adherant</label>
                        <select name="idtypeAdherant" required>
                            <option value="">-- Selectionner le type d'adhérent --</option>
                            <c:forEach var="type" items="${types}">
                                <option value="${type.idTypeAdherant}">${type.libelle}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <br>
                    <button type="submit" onclick="return confirm('Êtes-vous sûr de vouloir inscrire cet adhérent ?');">Inscrire</button>
                </form>
            </div>
        </main>
    </div>
</body>
</html>