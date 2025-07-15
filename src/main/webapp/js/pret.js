const typePretSelect = document.getElementById('typePret');
const datePretInput = document.getElementById('datePret'); // ID unique pour la date
const heurePretSurPlaceDiv = document.getElementById('heurePretSurPlaceDiv'); // nouveau div pour l'heure
const heurePretInput = document.getElementById('heurePret');

function formatDateToYYYYMMDD(date) {
    const d = new Date(date);
    const month = ('0' + (d.getMonth() + 1)).slice(-2);
    const day = ('0' + d.getDate()).slice(-2);
    return `${d.getFullYear()}-${month}-${day}`;
}

document.addEventListener('DOMContentLoaded', () => {
    // Affiche la date du jour au chargement
    datePretInput.value = formatDateToYYYYMMDD(new Date());
    heurePretSurPlaceDiv.classList.add('hidden');
});

typePretSelect.addEventListener('change', () => {
    const selected = typePretSelect.value;

    if (selected === 'SurPlace') {
        heurePretSurPlaceDiv.classList.remove('hidden');

        // Initialise heure a maintenant (HH:MM)
        const now = new Date();
        const hh = ('0' + now.getHours()).slice(-2);
        const mm = ('0' + now.getMinutes()).slice(-2);
        heurePretInput.value = `${hh}:${mm}`;
    } else {
        heurePretSurPlaceDiv.classList.add('hidden');
        heurePretInput.value = ''; // vide si pas besoin
    }

    // Toujours mettre la date a aujourd’hui
    datePretInput.value = formatDateToYYYYMMDD(new Date());
});

// Validation
document.getElementById('formPret').addEventListener('submit', (e) => {
    const typePret = typePretSelect.value;
    const datePret = datePretInput.value;

    if (!typePret || !datePret) {
        alert('Veuillez remplir tous les champs requis.');
        e.preventDefault();
        return;
    }

    if (typePret === 'SurPlace') {
        const heurePret = heurePretInput.value;
        if (!heurePret) {
            alert("Veuillez renseigner l'heure pour le pret sur place.");
            e.preventDefault();
        }
    }
});
