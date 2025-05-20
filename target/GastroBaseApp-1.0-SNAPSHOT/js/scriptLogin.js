/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */


let currentSlide = 0;
const slides = document.querySelectorAll('.recipe-slide');
const indicatorsContainer = document.querySelector('.carousel-indicators');
slides.forEach((_, index) => {
    const indicator = document.createElement('span');
    indicator.classList.add('indicator');
    if (index === 0)
        indicator.classList.add('active');
    indicator.addEventListener('click', () => goToSlide(index));
    indicatorsContainer.appendChild(indicator);
});

function updateCarousel() {
    slides.forEach((slide, index) => {
        slide.classList.toggle('active', index === currentSlide);
    });

    document.querySelectorAll('.indicator').forEach((indicator, i) => {
        indicator.classList.toggle('active', i === currentSlide);
    });
}

function nextSlide() {
    currentSlide = (currentSlide + 1) % slides.length;
    updateCarousel();
}

function prevSlide() {
    currentSlide = (currentSlide - 1 + slides.length) % slides.length;
    updateCarousel();
}

function goToSlide(index) {
    currentSlide = index;
    updateCarousel();
}

document.querySelector('.carousel-next').addEventListener('click', nextSlide);
document.querySelector('.carousel-prev').addEventListener('click', prevSlide);

let slideInterval = setInterval(nextSlide, 5000);

const carousel = document.querySelector('.recipe-carousel');
carousel.addEventListener('mouseenter', () => clearInterval(slideInterval));
carousel.addEventListener('mouseleave', () => {
    slideInterval = setInterval(nextSlide, 5000);
});

function toggleForms() {
    document.querySelector('.carousel-container').classList.toggle('move-right');
    document.querySelector('.forms-container').classList.toggle('move-left');
    document.querySelectorAll('.form-box').forEach(form => {
        form.classList.toggle('active');
    });
}

document.querySelectorAll('.switch-form').forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        toggleForms();
    });
});

document.querySelectorAll('input').forEach(input => {
    input.addEventListener('focus', function () {
        this.parentNode.querySelector('.input-focus-border').style.width = '100%';
    });

    input.addEventListener('blur', function () {
        if (!this.value) {
            this.parentNode.querySelector('.input-focus-border').style.width = '0';
        }
    });
});

function setMaxDate() {
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('dob').setAttribute('max', today);
}

function validateDate(input) {
    const selectedDate = new Date(input.value);
    const today = new Date();
    today.setHours(0, 0, 0, 0); // Resetear hora a medianoche

    if (selectedDate > today) {
        input.setCustomValidity('No puedes seleccionar una fecha futura');
    } else {
        input.setCustomValidity('');
    }
}

window.addEventListener('load', () => {
    setMaxDate();
    document.getElementById('dob').addEventListener('change', function () {
        validateDate(this);
    });
});// Función para cargar países con banderas
async function loadCountries() {
    try {
        const response = await fetch('https://restcountries.com/v3.1/all?fields=name,cca2,flags');
        const countries = await response.json();
        const select = document.getElementById('country');
        const flagsContainer = document.getElementById('country-flags');
        
        countries.sort((a, b) => a.name.common.localeCompare(b.name.common));
        
        countries.forEach(country => {
            // Opción para el select oculto
            const option = document.createElement('option');
            option.value = country.name.common;
            option.textContent = country.name.common;
            select.appendChild(option);

            // Elemento de bandera personalizado
            const flagElement = document.createElement('div');
            flagElement.className = 'country-option';
            flagElement.innerHTML = `
                <img src="${country.flags.png}" 
                     alt="${country.name.common} Flag" 
                     class="country-flag">
                <span>${country.name.common}</span>
            `;
            
            flagElement.addEventListener('click', () => {
                select.value = country.name.common;
                document.querySelector('.selected-country span').textContent = country.name.common;
                flagsContainer.style.display = 'none';
                document.querySelector('.country-select label').classList.add('has-value');
            });
            
            flagsContainer.appendChild(flagElement);
        });

        // Manejar clic fuera del selector
        document.addEventListener('click', (e) => {
            if (!e.target.closest('.custom-country-select')) {
                flagsContainer.style.display = 'none';
            }
        });
    } catch (error) {
        console.error('Error loading countries:', error);
    }
}

// Función para mostrar/ocultar banderas
function toggleFlags() {
    const flagsContainer = document.getElementById('country-flags');
    flagsContainer.style.display = flagsContainer.style.display === 'block' ? 'none' : 'block';
}

// Vista previa de imagen en círculo
document.getElementById('profile-photo').addEventListener('change', function(e) {
    const preview = document.getElementById('preview');
    const file = e.target.files[0];
    
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.style.display = 'block';
            preview.parentElement.classList.add('has-image');
        }
        reader.readAsDataURL(file);
    }
});

// Inicialización
window.addEventListener('DOMContentLoaded', () => {
    loadCountries();
});
    document.querySelector('.avatar-container').addEventListener('click', function(e) {
        if (!e.target.matches('input[type="file"]')) {
            document.getElementById('profile-photo').click();
        }
    });
    

document.getElementById('profile-photo').addEventListener('change', function(e) {
    const preview = document.getElementById('preview');
    const container = document.querySelector('.avatar-container');
    const file = e.target.files[0];
    
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
            container.classList.add('has-image');
            
            // Ajuste final de posición
            setTimeout(() => {
                preview.style.transform = 'translate(-50%, -50%)';
            }, 10);
        }
        reader.readAsDataURL(file);
    } else {
        container.classList.remove('has-image');
        preview.style.display = 'none';
    }
});

// Manejo de mensajes de error
document.querySelectorAll('.error-message').forEach(error => {
    setTimeout(() => {
        error.classList.add('animate__fadeOutUp');
        setTimeout(() => error.remove(), 500);
    }, 5000);
});