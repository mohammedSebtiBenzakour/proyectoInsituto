var openModal = document.querySelector('.hero__cta');
var modal = document.querySelector('.modal');
var closeModal = document.querySelector('.modal__close');

openModal.addEventListener('click', (e)=>{
    e.preventDefault();
    modal.classList.add('modal--show');
});

closeModal.addEventListener('click', (e)=>{
    e.preventDefault();
    modal.classList.remove('modal--show');
});

var openModal1 = document.querySelector('.hero__cta1');
var modal1 = document.querySelector('.modal1');
var closeModal1 = document.querySelector('.modal__close1');

openModal1.addEventListener('click', (e)=>{
    e.preventDefault();
    modal1.classList.add('modal1--show');
});

closeModal1.addEventListener('click', (e)=>{
    e.preventDefault();
    modal1.classList.remove('modal1--show');
});

var openModal2 = document.querySelector('.hero__cta2');
var modal2 = document.querySelector('.modal2');
var closeModal2 = document.querySelector('.modal__close2');

openModal2.addEventListener('click', (e)=>{
    e.preventDefault();
    modal2.classList.add('modal2--show');
});

closeModal2.addEventListener('click', (e)=>{
    e.preventDefault();
    modal2.classList.remove('modal2--show');
});