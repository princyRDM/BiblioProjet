document.addEventListener("DOMContentLoaded", function () {
    const input = document.getElementById("recherche");
    const tableRows = document.querySelectorAll("tbody tr");

    input.addEventListener("input", function () {
        const query = input.value.toLowerCase();

        tableRows.forEach(row => {
            const cells = row.querySelectorAll("td");
            let visible = false;

            cells.forEach(cell => {
                if (cell.textContent.toLowerCase().includes(query)) {
                    visible = true;
                }
            });

            row.style.display = visible ? "" : "none";
        });
    });
});