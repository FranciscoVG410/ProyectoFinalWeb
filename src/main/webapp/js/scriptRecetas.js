window.addEventListener("DOMContentLoaded", function () {
    const recipeModal = document.getElementById('recipeModal');
    const recipeForm = document.getElementById('recipeForm');
    const photoUpload = document.getElementById('photoUpload');
    const previewContainer = document.getElementById('previewContainer');
    const fileUploadContainer = document.getElementById('fileUploadContainer');

    window.openRecipeModal = function () {
        recipeModal.style.display = 'flex';
    };

    window.closeRecipeModal = function () {
        recipeModal.style.display = 'none';
        recipeForm.reset();
        previewContainer.innerHTML = '';
        document.querySelector('.upload-content span').textContent = 'Haz clic o arrastra hasta 5 fotos';
    };

    fileUploadContainer.addEventListener('click', () => {
        photoUpload.click();
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
            alert('Máximo 5 fotos');
            photoUpload.value = '';
            previewContainer.innerHTML = '';
            document.querySelector('.upload-content span').textContent = 'Haz clic o arrastra hasta 5 fotos';
            return;
        }

        previewContainer.innerHTML = '';
        const span = document.querySelector('.upload-content span');
        span.textContent = files.length
            ? `${files.length} foto(s) seleccionada(s)`
            : 'Haz clic o arrastra hasta 5 fotos';

        files.forEach((file, index) => {
            const reader = new FileReader();

            reader.onload = function (loadEvent) {
                const previewItem = document.createElement('div');
                previewItem.className = 'preview-item';

                const img = document.createElement('img');
                img.src = loadEvent.target.result;
                previewItem.appendChild(img);

                const btn = document.createElement('button');
                btn.innerHTML = '&times;';
                btn.onclick = () => removePreview(index);
                previewItem.appendChild(btn);

                previewContainer.appendChild(previewItem);
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

    recipeForm.onsubmit = function (e) {
        if (photoUpload.files.length === 0) {
            alert('Por favor agrega al menos una foto');
            e.preventDefault();
            return;
        }
        console.log(" Formulario listo para enviar al servlet");
    };
});
