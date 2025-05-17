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
});