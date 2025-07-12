const typePretSelect = document.getElementById('typePret');
const datePretDomicileDiv = document.getElementById('datePretDomicile');
const datePretDomicileInput = document.getElementById('datePretDomicileInput');
const dateHeurePretSurPlaceDiv = document.getElementById('dateHeurePretSurPlace');

function formatDateToYYYYMMDD(date) {
    const d = new Date(date);
    const month = ('0' + (d.getMonth() + 1)).slice(-2);
    const day = ('0' + d.getDate()).slice(-2);
    return `${d.getFullYear()}-${month}-${day}`;
}

typePretSelect.addEventListener('change', () => {
    const selected = typePretSelect.value;

    if (selected === 'Domicile') {
    // Affiche date du jour en readonly
    datePretDomicileDiv.classList.remove('hidden');
    dateHeurePretSurPlaceDiv.classList.add('hidden');
    datePretDomicileInput.value = formatDateToYYYYMMDD(new Date());
    } else if (selected === 'SurPlace') {
    // Affiche date + heure modifiable
    dateHeurePretSurPlaceDiv.classList.remove('hidden');
    datePretDomicileDiv.classList.add('hidden');

    // Initialise date à aujourd'hui
    document.getElementById('datePretSurPlace').value = formatDateToYYYYMMDD(new Date());
    // Initialise heure à maintenant (HH:MM)
    const now = new Date();
    const hh = ('0' + now.getHours()).slice(-2);
    const mm = ('0' + now.getMinutes()).slice(-2);
    document.getElementById('heurePretSurPlace').value = `${hh}:${mm}`;
    } else {
    // Aucun champ affiché
    datePretDomicileDiv.classList.add('hidden');
    dateHeurePretSurPlaceDiv.classList.add('hidden');
    }
});

// Optionnel : empêcher soumission si infos manquantes
document.getElementById('formPret').addEventListener('submit', (e) => {
    const typePret = typePretSelect.value;
    if (!typePret) {
    alert('Veuillez choisir un type de prêt.');
    e.preventDefault();
    return;
    }
    if (typePret === 'SurPlace') {
    const datePret = document.getElementById('datePretSurPlace').value;
    const heurePret = document.getElementById('heurePretSurPlace').value;
    if (!datePret || !heurePret) {
        alert('Veuillez renseigner la date et l\'heure du prêt sur place.');
        e.preventDefault();
    }
    }
});