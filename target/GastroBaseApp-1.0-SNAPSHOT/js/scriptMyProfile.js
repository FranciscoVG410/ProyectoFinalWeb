/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

function openTab(tabName) {
    const tabContents = document.querySelectorAll('.tab-content');
    const tabButtons = document.querySelectorAll('.tab-button');

    tabContents.forEach(tab => tab.classList.remove('active'));
    tabButtons.forEach(btn => btn.classList.remove('active'));

    document.getElementById(tabName).classList.add('active');
    event.currentTarget.classList.add('active');
}
    // Añadir estas funciones si no existen
    function openRecipeModal() {
        document.getElementById('recipeModal').style.display = 'flex';
    }

    function closeRecipeModal() {
        document.getElementById('recipeModal').style.display = 'none';
    }

    // Cerrar modal al hacer click fuera
    window.onclick = function(event) {
        if (event.target == document.getElementById('recipeModal')) {
            closeRecipeModal();
        }
    }
