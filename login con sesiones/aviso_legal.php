<?php 
require_once('conexion.php');
session_start();
$usuario = $_SESSION['usuario'] ;
$perfil = $_SESSION['perfil'] ;
if (!isset($usuario) || !isset($perfil)) {
	header("location: loginProfesores.php");
}else{

// 	echo "<h1>Bienvenido : $usuario </h1>";

// echo "<h2></h2>";
}


?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Gestión de un instituto">
	<meta name="keywords" content="instituto, profesores, alumnos, notas, materias, matriculas, listados">
	<meta name="author" content="Mohammed Sebti Benzakour">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&family=Lobster&family=Pacifico&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"  href="../css/estiloMenuAside.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>Gestión de un Instítuto</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col ">
				<nav class="navbar navbar-expand-lg navbar-light  bg-light ">
					<div class="container-fluid">
						<a class="navbar-brand" href="#">Menu</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
							<ul class="navbar-nav">
								
								
								<li class="nav-item dropdown">
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
										<li><a class="dropdown-item" href="../MohammedSebtiBenzakour_sopaLetrasDireccion/sopaLetrasDireccion/sopaLetrasDireccion.html">Sopa de letra aleatoria Entorno cliente</a></li>
										<li><a class="dropdown-item" href="../MohammedSebtiBenzakour_sopaLetrasDireccionIntroducidaManual/sopaLetrasDireccionIntroducidaManual/sopaLetrasDireccionIntroducidaManual.html">Sopa de letra manual Entorno cliente</a></li>
									</ul>
								</li>

								<li class="nav-item">
									<a class="nav-link" href="calendario.html">Calendario</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Datos de la persona conectada
									</a>
									<ul class="dropdown-menu p-2" aria-labelledby="navbarScrollingDropdown">
										<li>Bienvenido : <?php echo $usuario; ?> </li>
										<li>Tu perfil es : <?php echo $perfil; ?></li>
									</ul>
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
		<div class="row">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="indexNuevo.php">Home</a></li>
					<li class="breadcrumb-item"><a href="aviso_legal.php">Aviso Legal</a></li>
					<li class="breadcrumb-item active" aria-current="page">Pagina Principal</li>
				</ol>
			</nav>
		</div>
		<div class="row">
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
				Ver Avisos Legales
			</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<a class="btn btn-outline-success d-flex align-items-center justify-content-center" href="aviso_legal.pdf" role="button">Ver Avisos Legales</a>
							<p>
							AVISO LEGAL
							LEY DE LOS SERVICIOS DE LA SOCIEDAD DE LA INFORMACIÓN (LSSI)
							TU EMPRESA, S.L., responsable del sitio web, en adelante RESPONSABLE, pone a disposición de los usuarios el presente documento, con el que pretende dar cumplimiento a las obligaciones dispuestas en la Ley 34/2002, de 11 de julio, de Servicios de la Sociedad de la Información y del Comercio Electrónico (LSSICE), así como informar a todos los usuarios del sitio web respecto a cuáles son las condiciones de uso.
							Toda persona que acceda a este sitio web asume el papel de usuario, comprometiéndose a la observancia y cumplimiento riguroso de las disposiciones aquí dispuestas, así como a cualquier otra disposición legal que fuera de aplicación. 
							TU EMPRESA, S.L. se reserva el derecho de modificar cualquier tipo de información que pudiera aparecer en el sitio web, sin que exista obligación de preavisar o poner en conocimiento de los usuarios dichas obligaciones, entendiéndose como suficiente con la publicación en el sitio web de TU EMPRESA, S.L
							1. DATOS IDENTIFICATIVOS
							Denominación social: TU EMPRESA, S.L.
							Nombre comercial: TU EMPRESA
							CIF: NUMERO CIF
							Domicilio: DIRECCION DE TU NEGOCIO
							e-mail: tuemail@tudominio. com
							2. OBJETO
							A través del Sitio Web, les ofrecemos a los Usuarios la posibilidad de acceder a la información sobre nuestros servicios.
							3. PRIVACIDAD Y TRATAMIENTO DE DATOS
							Cuando para el acceso a determinados contenidos o servicio sea necesario facilitar datos de carácter personal, los Usuarios garantizarán su veracidad, exactitud, autenticidad y vigencia. La empresa dará a dichos datos el tratamiento automatizado que corresponda en función de su naturaleza o finalidad, en los términos indicados en la sección de Política de Privacidad.

							4. PROPIEDAD INDUSTRIAL E INTELECTUAL
							El Usuario reconoce y acepta que todos los contenidos que se muestran en el Espacio Web y en especial, diseños, textos, imágenes, logos, iconos, botones, software, nombres comerciales, marcas, o cualesquiera otros signos susceptibles de utilización industrial y/o comercial están sujetos a derechos de Propiedad Intelectual y todas las marcas, nombres comerciales o signos distintivos, todos los derechos de propiedad industrial e intelectual, sobre los contenidos y/o cualesquiera otros elementos insertados en el página, que son propiedad exclusiva de la empresa y/o de terceros, quienes tienen el derecho exclusivo de utilizarlos en el tráfico económico. Por todo ello el Usuario se compromete a no reproducir, copiar, distribuir, poner a disposición o de cualquier otra forma comunicar públicamente, transformar o modificar tales contenidos manteniendo indemne a la empresa de cualquier reclamación que se derive del incumplimiento de tales obligaciones. En ningún caso el acceso al Espacio Web implica ningún tipo de renuncia, transmisión, licencia o cesión total ni parcial de dichos derechos, salvo que se establezca expresamente lo contrario. Las presentes Condiciones Generales de Uso del Espacio Web no confieren a los Usuarios ningún otro derecho de utilización, RRHH, alteración, explotación, reproducción, distribución o comunicación pública del Espacio Web y/o de sus Contenidos distintos de los aquí expresamente previstos. Cualquier otro uso o explotación de cualesquiera derechos estará sujeto a la previa y expresa autorización específicamente otorgada a tal efecto por la empresa o el tercero titular de los derechos afectados.
							Los contenidos, textos, fotografías, diseños, logotipos, imágenes, programas de ordenador, códigos fuente y, en general, cualquier creación intelectual existente en este Espacio, así como el propio Espacio en su conjunto, como obra artística multimedia, están protegidos como derechos de autor por la legislación en materia de propiedad intelectual. La empresa es titular de los elementos que integran el diseño gráfico del Espacio Web, lo menús, botones de navegación, el código HTML, los textos, imágenes, texturas, gráficos y cualquier otro contenido del Espacio Web o, en cualquier caso dispone de la correspondiente autorización para la utilización de dichos elementos. El contenido dispuesto en el Espacio Web no podrá ser reproducido ni en todo ni en parte, ni transmitido, ni registrado por ningún sistema de recuperación de información, en ninguna forma ni en ningún medio, a menos que se cuente con la autorización previa, por escrito, de la citada Entidad.
							Asimismo queda prohibido suprimir, eludir y/o manipular el «copyright» así como los dispositivos técnicos de protección, o cualesquiera mecanismos de información que pudieren contener los contenidos. El Usuario de este Espacio Web se compromete a respetar los derechos enunciados y a evitar cualquier actuación que pudiera perjudicarlos, reservándose en todo caso la empresa el ejercicio de cuantos medios o acciones legales le correspondan en defensa de sus legítimos derechos de propiedad intelectual e industrial.
							5. OBLIGACIONES Y RESPONSABILIDADES DEL USUARIO DEL ESPACIO WEB
							El Usuario se compromete a:
							1.	Hacer un uso adecuado y lícito del Espacio Web así como de los contenidos y servicios, de  conformidad con: (i) la legislación aplicable en cada momento; (ii) las Condiciones Generales de Uso del Espacio Web; (iii) la moral y buenas costumbres generalmente aceptadas y (iv) el orden público.
							2.	Proveerse de todos los medios y requerimientos técnicos que se precisen para acceder al Espacio Web.
							3.	Facilitar información veraz al cumplimentar con sus datos de carácter personal los formularios contenidos en el Espacio Web y a mantenerlos actualizados en todo momento de forma que responda, en cada momento, a la situación real del Usuario. El Usuario será el único responsable de las manifestaciones falsas o inexactas que realice y de los perjuicios que cause a la empresa o a terceros por la información que facilite.
							No obstante lo establecido en el apartado anterior el Usuario deberá asimismo abstenerse de:
							1.	Hacer un uso no autorizado o fraudulento del Espacio Web y/o de los contenidos con fines o efectos ilícitos, prohibidos en las presentes Condiciones Generales de Uso, lesivos de los derechos e intereses de terceros, o que de cualquier forma puedan dañar, inutilizar, sobrecargar, deteriorar o impedir la normal utilización de los servicios o los documentos, archivos y toda clase de contenidos almacenados en cualquier equipo informático.
							2.	Acceder o intentar acceder a recursos o áreas restringidas del Espacio Web, sin cumplir las condiciones exigidas para dicho acceso.
							3.	Provocar daños en los sistemas físicos o lógicos del Espacio Web, de sus proveedores o de terceros.
							4.	Introducir o difundir en la red virus informáticos o cualesquiera otros sistemas físicos o lógicos que sean susceptibles de provocar daños en los sistemas físicos o lógicos de la empresa, proveedores o de terceros.
							5.	Intentar acceder, utilizar y/o manipular los datos de la empresa, terceros proveedores y otros Usuarios.
							6.	Reproducir o copiar, distribuir, permitir el acceso del público a través de cualquier modalidad de comunicación pública, transformar o modificar los contenidos, a menos que se cuente con la autorización del titular de los correspondientes derechos o ello resulte legalmente permitido.
							7.	Suprimir, ocultar o manipular las notas sobre derechos de propiedad intelectual o industrial y demás datos identificativos de los derechos de la empresa o de terceros incorporados a los contenidos, así como los dispositivos técnicos de protección o cualesquiera mecanismos de información que puedan insertarse en los contenidos.
							8.	Obtener e intentar obtener los contenidos empleando para ello medios o procedimientos distintos de los que, según los casos, se hayan puesto a su disposición a este efecto o se hayan indicado expresamente en las páginas web donde se encuentren los contenidos o, en general, de los que se empleen habitualmente en Internet por no entrañar un riesgo de daño o inutilización del Espacio web y/o de los contenidos.
							9.	En particular, y a título meramente indicativo y no exhaustivo, el Usuario se compromete a no transmitir, difundir o poner a disposición de terceros informaciones, datos, contenidos, mensajes, gráficos, dibujos, archivos de sonido y/o imagen, fotografías, grabaciones, software y, en general, cualquier clase de material que: • De cualquier forma sea contrario, menosprecie o atente contra los derechos fundamentales y las libertades públicas reconocidas constitucionalmente, en los Tratados Internacionales y en el resto de la legislación vigente.• Induzca, incite o promueva actuaciones delictivas, denigratorias, difamatorias, violentas o, en general, contrarias a la ley, a la moral, a las buenas costumbres generalmente aceptadas o al orden público.• Induzca, incite o promueva actuaciones, actitudes o pensamientos discriminatorios por razón de sexo, raza, religión, creencias, edad o condición.• Incorpore, ponga a disposición o permita acceder a productos, elementos, mensajes y/o servicios delictivos, violentos, ofensivos, nocivos, degradantes o, en general, contrarios a la ley, a la moral y a las buenas costumbres generalmente aceptadas o al orden público. Induzca o pueda inducir a un estado inaceptable de ansiedad o temor.• Induzca o incite a involucrarse en prácticas peligrosas, de riesgo o nocivas para la salud y el equilibrio psíquico.• Se encuentra protegido por la legislación en materia de protección intelectual o industrial perteneciente a la sociedad o a terceros sin que haya sido autorizado el uso que se pretenda realizar.• Sea contrario al honor, a la intimidad personal y familiar o a la propia imagen de las personas.• Constituya cualquier tipo de publicidad.• Incluya cualquier tipo de virus o programa que impida el normal funcionamiento del Espacio Web.
							Si para acceder a algunos de los servicios y/o contenidos del Espacio Web, se le proporcionara una contraseña, se obliga a usarla de manera diligente, manteniéndola en todo momento en secreto. En consecuencia, será responsable de su adecuada custodia y confidencialidad, comprometiéndose a no cederla a terceros, de manera temporal o permanente, ni a permitir el acceso a los mencionados servicios y/o contenidos por parte de personas ajenas. Igualmente, se obliga a notificar a la sociedad cualquier hecho que pueda suponer un uso indebido de su contraseña, como, a título enunciativo, su robo, extravío o el acceso no autorizado, con el fin de proceder a su inmediata cancelación. En consecuencia, mientras no efectúe la notificación anterior, la empresa quedará eximida de cualquier responsabilidad que pudiera derivarse del uso indebido de su contraseña, siendo de su responsabilidad cualquier utilización ilícita de los contenidos y/o servicios del Espacio Web por cualquier tercero ilegítimo. Si de manera negligente o dolosa incumpliera cualquiera de las obligaciones establecidas en las presentes Condiciones Generales de Uso, responderá por todos los daños y perjuicios que de dicho incumplimiento pudieran derivarse para la empresa.
							6. RESPONSABILIDADES
							No se garantiza el acceso continuado, ni la correcta visualización, descarga o utilidad  de los elementos e informaciones contenidas en la web que puedan verse impedidos, dificultados o interrumpidos por factores o circunstancias que están fuera de su control. No se hace responsable de las decisiones que pudieran adoptarse como consecuencia del acceso a los contenidos o informaciones ofrecidas.
							Se podrá interrumpir el servicio, o resolver de modo inmediato la relación con el Usuario, si se detecta que un uso de su Espacio Web, o de cualquiera de los servicios ofertados en el mismo, es contrario a las presentes Condiciones Generales de Uso. No nos hacemos responsables por daños, perjuicios, pérdidas, reclamaciones o gastos derivados del uso del Espacio Web.

							Únicamente será responsable de eliminar, lo antes posible, los contenidos que puedan generar tales perjuicios, siempre que así se notifique. En especial no seremos responsables de los perjuicios que se pudieran derivar, entre otros, de:
							1.	Interferencias, interrupciones, fallos, omisiones, averías telefónicas, retrasos, bloqueos o desconexiones en el funcionamiento del sistema electrónico, motivadas por deficiencias, sobrecargas y errores en las líneas y redes de telecomunicaciones, o por cualquier otra causa ajena al control de la empresa. 
							2.	Intromisiones ilegítimas mediante el uso de programas malignos de cualquier tipo y a través de cualquier medio de comunicación, tales como virus informáticos o cualesquiera otros.
							3.	Abuso indebido o inadecuado del Espacio Web.
							4.	Errores de seguridad o navegación producidos por un mal funcionamiento del navegador o por el uso de versiones no actualizadas del mismo. El administrador del espacio web se reservan el derecho de retirar, total o parcialmente, cualquier contenido o información presente en el Espacio Web.
							La empresa excluye cualquier responsabilidad por los daños y perjuicios de toda naturaleza que pudieran deberse a la mala utilización de los servicios de libre disposición y uso por parte de los Usuarios de Espacio Web. Asimismo queda exonerado de cualquier responsabilidad por el contenido e informaciones que puedan ser recibidas como consecuencia de los formularios de recogida de datos, estando los mismos únicamente para la prestación de los servicios de consultas y dudas. Por otro lado, en caso de causar daños y perjuicios por un uso ilícito o incorrecto de dichos servicios, podrá ser el Usuario reclamado por los daños o perjuicios causados.

							Usted mantendrá a la empresa indemne frente a cualesquiera daños y perjuicios que se deriven de reclamaciones, acciones o demandas de terceros como consecuencia de su acceso o uso del Espacio Web. Asimismo, usted se obliga a indemnizar frente a cualesquiera daños y perjuicios, que se deriven del uso por su parte de “robots”, “spiders”, “crawlers” o herramientas similares empleadas con el fin de recabar o extraer datos o de cualquier otra actuación por su parte que imponga una carga irrazonable sobre el funcionamiento del Espacio Web.
							7. HIPERVÍNCULOS
							El Usuario se obliga a no reproducir de ningún modo, ni siquiera mediante un hiperenlace o hipervínculo, el Espacio Web, así como ninguno de sus contenidos, salvo autorización expresa y por escrito del responsable del fichero.
							El Espacio Web puede incluir enlaces a otros espacios web, gestionados por terceros, con objeto de facilitar el acceso del Usuario a la información de empresas colaboradoras y/o patrocinadoras. Conforme con ello, la sociedad no se responsabiliza del contenido de dichos Espacios web, ni se sitúa en una posición de garante ni/o de parte ofertante de los servicios y/o información que se puedan ofrecer a terceros a través de los enlaces de terceros.
							Se concede al Usuario un derecho limitado, revocable y no exclusivo a crear enlaces a la página principal del Espacio Web exclusivamente para uso privado y no comercial. Los Espacios web que incluyan enlace a nuestro Espacio Web (i) no podrán falsear su relación ni afirmar que se ha autorizado tal enlace, ni incluir marcas, denominaciones, nombres comerciales, logotipos u otros signos distintivos de nuestra sociedad; (ii) no podrán incluir contenidos que puedan considerarse de mal gusto, obscenos, ofensivos, controvertidos, que inciten a la violencia o la discriminación por razón de sexo, raza o religión, contrarios al orden público o ilícitos; (iii) no podrán enlazar a ninguna página del Espacio Web distinta de la página principal; (iv) deberá enlazar con la propia dirección del Espacio Web, sin permitir que el Espacio web que realice el enlace reproduzca el Espacio Web como parte de su web o dentro de uno de sus “frames” o crear un “browser” sobre cualquiera de las páginas del Espacio Web. La empresa podrá solicitar, en cualquier momento, que elimine cualquier enlace al Espacio Web, después de lo cual deberá proceder de inmediato a su eliminación.
							La empresa no puede controlar la información, contenidos, productos o servicios facilitados por otros Espacios web que tengan establecidos enlaces con destino al Espacio Web.
							8. PROTECCIÓN DE DATOS
							Para utilizar algunos de los Servicios, el Usuario debe proporcionar previamente ciertos datos de carácter personal. La empresa tratará automatizadamente estos datos y aplicará las correspondientes medidas de seguridad, todo ello en cumplimiento del RGPD, LOPDGDD y LSSI. El Usuario puede acceder a la política seguida en el tratamiento de los datos personales, así como el establecimiento de las finalidades previamente establecidas, en las condiciones definidas en la Política de Privacidad.
							9. COOKIES
							La empresa se reserva el derecho de utilizar la tecnología “cookie” en el Espacio Web, a fin de reconocerlo como Usuario frecuente y personalizar el uso que realice del Espacio Web mediante la preselección de su idioma, o contenidos más deseados o específicos.
							Las cookies recopilan la dirección IP del usuario siendo Google el responsable del tratamiento de esta información.
							Las cookies son ficheros enviados a un navegador, por medio de un servidor Web, para registrar la navegación del Usuario en el Espacio Web, cuando el Usuario permita su recepción. Si usted lo desea puede configurar su navegador para ser avisado en pantalla de la recepción de cookies y para impedir la instalación de cookies en su disco duro. Por favor consulte las instrucciones y manuales de su navegador para ampliar esta información.
							Gracias a las cookies, resulta posible que se pueda reconocer el navegador del ordenador utilizado por el Usuario con la finalidad de facilitar contenidos y ofrecer las preferencias de navegación u publicitarias que el Usuario, a los perfiles demográficos de los Usuarios así como para medir las visitas y parámetros del tráfico, controlar el progreso y número de entradas.
							10. DECLARACIONES Y GARANTÍAS
							En general, los contenidos y servicios ofrecidos en el Espacio Web tienen carácter meramente informativo. Por consiguiente, al ofrecerlos, no se otorga garantía ni declaración alguna en relación con los contenidos y servicios ofrecidos en el Espacio web, incluyendo, a título enunciativo, garantías de licitud, fiabilidad, utilidad, veracidad, exactitud, o comerciabilidad, salvo en la medida en que por ley no puedan excluirse tales declaraciones y garantías.
							11. FUERZA MAYOR
							La empresa no será responsable en todo en caso de imposibilidad de prestar servicio, si ésta se debe a interrupciones prolongadas del suministro eléctrico, líneas de telecomunicaciones, conflictos sociales, huelgas, rebelión, explosiones, inundaciones, actos y omisiones del Gobierno, y en general todos los supuestos de fuerza mayor o de caso fortuito.
							12. RESOLUCIÓN DE CONTROVERSIAS. LEY APLICABLE Y JURISDICCIÓN
							Las presentes Condiciones Generales de Uso, así como el uso del Espacio Web, se regirán por la legislación española. Para la resolución de cualquier controversia las partes se someterán a los Juzgados y Tribunales del domicilio social del Responsable del sitio web.
							En el supuesto de que cualquier estipulación de las presentes Condiciones Generales de Uso resultara inexigible o nula en virtud de la legislación aplicable o como consecuencia de una resolución judicial o administrativa, dicha inexigibilidad o nulidad no hará que las presentes Condiciones Generales de Uso resulten inexigibles o nulas en su conjunto. En dichos casos, la empresa procederá a la modificación o sustitución de dicha estipulación por otra que sea válida y exigible y que, en la medida de lo posible, consiga el objetivo y pretensión reflejados en la estipulación original.
</p>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row p-4">
			<div class="col">
				<a class="btn btn-outline-info" href="aviso_legal.php" role="button">Reiniciar</a>
			</div>
			<div class="col">
				<a class="btn btn-outline-success" href="aviso_legal.pdf" role="button">Ver Avisos Legales</a>
			</div>
			<div class="col">
				<a class="btn btn-outline-warning" href="indexNuevo.php" role="button">Volver</a>
			</div>
		</div>
		
	</div>

	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>