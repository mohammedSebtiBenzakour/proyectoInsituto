<?php 

require_once('conexion.php');

$consultar = "select * from insertar_noticias";
$query = mysqli_query($connection, $consultar);
$array = mysqli_fetch_array($query);

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Gestión de un instituto">
    <meta name="keywords" content="instituto, profesores, alumnos, notas, materias, matriculas, listados">
    <meta name="author" content="Mohammed Sebti Benzakour">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Gestión de un Instítuto</title>
    <link href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&family=Lobster&family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <link rel="stylesheet" type="text/css" href="../css/horaSimple.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="../css/flag-icon.min.css">
    <link rel="stylesheet" type="text/css"  href="../css/index.css">
    <link rel="stylesheet" type="text/css"  href="../css/indexSlider.css">
    <link rel="stylesheet" type="text/css"  href="../css/textoDinamico.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css"  href="../css/estiloSlideShow.css">
    <link rel="stylesheet" type="text/css"  href="../css/portofolio.css">
    <link rel="stylesheet" type="text/css"  href="../css/footer.css">
    <link rel="stylesheet" type="text/css"  href="../css/ventanaModal.css">
    <link rel="stylesheet" type="text/css"  href="../css/cookies.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href='../css/estilosTextoImagen.css' rel='stylesheet' type='text/css'>
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
</head>
<body>
    <header class="container">
        <div class="row">
            <div class="col">
            </div>
            <div class="col">
               <div id='rssBlock'>
                 <p class="cnnContents">
                     <span class="marqueeStyle">&nbsp;Bienvenido al instituto</span>
                     <!-- duplicate above, change style to allow continous scroll -->
                 </p>
             </div>
         </div>
         <div class="col pt-2 mb-2 d-flex flex-row-reverse colores col-lg-2">
             <div class="dropdown">
              <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                Idiomas
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="#" ><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_Spain.png" width="20%" /> Español</a></li>
                <li><a class="dropdown-item" href="#"><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_United_Kingdom.png" width="20%" /> English</a></li>
                <li><a class="dropdown-item" href="#"><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_France.png" width="20%"/> Français</a></li>
                <li><a class="dropdown-item" href="#"><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_Italy.png" width="20%" /> Italiano</a></li>
                <li><a class="dropdown-item" href="#"><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_Germany.png" width="20%" /> Deutsch</a></li>
            </ul>
        </div>

    </div>
</div>
</header>
<nav class="container">
    <div class="row">
        <div class="col ">
           <div class='time' id='time'></div>
       </div>
   </div>
   <div class="row">
    <div class="col ">
     <nav class="navbar navbar-expand-lg navbar-light  bg-light ">
      <div class="container-fluid">
          <a class="navbar-brand" href="loginPorPerfiles.php">Login</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
              <ul class="navbar-nav">
                <li class="nav-item dropdown disabled" hidden>
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Administración
                </a>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                    <li><a class="dropdown-item" href="eleccionPorPerfiles.php" target="_blank">Pagina para acceder o crear perfiles</a></li>
                    <li><a class="dropdown-item" href="formularioRegistrar.php" target="_blank">Registrar Profesores</a></li>
                    <li><a class="dropdown-item" href="loginProfesores.php" target="_blank">Acceso Solo Profesores</a></li>
                    <li><a class="dropdown-item" href="documentacion.php" target="_blank">Jefatura</a></li>
                    <li><a class="dropdown-item" href="" target="_blank">Empleados</a></li>
                    <li><a class="dropdown-item" href="#">Conserjes</a></li>
                    <li><a class="dropdown-item" href="registrarAlumnos.php" target="_blank">Registrar Alumnos</a></li>
                    <li><a class="dropdown-item" href="#">Consultar Listado Alumnos</a></li>
                    <li><a class="dropdown-item" href="http://localhost:8080/LoginUsuario/index.jsp">Biblioteca</a></li>
                    <li><a class="dropdown-item" href="crearNivelInstituto.php">Crear Nivel Educativo En el Instituto</a></li>
                    <li><a class="dropdown-item" href="formularioRegistrarPersonalNoDocente.php">Registrar Personal No Docente</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown disabled" hidden>
              <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Departamentos
            </a>
            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                <li><a class="dropdown-item" href="#">Formación Profesional</a></li>
                <li><a class="dropdown-item" href="#">Formación Normal</a></li>
                <li><a class="dropdown-item" href="crearDepartamento.php">Crear Departamento</a></li>
                <li><a class="dropdown-item" href="#">Otros</a></li>
            </ul>
        </li>
        <li class="nav-item dropdown ">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Juegos Educativos
        </a>
        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="../Encuesta/encuesta.php">Encuesta</a></li>
            <li><a class="dropdown-item" href="http://localhost:8080/ElAhorcadoJavaServlet/index.jsp">El ahorcado</a></li>
            <li><a class="dropdown-item" href="http://localhost:8080/p2/index.jsp">Juego de las parejas</a></li>
            <li><a class="dropdown-item" href="http://localhost:8080/EvaluacionExamen2/">Multiplicación de matrices</a></li>
            <li><a class="dropdown-item" href="http://localhost:8080/SopaDeLetras/index.jsp">La sopa de letras</a></li>
            <li><a class="dropdown-item" href="http://localhost:8080/EvaluacionExamen1/">Mostrar temperatura</a></li>
            <li><a class="dropdown-item" href="../calculadora/calculadora.html">Calculadora</a></li>
            <li><a class="dropdown-item" href="../ElAhorcadoMohammedSebtiBenzakour11122021/index1.php">El ahorcado PHP</a></li>
        </ul>
    </li>
    <li class="nav-item dropdown disabled" hidden>
      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        Varios
    </a>
    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
        <li><a class="dropdown-item" href="../Encuesta/encuesta.php">Encuesta</a></li>
        <li><a class="dropdown-item" href="../examenDiseño261221_ConSASS/mohammedSass.html">Examen Diseño con SASS/SCSS</a></li>
        <li><a class="dropdown-item" href="#">Juego de las parejas</a></li>
        <li><a class="dropdown-item" href="#">Multiplicación de matrices</a></li>
        <li><a class="dropdown-item" href="#">La sopa de letras</a></li>
        <li><a class="dropdown-item" href="#">Mostrar temperatura</a></li>
        <li><a class="dropdown-item" href="#">Calculadora</a></li>
    </ul>
</li>
<li class="nav-item">
  <a class="nav-link" href="apuntarTareas.html">Apuntar tareas</a>
</li>
<li class="nav-item">
  <a class="nav-link" href="calendario.html">Calendario</a>
</li>
</ul>
</div>
</div>
</nav>
</div>
<div class="col pt-2">
    <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>

</div>
</nav>
<section class="container">
    <div class="row">
        <div class="col">
            <div class="col-12 w-25">
                <nav aria-label="breadcrumb ">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item " aria-current="page">Home &#60;&#62;</li>
                </ol>
            </nav>
        </div>
    </div>
</div>

<div class="row ">
    <div class="col-12 ">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="../imagenesInstituto/1.jfif" class="d-block w-100" alt="El instituto" height="575vh">
              <div class="carousel-caption d-flex h-100 align-items-center justify-content-center">
                <h1 class="losh1">Instituto M.S.B</h1>
            </div>
            <div class="carousel-caption d-none d-md-block">
                <p class="estilo_texto_imagen">Hay una fuerza motriz más poderosa que el vapor, la electricidad y la energía atómica: la voluntad. <br>  <abbr title="Hay una fuerza motriz más poderosa que el vapor, la electricidad y la energía atómica: la voluntad.">Albert Einstein </abbr></p>
            </div>
        </div>
        <div class="carousel-item">
          <img src="../imagenesInstituto/14.jfif" class="d-block w-100" alt="El instituto" height="575vh">
          <div class="carousel-caption d-flex h-100 align-items-center justify-content-center">
            <h1 class="losh1">Instituto M.S.B</h1>
        </div>
        <div class="carousel-caption d-none d-md-block">
            <p class="text-warning estilo_texto_imagen">El genio se hace con un 1% de talento, y un 99% de trabajo. <br>  <abbr title="El genio se hace con un 1% de talento, y un 99% de trabajo.">Albert Einstein</abbr>n</p>
        </div>
    </div>
    <div class="carousel-item">
      <img src="../imagenesInstituto/18.jfif" class="d-block w-100" alt="El instituto" height="575vh">
      <div class="carousel-caption d-flex h-100 align-items-center justify-content-center">
        <h1 class="losh1">Instituto M.S.B</h1>
    </div>
    <div class="carousel-caption d-none d-md-block">
        <p class="estilo_texto_imagen">Nuestra gloria más grande no consiste en no haberse caído nunca, sino en haberse levantado después de cada caída. <br> <abbr title="Nuestra gloria más grande no consiste en no haberse caído nunca, sino en haberse levantado después de cada caída.">Confucio</abbr></p>
    </div>
</div>
</div>
<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
</button>
<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
</button>
</div> 
</div>
</div>
</section>
<div class="container pt-5">
    <div class="row">
        <div class="col">


          <section class="cc-carousel">
             <div class="cc-carousel-container" data-carousel-position="1" data-animation-duration="2000" data-animation-position="0" data-animation-easing="linear">
                <div
                class="cc-card"
                data-card-position="1"
                data-image-src="../imagenesInstituto/mascarilla.png"
                data-image-size="cover"
                data-background-position="center center"
                data-background-color="f5f5f5"
                >
                <div class="cc-card-top">
                  <div class="cc-card-top-overlay"></div>
                  <h3>COVID</h3>
              </div>
              <div class="cc-card-bottom">
                  <h4>Med. COVID</h4>
                  <p class="card-details">
                     Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem quia quas nihil provident atque perspiciatis ipsum esse blanditiis cupiditate vero?
                 </p>
                 <a href="javascript:void(0);" class="button-cta"></a>
             </div>
         </div>
         <div
         class="cc-card"
         data-card-position="2"
         data-image-src="../imagenesInstituto/formulario.png"
         data-image-size="cover"
         data-background-position="center center"
         data-background-color="f5f5f5"
         >
         <div class="cc-card-top">
          <div class="cc-card-top-overlay"></div>
          <h3>Ausencias</h3>
      </div>
      <div class="cc-card-bottom">
          <h4>F. Ausencias</h4>
          <p class="card-details">
             Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem quia quas nihil provident atque perspiciatis ipsum esse blanditiis cupiditate vero?
         </p>
         <a href="javascript:void(0);" class="button-cta"></a>
     </div>
 </div>
 <div
 class="cc-card"
 data-card-position="3"
 data-image-src="../imagenesInstituto/actividades.png"
 data-image-size="cover"
 data-background-position="center center"
 data-background-color="f5f5f5"
 >
 <div class="cc-card-top">
  <div class="cc-card-top-overlay"></div>
  <h3>Actividades</h3>
</div>
<div class="cc-card-bottom">
  <h4>Actividades</h4>
  <p class="card-details">
     Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem quia quas nihil provident atque perspiciatis ipsum esse blanditiis cupiditate vero?
 </p>
 <a href="javascript:void(0);" class="button-cta"></a>
</div>
</div>
<div
class="cc-card"
data-card-position="4"
data-image-src="../imagenesInstituto/conusltas.png"
data-image-size="cover"
data-background-position="center center"
data-background-color="f5f5f5"
>
<div class="cc-card-top">
  <div class="cc-card-top-overlay"></div>
  <h3></h3>
</div>
<div class="cc-card-bottom">
  <div class="cc-card-top-overlay"></div>
  <h4>Consultas</h4>
  <p class="card-details">
     Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem quia quas nihil provident atque perspiciatis ipsum esse blanditiis cupiditate vero?
 </p>
 <a href="javascript:void(0);" class="button-cta"></a>
</div>
</div>
<div
class="cc-card"
data-card-position="5"
data-image-src="../imagenesInstituto/transporte.jfif"
data-image-size="cover"
data-background-position="center center"
data-background-color="f5f5f5"
>
<div class="cc-card-top">
  <div class="cc-card-top-overlay"></div>
  <h3>Transporte</h3>
</div>
<div class="cc-card-bottom">
  <h4>Transporte</h4>
  <p class="card-details">
     Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem quia quas nihil provident atque perspiciatis ipsum esse blanditiis cupiditate vero?
 </p>
 <a href="javascript:void(0);" class="button-cta"></a>
</div>
</div>
<div
class="cc-card"
data-card-position="6"
data-image-src="../imagenesInstituto/incidencias.png"
data-image-size="cover"
data-background-position="center center"
data-background-color="f5f5f5"
>
<div class="cc-card-top">
  <div class="cc-card-top-overlay"></div>
  <h3>Incidencias</h3>
</div>
<div class="cc-card-bottom">
  <h4>Incidencias</h4>
  <p class="card-details">
     Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem quia quas nihil provident atque perspiciatis ipsum esse blanditiis cupiditate vero?
 </p>
 <a href="javascript:void(0);" class="button-cta"></a>
</div>
</div>
</div>
</section>
<section class="container pt-3">
    <div class="row">
        <div class="col">
            <h2 class="noticias pb-3">Ultimas Noticias</h2>
        </div>
    </div>
    <div class="row">
      <div class="col">
          <div class="accordion" id="accordionPanelsStayOpenExample">
            <?php 
            foreach ($query as $row) {
                ?>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse<?php echo  $row['id']; ?>" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                        <?php echo  $row['nombre_noticia']; ?>
                    </button>
                </h2>
                <div id="panelsStayOpen-collapse<?php echo  $row['id']; ?>" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                  <div class="accordion-body">
                    <?php echo  $row['texto_noticia']; ?>
                </div>
                <div class="accordion-body">
                    Fecha de la noticia: <?php echo  $row['creado_el']; ?>
                </div>
            </div>
        </div>
    <?php }
    ?>

</div>
</div>
</div>
</section>
<section class="container">
    <div class="row">
        <div class="col">
            <section id="portfolio" class="portfolio">
              <div class="container">
                <div class="row text-center mt-5">
                  <h1 class="display-3 fw-bold text-capitalize">Curiosidades en la vida para aprender de ellas</h1>
                  <div class="heading-line"></div>
                  <p class="lead">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint porro temporibus distinctio.
                </p>
            </div>
            <!-- FILTER BUTTONS  -->
            <div class="row mt-5 mb-4 g-3 text-center">
              <div class="col-md-12">
                <button class="btn btn-outline-primary"  type="button"><a href="http://www.google.com">La tierra</a></button>
                <button class="btn btn-outline-primary"  type="button"><a href="http://www.google.com">El corazon</a></button>
                <button class="btn btn-outline-primary"  type="button"><a href="http://www.google.com">Cosas que no sabias</a></button>
                <button class="btn btn-outline-primary" type="button"><a href="http://www.google.com">¿Eres curioso?</a></button>
                <button class="btn btn-outline-primary" type="button"><a href="http://www.google.com">¿Sabias que?</a></button>
                <button class="btn btn-outline-primary" type="button"><a href="http://www.google.com">Algo de historia es primordial</a></button>
            </div>
            <div class="row pt-2">
                <ul class="modales">
                    <li><a href="#modal1">DESLIZAR</a></li>
                    <li><a href="#modal2">ROTAR</a></li>
                    <li><a href="#modal3">REDIMENSIONAR</a></li>
                </ul>
                <div id="modal1" class="modalmask">
                    <div class="modalbox movedown">
                        <a href="#close" title="Close" class="close">X</a>
                        <h2>DESLIZAR</h2>
                        <p>La ventana modal aparece por arriba y se desliza hasta su posición. Un efecto simple pero elegante.</p>
                        <p>Aquí puedes incluir cualquier cosa como vídeos, mapas, formularios...</p>
                    </div>
                </div>
                <div id="modal2" class="modalmask">
                    <div class="modalbox rotate">
                        <a href="#close" title="Close" class="close">X</a>
                        <h2>ROTAR</h2>
                        <p>Usando la propiedad transform de CSS3, podemos hacer que las ventanas aparezcan rotando.</p>
                        <p>No hay nada de Javascript, solo unas pocas lineas de CSS.</p>
                    </div>
                </div>
                <div id="modal3" class="modalmask">
                    <div class="modalbox resize">
                        <a href="#close" title="Close" class="close">X</a>
                        <h2>REDIMENSIONAR</h2>
                        <p>También puedes redimensionar la ventana hasta hacerla desaparecer.</p>
                        <p>Las posibilidades que ofrece CSS3 son múltiples, tan solo hace falta un poco de imaginación para crear efectos realmente llamativos.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- START THE PORTFOLIO ITEMS  -->
        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="portfolio-box shadow">
              <img src="../imagenesInstituto/tierra.jfif" alt="portfolio 1 image" title="portfolio 1 picture" class="img-fluid">
              <div class="portfolio-info">
                  <h4><a href="http://www.google.com">La tierra</a></h4>
                  <p>Sus curiosidades</p>
              </div>
          </div>
      </div>
      <div class="col-lg-4 col-md-6">
        <div class="portfolio-box shadow">
          <img src="../imagenesInstituto/corazon.jfif" alt="portfolio 2 image" title="portfolio 2 picture" class="img-fluid">
          <div class="portfolio-info">
            <h4><a href="http://www.google.com">El corazon</a></h4>
            <p>Su alrededor</p>
        </div>
    </div>
</div>
<div class="col-lg-4 col-md-6">
    <div class="portfolio-box shadow">
      <img src="../imagenesInstituto/noSabias.png" alt="portfolio 3 image" title="portfolio 3 picture" class="img-fluid">
      <div class="portfolio-info">
        <h4><a href="http://www.google.com">Cosas que no sabias</a></h4>
        <p>Realmente, sorprendente</p>
    </div>
</div>
</div>
<div class="col-lg-4 col-md-6">
    <div class="portfolio-box shadow">
      <img src="../imagenesInstituto/curioso.png" alt="portfolio 4 image" title="portfolio 4 picture" class="img-fluid">
      <div class="portfolio-info">
        <h4><a href="http://www.google.com">¿Eres curioso?</a></h4>
        <p>Este es tu lugar</p>
    </div>
</div>
</div>
<div class="col-lg-4 col-md-6">
    <div class="portfolio-box shadow">
      <img src="../imagenesInstituto/sabiasQue.jfif" alt="portfolio 5 image" title="portfolio 5 picture" class="img-fluid">
      <div class="portfolio-info">
          <h4><a href="http://www.google.com">¿Sabias que?</a></h4>
          <p>Nunca lo adivinarias</p>
      </div>
  </div>
</div>
<div class="col-lg-4 col-md-6">
    <div class="portfolio-box shadow">
      <img src="../imagenesInstituto/cervantes.png" alt="portfolio 6 image" title="portfolio 6 picture" class="img-fluid">
      <div class="portfolio-info">
        <h4><a href="http://www.google.com">Algo de historia es primordial</a></h4>
        <p>Sus secretos</p>
    </div>
</div>
</div>
</div>
</section>
</div>
</div>
</section>
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-4 footer-column">
        <ul class="nav flex-column">
          <li class="nav-item">
            <span class="footer-title">Información especifica</span>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="aviso_legal.php">Aviso legal</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Visitas</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Mapa del sitio</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="https://developer.mozilla.org/es/docs/Learn/Common_questions">Preguntas frecuentes</a>
        </li>
    </ul>
</div>
<div class="col-md-4 footer-column">
    <ul class="nav flex-column">
      <li class="nav-item">
        <span class="footer-title">Nuevas oportunidades</span>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#">La junta de Andalucía</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="formularioInsertarOferta.php">Introducir Ofertas de trabajo</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#">Otras noticias de interés</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="comoLlegar.php">Como llegar</a>
    </li>
</ul>
</div>
<div class="col-md-4 footer-column">
    <ul class="nav flex-column">
      <li class="nav-item">
        <span class="footer-title">Contact & Support</span>
    </li>
    <li class="nav-item">
        <span class="nav-link"><i class="fas fa-phone"></i>+34 655 173 174</span>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="../simplechat/index.php"><i class="fas fa-comments"></i>Live chat</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="formularioContacto.php"><i class="fas fa-envelope"></i>Contactar</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="feedbackForm.php"><i class="fas fa-star"></i>Give feedback</a>
    </li>
    <li class="nav-item">
        <button  onclick="sendEmailDefault()"><i class="fas fa-plane-departure"></i>Enviar email</button>
    </li>
    <li class="nav-item">
       <a class="nav-link" href="../phpMail040322/enviarEmail.php"><i class="fas fa-envelope"></i>Enviar Sugerencias </a>
   </li>
</ul>
</div>
</div>

<div class="text-center"><i class="fas fa-ellipsis-h"></i></div>

<div class="row text-center">
  <div class="col-md-4 box">
    <span class="copyright quick-links">Copyright &copy; Todos los derechos reservados <script>document.write(new Date().getFullYear())</script>
    </span>
</div>
<div class="col-md-4 box">
    <ul class="list-inline social-buttons">
      <li class="list-inline-item">
        <a href="#">
            <i class="fab fa-twitter"></i>
        </a>
    </li>
    <li class="list-inline-item">
        <a href="#">
            <i class="fab fa-facebook-f"></i>
        </a>
    </li>
    <li class="list-inline-item">
        <a href="#">
            <i class="fab fa-linkedin-in"></i>
        </a>
    </li>
</ul>
</div>
<div class="col-md-4 box">
    <ul class="list-inline quick-links">
      <li class="list-inline-item">
        <a href="https://www.privacypolicygenerator.info/live.php?token=sRwWmSNAXRV7RyzL20xgeH9w1WWQR5JY">Privacy Policy</a>
    </li>
    <li class="list-inline-item">
        <a href="https://www.termsfeed.com/live/9db1b3e8-aad4-43be-aa59-9dbc2578d336">Terms of Use</a>
    </li>
</ul>
</div>
</div>
</div>
</footer>
</div>
</div>
</div> 
<div id="cajacookies">
    <p><button onclick="aceptarCookies()" class="pull-right"><i class="fa fa-times"></i> Aceptar y cerrar éste mensaje</button>
        Éste sitio web usa cookies, si permanece aquí acepta su uso.
        Puede leer más sobre el uso de cookies en nuestra <a href="politica.html">política de privacidad</a>.
    </p>
</div>

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/slideShow.js"></script>
<script type="text/javascript" src="../js/index.js"></script>
<script type="text/javascript" src="../js/horaSimple.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.5.4/bootstrap-select.js"></script>
<script type="text/javascript" src="../js/enviarEmail.js"></script>
<script>
    /* ésto comprueba la localStorage si ya tiene la variable guardada */
    function compruebaAceptaCookies() {
      if(localStorage.aceptaCookies != 'true'){
        cajacookies.style.display = 'block';
    }
}

/* aquí guardamos la variable de que se ha
aceptado el uso de cookies así no mostraremos
el mensaje de nuevo */
function aceptarCookies() {
  localStorage.aceptaCookies = 'true';
  cajacookies.style.display = 'none';
}

/* ésto se ejecuta cuando la web está cargada */
$(document).ready(function () {
  compruebaAceptaCookies();
});
</script>
</body>
</html>
