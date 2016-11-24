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
	alert("testing");
	var link = document.getElementById("signature").toDataURL();
	var hen = document.getElementById("homeEnrollmentNumber").value;
	//alert(hen);
	document.getElementById("acc2").innerHTML='<a id="acc2" data-toggle="tooltip" data-placement="top" title="Attatch Signature to Form" download="refSig.png" href="'+link+'">Attach</a>';
	showSave();
	
}

function accept2(){
	var hen = document.getElementById("homeEnrollmentNumber").value;
	//alert(hen);
	var link = document.getElementById("signature").toDataURL();
	document.getElementById("acc2").innerHTML='<a id="acc2" data-toggle="tooltip" data-placement="top" title="Attatch Signature to Form" download="'+hen+'refSig2.png" href="'+link+'">Attach</a>';
	showSave();
	//alert("hi");
}
