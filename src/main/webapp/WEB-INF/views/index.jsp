<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="login" align="center">
            <h1>Login</h1>
            <form action="${pageContext.request.contextPath}/login/authentification" method="post">
                <div>
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" value="hasina@gmail.com" placeholder="user@example.com" required>
                </div>
                <div>
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" value="hasina" placeholder="Password" required>
                </div>
                <div>
                    <label for="">Utilisateur</label>
                    <select name="role" id="">
                        <option value="user">Adherant</option>
                        <option value="admin">Bibliothecaire</option>
                    </select>
                </div>
                <button type="submit">Se connecter</button>
            </form>
        </div>
    </div>
</body>
</html>