/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */


function openRecipeModal() {
    document.getElementById('recipeModal').style.display = 'flex';
}

function closeRecipeModal() {
    document.getElementById('recipeModal').style.display = 'none';
    document.getElementById('recipeForm').reset();
    document.getElementById('previewContainer').innerHTML = '';
    document.querySelector('.upload-content span').textContent = 'Haz clic o arrastra hasta 5 fotos';
}

function toggleProfileMenu() {
    document.querySelector('.profile-menu').classList.toggle('show');
}

window.addEventListener('click', function (e) {
    if (!e.target.closest('.user-profile')) {
        document.querySelector('.profile-menu').classList.remove('show');
    }
});


const photoUpload = document.getElementById('photoUpload');
const previewContainer = document.getElementById('previewContainer');
const fileUploadContainer = document.getElementById('fileUploadContainer');

// Dispara el input file al hacer click en el área
fileUploadContainer.addEventListener('click', (e) => {
    if (e.target.closest('.upload-content') || e.target === fileUploadContainer) {
        photoUpload.click();
    }
});

fileUploadContainer.addEventListener('dragover', (e) => {
    e.preventDefault();
    fileUploadContainer.classList.add('dragover');
});
fileUploadContainer.addEventListener('dragleave', () => {
    fileUploadContainer.classList.remove('dragover');
});
fileUploadContainer.addEventListener('drop', (e) => {
    e.preventDefault();
    fileUploadContainer.classList.remove('dragover');
    photoUpload.files = e.dataTransfer.files;
    photoUpload.dispatchEvent(new Event('change'));
});

photoUpload.addEventListener('change', function (evt) {
    const files = Array.from(evt.target.files);

    if (files.length > 5) {
        alert('Solo puedes subir un máximo de 5 fotos.');
        photoUpload.value = '';
        previewContainer.innerHTML = '';
        fileUploadContainer.querySelector('.upload-content span')
                .textContent = 'Haz clic o arrastra hasta 5 fotos';
        return;
    }

    previewContainer.innerHTML = '';
    const span = fileUploadContainer.querySelector('.upload-content span');
    span.textContent = files.length
            ? `${files.length} foto(s) seleccionada(s)`
            : 'Haz clic o arrastra hasta 5 fotos';

    files.forEach((file, index) => {
        const reader = new FileReader();

        reader.onload = function (loadEvent) {
            console.log('DATA URL:', loadEvent.target.result);

            const previewItem = document.createElement('div');
            previewItem.className = 'preview-item';

            const img = document.createElement('img');
            img.src = loadEvent.target.result;
            img.alt = 'Preview';
            previewItem.appendChild(img);

            const btn = document.createElement('button');
            btn.className = 'remove-btn';
            btn.innerHTML = '&times;';
            btn.onclick = () => removePreview(index);
            previewItem.appendChild(btn);

            previewContainer.appendChild(previewItem);
        };

        reader.onerror = function (err) {
            console.error('Error leyendo el archivo', err);
        };

        reader.readAsDataURL(file);
    });
});

function removePreview(idx) {
    const dt = new DataTransfer();
    const files = Array.from(photoUpload.files);
    files.splice(idx, 1);
    files.forEach(f => dt.items.add(f));
    photoUpload.files = dt.files;
    photoUpload.dispatchEvent(new Event('change'));
}

function openTab(tabName, event) {
    const tabContents = document.querySelectorAll('.tab-content');
    const tabButtons = document.querySelectorAll('.tab-button');

    tabContents.forEach(tab => tab.classList.remove('active'));
    tabButtons.forEach(btn => btn.classList.remove('active'));

    document.getElementById(tabName).classList.add('active');
    event.currentTarget.classList.add('active');
}
function openEditRecipeModal(id, nombre, tiempo, personas, complejidad, ingredientes, instrucciones) {
    document.getElementById("editRecipeModal").style.display = "flex";

    document.querySelector("#editRecipeForm input[name='idReceta']").value = id;
    document.querySelector("#editRecipeForm input[name='titulo']").value = nombre;
    document.querySelector("#editRecipeForm input[name='tiempo']").value = tiempo;
    document.querySelector("#editRecipeForm input[name='personas']").value = personas;
    document.querySelector("#editRecipeForm select[name='complejidad']").value = complejidad;
    document.querySelector("#editRecipeForm textarea[name='ingredientes']").value = ingredientes;
    document.querySelector("#editRecipeForm textarea[name='instrucciones']").value = instrucciones;
}

function closeEditRecipeModal() {
    document.getElementById("editRecipeModal").style.display = "none";
}

document.getElementById("searchInput").addEventListener("keyup", function () {
    const searchValue = this.value.toLowerCase();
    const recetas = document.querySelectorAll(".receta-item");

    recetas.forEach(function (receta) {
        const nombre = receta.querySelector(".receta-nombre").textContent.toLowerCase();
        receta.style.display = nombre.includes(searchValue) ? "block" : "none";
    });
});
