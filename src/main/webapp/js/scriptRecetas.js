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



