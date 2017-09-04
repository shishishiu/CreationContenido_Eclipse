$(function() {
	iniciaMessageDialog();
	funcResizeMain();

});

$("textarea").resizable({
    resize: function() {
    	funcResizeMain();
    }
});

function funcRegreso(){
    location.href = "BusMat"
}

function funcLiberar(){
	$("#innerMessage").html("");
	$("#message").hide();

	document.getElementById("hiddenTipo").value = 1;
	document.forms["form1"].action = "Liberar";
    document.forms["form1"].submit();
	
}