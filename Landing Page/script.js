const menu = document.querySelector('.menu');
const navMenu = document.querySelector('.nav-menu');

menu.addEventListener('click', () => {
    menu.classList.toggle('ativo');
    navMenu.classList.toggle('ativo');
})

let count = 1;
document.getElementById("radio__one").checked = true;

setInterval(function() {
    nextImage();
}, 2000)

function nextImage() {
    count++;
    if (count > 4) {
        count = 1;
    }
    document.getElementById("radio" + count).checked = true;

}

/* Scroll reveal - 
Mostrar o elemento quando der scroll na página */

const scrollReveal = ScrollReveal({
    origin: "top",
    distance: "5px",
    duration: 1000,
    reset: true,
});

scrollReveal.reveal(
    `
 .about__me,
 .about,
 .contact,
 .cards,
 .footer,
 .formation,
 .head,
 .hobbies,
 .projects,
 .skills `, { interval: 60 }
);

const nav = document.querySelector("header .container nav");

const toggle = document.querySelectorAll(".toggle");

for (element of toggle) {
    element.addEventListener("click", () => {
        nav.classList.toggle("show");
    });
}

const links = document.querySelectorAll(
    "nav .about .container_cards, nav .skills, nav .menu-social li a"
);

for (const link of links) {
    link.addEventListener("click", () => {
        nav.classList.remove("show");
    });
}
$(document).ready(function() {
    $("body").append("<a href='#' class='back-to-top'><i class='fa fa-arrow-circle-up' aria-hidden='true'></i></a>"),
        $(function toTop() {
            $(window).scroll(function() {
                $(this).scrollTop() > 200 ? $(".back-to-top").fadeIn() : $(".back-to-top").fadeOut()
            }), $(".back-to-top").click(function() {
                return $("html, body").animate({
                    scrollTop: 0
                }, 500), !1
            })
        });
})

function validacao() {
    console.log('iniciando validacao');
    let cpf = document.getElementById('Informações recebidas').value;
    console.log(cpf.length);
    if (cpf.length == 11) {
        alert('Suas informações foram enviadas')
    } else {
        alert('Informações incorretas')
    }
}