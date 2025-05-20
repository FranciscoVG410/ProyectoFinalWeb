document.addEventListener('DOMContentLoaded', function() {
    // Inicializar el tab activo
    switchTab('posts');
    
    // Delegación de eventos para los tabs
    document.querySelector('.admin-tabs').addEventListener('click', function(e) {
        if (e.target.classList.contains('admin-tab')) {
            const tab = e.target.getAttribute('onclick').match(/'([^']+)'/)[1];
            switchTab(tab);
        }
    });
    
    // Cerrar el menú de perfil al hacer clic fuera
    document.addEventListener('click', function(e) {
        const profileMenu = document.querySelector('.profile-menu');
        const userProfile = document.querySelector('.user-profile');
        
        if (!userProfile.contains(e.target) && profileMenu.classList.contains('show')) {
            profileMenu.classList.remove('show');
        }
    });
});

function toggleFeatured(userId, feature) {
    const action = feature ? 'destacar' : 'quitar el destacado';
    const message = feature
        ? '¿Estás seguro de que quieres destacar a este usuario? Aparecerá como chef destacado en la plataforma.'
        : '¿Estás seguro de que quieres quitar el destacado a este usuario?';

    if (confirm(message)) {
        // Simular llamada AJAX
        simulateAjaxCall().then(() => {
            // Actualizar la interfaz
            const userCard = document.querySelector(`[onclick*="toggleFeatured(${userId}, ${feature})"]`).closest('.user-card');
            
            if (feature) {
                // Añadir destacado
                const avatarContainer = userCard.querySelector('.user-avatar-container');
                if (!avatarContainer.querySelector('.featured-badge')) {
                    const badge = document.createElement('span');
                    badge.className = 'featured-badge';
                    badge.textContent = 'Destacado';
                    avatarContainer.appendChild(badge);
                }
                
                userCard.querySelector('.user-status').className = 'user-status status-featured';
                userCard.querySelector('.user-status').textContent = 'Destacado';
                
                const btn = userCard.querySelector('.featured-btn');
                btn.innerHTML = '<i class="fas fa-star"></i> Quitar destacado';
                btn.setAttribute('onclick', `toggleFeatured(${userId}, false)`);
            } else {
                // Quitar destacado
                const badge = userCard.querySelector('.featured-badge');
                if (badge) badge.remove();
                
                userCard.querySelector('.user-status').className = 'user-status status-active';
                userCard.querySelector('.user-status').textContent = 'Activo';
                
                const btn = userCard.querySelector('.featured-btn');
                btn.innerHTML = '<i class="fas fa-star"></i> Destacar';
                btn.setAttribute('onclick', `toggleFeatured(${userId}, true)`);
            }
            
            showNotification(`Usuario ${action} correctamente`);
        }).catch(error => {
            console.error('Error:', error);
            showNotification('Ocurrió un error al procesar la solicitud', true);
        });
    }
}

function switchTab(tab) {
    // Ocultar todos los contenidos
    document.querySelectorAll('.admin-content').forEach(content => {
        content.classList.remove('active');
    });

    // Desactivar todas las pestañas
    document.querySelectorAll('.admin-tab').forEach(tabEl => {
        tabEl.classList.remove('active');
    });

    // Activar la pestaña y contenido seleccionado
    document.getElementById(tab + '-content').classList.add('active');
    document.querySelector(`.admin-tab[onclick*="switchTab('${tab}')"]`).classList.add('active');
}

function deletePost(postId) {
    if (confirm('¿Estás seguro de que quieres eliminar esta receta? Esta acción no se puede deshacer.')) {
        // Simular llamada AJAX
        simulateAjaxCall().then(() => {
            // Eliminar el post de la interfaz
            document.querySelector(`[onclick*="deletePost(${postId})"]`).closest('.post-card').remove();
            showNotification('Receta eliminada correctamente');
        }).catch(error => {
            console.error('Error:', error);
            showNotification('Ocurrió un error al eliminar la receta', true);
        });
    }
}

function banUser(userId, ban) {
    const action = ban ? 'banear' : 'quitar el ban';
    const message = ban
        ? '¿Estás seguro de que quieres banear a este usuario? No podrá publicar contenido.'
        : '¿Estás seguro de que quieres quitar el ban a este usuario? Podrá volver a publicar contenido.';

    if (confirm(message)) {
        // Simular llamada AJAX
        simulateAjaxCall().then(() => {
            // Actualizar la interfaz
            const userCard = document.querySelector(`[onclick*="banUser(${userId}, ${ban})"]`).closest('.user-card');
            
            if (ban) {
                // Banear usuario
                userCard.querySelector('.user-status').className = 'user-status status-banned';
                userCard.querySelector('.user-status').textContent = 'Baneado';
                
                const btn = userCard.querySelector('.ban-btn');
                btn.innerHTML = '<i class="fas fa-check-circle"></i> Quitar ban';
                btn.className = 'admin-btn unban-btn';
                btn.setAttribute('onclick', `banUser(${userId}, false)`);
            } else {
                // Quitar ban
                userCard.querySelector('.user-status').className = 'user-status status-active';
                userCard.querySelector('.user-status').textContent = 'Activo';
                
                const btn = userCard.querySelector('.unban-btn');
                btn.innerHTML = '<i class="fas fa-ban"></i> Banear';
                btn.className = 'admin-btn ban-btn';
                btn.setAttribute('onclick', `banUser(${userId}, true)`);
            }
            
            showNotification(`Usuario ${action} correctamente`);
        }).catch(error => {
            console.error('Error:', error);
            showNotification('Ocurrió un error al procesar la solicitud', true);
        });
    }
}

function toggleProfileMenu() {
    const menu = document.querySelector('.profile-menu');
    menu.classList.toggle('show');
}

// Función auxiliar para simular llamadas AJAX
function simulateAjaxCall() {
    return new Promise((resolve) => {
        setTimeout(resolve, 800);
    });
}

// Función para mostrar notificaciones
function showNotification(message, isError = false) {
    const notification = document.createElement('div');
    notification.className = `admin-notification ${isError ? 'error' : 'success'}`;
    notification.textContent = message;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.classList.add('show');
    }, 10);
    
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 3000);
}