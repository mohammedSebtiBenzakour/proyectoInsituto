/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//(function () {
    var video = document.getElementById('video'),
            canvas = document.getElementById("canvas"),
            context = canvas.getContext("2d"),
            hacerFoto = document.getElementById("hacerFoto"),
            vendorUrl = window.URL || window.webkitURL;

    navigator.getMedia = navigator.getUserMedia ||
            navigator.webkitGetUserMedia ||
            navigator.mozGetUserMedia ||
            navigator.msGetUserMedia;

    navigator.getMedia({
        video: true,
        audio: false
    }, function (stream) {
        video.srcObject = stream;
        video.play();
    }, function (error) {
        //

    });
    document.getElementById("hacerFoto").addEventListener("click", function () {
        
         Swal.fire({
                title: 'Notificacion',
                text: 'Despues puedes descargarla y guardarla al nombre que usted desea para poder subirla al servidor',
                type: 'success'
            })
        context.drawImage(video, 0, 0, 500, 400);
        foto.setAttribute("src", canvas.toDataURL("image/png"));
    });
    
    

//})();
