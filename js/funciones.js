$(document).ready(function(){
	$("#datos").keyup(function(){
		var datos = $("#datos").val();
		
		$.ajax({
			type: 'get',
			URL: 'procesar.txt',
			data: 'id='+datos,
			beforeSend: function () {
                        $("#resultado").html("Procesando, espere por favor...");
                },
			success:function(json){
			alert(json);
			}
		})
		
	})
});

