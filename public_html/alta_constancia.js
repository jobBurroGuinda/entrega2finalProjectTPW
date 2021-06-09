$(document).ready(function() {
  var c_id, opcion;
  opcion = 4;
      
  tablaUsuarios = $('#tablaUsuarios').DataTable({  
      "ajax":{            
          "url": "bd/crud.php", 
          "method": 'POST', //usamos el metodo POST
          "data":{opcion:opcion}, //enviamos opcion 4 para que haga un SELECT
          "dataSrc":""
      },
      "columns":[
          {"data": "id"},
          {"data": "actividad"},
          {"data": "fecha_inicio"},
          {"data": "fecha_fin"},
          {"data": "horas"},
          {"data": "archivo"},
          {"data": "observaciones"},
          {"data": "valida"},
          {"defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-primary btn-sm btnEditar'><i class='material-icons'>edit</i></button><button class='btn btn-danger btn-sm btnBorrar'><i class='material-icons'>delete</i></button></div></div>"}
      ]
  });   


  
  var fila; //captura la fila, para editar o eliminar
  //submit para el Alta y Actualización
  $('#formConstancias').submit(function(e){                         
      e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
      actividad = $.trim($('#actividad').val());
      inicio = $.trim($('#inicio').val());
      termino = $.trim($('#termino').val()); 
      horas = $.trim($('#horas').val()); 
      archivo = $.trim($('#archivo').val()); 
      comentarios = $.trim($('#comentarios').val()); 
          $.ajax({
            url: "bd/crud.php",
            type: "POST",
            datatype:"json",    
            data:  {c_id:c_id, actividad:actividad, inicio:inicio, termino:termino, 
              horas:horas, archivo:archivo, comentarios:comentarios,opcion:opcion},   
            success: function(data) {
              tablaUsuarios.ajax.reload(null, false);
             }
          });			        
      $('#modalCRUD').modal('hide');											     			
  });
          
   
  
  //para limpiar los campos antes de dar de Alta una Persona
  $("#btnNuevo").click(function(){
      opcion = 1; //alta           
      user_id=null;
      $("#formConstancias").trigger("reset");
      $(".modal-header").css( "background-color", "#17a2b8");
      $(".modal-header").css( "color", "white" );
      $(".modal-title").text("Nueva Constancia");
      $('#modalCRUD').modal('show');	    
  });
  
  //Editar        
  $(document).on("click", ".btnEditar", function(){		        
      opcion = 2;//editar
      fila = $(this).closest("tr");	        
      c_id = parseInt(fila.find('td:eq(0)').text()); //capturo el ID		            
      actividad = fila.find('td:eq(1)').text();
      inicio = fila.find('td:eq(2)').text();
      final = fila.find('td:eq(3)').text();
      horas = fila.find('td:eq(4)').text();
      archivo = fila.find('td:eq(5)').text();
      comentarios = fila.find('td:eq(6)').text();
      $("#actividad").val(actividad);
      $("#inicio").val(inicio);
      $("#termino").val(final);
      $("#horas").val(horas);
      $("#archivo").val(archivo);
      $("#comentarios").val(comentarios);
      $(".modal-header").css("background-color", "#007bff");
      $(".modal-header").css("color", "white" );
      $(".modal-title").text("Editar Constancia");		
      $('#modalCRUD').modal('show');		   
  });
  
  function importarScript(nombre) {
      var s = document.createElement("script");
      s.src = nombre;
      document.querySelector("head").appendChild(s);
  }
  
  });   