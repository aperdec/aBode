var e;

var used;
function hide(){
used = document.getElementById("repName").value;
document.getElementById("nextBtn").style.visibility = 'hidden';
document.getElementById("saveBtn").style.visibility = 'hidden';
document.getElementById("nextBtn").style.visibility = 'visible';

if (used === ""){
	//alert(used);
	document.getElementById("nextBtn").style.visibility = 'hidden';
}
}

function showSave(){
	document.getElementById("saveBtn").style.visibility = 'visible';
}

function acceptSig(){
	var link = document.getElementById("signature").toDataURL();
	document.getElementById("acc2").innerHTML='<a id="acc2" data-toggle="tooltip" data-placement="top" title="Attatch Signature to Form" download="refSig.png" href="'+link+'">Attach</a>';
	showSave();
	//alert("hi");
}

function ValidateHEN() {
	e = document.getElementById("homeEnrollmentNumber").value;
    //if you need text to be compared then use
//    if(e <= 0 || e == null || e== "") {
//        $('#alert').show();
//        $('#selectHEN').show();
//        alert("not valid");
//        return false;
//    } else
       if (isNaN(e)){
    	$('#alert').show();
        $('#selectHEN').show();
        return false;
    } else {
        return true;
    }
}

function Validate() {
    if (ValidateHEN()) {
        return true;
    } else if (ValidateHEN()) {
        $('#selectHEN').hide();
        return false;
    } else {
        return false;
    }
}

function verify() {
	varpassword1 = document.forms['form']['password'].value;
	varpassword2 = document.forms['form']['verifyPassword'].value;
	if (password1 == null || password1 == "" || password1 != password2) {
		document.getElementById("error").innerHTML = "Please check your passwords";
		return false;
	}
}