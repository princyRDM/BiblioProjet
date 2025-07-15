<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Système de Bibliothèque</title>
    <style>
        :root {
            --primary-color: #4a6fa5;
            --secondary-color: #166088;
            --accent-color: #4fc3a1;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --error-color: #e63946;
            --font-main: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--font-main);
            background-color: #f5f5f5;
            background-image: linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9)), 
                              url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: var(--dark-color);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 1rem;
        }

        .container {
            width: 100%;
            max-width: 450px;
        }

        .login-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            transition: transform 0.3s ease;
        }

        .login-card:hover {
            transform: translateY(-5px);
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .login-header h1 {
            color: var(--secondary-color);
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .login-header::after {
            content: "";
            display: block;
            width: 60px;
            height: 4px;
            background: var(--accent-color);
            margin: 0.5rem auto;
            border-radius: 2px;
        }

        .login-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        label {
            font-weight: 600;
            color: var(--secondary-color);
            font-size: 0.95rem;
        }

        input, select {
            padding: 0.8rem 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: all 0.3s;
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.2);
        }

        input::placeholder {
            color: #aaa;
        }

        button {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 0.5rem;
        }

        button:hover, button:focus {
            background-color: var(--secondary-color);
        }

        .visually-hidden {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
        }

        @media (max-width: 480px) {
            .login-card {
                padding: 1.5rem;
            }
        }

        /* Accessibilité supplémentaire */
        a:focus, button:focus, input:focus, select:focus {
            outline: 3px solid var(--accent-color);
            outline-offset: 2px;
        }

        /* Animation pour les utilisateurs de clavier */
        @keyframes focus-shadow {
            0% { box-shadow: 0 0 0 0 rgba(74, 111, 165, 0.4); }
            100% { box-shadow: 0 0 0 5px rgba(74, 111, 165, 0); }
        }

        input:focus-visible, select:focus-visible, button:focus-visible {
            animation: focus-shadow 0.5s ease-out;
        }
    </style>
</head>
<body>
    <div class="container">
        <main class="login-card">
            <div class="login-header">
                <div class="login-icon" aria-hidden="true"></div>
                <h1>Connexion</h1>
                <p>Accedez a votre espace bibliotheque</p>
            </div>
            
            <form action="${pageContext.request.contextPath}/login/authentification" method="post">
                <div class="form-group">
                    <label for="email">Adresse email</label>
                    <input type="email" name="email" id="email" value="hasina@gmail.com" placeholder="user@example.com" required aria-describedby="email-help">
                    <small id="email-help" class="visually-hidden">Veuillez entrer votre adresse email institutionnelle</small>
                </div>
                
                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <input type="password" name="password" id="password" value="hasina" placeholder="Mot de passe" required>
                </div>
                
                <div class="form-group">
                    <label for="role">Type d'utilisateur</label>
                    <select name="role" id="role" required>
                        <option value="user">Adherent</option>
                        <option value="admin">Bibliothécaire</option>
                    </select>
                </div>
                
                <button type="submit">Se connecter</button>
            </form>
        </main>
    </div>
</body>
</html>