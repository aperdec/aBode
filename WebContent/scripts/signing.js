// JavaScript Document
var sigCapture = null;
var canvas = document.getElementById("signature");

$(document).ready(function(e) {

	sigCapture = new SignatureCapture( "signature" );

});


function to_image(){
    var canvas = document.getElementById("signature");

    document.getElementById("theimage").src = canvas.toDataURL();
    Canvas2Image.saveAsPNG(canvas);

}

function clearSig() {
	sigCapture.clear();
}

function accept(){
	var link = document.getElementById("signature").toDataURL();
	document.getElementById("acc2").innerHTML='<a id="acc2" data-toggle="tooltip" data-placement="top" title="Attatch Signature to Form" download="refSig.png" href="'+link+'">Attach</a>';
	showSave();
	//alert("hi");
}


/*

function download() {
    var dt = canvas.toDataURL('image/jpeg');
    this.href = dt;
};
downloadLnk.addEventListener('click', download, false);


$(function() {
	  $("#acc").click(function() {
	      html2canvas(document.body, {
	          onrendered: function(sigCapture) {
	              return Canvas2Image.saveAsPNG(sigCapture);
	          }
	      });
	  })
	});


//link on displayunit jsp commented out because not working
function dlCanvas() {
	  var dt = canvas.toDataURL();
	  //Change MIME type to trick the browser to downlaod the file instead of displaying it 
	  //dt = dt.replace(/^data:image\/[^;], 'data:application/octet-stream');

	  //In addition to <a>'s "download" attribute, you can define HTTP-style headers 
	  //dt = dt.replace(/^data:application\/octet-stream/, 'data:application/octet-stream;headers=Content-Disposition%3A%20attachment%3B%20filename=Canvas.png');

	  this.href = dt;
	  this.download = 'sig.png';
	};
	document.getElementById("dl").addEventListener('click', dlCanvas, false);


//these 2 func together do not work
document.getElementById('download').addEventListener('click', function() {
    downloadCanvas(this, 'signature', 'test.png');
}, false);

function downloadCanvas(link, canvasId, filename) {
    link.href = document.getElementById(canvasId).toDataURL();
    link.download = filename;
}

*/
