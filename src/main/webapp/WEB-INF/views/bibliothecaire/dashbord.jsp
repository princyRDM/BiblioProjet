<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblio - Gestion de Bibliotheque</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bdashbord.css">
    
</head>
<body>
    <div class="dashboard">
        <!-- Sidebar fixe -->
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
                </ul>            
            </nav>
        </div>

        <!-- Main Content -->
        <main class="main-content">
            <div class="header">
                <h2>Tableau de Bord</h2>
                <p>Vue d'ensemble de votre bibliotheque</p>
            </div>
            
            <!-- Stats Cards -->
            <div class="stats-container">
                <div class="stat-card">
                    <label>Livres empruntes</label>
                    <span>${livreEmprunter}</span>
                </div>
                <div class="stat-card">
                    <label>Emprunts a domicile</label>
                    <span>${nbrLED}</span>
                </div>
                <div class="stat-card">
                    <label>Emprunts sur place</label>
                    <span>${nbrLES}</span>
                </div>
                <div class="stat-card">
                    <label>Livres rendus</label>
                    <span>${livreRendu}</span>
                </div>
            </div>

            <!-- Graphiques -->
            <div class="charts-container">
                <div class="chart-card">
                    <h3>Repartition des Emprunts</h3>
                    <canvas id="empruntsChart"></canvas>
                </div>
                <div class="chart-card">
                    <h3>evolution des Activites</h3>
                    <canvas id="activitesChart"></canvas>
                </div>
            </div>
        </main>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <script>
        // Animation au scroll et interactions
        document.addEventListener('DOMContentLoaded', function() {
            const statCards = document.querySelectorAll('.stat-card');
            
            // Recuperation des donnees depuis le serveur (simulees ici)
            const livreEmprunter = parseInt('${livreEmprunter}') || 142;
            const nbrLED = parseInt('${nbrLED}') || 89;
            const nbrLES = parseInt('${nbrLES}') || 53;
            const livreRendu = parseInt('${livreRendu}') || 1247;
            
            // Animation des chiffres
            statCards.forEach(card => {
                const span = card.querySelector('span');
                const finalValue = parseInt(span.textContent.replace(/,/g, ''));
                let currentValue = 0;
                const increment = finalValue / 50;
                
                const timer = setInterval(() => {
                    currentValue += increment;
                    if (currentValue >= finalValue) {
                        currentValue = finalValue;
                        clearInterval(timer);
                    }
                    span.textContent = Math.floor(currentValue).toLocaleString();
                }, 20);
            });

            // Graphique en camembert - Repartition des emprunts
            const ctx1 = document.getElementById('empruntsChart').getContext('2d');
            new Chart(ctx1, {
                type: 'doughnut',
                data: {
                    labels: ['Emprunts a domicile', 'Emprunts sur place'],
                    datasets: [{
                        data: [nbrLED, nbrLES],
                        backgroundColor: [
                            'rgba(239, 68, 68, 0.8)',
                            'rgba(16, 185, 129, 0.8)'
                        ],
                        borderColor: [
                            'rgba(239, 68, 68, 1)',
                            'rgba(16, 185, 129, 1)'
                        ],
                        borderWidth: 2,
                        hoverOffset: 10
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: {
                                padding: 20,
                                usePointStyle: true,
                                font: {
                                    size: 12,
                                    weight: '500'
                                }
                            }
                        }
                    },
                    animation: {
                        animateScale: true,
                        duration: 1000
                    }
                }
            });

            // Graphique en barres - evolution des activites
            const ctx2 = document.getElementById('activitesChart').getContext('2d');
            new Chart(ctx2, {
                type: 'bar',
                data: {
                    labels: ['Empruntes', 'Rendus', 'Total Actifs'],
                    datasets: [{
                        label: 'Nombre de livres',
                        data: [livreEmprunter, livreRendu, livreEmprunter + livreRendu],
                        backgroundColor: [
                            'rgba(79, 70, 229, 0.8)',
                            'rgba(59, 130, 246, 0.8)',
                            'rgba(124, 58, 237, 0.8)'
                        ],
                        borderColor: [
                            'rgba(79, 70, 229, 1)',
                            'rgba(59, 130, 246, 1)',
                            'rgba(124, 58, 237, 1)'
                        ],
                        borderWidth: 2,
                        borderRadius: 8,
                        borderSkipped: false
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                font: {
                                    size: 11
                                }
                            },
                            grid: {
                                color: 'rgba(0, 0, 0, 0.1)'
                            }
                        },
                        x: {
                            ticks: {
                                font: {
                                    size: 11,
                                    weight: '500'
                                }
                            },
                            grid: {
                                display: false
                            }
                        }
                    },
                    animation: {
                        duration: 1000,
                        easing: 'easeInOutQuart'
                    }
                }
            });
        });
    </script>
</body>
</html>