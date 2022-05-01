
const contenedorTareas = document.getElementById("app");
const addTareaButton = contenedorTareas.querySelector(".add-tarea");

getTareas().forEach(tarea => {
	const tareaElement = createTareasElement(tarea.id, tarea.content);
	contenedorTareas.insertBefore(tareaElement, addTareaButton);

});

addTareaButton.addEventListener("click", () => addTarea());

function getTareas(){

	return JSON.parse(localStorage.getItem("stickynotes-notes") || "[]");


}

function saveTareas(tareas){
	localStorage.setItem("stickynotes-notes", JSON.stringify(tareas));



}

function createTareasElement(id, content){

	const element = document.createElement("textarea");

	element.classList.add("tarea");
	element.value = content;
	element.placeholder ="Tarea vacia por ahora";

	element.addEventListener("change", () => {
		updateTarea(id, element.value);
	});

	element.addEventListener("dblclick", () => {
		//const doDelete = confirm("Realmente quieres borrar la tarea?");

		Swal.fire({
			title: 'Realmente quieres borrar la tarea?',
			showDenyButton: true,
			showCancelButton: true,
			confirmButtonText: 'Save',
			denyButtonText: `Don't save`,
		}).then((result) => {
			/* Read more about isConfirmed, isDenied below */
			if (result.isConfirmed) {
				Swal.fire('Borrada la tarea!', '', 'success')
				deleteTarea(id, element);
			} else if (result.isDenied) {
				Swal.fire('NO se ha borrado la tarea', '', 'info')
			}
		})

		// if (doDelete) {
		// 	deleteTarea(id, element);
		// }
	});

	return element;

}

function addTarea(){

	const tareas = getTareas();
	const tareaObject = {
		id: Math.floor(Math.random() * 100000),
		content: ""
	};

	const tareaElement = createTareasElement(tareaObject.id, tareaObject.content);
	contenedorTareas.insertBefore(tareaElement, addTareaButton);

	tareas.push(tareaObject);
	saveTareas(tareas);


}

function updateTarea(id, newContent){
	console.log("updating tarea");
	console.log(id, newContent);

	const tareas = getTareas();
	const targetTarea = tareas.filter(tarea => tarea.id == id)[0];

	targetTarea.content = newContent;
	saveTareas(tareas);
	Swal.fire({
		position: 'center',
		icon: 'success',
		title: 'La tarea ha sido modificada',
		showConfirmButton: false,
		timer: 1500
	})

}

function deleteTarea(id, element){

	console.log("deleting tarea");
	console.log(id);

	const tareas = getTareas().filter(tarea => tarea.id != id);

	saveTareas(tareas);
	contenedorTareas.removeChild(element);

}