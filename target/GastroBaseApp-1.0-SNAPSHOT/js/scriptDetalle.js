let likeCount = 0;

function toggleLike(btn) {
    likeCount++;
    document.getElementById("like-count").innerText = likeCount;
    btn.classList.toggle("liked");
}

function agregarComentario() {
    const textarea = document.getElementById("nuevo-comentario");
    const texto = textarea.value.trim();
    if (texto === "") return;

    const comentario = document.createElement("div");
    comentario.classList.add("comentario-item");
    comentario.innerHTML = `<strong>Usuario Anónimo</strong><br>${texto}`;
    document.getElementById("comentarios-lista").appendChild(comentario);

    textarea.value = "";
}
