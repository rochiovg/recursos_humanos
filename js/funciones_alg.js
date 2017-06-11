function http_request() {
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			xmlhttp = false;
		}
	}
	if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}

function verifica_algoritmo_nivel(id_cc){
	if (id_cc==0){
		return false;
		}
	
	var url_a="m_ingreso_alg.asp"
	var valores='?id_cc='+id_cc+'&lsTipo=1';

	var peticion=$.ajax(
		{
	     url:url_a+valores,
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			///$("#d_ayuda").html("Cargando...");				
		 },
		 success:function (respuesta) {

	         if(respuesta==0 || respuesta=='0' ){
			 	//inserta_algoritmo_nivel(id_cc);
				inserta_algoritmo(id_cc);
			 }
			 else {
				// muestra_algoritmo_nivel(id_cc);
				muestra_algoritmo(id_cc);
			 }
	     } ,
         error:function (){alert('Se a producido un Error'); 
			 $("#d_ayuda").html("");
         }
  });
}


function inserta_algoritmo(id_cc){
	
	var url_a="m_ingreso_alg.asp"
	var valores='?id_cc='+id_cc+'&lsTipo=2';

	var peticion=$.ajax(
		{
	     url:url_a+valores,
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			///$("#d_ayuda").html("Cargando...");				
		 },
		 success:function (respuesta) {
			 	muestra_algoritmo(id_cc);

	     } ,
         error:function (){alert('Se a producido un Error'); 
			 $("#d_ayuda").html("");
         }
  });

}

function muestra_algoritmo(id_cc){
	var url_a="m_algoritmo.asp"
	var valores='?id_cc='+id_cc;

	var peticion=$.ajax(
		{
	     url:url_a+valores,
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
				$("#div_algoritmo").html("Cargando...");				
		 },
		 success:function (respuesta) {
			 	$("#div_algoritmo").html(respuesta);
				muestra_algoritmo_nivel(id_cc, '1');
				
	     } ,
         error:function (){alert('Se a producido un Error'); 
			 $("#div_algoritmo").html("");
         }
  });

}


function muestra_algoritmo_nivel(id_cc, flag){
	if (flag=='1'){
		var url_a="m_algoritmo_nivel_grado.asp"
	} 
	if (flag=='2'){
		var url_a="m_algoritmo_experiencia.asp"
	}
	if (flag=='3'){
		var url_a="m_algoritmo_capacitacion.asp"
	}
	
	var valores='?id_cc='+id_cc;

	var peticion=$.ajax(
		{
	     url:url_a+valores,
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
				$("#div_detalle_algoritmo").html("Cargando...");				
		 },
		 success:function (respuesta) {
			 	$("#div_detalle_algoritmo").html(respuesta)
	     } ,
         error:function (){alert('Se a producido un Error VE'); 
			 $("#div_detalle_algoritmo").html("");
         }
  });

}


function inserta_algoritmo_nivel(id_cc){
	
	var url_a="m_ingreso_alg.asp"
	var valores='?id_cc='+id_cc+'&lsTipo=2';

	var peticion=$.ajax(
		{
	     url:url_a+valores,
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			///$("#d_ayuda").html("Cargando...");				
		 },
		 success:function (respuesta) {
			 	muestra_algoritmo_nivel(id_cc);

	     } ,
         error:function (){alert('Se a producido un Error'); 
			 $("#d_ayuda").html("");
         }
  });

}

function fs_numeros(e) {
	
        tecla = (document.all) ? e.keyCode : e.which; 

		if (tecla < 48 || tecla > 57) {
			return false;
			
		}
		
        if (tecla==8 || tecla!=13) return true;
}

function guardarPuntaje (tabla, columna, id_bd, valor, id_text){
	var v_min=0;
	var v_max=0;
	if (valor=="" || valor=='0' || valor==0){
		alert('Registre valor de puntaje correcto');
		return false;	
	}
	
	if (id_text=='txtFA_min'+id_bd || id_text=='txtFA_max'+id_bd ){
		v_min=$("#txtFA_min"+id_bd).val();
		v_max=$("#txtFA_max"+id_bd).val();
	}
	
	if (id_text=='txtExMin'+id_bd || id_text=='txtExMax'+id_bd ){
		v_min=$("#txtExMin"+id_bd).val();
		v_max=$("#txtExMax"+id_bd).val();
	}
	
	if (id_text=='txtCapMin'+id_bd || id_text=='txtCapMax'+id_bd ){
		v_min=$("#txtCapMin"+id_bd).val();
		v_max=$("#txtCapMax"+id_bd).val();
	}
	
	if (v_min!="" && v_max!=""){
		if (parseInt(v_min)>=parseInt(v_max)){
			alert ('El valor m\xednimo no puede ser mayor al valor m\xe1ximo, corregir X-)');
			$("#"+id_text).focus();
			$("#"+id_text).val("");
			return false;	
		}
			
	}
	
	var url_a="m_ingreso_alg.asp"
	var valores='?tabla='+tabla+'&columna='+escape(columna)+'&id_bd='+escape(id_bd)+'&valor='+escape(valor)+'&lsTipo=3';

	var peticion=$.ajax(
		{
	     url:url_a+valores,
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			///$("#d_ayuda").html("Cargando...");				
		 },
		 success:function (respuesta) {
			 if (id_text=='txtExran'+id_bd  ){
				 var id_algoritmo=$("#h_algoritmo_id").val();
				 var id_cc=$("#h_id_convocatoriacargo").val();
				 inserta_algoritmo_det(id_cc,id_algoritmo,valor,'1');
			 }
			 if (id_text =='txtCapRan'+id_bd ){
				 var id_algoritmo=$("#h_algoritmo_id").val();
				 var id_cc=$("#h_id_convocatoriacargo").val();
				 inserta_algoritmo_det(id_cc,id_algoritmo,valor,'2');
			 }
			 
	     } ,
         error:function (){alert('Se a producido un Error'); 
			 $("#d_ayuda").html("");
         }
  });
}

function inserta_algoritmo_det(id_cc,id_algoritmo,valor,flag) {
	//var url_a="m_ingreso_alg.asp"
	var valores='m_ingreso_alg.asp?id_cc='+id_cc+'&id_algoritmo='+id_algoritmo+'&valor='+valor+'&flag='+flag+'&lsTipo=4';

	var peticion=$.ajax(
		{
	     url:valores,
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			///$("#d_ayuda").html("Cargando...");				
		 },
		 success:function (respuesta) {
			 	//muestra_algoritmo_nivel(id_cc);

	     } ,
         error:function (){alert('Se a producido un Error'); 
			 $("#d_ayuda").html("");
         }
  });
		
}

function guardadatos( id_cc, etapa, flag){
	
	if (flag==1){
		var dato=document.getElementById("txtfecha").val;
		var campo='Fecha_entrevista';
	} else {
		var dato=document.getElementById("txtHora").val;
		var campo='Hora_entrevista';
	}
	
	var valores="m_ingreso_alg.asp?id_cc="+id_cc+"&etapa="+etapa+"&campo="+campo+"&dato="+dato+"&lsTipo=7";

	var peticion=$.ajax(
		{
	     url:valores,
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			///$("#d_ayuda").html("Cargando...");				
		 },
		 success:function (respuesta) {
			 	location.reload();

	     } ,
         error:function (){alert('Se a producido un Error'); 
			 $("#d_ayuda").html("");
         }
  });
}


function eliminar_reg_ang(id, id_cc){
	var url_a="m_ingreso_alg.asp"
	var valores='?id='+id+'&lsTipo=8';
	
	if(!confirm("Estas seguro de eliminar el registro?"))
	{ return false; }
	else {

		var peticion=$.ajax(
			{
			 url:url_a+valores,
			 timeout:7000,
			 type:'POST',
			 contentType: "application/x-www-form-urlencoded",
			 data:valores,
			 beforeSend: function(){			
			 },
			 success:function (respuesta) {
					alert('Se elimin\xf3 el registro satisfactoriamente');
					muestra_algoritmo_nivel(id_cc, '1');
			 } ,
			 error:function (){alert('Se a producido un Error'); 
			 }
	  });	
	}
}



function guardar_reg_ang (id_cc){
	
	var nivel_grado_id=$("#cmb_nivel_grado").val();
	var valor=$("#txt_n_nivel").val();
	
	var url_a="m_ingreso_alg.asp"
	var valores='?id_cc='+id_cc+'&nivel_grado_id='+nivel_grado_id+'&valor='+valor+'&lsTipo=9';
	
	if(!confirm("Estas seguro de realizar el registro?"))
	{ return false; }
	else {

		var peticion=$.ajax(
			{
			 url:url_a+valores,
			 timeout:7000,
			 type:'POST',
			 contentType: "application/x-www-form-urlencoded",
			 data:valores,
			 beforeSend: function(){			
			 },
			 success:function (respuesta) {
					alert('Se procedi\xf3 con el registro satisfactoriamente');
					muestra_algoritmo_nivel(id_cc, '1');
			 } ,
			 error:function (){alert('Se a producido un Error'); 
				// $("#d_ayuda").html("");
			 }
	  });	
	}
}