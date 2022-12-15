let count = 1;
document.getElementById("radio__one").checked = true;

setInterval(function() {
    nextImage();
}, 50)

function nextImage() {
    count++;
    if (count > 4) {
        count = 1;
    }
    document.getElementById("radio" + count).checked = true;

}

const Errors = {
    NAME: "Nome possui caracteres inválidos ou está vazio",
    SURNAME: "Sobrenome possui caracteres inválidos ou está vazio",
    EMAIL: "Email em formato inválido ou está vazio",
};

function showError(selector, condition, message = "") {
    const error = document.querySelector(selector);

    error.innerHTML = condition ? message : "";
}

export function validateSignup() {
    const form = document.querySelector("#formCadastro");
    const nome = form.querySelector("[name=nome]").value.trim();
    const sobrenome = form.querySelector("[name=sobrenome]").value.trim();
    const email = form.querySelector("[name=email]").value.trim();

    const padraoNome = /[^a-zà-ú]/gi;
    const padraoEmail = /[^a-z0-9.]+@[a-z0-9]+\.[a-z]/gi;

    const invalidName = nome.match(padraoNome);
    const invalidSobrenome = sobrenome.match(padraoNome);
    const invalidEmail = email.match(padraoEmail);

    showError("#erro", invalidName || !nome, Errors.NAME);
    showError("#erro2", invalidSobrenome || !sobrenome, Errors.SURNAME);
    showError("#erro3", invalidEmail || !email, Errors.EMAIL);
}