document.addEventListener('DOMContentLoaded', function() {
    const dropdownTrigger = document.getElementById('dropdownTrigger');
    const dropdownMenu = document.getElementById('dropdownMenu');

    dropdownTrigger.addEventListener('click', function() {
        dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
    });

    // Close the dropdown if the user clicks outside of it
    window.addEventListener('click', function(event) {
        if (!event.target.matches('.dropdown-image')) {
            if (dropdownMenu.style.display === 'block') {
                dropdownMenu.style.display = 'none';
            }
        }
    });
});





const occupiedWeeks = new Set(); // Use a Set for better performance
const weekInput = document.getElementById('week-input');
const claimButton = document.getElementById('claim-btn');
const deleteButton = document.getElementById('delete-btn');

weekInput.addEventListener('change', function() {
    const selectedWeek = weekInput.value;
    if (occupiedWeeks.has(selectedWeek)) {
        weekInput.classList.add('occupied');
        deleteButton.disabled = false; // Enable delete button
    } else {
        weekInput.classList.remove('occupied');
        deleteButton.disabled = true; // Disable delete button
    }
});

claimButton.addEventListener('click', function() {
    const selectedWeek = weekInput.value;
    if (selectedWeek && !occupiedWeeks.has(selectedWeek)) {
        occupiedWeeks.add(selectedWeek);
        weekInput.classList.add('occupied');
        deleteButton.disabled = false; // Enable delete button
        alert(`Week ${selectedWeek} claimed!`);
    } else {
        alert(`Week ${selectedWeek} is already occupied or not selected.`);
    }
});

deleteButton.addEventListener('click', function() {
    const selectedWeek = weekInput.value;
    if (occupiedWeeks.has(selectedWeek)) {
        occupiedWeeks.delete(selectedWeek);
        weekInput.classList.remove('occupied');
        deleteButton.disabled = true; // Disable delete button
        alert(`Week ${selectedWeek} deleted!`);
    } else {
        alert(`Week ${selectedWeek} is not occupied.`);
    }
});