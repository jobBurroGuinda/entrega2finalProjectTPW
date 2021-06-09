$(document).ready(function() {
    $('#tablaDina').DataTable({
    	"ajax":{            
          "url": "bd/dash.php", 
          "method": 'POST', //usamos el metodo POST
          "dataSrc":""
      },
      "columns":[
          {"data": "modalidad"},
          {"data": "ejemplos"},
          {"data": "factor"}
      ]
    });

    $('#tablaBar').DataTable({
    	"ajax":{            
          "url": "bd/dashBar.php", 
          "method": 'POST', //usamos el metodo POST
          "dataSrc":""
      },
      "columns":[
          {"data": "nombre"},
          {"data": "porcentaje"}
      ]
    });

    //llenarBars();
} );
/*
function llenarBars(){
	$.ajax({
		url: "bd/dash.php",
		type: "POST",
		success: function(res){
			var js = JSON.parse(res);
			var bar;
			for (var i = 0; i < js.length ; i++) {
				bar = "<b>"+js[i].modalidad+"</b>";
			}
			$("$contenedorBars").html(bar);
		}
		error: function(){
			alert("error");
		}
	});
}*/