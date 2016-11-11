var e;

var used;
function hide(){
used = document.getElementById("repName").value;
//disable save on load
$( "#saveBtn" ).prop( "disabled", true );

//test not hidden

$( "#nextBtn" ).prop( "disabled", false );
$( "#nextBtn" ).prop( "disabled", true );

//document.getElementById("nextBtn").style.visibility = 'visible';
//document.getElementById("saveBtn").style.visibility = 'visible';

if (used === ""){
	//alert(used);
	document.getElementById("nextBtn").style.visibility = 'visible';
}
}

function showSave(){
	$( "#saveBtn" ).prop( "disabled", false );
	//$( "#nextBtn" ).prop( "disabled", false );
//	$('a').disable(false);

	document.getElementById("saveBtn").style.visibility = 'visible';
}

function enableNextBtn(){
	$('a').disable(false);
}

function disableNextBtn(){
	$('a').disable(false);
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
    if(e <= 0 || e == null || e== "") {
        $('#alert').show();
        $('#selectHEN').show();
        return false;
    } else
       if (isNaN(e)){
    	$('#alert').show();
        $('#selectHEN').show();
        return false;
    } else {
        return true;
    }
return true;
}

function Validate() {
    if (ValidateHEN()) {
        return true;
    } else {
        $('#selectHEN').hide();
        return false;
    }
}

//Function to enable disable Next button HREF
$(function() {
    jQuery.fn.extend({
        disable: function(state) {
            return this.each(function() {
                var $this = $(this);
                if($this.is('input, button'))
                    this.disabled = state;
                else
                    $this.toggleClass('disabled', state);
            });
        }
    });

    $('a').disable(true);

    $('body').on('click', 'a.disabled', function(event) {
        event.preventDefault();
    });
});


function verify() {
	varpassword1 = document.forms['form']['password'].value;
	varpassword2 = document.forms['form']['verifyPassword'].value;
	if (password1 == null || password1 == "" || password1 != password2) {
		document.getElementById("error").innerHTML = "Please check your passwords";
		return false;
	}
}