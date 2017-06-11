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

function verDetalle (id){
	if (id==1) {
		var reg=document.getElementById("reg").value;
		document.getElementById("trdet1").style.display="";
		document.getElementById("trdet"+reg).style.display="none";
	}
	
	if (id!=1) {
		var reg=document.getElementById("reg").value;
		document.getElementById("detalle_1").style.display="none";
		document.getElementById("trdet1").style.display="none";
		document.getElementById("trdet"+reg).style.display="none";
		document.getElementById("trdet"+id).style.display="";
		document.getElementById("TR1").style.background="#F2F9FF";
		document.getElementById("detalle_1").style.background="";
	}
 	if (document.getElementById("reg").value==1){
		document.getElementById("detalle_"+id).style.display="";
		document.getElementById("detalle_"+id).bgColor="";
		document.getElementById("reg").value=id;
		document.getElementById("TR"+id).style.background="#6EA4D3";
		document.getElementById("detalle_"+id).style.background="#FFFFFF";
	}		
	else
	{
		var reg=document.getElementById("reg").value;
		document.getElementById("detalle_"+reg).style.display="none";
		document.getElementById("TR"+reg).style.background="#F2F9FF";
		document.getElementById("detalle_"+reg).style.background="";
		document.getElementById("detalle_"+id).style.display="";
		document.getElementById("TR"+id).style.background="#6EA4D3";
		document.getElementById("detalle_"+id).style.background="#FFFFFF";
		document.getElementById("reg").value=id;

	}
	
}


function abrir(id_proy){
	
	var id=document.getElementById("id_cc").value;
	var p=document.getElementById("id_p").value;
		
	document.getElementById("divContenido").style.display="none";
	document.getElementById("contenido").style.display="";
		
	ajax=http_request();
	var valores;	
	valores= "id="+id+"&p="+p;  // parametros a enviar al servidor	
	url="logueo.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                document.getElementById("contenido").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				document.getElementById("contenido").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                document.getElementById("contenido").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                document.getElementById("contenido").innerHTML =ajax.responseText;
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 
}

function validaPeriodo (valor){
	if(valor>20){
	$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'Valor Incorrecto, no puede ser mayor a 20';
				document.getElementById("txtperioalc").value="";
				document.getElementById('txtperioalc').focus();
				document.getElementById("txtperioalc").style.backgroundColor="#FFA4A4";
	}else
	{document.getElementById("txtperioalc").style.backgroundColor="";}
}


function validarPerido(valor){
	var tiempo= document.getElementById("txtperioalc").value;
	
	if (tiempo=="0"){
		document.getElementById('txtperioalc').focus();
		$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'Ingrese periodo alcanzado';
				document.getElementById("txtperioalc").value="";
				document.getElementById("txtperioalc").style.backgroundColor="#FFA4A4";
	}else
	{document.getElementById("txtperioalc").style.backgroundColor="";}
	
	if ((valor =="01" || valor=="07")&& tiempo>=21)  {
		document.getElementById('txtperioalc').focus();
		$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'El periodo ingresado no es valido, verificar';
				document.getElementById("txtperioalc").value="";
				document.getElementById("cmbPeriodo").value="";
				document.getElementById("txtperioalc").style.backgroundColor="#FFA4A4";
	}else
	{document.getElementById("txtperioalc").style.backgroundColor="";}
	
	if (valor =="02" && tiempo>=241)  {
		document.getElementById('txtperioalc').focus();
		$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'El periodo ingresado no es valido, verificar';
				document.getElementById("txtperioalc").value="";
				document.getElementById("cmbPeriodo").value="";
				document.getElementById("txtperioalc").style.backgroundColor="#FFA4A4";
	}else
	{document.getElementById("txtperioalc").style.backgroundColor="";}
	
	
	if (valor =="03" && tiempo>=11)  {
		document.getElementById('txtperioalc').focus();
		$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'El periodo ingresado no es valido, verificar';
				document.getElementById("txtperioalc").value="";
				document.getElementById("cmbPeriodo").value="";
				document.getElementById("txtperioalc").style.backgroundColor="#FFA4A4";
	}else
	{document.getElementById("txtperioalc").style.backgroundColor="";}
	
	
	if (valor =="04" && tiempo>=41)  {
		document.getElementById('txtperioalc').focus();
		$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'El periodo ingresado no es valido, verificar';
				document.getElementById("txtperioalc").value="";
				document.getElementById("cmbPeriodo").value="";
				document.getElementById("txtperioalc").style.backgroundColor="#FFA4A4";
	}else
	{document.getElementById("txtperioalc").style.backgroundColor="";}
	
	if (valor =="05" && tiempo>=21)  {
		document.getElementById('txtperioalc').focus();
		$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'El periodo ingresado no es valido, verificar';
				document.getElementById("txtperioalc").value="";
				document.getElementById("cmbPeriodo").value="";
				document.getElementById("txtperioalc").style.backgroundColor="#FFA4A4";
	}else
	{document.getElementById("txtperioalc").style.backgroundColor="";}
	
}



function abrir_inei(id_proy){
	
	var id=document.getElementById("id_cc").value;
	var p=document.getElementById("id_p").value;
		
	document.getElementById("divContenido").style.display="none";
	document.getElementById("contenido").style.display="";
		
	ajax=http_request();
	var valores;	
	valores= "id="+id+"&p="+p;  // parametros a enviar al servidor	
	url="logueo_inei.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                document.getElementById("contenido").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				document.getElementById("contenido").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                document.getElementById("contenido").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                document.getElementById("contenido").innerHTML =ajax.responseText;
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 
}


		
function validar_ano(valor)
{	
	f = new Date();
	if(valor>f.getFullYear()){
		
		$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'Error en el registro del a\xf1o';
				document.getElementById("txtIneiAnio").value="";
				document.getElementById('txtIneiAnio').focus();
				document.getElementById("txtIneiAnio").style.backgroundColor="#FFA4A4";
	}else
	{document.getElementById("txtIneiAnio").style.backgroundColor="";}
}

function ValidaAnio5(){ 
  var dia = document.getElementById("DiaComp").value;
  var mes = document.getElementById("MesComp").value;
  var anio = document.getElementById("AnioComp").value; 
  
  if (anio<=1910){
	  $("#dialog").dialog("open");
	 document.getElementById("mensaje").innerHTML = 'A\xf1o incorrecto';
	 document.getElementById("AnioComp").style.backgroundColor="#FFA4A4";
	  return false;
	  } else {
		  document.getElementById("AnioComp").style.backgroundColor="";
		  }
  var fecha_actual = new Date();  
  
    var diaA = fecha_actual.getDate();   
    var mesA = fecha_actual.getMonth() + 1;   
    var anioA = fecha_actual.getFullYear(); 
  
  if(mes != '' && anio != '' && dia != '' ){
	   switch(parseInt(mes,10)){
              case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                    numDias=31;
                  break;
              case 4: case 6: case 9: case 11:
                  numDias=30;
                  break;
              case 2:
                 if (comprobarSiBisisesto(parseInt(anio))){ numDias=29 }else{ numDias=28};
                 break;
              default:
			  	$("#dialog").dialog("open");
				 document.getElementById("mensaje").innerHTML = 'Fecha introducida err\xf3nea';
				 document.getElementById("DiaComp").focus();	
				 return false;
          }
		  }
		  else {
			  	$("#dialog").dialog("open");
				 document.getElementById("mensaje").innerHTML = 'Ingrese el mes o el a\xf1o segun corresponda';
				 document.getElementById("DiaComp").value="";
				 return false;
		}
		  
  	if(anio < anioA || (anio == anioA && (mes < mesA || (mes == mesA && dia <= diaA)))) {
			document.getElementById("button1").disabled=false;
	}
	else {
			$("#dialog").dialog("open");
			document.getElementById("mensaje").innerHTML = 'Fecha introducida err\xf3nea';
	}
}

function  validaDJ(valor){
	  
		if (valor==0 || valor==2 ){
			$("#dialog").dialog("open");
			document.getElementById("mensaje").innerHTML = 'Usted est\xe1 descalificada para este proceso, es requisito que los datos consigandos correspondan a la verdad';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			return false;	
		}
		else {
			document.getElementById("cmbVeracidad").style.backgroundColor="";
			}	
}


function fs_numeros(e) {
	
        tecla = (document.all) ? e.keyCode : e.which; 

		if (tecla < 48 || tecla > 57) {
			return false;
			
		}
		
        if (tecla==8 || tecla!=13) return true;
}

function fs_numerosTel(e) {
	
	
        tecla = (document.all) ? e.keyCode : e.which; 
		if ((tecla < 48 || tecla > 57) && tecla != 45) {
			return false;
			
		}
        if (tecla==8 || tecla!=13) return true;
}

function fs_SoloLetrasLog(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 
			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209  && tecla != 45 && tecla != 39 )
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}

function fs_SoloLetras(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209  && tecla != 45)
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}


function fs_alfanumerico(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 
			
			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209 && tecla != 49 && tecla != 50 && tecla != 51 && tecla != 52 && tecla != 53 && tecla != 54 && tecla != 55 && tecla != 56 && tecla != 57 && tecla != 48 && tecla != 95 && tecla != 45)
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}


function fs_alfanumericoE(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 
			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209 && tecla != 49 && tecla != 50 && tecla != 51 && tecla != 52 && tecla != 53 && tecla != 54 && tecla != 55 && tecla != 56 && tecla != 57 && tecla != 48 && tecla != 64  && tecla != 95 && tecla != 45 && tecla != 46)
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}




function validadepa()
{ 
	
	var valUbigeo = document.getElementById('valUbigeo').value;
	var depa1 = document.getElementById('txtDpto1').value.substring(0,2);   
   	var depa2 = document.getElementById('txtDpto2').value.substring(0,2);  
	
	if 	(valUbigeo==1 || valUbigeo==2 || valUbigeo==3 || valUbigeo==5) {
	if (depa1!=15){
	
		if(depa1 != '0'){
		if(depa2 != depa1 )
		{
			
			$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'Deben de coincidir los Departamentos de postulaci\xf3n y de residencia';
				document.getElementById('txtDpto2').focus();
				document.getElementById("button1").disabled=true;
				document.getElementById("txtDpto2").style.backgroundColor="#FFA4A4";
		}   
		else
		{ 
		document.getElementById("txtDpto2").style.backgroundColor="";
		document.getElementById('txtDpto1').disabled=false;
		document.getElementById("button1").disabled=false;
		}
	  }
	} else {
		 if (depa2==15 || depa2==07 ){
				document.getElementById('txtDpto1').disabled=false;
				document.getElementById("button1").disabled=false;
				document.getElementById("txtDpto2").style.backgroundColor="";
			 }
			 else{
				 $("#dialog").dialog("open");
				 document.getElementById("mensaje").innerHTML = 'Deben de coincidir los Departamentos de postulaci\xf3n y de residencia';
				document.getElementById('txtDpto2').focus();
				document.getElementById("button1").disabled=true;
				document.getElementById("txtDpto2").style.backgroundColor="#FFA4A4";
				 }
		}
	
	}
	else {
		document.getElementById("txtDpto2").style.backgroundColor="";
		return false;
	}	
}


function validaProv()
{
	var val_sede=document.getElementById('val_sede').value;
	var valUbigeo = document.getElementById('valUbigeo').value;
	var prov1 = document.getElementById('txtProv1').value.substring(0,4);   
   	var prov2 = document.getElementById('txtProv2').value.substring(0,4); 
	var depa1 = document.getElementById('txtDpto1').value.substring(0,2);   
   	var depa2 = document.getElementById('txtDpto2').value.substring(0,2);  
	
	if (valUbigeo==2 || valUbigeo==3 ) {
		if (prov1==1602){return false;}
		else{	
			if(prov2 != '0701'  ){
				if(prov2 != prov1)
				{
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Deben de coincidir las Provincias de postulaci\xf3n y de residencia';
				document.getElementById('txtProv2').focus();
				document.getElementById("button1").disabled=true;	
				document.getElementById("txtProv2").style.backgroundColor="#FFA4A4";		
				}   
				else
				{ document.getElementById('txtProv2').disabled=false;
				document.getElementById("button1").disabled=false;
				document.getElementById("txtProv2").style.backgroundColor="";
			
				}
			}
		}
	}	
	else {
		return false;
		}
}


function validaDist()
{
	var valUbigeo = document.getElementById('valUbigeo').value.substring(0,2);
	var dist1 = document.getElementById('txtDist1').value;   
   	var dist2 = document.getElementById('txtDist2').value.substring(0,6); 
	
	if (valUbigeo==3){
		if(dist2 != dist1 )
		{
			$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Deben de coincidir los Distritos de postulaci\xf3n y de residencia';
				document.getElementById('txtDist2').focus();
				document.getElementById("button1").disabled=true;
				document.getElementById("txtDist2").style.backgroundColor="#FFA4A4";
		}   
			else
				{ document.getElementById('txtDist2').disabled=false;
				  document.getElementById("button1").disabled=false;
				  document.getElementById("txtDist2").style.backgroundColor="";
				}
		}
	 else {
		document.getElementById("txtDist2").style.backgroundColor="";
		return false;
	}
}


function f_aprobar2(){
	exper=document.getElementById("cmbInst").options[document.getElementById("cmbInst").selectedIndex].value
	if (exper=="2") 
	document.getElementById("txtProyecto").selectedIndex='';
}


function ValidaDia()
{ var dia = parseInt(document.getElementById("txtDia").value,10);         
	if(dia > 31){
		$("#dialog").dialog("open");
		 document.getElementById("mensaje").innerHTML = 'Registro de d\xeda err\xf3neo';	
         document.getElementById("txtDia").focus();
		 return false;
	}
}

function ValidaMes(){ 
  var mes = document.getElementById("txtMes").value;
  var dia = document.getElementById("txtDia").value;
  if(mes != ''){
     if(parseInt(mes,10) > 12){
		 $("#dialog").dialog("open");
		 document.getElementById("mensaje").innerHTML = 'Registro de mes err\xf3neo';	
         document.getElementById("txtMes").focus();		
		 return false;
		}
		mes = parseInt(mes,10)		
	   switch(mes){
	    
              case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                    numDias=31;
                  break;
              case 4: case 6: case 9: case 11:
                  numDias=30;
                  break;
              case 2:
                 numDias=29;
                 break;
              default:
			 		$("#dialog").dialog("open");
		 			document.getElementById("mensaje").innerHTML = 'Fecha introducida err\xf3nea, registre correctamente el n\xfamero de d\xedas de acuerdo al mes';
					document.getElementById("txtDia").focus();
		          return false;
          }    
		  if (parseInt(dia,10)>numDias || parseInt(dia,10)==0){
			  $("#dialog").dialog("open");
		 	  document.getElementById("mensaje").innerHTML = 'Fecha introducida err\xf3nea, registre correctamente el n\xfamero de d\xedas de acuerdo al mes';  
			document.getElementById("txtDia").focus(); 
            return false;
        }        
	}
}

function ValidaAnio2(){ 
  var mes = document.getElementById("txtMes2").value;
  var dia = document.getElementById("txtDia2").value;
  var anio = document.getElementById("txtAnio2").value; 
  var fecha_actual = new Date();   
  var anioA = fecha_actual.getFullYear(); 
		
		
  if (anio<=1910 || anio>anioA){
	  $("#dialog").dialog("open");
	  document.getElementById("mensaje").innerHTML = 'A\xf1o incorrecto';
	  document.getElementById("txtMes2").value="";
      document.getElementById("txtDia2").value="";
      document.getElementById("txtAnio2").value="";
	  return false
	  }
  var fecha_actual = new Date();  
  
    var diaA = fecha_actual.getDate();   
    var mesA = fecha_actual.getMonth() + 1;   
    var anioA = fecha_actual.getFullYear(); 
  
  if(mes != '' && anio != '' && dia != '' ){
	   switch(parseInt(mes,10)){
              case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                    numDias=31;
                  break;
              case 4: case 6: case 9: case 11:
                  numDias=30;
                  break;
              case 2:
                 if (comprobarSiBisisesto(parseInt(anio))){ numDias=29 }else{ numDias=28};
				  if (dia>numDias){
					 		$("#dialog").dialog("open");
	 						document.getElementById("mensaje").innerHTML = 'Registro de fecha err\xf3neo, no es a\xd1o bisiesto';
							document.getElementById("txtMes2").value="";
							document.getElementById("txtAnio2").value="";
							document.getElementById("txtDia2").focus();
							return false;
							}
                 break;
              default:
			  	$("#dialog").dialog("open");
	 			  document.getElementById("mensaje").innerHTML = 'Fecha introducida err\xf3nea';
                  document.getElementById("txtMes2").focus();		         
                  return false;
          }
		  }
		  else {
		$("#dialog").dialog("open");
	 	document.getElementById("mensaje").innerHTML = 'Ingrese el mes o el a\xf1o segun corresponda';
		document.getElementById("txtAnio2").value="";
		return false;
		}
		  
  	if(anio < anioA || (anio == anioA && (mes < mesA || (mes == mesA && dia <= diaA)))) {
			document.getElementById("button1").disabled=false;
	}
	else {
		$("#dialog").dialog("open");
	 	document.getElementById("mensaje").innerHTML = 'Fecha introducida err\xf3nea';
	}
}


function valor_mes(valor,id)
{
	if(valor>11)
	{
		$("#dialog").dialog("open");
	 	document.getElementById("mensaje").innerHTML = 'Mes incorrecto';
		document.getElementById(id).focus();
		
		}
	
	
	}

function acceptCorreo(obj){
	if (obj.value!="")
	{ 	
	patron = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
	if( !patron.test(obj.value) ){
		$("#dialog").dialog("open");
		document.getElementById("mensaje").innerHTML = 'Correo electr\xf3nico inv\xe1lido';	
		obj.style.backgroundColor="#FFA4A4";
		obj.focus();

	}  else {
		obj.style.backgroundColor=""
		}
	
	
	}
}


var primerslap=false; 
var segundoslap=false; 

function verificaFechaT (fecha, id){
	var long = fecha.length; 
	
	if (long<10 && long>=1){
		$("#dialog").dialog("open");
	 	document.getElementById("mensaje").innerHTML = 'Fecha Incorrecta';
		document.getElementById(id).value="";
		document.getElementById(id).style.backgroundColor="#FFA4A4";
		}
	else{
		document.getElementById(id).style.backgroundColor="";
		}
	}

function formateafecha(fecha) 

{ 

var long = fecha.length; 

var dia; 

var mes; 

var ano; 

function IsNumeric(valor) 

{ 

var log=valor.length; var sw="S"; 

for (x=0; x<log; x++) 

{ v1=valor.substr(x,1); 

v2 = parseInt(v1); 

//Compruebo si es un valor numérico 

if (isNaN(v2)) { sw= "N";} 

} 

if (sw=="S") {return true;} else {return false; } 

} 

if ((long>=2) && (primerslap==false)) { dia=fecha.substr(0,2); 

if ((IsNumeric(dia)==true) && (dia<=31) && (dia!="00")) { fecha=fecha.substr(0,2)+"/"+fecha.substr(3,7); primerslap=true; } 

else { fecha=""; primerslap=false;} 

} 

else 

{ dia=fecha.substr(0,1); 

if (IsNumeric(dia)==false) 

{fecha="";} 

if ((long<=2) && (primerslap=true)) {fecha=fecha.substr(0,1); primerslap=false; } 

} 

if ((long>=5) && (segundoslap==false)) 

{ mes=fecha.substr(3,2); 

if ((IsNumeric(mes)==true) &&(mes<=12) && (mes!="00")) { fecha=fecha.substr(0,5)+"/"+fecha.substr(6,4); segundoslap=true; } 

else { fecha=fecha.substr(0,3);; segundoslap=false;} 

} 

else { if ((long<=5) && (segundoslap=true)) { fecha=fecha.substr(0,4); segundoslap=false; } } 

if (long>=7) 

{ ano=fecha.substr(6,4); 

if (IsNumeric(ano)==false) { fecha=fecha.substr(0,6); } 

else { if (long==10){ if ((ano==0) || (ano<1900) || (ano>2100)) { fecha=fecha.substr(0,6); } } } 

} 



if (long>=10) 

{ 

fecha=fecha.substr(0,10); 

dia=fecha.substr(0,2); 

mes=fecha.substr(3,2); 

ano=fecha.substr(6,4); 

// Año no viciesto y es febrero y el dia es mayor a 28 

if ( (ano%4 != 0) && (mes ==02) && (dia > 28) ) { fecha=fecha.substr(0,2)+"/"; } 

if ( mes == 4 || mes == 6 || mes == 9 || mes == 11 ){ if (dia==31) fecha=fecha.substr(0,2)+"/"; }

} 

return (fecha); 

} 


function enter(e, flag){
	if (e.keyCode==13){
		if (flag==1){
			var obj = document.getElementById('txtDNII').value;   
   			if(obj.length < 8 ){	
				$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'N\xfamero ingresado incorrecto, el DNI tien 8 digitos';
				document.getElementById('txtDNII').focus();
			}
			else 
				document.getElementById("txtApePat").focus();
		}	
		if (flag==2 ){
			var obj = document.getElementById('txtApePat').value; 
			if(obj.length < 2 || obj=='' ){
				$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'Apellido Paterno incorrecto';
				document.getElementById("txtApePat").focus();
			} else
				document.getElementById("txtApeMat").focus();
			
		}	
		if (flag==3){
			var obj = document.getElementById('txtApeMat').value; 
			if(obj.length < 2 || obj=='' ){
				$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'Apellido Materno incorrecto';
				document.getElementById("txtApeMat").focus();
			} else
			document.getElementById("txtNombres").focus();
		}
		if (flag==4){
			var obj = document.getElementById('txtNombres').value; 
			if(obj.length < 2 || obj=='' ){
				$("#dialog").dialog("open");
	 			document.getElementById("mensaje").innerHTML = 'Nombre incorrecto';
				document.getElementById("txtNombres").focus();
			} else
			Validar();
		}
	}
}


function Validar() {
   var dni = document.getElementById('txtDNII').value;   
   var ape_pat = document.getElementById('txtApePat').value;   
   var ape_mat = document.getElementById('txtApeMat').value;   
   var nombres = document.getElementById('txtNombres').value;   
   var id_cc = document.getElementById('txtID_CC').value;  
   var id_proy = document.getElementById('id_proy').value;
   var txtFecEmi = document.getElementById('txtFecEmi').value;   

	/* if (id_cc == '3393' ) {
		alert('Convocatoria cerrada');
		return false;
		} */
	
   if (dni==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre su n\xfamero de DNI';
	   document.getElementById('txtDNII').focus();  
	   
	   return false;
	}
	
	if(dni.length < 8 ){	
				$("#dialog").dialog("open");
	  			document.getElementById("mensaje").innerHTML = 'N\xfamero ingresado incorrecto, el DNI tien 8 digitos';
				document.getElementById('txtDNII').style.backgroundColor="#FFA4A4";
				document.getElementById('txtDNII').focus(); 
				return false;
			}
	else{
		document.getElementById('txtDNII').style.backgroundColor="";
		} 
	
	if (ape_pat==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre su apellido paterno';
	   document.getElementById('txtApePat').style.backgroundColor="#FFA4A4";
	   document.getElementById('txtApePat').focus();  
	   return false;
	}
	else{
		document.getElementById('txtApePat').style.backgroundColor="";
		} 
	/*if (ape_mat==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre su apellido materno';
	   document.getElementById('txtApeMat').style.backgroundColor="#FFA4A4";
	   document.getElementById('txtApeMat').focus(); 
	   return false; 
	}
	else{
		document.getElementById('txtApeMat').style.backgroundColor="";
		} */
	if (nombres==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre su/s nombre/s';
	   document.getElementById('txtNombres').style.backgroundColor="#FFA4A4";
	   document.getElementById('txtNombres').focus();  
	   return false;
	}
	else{
		document.getElementById('txtNombres').style.backgroundColor="";
		}
	if (txtFecEmi==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre fecha de Emisi\xf3n';
	   document.getElementById('txtFecEmi').style.backgroundColor="#FFA4A4";
	   document.getElementById('txtFecEmi').focus();  
	   return false;
	}
	else{
		document.getElementById('txtFecEmi').style.backgroundColor="";
		}
		
	ajax=http_request();
	var valores;	
	valores= "dni=" + escape(dni)+"&ape_pat=" + escape(ape_pat)+"&ape_mat=" + escape(ape_mat)+"&nombres=" + escape(nombres)+"&id_cc=" + escape(id_cc)+"&id_proy=" + escape(id_proy)+"&txtFecEmi=" + escape(txtFecEmi);  // parametros a enviar al servidor	
	
	
	url="verificar_log.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
	
         if (ajax.readyState==1) {
         }
		 
         else if (ajax.readyState==4){

            if(ajax.status==200){
				
            	results = ajax.responseText.split("*");	
				if 	( results[0]  ==  "6" )	{
				   document.getElementById('msj').style.display='block';
				   document.getElementById("msj").innerHTML =results[1];
				}
				else if( results[0]  ==  "2"){
					var id=document.getElementById("id_proy").value;
					var dni = document.getElementById('txtDNII').value; 
				 	var ape_pat = document.getElementById('txtApePat').value;   
   				 	var ape_mat = document.getElementById('txtApeMat').value;   
   				  	var nombres = document.getElementById('txtNombres').value;
				  	document.getElementById('msj').style.display='none';
					document.getElementById("txtID_proyecto").value=results[1];
					
					if (results[1]==id){
						var dni2 = document.getElementById('txtDNII').value;   
				  		var id_cc2 = document.getElementById('txtID_CC').value; 
				  		var id_proy2 = document.getElementById('id_proy').value; 
						
						var pagina='';
						pagina='ficha.asp';

						
						abrirFicha(pagina, id_cc2, id_proy2,dni2,txtFecEmi,'','','');
					} 
					
					else{

						var dni2 = document.getElementById('txtDNII').value;   
				  		var id_cc2 = document.getElementById('txtID_CC').value; 
				  		var id_proy2 = document.getElementById('id_proy').value; 
						var pagina='';
						pagina='ficha.asp';
							
						abrirFicha(pagina, id_cc2, id_proy2,dni2,txtFecEmi, ape_pat, ape_mat, nombres);
					}
					
								
			  } 
			  else if ( results[0]  ==  "1"){
				  var id=document.getElementById("txtID_CC").value;
				  var id_proy = document.getElementById('id_proy').value;
				  var dni = document.getElementById('txtDNII').value; 
				  var ape_pat = document.getElementById('txtApePat').value;   
   				  var ape_mat = document.getElementById('txtApeMat').value;   
   				  var nombres = document.getElementById('txtNombres').value;
				  var pagina='';
						pagina='ficha.asp';
						abrirFicha(pagina, id, id_proy,dni,txtFecEmi, ape_pat, ape_mat, nombres);
			  	}  
			  else if (results[0]  ==  "10"){
				  var dni1 = document.getElementById('txtDNII').value;   
				  var id_cc1 = document.getElementById('txtID_CC').value;  
				  var id_proy1 = document.getElementById('id_proy').value; 
				  
				  var w= window.open("pd_confirmacion_test.asp?nocache="+Math.random()+"&dni="+escape(dni1)+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");	
					}
			  
			  else {
				   document.getElementById('msj').style.display='block';
				   document.getElementById("msj").innerHTML =ajax.responseText;
				  }		
            }
            else if(ajax.status==404){
                     document.getElementById("msj").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("msj").innerHTML = ajax.responseText;					
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 
}


function Validar_Inei() {
   var dni = document.getElementById('txtDNII').value;   
   var ape_pat = document.getElementById('txtApePat').value;   
   var ape_mat = document.getElementById('txtApeMat').value;   
   var nombres = document.getElementById('txtNombres').value;   
   var id_cc = document.getElementById('txtID_CC').value;  
   var id_proy = document.getElementById('id_proy').value;
   var txtFecEmi = document.getElementById('txtFecEmi').value;   
   
   if (dni==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre su n\xfamero de DNI';
	   document.getElementById('txtDNII').focus();  
	   
	   return false;
	}
	
	if(dni.length < 8 ){	
				$("#dialog").dialog("open");
	  			document.getElementById("mensaje").innerHTML = 'N\xfamero ingresado incorrecto, el DNI tien 8 digitos';
				document.getElementById('txtDNII').style.backgroundColor="#FFA4A4";
				document.getElementById('txtDNII').focus(); 
				return false;
			}
	else{
		document.getElementById('txtDNII').style.backgroundColor="";
		} 
	
	if (ape_pat==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre su apellido paterno';
	   document.getElementById('txtApePat').style.backgroundColor="#FFA4A4";
	   document.getElementById('txtApePat').focus();  
	   return false;
	}
	else{
		document.getElementById('txtApePat').style.backgroundColor="";
		} 
	/*if (ape_mat==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre su apellido materno';
	   document.getElementById('txtApeMat').style.backgroundColor="#FFA4A4";
	   document.getElementById('txtApeMat').focus(); 
	   return false; 
	}
	else{
		document.getElementById('txtApeMat').style.backgroundColor="";
		} */
	if (nombres==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre su/s nombre/s';
	   document.getElementById('txtNombres').style.backgroundColor="#FFA4A4";
	   document.getElementById('txtNombres').focus();  
	   return false;
	}
	else{
		document.getElementById('txtNombres').style.backgroundColor="";
		}
	if (txtFecEmi==''){
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Registre fecha de Emisi\xf3n';
	   document.getElementById('txtFecEmi').style.backgroundColor="#FFA4A4";
	   document.getElementById('txtFecEmi').focus();  
	   return false;
	}
	else{
		document.getElementById('txtFecEmi').style.backgroundColor="";
		}
		
	ajax=http_request();
	var valores;	
	valores= "dni=" + escape(dni)+"&ape_pat=" + escape(ape_pat)+"&ape_mat=" + escape(ape_mat)+"&nombres=" + escape(nombres)+"&id_cc=" + escape(id_cc)+"&id_proy=" + escape(id_proy)+"&txtFecEmi=" + escape(txtFecEmi);  // parametros a enviar al servidor	
	
	
	url="verificar_logINEI.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
	
         if (ajax.readyState==1) {
         }
		 
         else if (ajax.readyState==4){

            if(ajax.status==200){
				
            	results = ajax.responseText.split("*");	
				if 	( results[0]  ==  "6" )	{
				   document.getElementById('msj').style.display='block';
				   document.getElementById("msj").innerHTML =results[1];
				}
				else if( results[0]  ==  "2"){
					var id=document.getElementById("id_proy").value;
					var dni = document.getElementById('txtDNII').value; 
				 	var ape_pat = document.getElementById('txtApePat').value;   
   				 	var ape_mat = document.getElementById('txtApeMat').value;   
   				  	var nombres = document.getElementById('txtNombres').value;
				  	document.getElementById('msj').style.display='none';
					document.getElementById("txtID_proyecto").value=results[1];
					
					if (results[1]==id){
						var dni2 = document.getElementById('txtDNII').value;   
				  		var id_cc2 = document.getElementById('txtID_CC').value; 
				  		var id_proy2 = document.getElementById('id_proy').value; 
						
						var pagina='';
						pagina='ficha.asp';

						
						abrirFicha(pagina, id_cc2, id_proy2,dni2,txtFecEmi,'','','');
					} 
					
					else{

						var dni2 = document.getElementById('txtDNII').value;   
				  		var id_cc2 = document.getElementById('txtID_CC').value; 
				  		var id_proy2 = document.getElementById('id_proy').value; 
						var pagina='';
						pagina='ficha.asp';
							
						abrirFicha(pagina, id_cc2, id_proy2,dni2,txtFecEmi, ape_pat, ape_mat, nombres);
					}
					
								
			  } 
			  else if ( results[0]  ==  "1"){
				  var id=document.getElementById("txtID_CC").value;
				  var id_proy = document.getElementById('id_proy').value;
				  var dni = document.getElementById('txtDNII').value; 
				  var ape_pat = document.getElementById('txtApePat').value;   
   				  var ape_mat = document.getElementById('txtApeMat').value;   
   				  var nombres = document.getElementById('txtNombres').value;
				  var pagina='';
						pagina='ficha.asp';
						abrirFicha(pagina, id, id_proy,dni,txtFecEmi, ape_pat, ape_mat, nombres);
			  	}  
			  else if (results[0]  ==  "10"){
				  var dni1 = document.getElementById('txtDNII').value;   
				  var id_cc1 = document.getElementById('txtID_CC').value;  
				  var id_proy1 = document.getElementById('id_proy').value; 
				  var pagina='m_fich.asp'
				  abrirFicha(pagina, id_cc1, id_proy1,dni1,txtFecEmi, '', '', '');		
					}
			  
			  else {
				   document.getElementById('msj').style.display='block';
				   document.getElementById("msj").innerHTML =ajax.responseText;
				  }		
            }
            else if(ajax.status==404){
                     document.getElementById("msj").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("msj").innerHTML = ajax.responseText;					
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 
}



function abrirFicha(pagina, id_cc, id_proy,dni,txtFecEmi, ape_pat, ape_mat, nombres){
	
	ajax=http_request();
	var valores;	
	valores= "id_cc="+escape(id_cc)+"&id_proy="+escape(id_proy)+"&dni="+escape(dni) +"&txtFecEmi="+escape(txtFecEmi) +"&ape_pat="+escape(ape_pat)+"&ape_mat="+escape(ape_mat)+"&nombres="+escape(nombres) ;  // parametros a enviar al servidor	


window.location.href = pagina+"?nocache="+Math.random()+"&"+valores;

	/*url=pagina;  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                document.getElementById("contenido").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				document.getElementById("contenido").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                document.getElementById("contenido").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                document.getElementById("contenido").innerHTML =ajax.responseText;
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 
   */
}

function verifica_exp (id){

	if($("#"+id).is(':checked')) {  
		document.getElementById("desc_"+id).disabled=false;

        } else {  
            document.getElementById("desc_"+id).value="";  
			document.getElementById("desc_"+id).disabled=true;
        }
}

function verifica_exp_otro (id){

	if($("#"+id).is(':checked')) {  
		document.getElementById("desc_"+id).disabled=false;
		document.getElementById("otro_"+id).disabled=false;

        } else {  
            document.getElementById("desc_"+id).value="";  
			document.getElementById("otro_"+id).value="";  
			document.getElementById("desc_"+id).disabled=true;
			document.getElementById("otro_"+id).disabled=true;
        }
}

function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	var codig=varDpto.substring(0,2);
	var id_cc=document.getElementById("id_cc").value;
	
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&id_cc="+escape(id_cc);  // parametros a enviar al servidor	
	
	url="m_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov").innerHTML =ajax.responseText;
					
					
					verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("prov").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov").innerHTML = ajax.responseText;	
					 
								 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}

function generaprov_act(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	var codig=varDpto.substring(0,2);
	var id_cc=document.getElementById("id_cc").value;
	
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&id_cc="+escape(id_cc);  // parametros a enviar al servidor	
	
	url="m_Provincia_act.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov").innerHTML =ajax.responseText;
					
					
					verdis_act();
            }
            else if(ajax.status==404){
                     document.getElementById("prov").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov").innerHTML = ajax.responseText;	
					 
								 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}

function generaprov2(id){
     
	var varDpto_a =document.getElementById("txtDpto1").value; 
    var varDpto =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
    var valUbigeo=document.getElementById("valUbigeo").value;
	var val_sede=document.getElementById("val_sede").value;
	
	if (id==2) {
		if (varDpto=="" && valUbigeo==4 ){					
					return false;
			} 
		 if (varDpto!= "" && valUbigeo==4 )
		 {
			 $("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Recuerde que debe de residir en la sede de Postulaci\xf3n, en caso contrario no podr\xe1 continuar con el registro de la ficha';
			 document.getElementById("txtDpto2").value="";
			 document.getElementById("txtProv2").value="";
			 document.getElementById("txtDist2").value="";
			 document.getElementById("txtDpto2").focus();
			 return false;
			 }
		}
	
	if (id==1) {
		if (varDpto_a=="" && valUbigeo==4 ){
			document.getElementById('txtSede').focus();
			document.getElementById("txtDpto2").value="";
			$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione la sede de residencia';
					
					return false;
			} 
		 if (varDpto_a!= "" && valUbigeo==4 )
		 {
			 $("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Recuerde que debe de residir en la sede de Postulaci\xf3n, en caso contrario no podr\xe1 continuar con el registro de la ficha';
			 }
		
		
		
		ajax=http_request();
		var valores;	
		
		valores= "datos=" + escape(varDpto)+"&valUbigeo="+valUbigeo+"&val_sede="+val_sede;  // parametros a enviar al servidor	
	
		
		url="m_Provincia2.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
					 document.getElementById("prov2").innerHTML ="<span class=etiqueta>Cargando......</span>";
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){
														
						document.getElementById("prov2").innerHTML =ajax.responseText;
						verdis2();
				}
				else if(ajax.status==404){
						 document.getElementById("prov2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else{
	
						 document.getElementById("prov2").innerHTML = ajax.responseText;					 
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
	   return;	
	}
}



function verdis(){

    var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m_Distrito.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("dist").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("dist").innerHTML =ajax.responseText;//}
						var tipo=document.getElementById("valUbigeo").value;
						if (tipo!="5"){
						verdis3();}
						
						
            }
            else if(ajax.status==404){
                     document.getElementById("dist").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function verdis_act(){

    var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m_Distrito_act.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("dist").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("dist").innerHTML =ajax.responseText;//}
						var tipo=document.getElementById("valUbigeo").value;
						if (tipo!="5"){
						verdis3();}
						
						
            }
            else if(ajax.status==404){
                     document.getElementById("dist").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function verdis3(){

    
    var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m_Distrito3.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("distcon").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("distcon").innerHTML =ajax.responseText;//}
					
            }
            else if(ajax.status==404){
                     document.getElementById("distcon").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("distcon").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function verdis2(){
    
    var varProv =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
    var valUbigeo=document.getElementById("valUbigeo").value;
	var val_sede=document.getElementById("val_sede").value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&valUbigeo="+valUbigeo+"&val_sede="+val_sede;  // parametros a enviar al servidor	
	
	url="m_Distrito2.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dist2").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dist2").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("dist2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist2").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function generaprov3(){
     
    var varDpto =document.getElementById("txtDpto3").options[document.getElementById("txtDpto3").selectedIndex].value;

    
	ajax=http_request();
	var valores;	
	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	

	
	url="m_Provincia3.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov3").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov3").innerHTML =ajax.responseText;
					verdis4();
            }
            else if(ajax.status==404){
                     document.getElementById("prov3").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov3").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function verdis4(){
    var varProv =document.getElementById("txtProv3").options[document.getElementById("txtProv3").selectedIndex].value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m_Distrito4.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("dist4").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("dist4").innerHTML =ajax.responseText;//}
            }
            else if(ajax.status==404){
                     document.getElementById("dist4").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist4").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	

}

function verificadist()
{
   var dist1 = document.getElementById('txtDist1').value;   
   var dist2 = document.getElementById('txtDist3').value;   
   var ver_tambo=document.getElementById("ver_tambo").value;  
   
   var valUbigeo=document.getElementById("valUbigeo").value;  
   
   if(valUbigeo=="5"){
	   $("#dialog").dialog("open");
		document.getElementById("mensaje").innerHTML = 'Por favor, seleccione la direcci\xf3n de local que se encuentre mas cerca a su domicilio';
		verSubdistrito();
	}

	if(dist1 != '0' && dist2 !=''){
		if(dist2 != dist1 )
		{
		   $("#dialog").dialog("open");
		   document.getElementById("mensaje").innerHTML = 'Los Distritos no coinciden';	
		   document.getElementById("button1").disabled=true;
		   document.getElementById('txtDist1').style.backgroundColor="#FFA4A4";
		   document.getElementById('txtDist3').style.backgroundColor="#FFA4A4";
		   document.getElementById('txtDist1').focus();
		}   
		else
		{ 	document.getElementById('txtDist1').disabled=false;
			document.getElementById("button1").disabled=false;
			document.getElementById('txtDist1').style.backgroundColor="";
		    document.getElementById('txtDist3').style.backgroundColor="";
			
			if(ver_tambo=="1"){
				listar_tambos(dist2);
			}
		}
  	}
}

function validanac(valor) { 
if (valor==4028){	
	document.getElementById("txtDpto3").disabled = false;
	}else 
		{
			document.getElementById("txtDpto3").disabled = true;
			document.getElementById("txtProv3").disabled=true;
			document.getElementById("txtDist4").disabled=true;
		}
}


function listar_tambos(ubigeo){
	
	ajax=http_request();
	var valores;	
	valores= "ubigeo=" + escape(ubigeo);  // parametros a enviar al servidor	
	
	url="m_tambos.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("divTambo").innerHTML ="<span class=etiqueta>Cargando......</span>"; 
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("divTambo").innerHTML =ajax.responseText;					
            }
            else if(ajax.status==404){
                     document.getElementById("divTambo").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divTambo").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;		
}

function verSede_ece(datos) {
	
	document.getElementById("div_sedes_ece").style.display="";
	
	//desc_sede
	
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(datos);  // parametros a enviar al servidor	
	
	url="m_desc_sede.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("desc_sede").innerHTML ="<span class=etiqueta>Cargando......</span>"; 
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("desc_sede").innerHTML =ajax.responseText;
						
            }
            else if(ajax.status==404){
                     document.getElementById("desc_sede").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("desc_sede").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}


function verSubdistrito(){
	
	document.getElementById("div_sedes_ece").style.display="none";
	var datos=document.getElementById("txtDist1").value;

	
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(datos);  // parametros a enviar al servidor	
	
	url="m_local_ece.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("subDistrito").innerHTML ="<span class=etiqueta>Cargando......</span>"; 
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("subDistrito").innerHTML =ajax.responseText;
						
            }
            else if(ajax.status==404){
                     document.getElementById("subDistrito").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("subDistrito").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	

}

function comprobarSiBisisesto(anio){
if ( ( anio % 100 != 0) && ((anio % 4 == 0) || (anio % 400 == 0))) {
    return true;
    }
else {
    return false;
    }
}



function ValidaAnio(){ 
  var mes = document.getElementById("txtMes").value;
  var dia = document.getElementById("txtDia").value;
  var anio = document.getElementById("txtAnio").value; 
  
  if (mes=="" || dia=="" || anio==""){
		return false;
	} 
	else{

		var fecha_actual = new Date(); 
		var diaA = fecha_actual.getDate();   
		var mesA = fecha_actual.getMonth() + 1;   
		var anioA = fecha_actual.getFullYear(); 
		
	  
	  if(mes != '' && anio != '' && dia != '' ){
		 if(parseInt(mes,10) > 12){
			 $("#dialog").dialog("open");
		     document.getElementById("mensaje").innerHTML = 'Registro de mes err\xf3neo';	
		     document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
			 document.getElementById("txtMes").focus();		
			 return false;
			} else {
				document.getElementById("txtMes").style.backgroundColor=""
				}
		   switch(parseInt(mes,10)){
				  case 1: case 3: case 5: case 7: case 8: case 10: case 12:
						numDias=31;
					  break;
				  case 4: case 6: case 9: case 11:
						numDias=30;
					  break;
				  case 2:
					 if (comprobarSiBisisesto(parseInt(anio))){ numDias=29 }else{ numDias=28};
					 if (dia>numDias){
						 	
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registro de fecha err\xf3neo, no es a\xF1o bisiesto';	
							document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
							document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
							document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
							document.getElementById("txtMes").value="";
							document.getElementById("txtAnio").value="";
							document.getElementById("txtDia").focus();
							return false;
							} else {
							document.getElementById("txtDia").style.backgroundColor="";
							document.getElementById("txtMes").style.backgroundColor="";
							document.getElementById("txtAnio").style.backgroundColor="";
							}
					 break;
				  default:
				  	$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Registro de d\xeda err\xf3neo';	
				    document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
					document.getElementById("txtDia").focus();		         
					return false;
			  }
			  
				hoy=new Date() 
				edad=hoy.getYear()- anio - 1; //-1 porque no se si ha cumplido años ya este año 
				if (hoy.getMonth() + 1 - mes < 0) //+ 1 porque los meses empiezan en 0 
				   edad1= edad 
				if (hoy.getMonth() + 1 - mes > 0) 
				   edad1= edad+1 
				if (hoy.getUTCDate() - dia >= 0) 
				   edad1= edad + 1 
			
				var flag = false;
	
				if((anioA-anio)<18 || (anioA-anio)>81) flag=true;
				if((anioA-anio)==18 && mes > mesA) flag=true; 
				if((anioA-anio)==90 && mes < mesA) flag=true;
				if((anioA-anio)==18 && mes == mesA && dia > diaA) flag=true;
				if((anioA-anio)==90 && mes == mesA && dia <= diaA) flag=true;
										  
				if(flag){
					$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'No cumple con el perfil por ser menor de edad o superar los 90 a\xF1os';	
				    document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
					document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
					document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
					document.getElementById("txtDia").value="";
					document.getElementById("txtMes").value="";
					document.getElementById("txtAnio").value="";
					document.getElementById("txtDia").focus();	
					return false;
			}	else {
					document.getElementById("txtDia").style.backgroundColor="";
					document.getElementById("txtMes").style.backgroundColor="";
					document.getElementById("txtAnio").style.backgroundColor="";
				}   
			
			 var flag2= 0;
			 if( anio>1973 ) flag2=1;
			 if( anio>1973 && parseInt(mes,10) >= 8) flag2=1; 
				document.getElementById("button1").disabled=false;

			}else {
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Ingrese el mes o el a\xf1o segun corresponda';	
				    document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
					document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
					document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
					document.getElementById("txtAnio").value="";
					return false;
		}
	}
}

function genera_grado(valor){
	id_cc=escape(document.getElementById("id_cc").value);
	
	ajax=http_request();
	var valores;	
	valores= "nivel=" + escape(valor)+"&id_cc="+escape(id_cc);  // parametros a enviar al servidor	
	
	url="m_Grado.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("idGrado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("idGrado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("idGrado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("idGrado").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}



function validar_ano(valor)
{	
	f = new Date();
	if(valor>f.getFullYear()){
			$("#dialog").dialog("open");
		    document.getElementById("mensaje").innerHTML = 'Error en el registro del a\xf1o';
			document.getElementById("txtIneiAnio").value="";
			document.getElementById("txtIneiAnio").focus();
	}
}


function ValidarRUC() {
   lngruc=document.getElementById("txtRUC").value.length;
	if(lngruc <11 && lngruc>0)
	{
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'El n\xfamero de RUC debe de ser de 11 d\xedgitos';
	   document.getElementById("txtRUC").style.backgroundColor="#FFA4A4";
	   document.getElementById("button1").disabled=true;
	   document.getElementById("txtRUC").focus();
 
    }   
	else
	{ 
		document.getElementById('txtRUC').disabled=false;
		document.getElementById("button1").disabled=false;
		document.getElementById("txtRUC").style.backgroundColor="";

	}

}


function ValidarRUC2() {
   var dni1 = document.getElementById('txtRUC').value;   
   var dni2 = document.getElementById('txtRUC2').value;   

	if(dni2 != ''){
	if(dni1 != dni2 )
	{
	   $("#dialog").dialog("open");
	   document.getElementById("mensaje").innerHTML = 'Los RUCs no coniciden';
	   document.getElementById("txtRUC").style.backgroundColor="#FFA4A4";
	   document.getElementById("txtRUC2").style.backgroundColor="#FFA4A4";
	   document.getElementById("button1").disabled=true;
 
    }   
	else
	{ document.getElementById('txtRUC2').disabled=false;
	  document.getElementById("txtRUC").style.backgroundColor="";
	   document.getElementById("txtRUC2").style.backgroundColor="";
	  document.getElementById("button1").disabled=false;

	}
  }
}


function verSP(valor){
	if (valor=="0" || valor=="2"){
		document.getElementById("txtTipoPension").disabled=true;
		document.getElementById("txtFCUSSP").disabled=true;
		document.getElementById("verificaFechaT").disabled=true;
		document.getElementById("txtComision").disabled=true;
		document.getElementById("txtAFP").disabled=true;
		
		document.getElementById("txtTipoPension").value="";
		document.getElementById("txtFCUSSP").value="";
		document.getElementById("verificaFechaT").value="";
		document.getElementById("txtComision").value="";
		document.getElementById("txtAFP").value="";
		}
	else {
		document.getElementById("txtTipoPension").disabled=false;
		}
	}
	
function validaPension(valor) {
	
	if (valor=="") {
		document.getElementById("txtAFP").disabled=true;
		document.getElementById("txtAFP").disabled=true;
		document.getElementById("txtAFP").value="";
		document.getElementById("txtFCUSSP").value="";
	}
	
	else if (valor=="19990"){
		document.getElementById("txtAFP").value="";
		document.getElementById("txtAFP").disabled=true;
		
	 	document.getElementById("txtFecAfiliacion").value="";
		document.getElementById("txtFecAfiliacion").disabled=true;
		
		document.getElementById("txtFCUSSP").value="";
		document.getElementById("txtFCUSSP").disabled=true;
		
		document.getElementById("txtComision").value="";
		document.getElementById("txtComision").disabled=true;
		}
	else {
		document.getElementById("txtAFP").disabled=false;
		document.getElementById("txtFecAfiliacion").disabled=false;
		document.getElementById("txtFCUSSP").disabled=false;
		document.getElementById("txtComision").disabled=false;
		} 
}


function valida_nivel3(valor)
{

       nivel=parseInt(valor)
                         
	if ( nivel == 3)
      {
              document.getElementById("cmbTipoEstudios").value='0';
              document.getElementById("cmbGrado").value='';
              document.getElementById("txtperioalc").value='';
              document.getElementById("cmbPeriodo").value='0';
              document.getElementById("cmbTipoEstudios").disabled = true;
			  document.getElementById("cmbGrado").disabled=true;
              document.getElementById("txtperioalc").disabled = true;
              document.getElementById("cmbPeriodo").disabled=true;
			  document.getElementById("cmbUniversidad").value="0";
              document.getElementById("cmbUniversidad").disabled = true;
              document.getElementById("txtLugEst").disabled = false;
              document.getElementById("txtDia2").value = "";
              document.getElementById("txtMes2").value = "";
              document.getElementById("txtAnio2").value = "";
              document.getElementById("txtDia2").disabled = true;
              document.getElementById("txtMes2").disabled = true;
              document.getElementById("txtAnio2").disabled = true;
           }

     if ( nivel ==4)
        {
          document.getElementById("txtLugEst").value=""
          document.getElementById("txtLugEst").disabled=true
          document.getElementById("txtperioalc").value='';
          document.getElementById("cmbPeriodo").value='0';
          document.getElementById("cmbTipoEstudios").disabled = false;
          document.getElementById("cmbGrado").disabled = false;
          document.getElementById("txtperioalc").disabled = false;
          document.getElementById("cmbPeriodo").disabled = false;
		  document.getElementById("cmbUniversidad").value="0"
          document.getElementById("cmbUniversidad").disabled = false;
          document.getElementById("cmbTipoEstudios").value='1'
         document.getElementById("txtDia2").disabled = false;
          document.getElementById("txtMes2").disabled = false;
          document.getElementById("txtAnio2").disabled = false;
            }              
                                                                 
     if ( nivel ==5)
       {
		 document.getElementById("txtDia2").value = "";
         document.getElementById("txtMes2").value = "";
         document.getElementById("txtAnio2").value = "";
         document.getElementById("txtDia2").disabled = true;
         document.getElementById("txtMes2").disabled = true;
         document.getElementById("txtAnio2").disabled = true;
         document.getElementById("txtperioalc").value = '';
         document.getElementById("cmbPeriodo").value='0';
         document.getElementById("cmbTipoEstudios").value='2'
         document.getElementById("cmbUniversidad").value="0"
         document.getElementById("cmbUniversidad").disabled = true;
         document.getElementById("txtLugEst").disabled = false;
         document.getElementById("cmbGrado").disabled = false;
         document.getElementById("txtDia2").disabled = false;
         document.getElementById("txtMes2").disabled = false;
         document.getElementById("txtAnio2").disabled = false;
         }
}


function cambiarText (opcion,valor,objeto) {
	oObj = document.getElementById(objeto);
	if (opcion=="1") {
		if (valor=="3") {
			oObj.disabled = false;
			oObj.focus();
		} else {
			oObj.value = "";
			oObj.disabled = true;
		}
	}
	if (opcion=="2") {
		if (valor=="1") {
			oObj.disabled = false;
			document.getElementById("txtIneiAnio").disabled = false;
			document.getElementById("txtCargoInei").disabled = false;
			oObj.focus();
		} else {
			oObj.value = "";
			document.getElementById("txtIneiAnio").value = "";
			oObj.disabled = true;
			document.getElementById("txtIneiAnio").disabled = true;
			document.getElementById("txtCargoInei").disabled = true;
		}
	}
	if (opcion=="3") {
		if (valor=="1") {
			oObj.disabled = false;
			oObj.focus();
		} else {
			oObj.value = "";
			oObj.disabled = true;
		}
	}
}



function ValidaAnio2E(ID){ 

	if (ID==2){
	  var mes = document.getElementById("MIcurso").value;
	  var dia = document.getElementById("DIcurso").value;
	  var anio = document.getElementById("AIcurso").value; 
	  
	  	diaD= document.getElementById("DIcurso");
		mesF = document.getElementById("MIcurso");
		anioD = document.getElementById("AIcurso");
		
	}
	if (ID==3){
	  var mes = document.getElementById("MFcurso").value;
	  var dia = document.getElementById("DFcurso").value;
	  var anio = document.getElementById("AFcurso").value; 
	  
	  	diaD= document.getElementById("DFcurso");
		mesF = document.getElementById("MFcurso");
		anioD = document.getElementById("AFcurso");
	}
	
		
	if (ID==4){
	  var mes = document.getElementById("MIcursoOf").value;
	  var dia = document.getElementById("DIcursoOf").value;
	  var anio = document.getElementById("AIcursoOf").value; 
	  
	    diaD= document.getElementById("DIcursoOf");
		mesF = document.getElementById("MIcursoOf");
		anioD = document.getElementById("AIcursoOf");
	}
	if (ID==5){
	  var mes = document.getElementById("MFcursoOf").value;
	  var dia = document.getElementById("DFcursoOf").value;
	  var anio = document.getElementById("AFcursoOf").value; 
	  
	    diaD= document.getElementById("DFcursoOf");
		mesF = document.getElementById("MFcursoOf");
		anioD = document.getElementById("AFcursoOf");
	}
	
  var fecha_actual = new Date();   
  var anioA = fecha_actual.getFullYear(); 
		
		
  if (anio<=1910 || anio>anioA){
	  $("#dialog").dialog("open");
	  document.getElementById("mensaje").innerHTML = 'A\xf1o incorrecto';
	  anioD.value="";
	  anioD.focus();
	  return false
	  }
  var fecha_actual = new Date();  
  
    var diaA = fecha_actual.getDate();   
    var mesA = fecha_actual.getMonth() + 1;   
    var anioA = fecha_actual.getFullYear(); 
  
  if(mes != '' && anio != '' && dia != '' ){
	   switch(parseInt(mes,10)){
              case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                    numDias=31;
                  break;
              case 4: case 6: case 9: case 11:
                  numDias=30;
                  break;
              case 2:
                 if (comprobarSiBisisesto(parseInt(anio))){ numDias=29 }else{ numDias=28};
				  if (dia>numDias){
					  		$("#dialog").dialog("open");
	  						document.getElementById("mensaje").innerHTML = 'Registro de fecha err\xf3neo, no es a\xd1o bisiesto';
							diaD.focus();
							mesF.value="";
							anioD.value="";
							return false;
							}
                 break;
              default:
			  	  $("#dialog").dialog("open");
	  			  document.getElementById("mensaje").innerHTML = 'Fecha introducida err\xf3nea';
				  diaD.value="";
	    		  mesF.value="";
			      anioD.value="";
                  mesF.focus();		         
                  return false;
          }
		  }
		  else {
		$("#dialog").dialog("open");
	  	document.getElementById("mensaje").innerHTML = 'Ingrese el mes o el a\xf1o segun corresponda';	  
		diaD.value="";
	    mesF.value="";
	    anioD.value="";
		diaD.focus();
		return false;
		}
		  
  	if(anio < anioA || (anio == anioA && (mes < mesA || (mes == mesA && dia <= diaA)))) {
			document.getElementById("button1").disabled=false;
	}
	else {
		$("#dialog").dialog("open");
	  	document.getElementById("mensaje").innerHTML = 'Fecha introducida err\xf3nea';	 
		diaD.value="";
	    mesF.value="";
	    anioD.value="";
		diaD.focus();
	}
}


function  validaDis(valor){
	
		if (valor==0 || valor==2 ){
			$("#dialog").dialog("open");
	  		document.getElementById("mensaje").innerHTML = 'Usted est\xe1 descalificada para este proceso, es requisito contar con disponibilidad a tiempo completo';
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	

}




function validaArchivo (valor){
	extensiones_permitidas = new Array(".pdf"); 
	//document.getElementById("id_convocatoria").value=window.parent.document.getElementById("id_cc").value;
	//document.getElementById("archivActual").value=valor;
   	mierror = ""; 
	
	if (valor==1){
		var archivo1=document.getElementById("file1").value;
	
		if (archivo1==""){
			$("#dialog").dialog("open");
	  	    document.getElementById("mensaje").innerHTML = 'Por favor, adjunte documento que acredite experiencia solicitada.';	  
			return false;

		} else{
			var a=0;
			var extension1 = (archivo1.substring(archivo1.lastIndexOf("."))).toLowerCase(); 
			for (var i = 0; i < extensiones_permitidas.length; i++) { 
         		if (extensiones_permitidas[i] == extension1) { 
					a=1;
         			//permitida = true; 
         			break; 
         		} 
      		} 
			
			if (a==0){
				mierror = "Comprueba la extensi\xf3n del archivo. \nS\xf3lo se pueden subir archivos con extensi\xf3n: " + extensiones_permitidas.join();
				$("#dialog").dialog("open");
	  	        document.getElementById("mensaje").innerHTML = mierror;
				 return false;
			} else {
			//	document.getElementById("a1f").innerHTML="Cargando...";
				document.getElementById("NumA").value="1";
				document.getElementById("NomArchivo").value=archivo1;
				window.parent.document.getElementById("a1").value="1";
				document.frmMisArchivos.submit();
			}
			
		}
		
	}
	
		
	else if (valor==2){
		var archivo2=document.getElementById("file2").value;
		
		if (archivo2==""){
			$("#dialog").dialog("open");
	  	    document.getElementById("mensaje").innerHTML = 'Por favor, adjunte imagen de su DNI';	  
			return false;

		}else{
			var b=0;
			var extension2 = (archivo2.substring(archivo2.lastIndexOf("."))).toLowerCase(); 
			for (var i = 0; i < extensiones_permitidas.length; i++) { 
         		if (extensiones_permitidas[i] == extension2) { 
					b=1;
         			//permitida = true; 
         			break; 
         		} 
      		}
			if (b==0){
				mierror = "Comprueba la extensi\xf3n del archivo. \nS\xf3lo se pueden subir archivos con extensi\xf3n: " + extensiones_permitidas.join(); 
				 $("#dialog").dialog("open");
	  	        document.getElementById("mensaje").innerHTML = mierror;
				 return false;
			} else {
			//	document.getElementById("a2f").innerHTML="Cargando...";
				document.getElementById("NumA").value="2";
		  		document.getElementById("NomArchivo").value=archivo2;
				window.parent.document.getElementById("a2").value="1";
				document.frmMisArchivos.submit();
			}
		}
		
	}
	
	
	else{
		var archivo3=document.getElementById("file3").value;
		
		if (archivo3==""){
			$("#dialog").dialog("open");
	  	    document.getElementById("mensaje").innerHTML = 'Por favor, adjunte la \xd3ltima constancia de estudios';
			return false;

		} else {
			var extension3 = (archivo3.substring(archivo3.lastIndexOf("."))).toLowerCase(); 
			var c=0;
			for (var i = 0; i < extensiones_permitidas.length; i++) { 
         		if (extensiones_permitidas[i] == extension3) { 
					c=1;
         			//permitida = true; 
         			break; 
         		} 
      		} 
			
			if (c==0){
				mierror = "Comprueba la extensi\xf3n del archivo. \nS\xf3lo se pueden subir archivos con extensi\xf3n: " + extensiones_permitidas.join(); 
				 $("#dialog").dialog("open");
	  	        document.getElementById("mensaje").innerHTML = mierror;
				 return false;
			} else {
				//document.getElementById("a3f").innerHTML="Cargando...";
				document.getElementById("NumA").value="3";
				window.parent.document.getElementById("a3").value="1";
				document.getElementById("NomArchivo").value=archivo3;
				document.frmMisArchivos.submit();
			}	
		}
		
	}		
}

function ver_cv(id){
	dni=document.getElementById("txtDNIA").value;
	id_proyecto=document.getElementById("id_proyectoA").value;
	pagina="archivo.asp?nocache="+Math.random()+"&id_proy="+id_proyecto+"&dni="+dni+"&id="+id;
	win = window.open(pagina,'','_blank');
}

function cargarDNI(){
	var proyecto=window.parent.document.getElementById("id_proyecto").value;
	document.getElementById("id_proyectoA").value=proyecto;
	
	var dni=window.parent.document.getElementById("txtDNI").value;
	document.getElementById("txtDNIA").value=dni;
	
	var a1=window.parent.document.getElementById("a1").value;

	var a2=window.parent.document.getElementById("a2").value;
	
	var a3=window.parent.document.getElementById("a3").value;
	
	var a11=document.getElementById("a11").value;

	var a22=document.getElementById("a22").value;
	
	var a33=document.getElementById("a33").value;
		
	if (a1==1 && a11==1){
		$("#dialog").dialog("open");
	   	document.getElementById("mensaje").innerHTML = 'El archivo se cargo correctamente';			
	} else if (a1==1 && a11==0){
		$("#dialog").dialog("open");
	   	document.getElementById("mensaje").innerHTML = 'Problemas al cargar el Archivo, puede guardar la ficha y volver a cargar el archivo consultando su inscripci\xf3n.';
	} 
	
	
	if (a2==1 && a22==1){
		$("#dialog").dialog("open");
			document.getElementById("mensaje").innerHTML="El archivo se cargo correctamente";	
	} else if (a2==1 && a22==0){
		$("#dialog").dialog("open");
			document.getElementById("mensaje").innerHTML="Problemas al cargar el Archivo, puede guardar la ficha y volver a cargar el archivo consultando su inscripci\xf3n. ";
		}
	
	
	if (a3==1 && a33==1 ){
		$("#dialog").dialog("open");
			document.getElementById("mensaje").innerHTML="El archivo se cargo correctamente";
	} else if (a3==1 && a33==0 ) {
		$("#dialog").dialog("open");
		document.getElementById("mensaje").innerHTML="Problemas al cargar el Archivo, puede guardar la ficha y volver a cargar el archivo consultando su inscripci\xf3n.";
		}
}


function registrarUbigeo (valor){
	
	
	document.getElementById("val_sede").value=valor.substring(0,2);

	document.getElementById("txtDpto1").value=valor.substring(3,5);
	document.getElementById("txtProv1").value=valor.substring(3,7);
	document.getElementById("txtDist1").value=valor.substring(3,9);
	document.getElementById("txtDist3").value=valor.substring(3,9);
	
}

				
function grabarFicha(existe){

if (confirm("¿Esta seguro(a) que desea registrar sus datos?")) {

	var cv=document.getElementById("Adjuntar_cv").value;

	if (cv==1){
		a1=1
	    a2=1
	    a3=1
		}
	else {
		var a1=document.getElementById("a1").value;
		var a2=document.getElementById("a2").value;
		var a3=document.getElementById("a3").value;
	}

	if (a1==0){
		$("#dialog").dialog("open");
	   	document.getElementById("mensaje").innerHTML = 'Adjunte documento que acredite experiencia solicitada.';
		return false;
	}
	
	if (a2==0){
		$("#dialog").dialog("open");
	   	document.getElementById("mensaje").innerHTML = 'Adjunte imagen de su DNI';
		return false;
	}
	
		if (a3==0){
		$("#dialog").dialog("open");
	   	document.getElementById("mensaje").innerHTML = 'Adjunte \xfaltima certificaci\xf3n de nivel acad\xe9mico alcanzado';
		return false;
	}

		var lsIdConvCargo=document.getElementById("id_cc").value;
		var valUbigeo=document.getElementById("valUbigeo").value;
		var txtSede=document.getElementById("txtSede").value;
		
		if (valUbigeo=="4")	{
			//txtSede
			if (txtSede == "") {
				document.getElementById("txtSede").focus();
				document.getElementById("txtSede").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione la sede de Postulaci\xf3n';
					return false;
			} else  document.getElementById("txtSede").style.backgroundColor="";
			}
		else{
			if (document.getElementById("txtDpto1").value == "") {
				document.getElementById("txtDpto1").focus();
				document.getElementById("txtDpto1").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione el Departamento de inscripci\xf3n';
				return false;
			} else  document.getElementById("txtDpto1").style.backgroundColor="";
			
			if (document.getElementById("txtProv1").value == "" || document.getElementById("txtProv1").value == "le" ) {
				document.getElementById("txtProv1").focus();
				document.getElementById("txtProv1").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione la Provincia de inscripci\xf3n';
				return false;
			} else  document.getElementById("txtProv1").style.backgroundColor="";
			
			if (document.getElementById("txtDist1").value == "" || document.getElementById("txtDist1").value == "cc") {
				document.getElementById("txtDist1").focus();
				document.getElementById("txtDist1").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione el Distrito de inscripci\xf3n';
				return false;
			} else  document.getElementById("txtDist1").style.backgroundColor="";
		}
		
var subDistrito="0";
		if (valUbigeo==5){
				if (document.getElementById("txtSubDistrito").value=="0"){
					document.getElementById("txtSubDistrito").focus();
					document.getElementById("txtSubDistrito").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione Local de UGEL';
					return false;
				}
				else {
					document.getElementById("txtSubDistrito").style.backgroundColor=""; 
					subDistrito=document.getElementById("txtSubDistrito").value;
				}
		}
		
		
		if (document.getElementById("ver_tambo").value=="1"){
			if (document.getElementById("txtTambo").value=="0")	{
				document.getElementById("txtTambo").focus();
				document.getElementById("txtTambo").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione Tambo';
				return false;
			}
			else {
				 document.getElementById("txtTambo").style.backgroundColor=""; 
				}
		}
		
		
		
		
		
		if (document.getElementById("txtApePaterno").value.length < 2) {
			document.getElementById("txtApePaterno").focus();
			document.getElementById("txtApePaterno").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Apellido Paterno v\xe1lido';
			return false;
		} else document.getElementById("txtApePaterno").style.backgroundColor=""; 
		
		/*if (document.getElementById("txtApeMaterno").value == "") {
			document.getElementById("txtApeMaterno").focus();
			document.getElementById("txtApeMaterno").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Apellido Materno v\xe1lido';
			return false;
		} else document.getElementById("txtApeMaterno").style.backgroundColor="";*/
		
		//if (document.getElementById("txtApeMaterno").value.length < 2) {
		//	alert("Ingrese Apellido Materno v\xe1lido");
		//	document.getElementById("txtApeMaterno").focus();
		//	return false;
		//} else document.getElementById("txtApeMaterno").style.backgroundColor="";
		
		if (document.getElementById("txtNombre1").value == "" || document.getElementById("txtNombre1").value.length < 2) {
			document.getElementById("txtNombre1").focus();
			document.getElementById("txtNombre1").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Nombre v\xe1lido';
			return false;
		} else document.getElementById("txtNombre1").style.backgroundColor="";
		
		if (document.getElementById("txtDNI").value == "" || document.getElementById("txtDNI").value.length < 8) {
			document.getElementById("txtDNI").focus();
			document.getElementById("txtDNI").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese n\xfamero de DNI v\xe1lido';
			return false;
		} else document.getElementById("txtDNI").style.backgroundColor="";
		
		if (!validarNumero(document.getElementById("txtDNI").value)) {
			document.getElementById("txtDNI").focus();
			document.getElementById("txtDNI").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese n\xfamero de DNI v\xe1lido';
			return false;
		}
		
		if (document.getElementById("cmbSexo").value == "") {
			document.getElementById("cmbSexo").focus();
			document.getElementById("cmbSexo").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Seleccione su sexo';
			return false;
		} else document.getElementById("cmbSexo").style.backgroundColor="";	
		
		if (document.getElementById("cmbpais").value == "0") {
			document.getElementById("cmbpais").focus();
			document.getElementById("cmbpais").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Seleccione el pais de Nacimiento';
			return false;
		} else document.getElementById("cmbpais").style.backgroundColor="";		
		
		
		if (document.getElementById("cmbpais").value == "4028") {
			
			if(document.getElementById("txtDpto3").value=="0" || document.getElementById("txtDpto3").value=="" )
			{
				document.getElementById("txtDpto3").focus();
				document.getElementById("txtDpto3").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Seleccione el Departamento de Nacimiento';
				return false;
			}  else document.getElementById("txtDpto3").style.backgroundColor="";	
			
			if(document.getElementById("txtProv3").value=="0" || document.getElementById("txtProv3").value=="" || document.getElementById("txtProv3").value=="le")
			{
				document.getElementById("txtProv3").focus();
				document.getElementById("txtProv3").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Seleccione la provincia de Nacimiento';
				return false;
			} else document.getElementById("txtProv3").style.backgroundColor="";	
			
			if(document.getElementById("txtDist4").value=="0" || document.getElementById("txtDist4").value=="" || document.getElementById("txtDist4").value=="cc")
			{
				document.getElementById("txtDist4").focus();

				document.getElementById("txtDist4").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Seleccione la distrito de Nacimiento';
				return false;
			} else document.getElementById("txtDist4").style.backgroundColor="";	
		}	
		
		oDia = document.getElementById("txtDia");
		oMes = document.getElementById("txtMes");
		oAnio = document.getElementById("txtAnio");
		
		/*-RNP VALIDACIONES-*/
		//Solo para cuando tiene flag RNP 
		ls_rnp = "0";
		if($("#txtRnP").is(':checked')){
			ls_rnp = "1";
			}
		
		
			
		
		if (document.getElementById("valRnP").value=="1") {
			
			if( ls_rnp == "0")
			{
			
			document.getElementById("txtRnP").focus();
			document.getElementById("txtRnP").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Debe de contar con el RNP';
			return false;
			}
		}
		
		//Solo para cuando tiene flag RNP valida las fechas
		if( ls_rnp == "1") {
			if ( document.getElementById("txtfechainirnp").value=="" ) 
			 {
			
			document.getElementById("txtfechainirnp").focus();
			document.getElementById("txtfechainirnp").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese FECHA Inicio RNP';
			return false;
		} else { document.getElementById("txtfechainirnp").style.backgroundColor="";};
		
		if ( document.getElementById("txtfechafinrnp").value=="" ) 
			 {
			
			document.getElementById("txtfechafinrnp").focus();
			document.getElementById("txtfechafinrnp").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese FECHA Fin RNP';
			return false;
		} else {document.getElementById("txtfechafinrnp").style.backgroundColor="";};
		
		}
		
		//Rango de Fechas
		if(ls_rnp == "1") {
			if ( document.getElementById("txtfechainirnp").value!="" &&  document.getElementById("txtfechafinrnp").value!="" ) 
			{
				if ( Date.parse(document.getElementById("txtfechainirnp").value)>Date.parse(document.getElementById("txtfechafinrnp").value) ) 
				{$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Fecha de inicio rnp debe ser menor a la fin';
			return false;
					
					}
				}
		}
		
			
		/*-RNP FIN VALIDACIONES-*/	
		
		var txtexpad_anio_1 =document.getElementById("txtexpad_anio_1").value;
		var txtexpad_anio_2 =document.getElementById("txtexpad_anio_2").value;
		var txtexpad_meses_1 =document.getElementById("txtexpad_meses_1").value;
		var txtexpad_meses_2 =document.getElementById("txtexpad_meses_2").value;
		
		
		
		if (oDia.value.length < 2) {
			oDia.focus();
			document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtDia").style.backgroundColor="";	
		if (oMes.value.length < 2) {
			oMes.focus();
			document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtMes").style.backgroundColor="";	
		if (oMes.value == "00" || oMes.value > "12") {
			oMes.focus();
			document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtMes").style.backgroundColor="";
		if (parseInt(oMes.value) == 1 || parseInt(oMes.value) == 3 || parseInt(oMes.value) == 5 || parseInt(oMes.value) == 7 || parseInt(oMes.value) == 8 || parseInt(oMes.value) == 10 || parseInt(oMes.value) == 12) {
			if (parseInt(oDia.value) > 31) {
				oDia.focus();
				document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
				return false;
			} else document.getElementById("txtDia").style.backgroundColor="";
		}
		if (parseInt(oMes.value) == 4 || parseInt(oMes.value) == 6 || parseInt(oMes.value) == 9 || parseInt(oMes.value) == 11) {
			if (parseInt(oDia.value) > 30) {
				oDia.focus();
				document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
				return false;
			} else document.getElementById("txtDia").style.backgroundColor="";
		}
		if (oAnio.value.length < 4) {
			oAnio.focus();
			document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtAnio").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (anioA - parseInt(oAnio.value) <18) {
			oAnio.focus();
			document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'El a\xf1o no corresponde a un mayor de edad';
			return false;
		} else document.getElementById("txtAnio").style.backgroundColor="";
		if (anioA - parseInt(oAnio.value)>90) {
			oAnio.focus();
			document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A&ntilde;o de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtAnio").style.backgroundColor="";
		
		if (parseInt(oMes.value) == 2) {
			if (parseInt(oAnio.value) % 4 == 0) {
				if (parseInt(oDia.value) > 29) {
					oDia.focus();
					document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
					return false;
				} else document.getElementById("txtDia").style.backgroundColor="";
			} else {
				if (parseInt(oDia.value) > 28) {
					oDia.focus();
					document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
					return false;
				} else document.getElementById("txtDia").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(oDia.value)) {
			oDia.focus();
			document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtDia").style.backgroundColor="";
		
		if (!validarNumero(oMes.value)) {
			oMes.focus();
			document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtMes").style.backgroundColor="";
		
		if (!validarNumero(oAnio.value)) {
			oAnio.focus();
			document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtAnio").style.backgroundColor="";	

		if (document.getElementById("valRuc").value=="2") {
			
			if (document.getElementById("txtRUC").value==""){
				 $("#dialog").dialog("open");
	   	    	document.getElementById("mensaje").innerHTML = 'El registro del RUC es obligatorio para este proceso';
				document.getElementById("txtRUC").style.backgroundColor="#FFA4A4";
				}
				else 
					document.getElementById("txtRUC").style.backgroundColor="";
					
			if (document.getElementById("txtRUC2").value==""){
				 $("#dialog").dialog("open");
	   	    	document.getElementById("mensaje").innerHTML = 'El registro de la confirmaci\xf3n del RUC es obligatorio';
				document.getElementById("txtRUC2").style.backgroundColor="#FFA4A4";
				}
				else 
					document.getElementById("txtRUC2").style.backgroundColor="";
		}
		
		   		
		if (document.getElementById("txtECivil").value == "0") {
			document.getElementById("txtECivil").focus();
			document.getElementById("txtECivil").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione estado civil';
			return false;
		} else document.getElementById("txtECivil").style.backgroundColor="";
		
		if (document.getElementById("cmbHijoUnico").value == "") {
			document.getElementById("cmbHijoUnico").focus();
			document.getElementById("cmbHijoUnico").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione informaci\xf3n sobre si es hijo \xfanico';
			return false;
		} else document.getElementById("cmbHijoUnico").style.backgroundColor="";	
		
		if (document.getElementById("cmbJefeHogar").value == "") {
			document.getElementById("cmbJefeHogar").focus();
			document.getElementById("cmbJefeHogar").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione informaci\xf3n sobre si es hijo \xfanico';
			return false;
		} else document.getElementById("cmbJefeHogar").style.backgroundColor="";		
		
		if (document.getElementById("cmbLengMat").value == "") {
			document.getElementById("cmbLengMat").focus();
			document.getElementById("cmbLengMat").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione informaci\xf3n sobre su cual es la lengua materna que aprendi\xf3 en su ni\xdaez';
			return false;
		} else document.getElementById("cmbLengMat").style.backgroundColor="";
		
		if (document.getElementById("cmbLeng").value == "") {
			document.getElementById("cmbLeng").focus();
			document.getElementById("cmbLeng").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione Lengua originaria';
			return false;
		} else document.getElementById("cmbLeng").style.backgroundColor="";

		if (document.getElementById("cmbIdiomaC").value !=0 && document.getElementById("cmbNivelIdioma").value =="" ) {
			document.getElementById("cmbNivelIdioma").focus();
			document.getElementById("cmbNivelIdioma").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione nivel de conocimiento de otro idioma';
			return false;
		} else document.getElementById("cmbNivelIdioma").style.backgroundColor="";

		if (document.getElementById("cmbIdiomaC").value !=0 && document.getElementById("cmbDomIdioma").value =="" ) {
			document.getElementById("cmbDomIdioma").focus();
			document.getElementById("cmbDomIdioma").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione dominio de conocimiento de otro idioma';
			return false;
		}

		/*	
		if (txtSiDescuento=="1"){
			
			if (txtSIPension=="0"){
				alert("Seleccione Si esta afiliado a un sistema de Pensiones");
					document.getElementById("txtSIPension").focus();
					return false;
				}
			
			if (txtSIPension=="1"){
				if (document.getElementById("txtTipoPension").value==""){
					alert("Seleccione Tipo de pensi\xf3n al que est\xe1 afiliado");
					document.getElementById("txtTipoPension").focus();
					return false;					
				} else{
					if (document.getElementById("txtAFP").value=="" && document.getElementById("txtTipoPension").value=="AFP" ){
						alert('Seleccione la AFP al que se ha afiliado');
						document.getElementById("AFP").focus();
						return false;
						}
						
					if (document.getElementById("txtFCUSSP").value=="" && document.getElementById("txtTipoPension").value=="AFP" ){

						alert('Registre el n\xfamero de CUSSP (C\xf3digo de Afiliado)');
						document.getElementById("txtFCUSSP").focus();
						return false;
						}
					if (document.getElementById("txtFecAfiliacion").value=="" && document.getElementById("txtTipoPension").value=="AFP" ){
						alert('Registre Fecha de afiliaci\xf3n');
						document.getElementById("txtFecAfiliacion").focus();
						return false;
						}
					}
			}
		
		} */
		

		if (document.getElementById("txtTelefono").value == "" && document.getElementById("txtCelular").value == "") {
			document.getElementById("txtTelefono").focus();
			document.getElementById("txtTelefono").style.backgroundColor="#FFA4A4";
			document.getElementById("txtCelular").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Registre un n\xfamero de tel\xe9fono fijo o celular ';
			return false;
		} else {
			document.getElementById("txtTelefono").style.backgroundColor="";
			document.getElementById("txtCelular").style.backgroundColor="";
		}
		

		if (document.getElementById("txtTelefono").value != "" && document.getElementById("cmbOperTel").value == "") {
			document.getElementById("cmbOperTel").focus();
			document.getElementById("cmbOperTel").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbOperTel").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Registre Operador Celular';
			return false;
		} else {
			document.getElementById("cmbOperTel").style.backgroundColor="";
			document.getElementById("cmbOperTel").style.backgroundColor="";
		}
		
		
		
		if (document.getElementById("valCorreo").value == "2" && document.getElementById("txtEmail").value == "") {
			document.getElementById("txtEmail").focus();
			document.getElementById("txtEmail").style.backgroundColor="#FFA4A4";
			document.getElementById("txtEmail").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Debe registrar su correo electronico';
			return false;
		} else {
			document.getElementById("txtEmail").style.backgroundColor="";
			document.getElementById("txtEmail").style.backgroundColor="";
		}
		
		
		if (document.getElementById("cmbTipovia").value == "") {
			document.getElementById("cmbTipovia").focus();
			document.getElementById("cmbTipovia").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione tipo de via';
			return false;
		} else document.getElementById("cmbTipovia").style.backgroundColor="";
				
		if (document.getElementById("txtNomVia").value == "") {
			document.getElementById("txtNomVia").focus();
			document.getElementById("txtNomVia").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Ingrese el nombre de la v\xeda donde reside';
			return false;
		} else document.getElementById("txtNomVia").style.backgroundColor="";	
		
  		if (document.getElementById("cmbZona").value == "0") {
			document.getElementById("cmbZona").focus();
			document.getElementById("cmbZona").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione la Zona de la residencia';
			return false;
		} else document.getElementById("cmbZona").style.backgroundColor="";	
		
		
		if (document.getElementById("txtNomZona").value == "") {
			document.getElementById("txtNomZona").focus();
			document.getElementById("txtNomZona").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Ingrese el nombre de la Zona';
			return false;
		} else document.getElementById("txtNomZona").style.backgroundColor="";	


		var lsNumPuerta = document.getElementById("txtNumPuerta").value;
		var lsNumKilometro = document.getElementById("txtNumKilometro").value;
		var lsNumManzana = document.getElementById("txtNumManzana").value;
		var lsNumInterior = document.getElementById("txtNumInterior").value;
		var lsDepa = document.getElementById("txtdepa").value;
		var lsNumPiso = document.getElementById("txtNumPiso").value;
		var lsNumLote = document.getElementById("txtNumLote").value;
					
		if (lsNumPuerta=="" && lsNumKilometro=="" && lsNumManzana=="" && lsNumInterior=="" && lsDepa=="" && lsNumPiso==""  && lsNumLote=="" ){
			
			document.getElementById("txtNumPuerta").focus();
			document.getElementById("txtNumPuerta").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Registre datos de residencia (Nro de puerta, kilometro, manzana, interior, lote, etc)';
			return false;
		}
		else document.getElementById("txtNumPuerta").style.backgroundColor="";
				

		if (document.getElementById("txtDpto2").value == "0" || document.getElementById("txtDpto2").value == "" ) {
				document.getElementById("txtDpto2").focus();
				document.getElementById("txtDpto2").style.backgroundColor="#FFA4A4";
		   		$("#dialog").dialog("open");
	   	    	document.getElementById("mensaje").innerHTML = 'Seleccione el departamento de residencia';
				return false;
		} else document.getElementById("txtDpto2").style.backgroundColor="";
			
		if (document.getElementById("txtProv2").value == "" || document.getElementById("txtProv2").value == "0" || document.getElementById("txtProv2").value == "le") {
			document.getElementById("txtProv2").focus();
			document.getElementById("txtProv2").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione la provincia de residencia';
			return false;
		} else document.getElementById("txtProv2").style.backgroundColor="";
		
		if (document.getElementById("txtDist2").value == "0" || document.getElementById("txtDist2").value == "" || document.getElementById("txtDist2").value == "le") {
			document.getElementById("txtDist2").focus();
			document.getElementById("txtDist2").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione el distrito de residencia';
			return false;
		} else document.getElementById("txtDist2").style.backgroundColor="";		
				
if (document.getElementById("ver_centroPob").value=="1"){
			if (document.getElementById("cmbUbicacion").value=="0" || document.getElementById("cmbUbicacion").value=="" ){
				document.getElementById("cmbUbicacion").focus();
				document.getElementById("cmbUbicacion").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione Ubicaci\xf3n de su Vivienda';
				return false;
			} else {
					document.getElementById("cmbUbicacion").style.backgroundColor="";
				}
				
			if (document.getElementById("cmbUbicacion").value=="2" ){
				if (document.getElementById("txtCentroPob").value=="0" ){
					document.getElementById("txtCentroPob").focus();
					document.getElementById("txtCentroPob").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione centro poblado donde reside';
					return false;
				}	
				else {
					document.getElementById("txtCentroPob").style.backgroundColor="";
					}
			}
		}			
		
		if (parseInt(document.getElementById("cmbNivelInstr").value) == 0  ) {
			document.getElementById("cmbNivelInstr").focus();
			document.getElementById("cmbNivelInstr").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione Nivel de Instrucci\xf3n';
			return false;
		} else document.getElementById("cmbNivelInstr").style.backgroundColor="";	
		
		
		if ((document.getElementById("cmbNivelInstr").value=='04' || document.getElementById("cmbNivelInstr").value=='05' || document.getElementById("cmbNivelInstr").value=='4' || document.getElementById("cmbNivelInstr").value=='5' ) && document.getElementById("txtperioalc").value=='' ) {
			document.getElementById("txtperioalc").focus();
			document.getElementById("txtperioalc").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Ingrese el Periodo';
			return false;

		} else document.getElementById("txtperioalc").style.backgroundColor="";	
		
		if ((document.getElementById("cmbNivelInstr").value=='04' || document.getElementById("cmbNivelInstr").value=='05' || document.getElementById("cmbNivelInstr").value=='4' || document.getElementById("cmbNivelInstr").value=='5' ) && document.getElementById("cmbPeriodo").value=='0' ) {
			document.getElementById("cmbPeriodo").focus();
			document.getElementById("cmbPeriodo").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione el tipo de Periodo';
			return false;
		} else document.getElementById("cmbPeriodo").style.backgroundColor="";	
		
		
		if (parseInt(document.getElementById("cmbNivelInstr").value)>3 && document.getElementById("cmbGrado").value=='0' ) {
		document.getElementById("cmbGrado").focus();
		document.getElementById("cmbGrado").style.backgroundColor="#FFA4A4";
		$("#dialog").dialog("open");
	   	document.getElementById("mensaje").innerHTML = 'Seleccione el Grado Alcanzado';
		return false;
		} else document.getElementById("cmbGrado").style.backgroundColor="";	
		
		if ((parseInt(document.getElementById("cmbGrado").value) >=3 && parseInt(document.getElementById("cmbGrado").value) <=6 ) && (document.getElementById("txtNum_reg_grado").value=='') ) {
			document.getElementById("txtNum_reg_grado").focus();
			document.getElementById("txtNum_reg_grado").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese el registro de Expedici\xf3n del grado';
			return false;
		} else document.getElementById("txtNum_reg_grado").style.backgroundColor="";	
		
		if ((parseInt(document.getElementById("cmbGrado").value) >=3 && parseInt(document.getElementById("cmbGrado").value) <=6) && (document.getElementById("txtDia2").value=='' || document.getElementById("txtMes2").value=='' ||  document.getElementById("txtAnio2").value=='' ) ) {
			document.getElementById("txtDia2").focus();
			document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
			document.getElementById("txtMes2").style.backgroundColor="#FFA4A4";
			document.getElementById("txtAnio2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingresa la fecha de expedici\xf3n del grado alcanzado';
			return false;
		} else 
			{document.getElementById("txtDia2").style.backgroundColor="";
			 document.getElementById("txtMes2").style.backgroundColor="";
			 document.getElementById("txtAnio2").style.backgroundColor="";	
			}
		
		if (parseInt(document.getElementById("cmbGrado").value) >=3 && parseInt(document.getElementById("cmbGrado").value) <=6) {
		
		o2Dia = document.getElementById("txtDia2");
		o2Mes = document.getElementById("txtMes2");
		o2Anio = document.getElementById("txtAnio2");
		
		if (o2Dia.value.length < 2) {
			o2Dia.focus();
			document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese D\xeda de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtDia2").style.backgroundColor="";
		
		if (o2Mes.value.length < 2) {
			o2Mes.focus();
			document.getElementById("txtMes2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtMes2").style.backgroundColor="";
		
		if (o2Mes.value == "00" || o2Mes.value > "12") {
			o2Mes.focus();
			document.getElementById("txtMes2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de expedici\xf3n de grado v\xe1lido';
			return false;
		}else document.getElementById("txtMes2").style.backgroundColor="";
		
		if (parseInt(o2Mes.value) == 1 || parseInt(o2Mes.value) == 3 || parseInt(o2Mes.value) == 5 || parseInt(o2Mes.value) == 7 || parseInt(o2Mes.value) == 8 || parseInt(o2Mes.value) == 10 || parseInt(o2Mes.value) == 12) {
			if (parseInt(o2Dia.value) > 31) {
				o2Dia.focus();
				document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
				return false;
			} else document.getElementById("txtDia2").style.backgroundColor="";
		}
		if (parseInt(o2Mes.value) == 4 || parseInt(o2Mes.value) == 6 || parseInt(o2Mes.value) == 9 || parseInt(o2Mes.value) == 11) {
			if (parseInt(o2Dia.value) > 30) {
				o2Dia.focus();
				document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
				return false;
			} else document.getElementById("txtDia2").style.backgroundColor="";
		}
		if (o2Anio.value.length < 4) {
			o2Anio.focus();
			document.getElementById("txtAnio2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtAnio2").style.backgroundColor="";
		
			
		if (parseInt(o2Mes.value) == 2) {
			if (parseInt(o2Anio.value) % 4 == 0) {
				if (parseInt(o2Dia.value) > 29) {
					o2Dia.focus();
					document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";

					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
					return false;
				} else document.getElementById("txtDia2").style.backgroundColor="";
			} else {
				if (parseInt(o2Dia.value) > 28) {
					o2Dia.focus();
					document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
					return false;
				} else document.getElementById("txtDia2").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(o2Dia.value)) {
			o2Dia.focus();
			document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtDia2").style.backgroundColor="";
		
		if (!validarNumero(o2Mes.value)) {
			o2Mes.focus();
			document.getElementById("txtMes2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtMes2").style.backgroundColor="";
		
		if (!validarNumero(o2Anio.value)) {
			o2Anio.focus();
			document.getElementById("txtAnio2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtAnio2").style.backgroundColor="";
	}
		
	var id_proyecto=document.getElementById("id_proyecto").value;
		if (id_proyecto==42 && (lsIdConvCargo==773 || lsIdConvCargo==774)){
		
			if ( document.getElementById("prof_ednom").value=="0"){
				
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione la carrera y/o Profesi\xf3n';
				document.getElementById("prof_ednom").style.backgroundColor="#FFA4A4";
				document.getElementById("prof_ednom").focus();
				return false;
			} else {
				
				if (document.getElementById("cmbProfesion").value == "0" && document.getElementById("prof_ednom").value=="3"){
					$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione la otra ocupaci\xf3n y/o Profesi\xf3';
					document.getElementById("cmbProfesion").style.backgroundColor="#FFA4A4";
					document.getElementById("cmbProfesion").focus();
					
				} else document.getElementById("cmbProfesion").style.backgroundColor="";
				
				if (document.getElementById("especialidad_ednom").value== "" && document.getElementById("prof_ednom").value=="1"){
					$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Anote su especialidad como educador';
					document.getElementById("especialidad_ednom").style.backgroundColor="#FFA4A4";
					document.getElementById("especialidad_ednom").focus();
					return false;
				} else document.getElementById("especialidad_ednom").style.backgroundColor="";
			}
		} else{
			if (document.getElementById("cmbProfesion").value == "0" ) {
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione la Profesi\xf3n';
					document.getElementById("cmbProfesion").style.backgroundColor="#FFA4A4";
					document.getElementById("cmbProfesion").focus();
					return false;
			} else document.getElementById("cmbProfesion").style.backgroundColor="";
		}
		
		if (document.getElementById("cmbUniversidad").value == "0" && document.getElementById("txtLugEst").value == "" ) {
			document.getElementById("txtLugEst").focus();
			document.getElementById("txtLugEst").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese \xf2 Seleccione la Universidad \xf2 el Centro de Estudios';
			return false;
		} else document.getElementById("txtLugEst").style.backgroundColor="";
		
		
		var annio_exp=parseInt(document.getElementById("txtAnio2").value);
		var txtAnio=parseInt(document.getElementById("txtAnio").value);
		
		if (annio_exp<txtAnio+17)
		{
			
			document.getElementById("txtAnio2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
			document.getElementById("txtAnio2").focus();
	   		document.getElementById("mensaje").innerHTML = 'El a\xf1o de expedici\xf3n de grado no puede ser menor o tan cercano al a\xf1o de nacimiento';
			return false;
		} else document.getElementById("txtAnio2").style.backgroundColor="";
		
	
	var ConvCargo=document.getElementById("id_cc").value;
	
	var GenInst=document.getElementById("txtExpGenInst").value;
	var GenFef=document.getElementById("txtExpGenFec").value;
	var GenAnio=document.getElementById("txtExpGenAnio").value;
	var GenMeses=document.getElementById("txtExpGenMeses").value;
	
	
	
	var GrupoInst=document.getElementById("txtExpGrupoInst").value;
	var GrupoFec=document.getElementById("txtExpGrupoFec").value;
	var GrupoAnio=document.getElementById("txtExpGrupoAnio").value;
	var GrupoMeses=document.getElementById("txtExpGrupoMeses").value;
	
	
	var CampoInst=document.getElementById("txtExpCampoInst").value;
	var CampoFef=document.getElementById("txtExpCampoFef").value;
	var CampoAnio=document.getElementById("txtExpCampoAnio").value;
	var CampoMeses=document.getElementById("txtExpCampoMeses").value;

	/*-RNP-*/
	var flag_rnp="0";
	if($("#txtRnP").is(':checked')){
				 flag_rnp= "1";
			}
			
	var fechainirnp=document.getElementById("txtfechainirnp").value;
	var fechafinrnp=document.getElementById("txtfechafinrnp").value;




		var valida2= document.getElementById("valExpGen2").value;
		if (valida2=="1"){
			if ( (GrupoAnio=="" && GrupoMeses=="") || GrupoAnio=="0" || GrupoMeses=="0"){
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Registre correctamente el tiempo de labores de la Experiencia solicitada';
					document.getElementById("txtExpGrupoAnio").style.backgroundColor="#FFA4A4";
					document.getElementById("txtExpGrupoAnio").focus();
					return false;
			} else {
				document.getElementById("txtExpGrupoAnio").style.backgroundColor="";
				}
		}
		
		
		var valida1= document.getElementById("valExpGen1").value;
		if (valida1=="1"){	
			if ( (CampoAnio=="" && CampoMeses=="") || CampoAnio=="0" || CampoMeses=="0" ){
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Registre correctamente el tiempo de labores de la Experiencia solicitada';
					document.getElementById("txtExpCampoAnio").style.backgroundColor="#FFA4A4";
					document.getElementById("txtExpCampoAnio").focus();
					return false;
			} else {
				document.getElementById("txtExpCampoAnio").style.backgroundColor="";
				}
		}
		
		var valida3= document.getElementById("valExpGen3").value;
		if (valida3=="1"){	
			if ( (GenAnio=="" && GenMeses=="") ||  GenAnio=="0" || GenMeses=="0"){
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Registre correctamente el tiempo de labores de la Experiencia solicitada';
					document.getElementById("txtExpGenAnio").style.backgroundColor="#FFA4A4";
					document.getElementById("txtExpGenAnio").focus();
					return false;
			} else {
				document.getElementById("txtExpGenAnio").style.backgroundColor="";
				}	
		}
	
		var validarCap1 = document.getElementById("validarCap1").value;
		if (validarCap1==2) {
			if 	(document.getElementById("txtCurso").value == "" ){
				document.getElementById("txtCurso").focus();
				document.getElementById("txtCurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Registre \xdaltima capacitaci\xf3n Profesional';
				return false;
			} else document.getElementById("txtCurso").style.backgroundColor="";
	
		}	

		
		var val_exp_especifica= document.getElementById("val_exp_especifica").value;
		 if (val_exp_especifica==0){
			 var mod_edu_1= 0;
			var mod_edu_2= 0;
			var mod_edu_3= 0;
			var mod_edu_4= 0;
			var mod_edu_5= 0;
			var mod_edu_6= 0;
			var mod_cod_1= 0;
			var mod_cod_2= 0;
			var mod_cod_3= 0;
			var desc_mod_edu_1= "";
			var desc_mod_edu_2= "";
			var desc_mod_edu_3= "";
			var desc_mod_edu_4= "";
			var desc_mod_edu_5= "";
			var desc_mod_edu_6= "";
			var otro_mod_edu_5= "";
			var otro_mod_edu_6= "";
			var desc_mod_cod_1= "";
			var desc_mod_cod_2= "";
			var desc_mod_cod_3= "";

			 }
		 else {
			 
			var mod_edu_1= 0; // listo
			var mod_edu_2= 0; // listo
			var mod_edu_3= 0;
			var mod_edu_4= 0;
			var mod_edu_5= 0;
			var mod_edu_6= 0;
			var mod_cod_1= 0; //listo
			var mod_cod_2= 0;
			var mod_cod_3= 0;
			var desc_mod_edu_1= "";  // listo
			var desc_mod_edu_2= "";  // listo
			var desc_mod_edu_3= "";
			var desc_mod_edu_4= "";
			var desc_mod_edu_5= "";
			var desc_mod_edu_6= "";
			var otro_mod_edu_5= "";
			var otro_mod_edu_6= "";
			var desc_mod_cod_1= "";  // listo
			var desc_mod_cod_2= "";
			var desc_mod_cod_3= "";

			
			
			var val_mod_edu_1 = document.getElementById("val_mod_edu_1").value; 
			
			if (val_mod_edu_1==1) {
				if($("#mod_edu_1").is(':checked')) {  
            		mod_edu_1=1;  
				} 
				if (mod_edu_1==1){
					desc_mod_edu_1= document.getElementById("desc_mod_edu_1").value;
					if (desc_mod_edu_1==""){
						document.getElementById("desc_mod_edu_1").focus();
						document.getElementById("desc_mod_edu_1").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 labores de Coordinaci\xf3n o Supervisi\xf3n ';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_1").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_edu_2 = document.getElementById("val_mod_edu_2").value; 
			
			if (val_mod_edu_2==1) {
				if($("#mod_edu_2").is(':checked')) {  
            		mod_edu_2=1;  
				} 
				if (mod_edu_2==1){
					desc_mod_edu_2= document.getElementById("desc_mod_edu_2").value;
					if (desc_mod_edu_2==""){
						document.getElementById("desc_mod_edu_2").focus();
						document.getElementById("desc_mod_edu_2").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Capacitaci\xf3n ';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_2").style.backgroundColor="";
						}		
				}
			}
			
			
			var val_mod_cod_1 = document.getElementById("val_mod_cod_1").value; 
			
			if (val_mod_cod_1==1) {
				if($("#mod_cod_1").is(':checked')) {  
            		mod_cod_1=1;  
				} 
				if (mod_cod_1==1){
					desc_mod_cod_1= document.getElementById("desc_mod_cod_1").value;
					if (desc_mod_cod_1==""){
						document.getElementById("desc_mod_cod_1").focus();
						document.getElementById("desc_mod_cod_1").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n de experiencia en Elaboraci\xf3n de Pruebas Estandarizadas';
						return false;
					}	
					else {
						document.getElementById("desc_mod_cod_1").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_cod_2 = document.getElementById("val_mod_cod_2").value; 
			
			if (val_mod_cod_2==1) {
				if($("#mod_cod_2").is(':checked')) {  
            		mod_cod_2=1;  
				} 
				if (mod_cod_2==1){
					desc_mod_cod_2= document.getElementById("desc_mod_cod_2").value;
					if (desc_mod_cod_2==""){
						document.getElementById("desc_mod_cod_2").focus();
						document.getElementById("desc_mod_cod_2").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Capacitaci\xf3n ';
						return false;
					}	
					else {
						document.getElementById("desc_mod_cod_2").style.backgroundColor="";
						}		
				}
			}
			
			
			var val_mod_cod_3 = document.getElementById("val_mod_cod_3").value; 
			
			if (val_mod_cod_3==1) {
				if($("#mod_cod_3").is(':checked')) {  
            		mod_cod_3=1;  
				} 
				if (mod_cod_3==1){
					desc_mod_cod_3= document.getElementById("desc_mod_cod_3").value;
					if (desc_mod_cod_3==""){
						document.getElementById("desc_mod_cod_3").focus();
						document.getElementById("desc_mod_cod_3").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Capacitaci\xf3n ';
						return false;
					}	
					else {
						document.getElementById("desc_mod_cod_3").style.backgroundColor="";
						}		
				}
			}
			
			
			
			var val_mod_edu_3 = document.getElementById("val_mod_edu_3").value; 
			
			if (val_mod_edu_3==1) {
				if($("#mod_edu_3").is(':checked')) {  
            		mod_edu_3=1;  
				} 
				if (mod_edu_3==1){
					desc_mod_edu_3= document.getElementById("desc_mod_edu_3").value;
					if (desc_mod_edu_3==""){
						document.getElementById("desc_mod_edu_3").focus();
						document.getElementById("desc_mod_edu_3").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Aplicaci\xf3n de Pruebas Estandarizadas';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_3").style.backgroundColor="";
						}		
				}
			}
			
			
			var val_mod_edu_4 = document.getElementById("val_mod_edu_4").value; 
			
			if (val_mod_edu_4==1) {
				if($("#mod_edu_4").is(':checked')) {  
            		mod_edu_4=1;  
				} 
				if (mod_edu_4==1){
					desc_mod_edu_4= document.getElementById("desc_mod_edu_4").value;
					if (desc_mod_edu_4==""){
						document.getElementById("desc_mod_edu_4").focus();
						document.getElementById("desc_mod_edu_4").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Trabajos de Recojo de informaci\xf3n';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_4").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_edu_4 = document.getElementById("val_mod_edu_4").value; 
			
			if (val_mod_edu_4==1) {
				if($("#mod_edu_4").is(':checked')) {  
            		mod_edu_4=1;  
				} 
				if (mod_edu_4==1){
					desc_mod_edu_4= document.getElementById("desc_mod_edu_4").value;
					if (desc_mod_edu_4==""){
						document.getElementById("desc_mod_edu_4").focus();
						document.getElementById("desc_mod_edu_4").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Trabajos de Recojo de informaci\xf3n';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_4").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_edu_5 = document.getElementById("val_mod_edu_5").value; 
			
			if (val_mod_edu_5==1) {
				if($("#mod_edu_5").is(':checked')) {  
            		mod_edu_5=1;  
				} 
				if (mod_edu_5==1){
					otro_mod_edu_5= document.getElementById("otro_mod_edu_5").value;
					if (otro_mod_edu_5==""){
						document.getElementById("otro_mod_edu_5").focus();
						document.getElementById("otro_mod_edu_5").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre Descripci\xf3n de la experiencia';
						return false;
					}	
					else {
						document.getElementById("otro_mod_edu_5").style.backgroundColor="";
						}
						
					desc_mod_edu_5= document.getElementById("desc_mod_edu_5").value;
					if (desc_mod_edu_5==""){
						document.getElementById("desc_mod_edu_5").focus();
						document.getElementById("desc_mod_edu_5").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre nombre de empresa o instituci\xf3n';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_5").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_edu_6 = document.getElementById("val_mod_edu_6").value; 
			
			if (val_mod_edu_6==1) {
				if($("#mod_edu_6").is(':checked')) {  
            		mod_edu_6=1;  
				} 
				if (mod_edu_6==1){
					otro_mod_edu_6= document.getElementById("otro_mod_edu_6").value;
					if (otro_mod_edu_6==""){
						document.getElementById("otro_mod_edu_6").focus();
						document.getElementById("otro_mod_edu_6").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre Descripci\xf3n de la experiencia';
						return false;
					}	
					else {
						document.getElementById("otro_mod_edu_6").style.backgroundColor="";
						}
						
					desc_mod_edu_6= document.getElementById("desc_mod_edu_6").value;
					if (desc_mod_edu_6==""){
						document.getElementById("desc_mod_edu_6").focus();
						document.getElementById("desc_mod_edu_6").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre nombre de empresa o instituci\xf3n';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_6").style.backgroundColor="";
						}		
				}
			}
		}
		
		
		if ( (document.getElementById("DIcurso").value!="" || document.getElementById("MIcurso").value!=""  || document.getElementById("AIcurso").value!="" || document.getElementById("DFcurso").value!=""  || document.getElementById("MFcurso").value!=""  || document.getElementById("AFcurso").value!="")  && document.getElementById("txtCurso").value == ""  ){
			
			document.getElementById("txtCurso").focus();
			document.getElementById("txtCurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese correctamente los datos sobre el curso de capacitaci\xf3n';
			return false;
			} else document.getElementById("txtCurso").style.backgroundColor=""; 
		
		if ( (document.getElementById("DIcurso").value!="" || document.getElementById("MIcurso").value!=""  || document.getElementById("AIcurso").value!="" || document.getElementById("DFcurso").value!=""  || document.getElementById("MFcurso").value!=""  || document.getElementById("AFcurso").value!="")  && document.getElementById("txtlugar_capacitacion").value == ""  ){
			document.getElementById("txtlugar_capacitacion").focus();
			document.getElementById("txtlugar_capacitacion").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese correctamente el lugar donde realiz\xf3 su capacitaci\xf3n';
			return false;
		} else document.getElementById("txtlugar_capacitacion").style.backgroundColor=""; 	
		
		if (document.getElementById("txtCurso").value == "" ) {
		} else {

		
		if (document.getElementById("DIcurso").value.length < 2) {
			document.getElementById("DIcurso").focus();
			document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("DIcurso").style.backgroundColor="";
		
		if (document.getElementById("MIcurso").value.length < 2) {
			document.getElementById("MIcurso").focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("MIcurso").style.backgroundColor="";
		
		if (document.getElementById("MIcurso").value == "00" || document.getElementById("MIcurso").value > "12") {
			document.getElementById("MIcurso").focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("MIcurso").style.backgroundColor="";
		
		if (parseInt(document.getElementById("MIcurso").value) == 1 || parseInt(document.getElementById("MIcurso").value) == 3 || parseInt(document.getElementById("MIcurso").value) == 5 || parseInt(document.getElementById("MIcurso").value) == 7 || parseInt(document.getElementById("MIcurso").value) == 8 || parseInt(document.getElementById("MIcurso").value) == 10 || parseInt(document.getElementById("MIcurso").value) == 12) {
			if (parseInt(document.getElementById("DIcurso").value) > 31) {
				document.getElementById("DIcurso").focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
				return false;
			} else document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (parseInt(document.getElementById("MIcurso").value) == 4 || parseInt(document.getElementById("MIcurso").value) == 6 || parseInt(document.getElementById("MIcurso").value) == 9 || parseInt(document.getElementById("MIcurso").value) == 11) {
			if (parseInt(document.getElementById("DIcurso").value) > 30) {
				document.getElementById("DIcurso").focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
				return false;
			} else document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (document.getElementById("AIcurso").value.length < 4) {
			document.getElementById("AIcurso").focus();
			document.getElementById("AIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("AIcurso").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (parseInt(document.getElementById("MIcurso").value) == 2) {
			if (parseInt(document.getElementById("AIcurso").value) % 4 == 0) {
				if (parseInt(document.getElementById("DIcurso").value) > 29) {
					document.getElementById("DIcurso").focus();
					document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
					return false;
				} else document.getElementById("DIcurso").style.backgroundColor="";
			} else {
				if (parseInt(document.getElementById("DIcurso").value) > 28) {
					document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
					return false;
				} else document.getElementById("DIcurso").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(document.getElementById("DIcurso").value)) {
			document.getElementById("DIcurso").focus();
			document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("DIcurso").style.backgroundColor="";
		
		if (!validarNumero(document.getElementById("MIcurso").value)) {
			document.getElementById("MIcurso").focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("MIcurso").style.backgroundColor="";
		
		if (!validarNumero(document.getElementById("AIcurso").value)) {
			document.getElementById("AIcurso").focus();
			document.getElementById("AIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de inicio de curso v\xe1lido';
			return false;
		}	 else document.getElementById("AIcurso").style.backgroundColor="";
		
		if (document.getElementById("DFcurso").value.length < 2) {
			document.getElementById("DFcurso").focus();
			document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese dia de fin de curso v\xe1lido';
			return false;
		} else document.getElementById("DFcurso").style.backgroundColor="";
		
		if (document.getElementById("MFcurso").value.length < 2) {
			document.getElementById("MFcurso").focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			return false;
		} else document.getElementById("MFcurso").style.backgroundColor="";
		
		if (document.getElementById("MFcurso").value == "00" || MFcurso.value > "12") {
			document.getElementById("MFcurso").focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';

			return false;
		} else document.getElementById("MFcurso").style.backgroundColor="";
		
		if (parseInt(document.getElementById("MFcurso").value) == 1 || parseInt(document.getElementById("MFcurso").value) == 3 || parseInt(document.getElementById("MFcurso").value) == 5 || parseInt(document.getElementById("MFcurso").value) == 7 || parseInt(document.getElementById("MFcurso").value) == 8 || parseInt(document.getElementById("MFcurso").value) == 10 || parseInt(document.getElementById("MFcurso").value) == 12) {
			if (parseInt(document.getElementById("DFcurso").value) > 31) {
				document.getElementById("DFcurso").focus();
				document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese dia de fin de curso v\xe1lido';
				return false;
			} else document.getElementById("DFcurso").style.backgroundColor="";
		}
		if (parseInt(document.getElementById("MFcurso").value) == 4 || parseInt(document.getElementById("MFcurso").value) == 6 || parseInt(document.getElementById("MFcurso").value) == 9 || parseInt(document.getElementById("MFcurso").value) == 11) {
			if (parseInt(document.getElementById("DFcurso").value) > 30) {
				document.getElementById("DFcurso").focus();
				document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
				return false;
			} else document.getElementById("DFcurso").style.backgroundColor="";
		}
		if (document.getElementById("AFcurso").value.length < 4) {
			document.getElementById("AFcurso").focus();
			document.getElementById("AFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
			return false;
		} else document.getElementById("AFcurso").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(document.getElementById("MFcurso").value) == 2) {
			if (parseInt(document.getElementById("MFcurso").value) % 4 == 0) {
				if (parseInt(document.getElementById("DFcurso").value) > 29) {
					document.getElementById("DFcurso").focus();
					document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
					return false;
				} else document.getElementById("DFcurso").style.backgroundColor="";
			} else {
				if (parseInt(DFcurso.value) > 28) {
					DFcurso.focus();
					document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
					return false;
				} else document.getElementById("DFcurso").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(document.getElementById("DFcurso").value)) {
			document.getElementById("DFcurso").focus();
			document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
			return false;
		} else document.getElementById("DFcurso").style.backgroundColor="";
		
		if (!validarNumero(document.getElementById("MFcurso").value)) {
			document.getElementById("MFcurso").focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("MFcurso").style.backgroundColor="";
		
		if (!validarNumero(document.getElementById("AFcurso").value)) {
			document.getElementById("AFcurso").focus();
			document.getElementById("AFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("AFcurso").style.backgroundColor="";
		
	/*	if (document.getElementById("txtHorasLectivas").value == "") {
			document.getElementById("txtHorasLectivas").focus();
			document.getElementById("txtHorasLectivas").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre la cantidad de tiempo del curso profesional';
			return false;
		} else  document.getElementById("txtHorasLectivas").style.backgroundColor="";
		
		if (document.getElementById("txtTiempoHL").value == "0") {
			document.getElementById("txtTiempoHL").focus();
			document.getElementById("txtTiempoHL").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre la descripci\xf3n del tiempo del curso profesional';
			return false;
		} else  document.getElementById("txtTiempoHL").style.backgroundColor="";*/
		
	}
	
	var validarCap2 = document.getElementById("validarCap2").value;
	
	if (validarCap2==2){
		if (document.getElementById("txtCursoOf").value == "" ){
			document.getElementById("txtCursoOf").focus()
			document.getElementById("txtCursoOf").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre curso de Office realizado';
			return false;
		} else  document.getElementById("txtCursoOf").style.backgroundColor="";
	}	
	if (document.getElementById("txtCursoOf").value == "" ) {
		} else {

		DIcurso= document.getElementById("DIcursoOf");
		MIcurso = document.getElementById("MIcursoOf");
		AIcurso = document.getElementById("AIcursoOf");
		
		DFcurso= document.getElementById("DFcursoOf");
		MFcurso = document.getElementById("MFcursoOf");
		AFcurso = document.getElementById("AFcursoOf");
		
		if (DIcurso.value.length < 2) {
			DIcurso.focus();
			document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("DIcurso").style.backgroundColor="";
		
		if (MIcurso.value.length < 2) {
			MIcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("MIcurso").style.backgroundColor="";
		
		if (MIcurso.value == "00" || MIcurso.value > "12") {
			MIcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("MIcurso").style.backgroundColor="";
		if (parseInt(MIcurso.value) == 1 || parseInt(MIcurso.value) == 3 || parseInt(MIcurso.value) == 5 || parseInt(MIcurso.value) == 7 || parseInt(MIcurso.value) == 8 || parseInt(MIcurso.value) == 10 || parseInt(MIcurso.value) == 12) {
			if (parseInt(DIcurso.value) > 31) {
				DIcurso.focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
				return false;
			} else  document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (parseInt(MIcurso.value) == 4 || parseInt(MIcurso.value) == 6 || parseInt(MIcurso.value) == 9 || parseInt(MIcurso.value) == 11) {
			if (parseInt(DIcurso.value) > 30) {
				DIcurso.focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
				return false;
			} else  document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (AIcurso.value.length < 4) {
			AIcurso.focus();
			document.getElementById("AIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("AIcurso").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (parseInt(MIcurso.value) == 2) {
			if (parseInt(AIcurso.value) % 4 == 0) {
				if (parseInt(DIcurso.value) > 29) {
					DIcurso.focus();
					document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
					return false;
				} else  document.getElementById("DIcurso").style.backgroundColor="";
			} else {
				if (parseInt(DIcurso.value) > 28) {
					DIcurso.focus();
					document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
					return false;
				} else  document.getElementById("DIcurso").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(DIcurso.value)) {
			DIcurso.focus();
			document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("DIcurso").style.backgroundColor="";
		if (!validarNumero(MIcurso.value)) {
			MIcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("MIcurso").style.backgroundColor="";
		if (!validarNumero(AIcurso.value)) {
			AIcurso.focus();
			document.getElementById("AIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("AIcurso").style.backgroundColor="";
		
		if (DFcurso.value.length < 2) {
			DFcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese dia de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("MIcurso").style.backgroundColor="";
		if (MFcurso.value.length < 2) {
			MFcurso.focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("MFcurso").style.backgroundColor="";
		if (MFcurso.value == "00" || MFcurso.value > "12") {
			MFcurso.focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("MFcurso").style.backgroundColor="";
		if (parseInt(MFcurso.value) == 1 || parseInt(MFcurso.value) == 3 || parseInt(MFcurso.value) == 5 || parseInt(MFcurso.value) == 7 || parseInt(MFcurso.value) == 8 || parseInt(MFcurso.value) == 10 || parseInt(MFcurso.value) == 12) {
			if (parseInt(DFcurso.value) > 31) {
				DFcurso.focus();
				document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese dia de fin de curso v\xe1lido';
				document.getElementById("DFcurso").style.backgroundColor="#FFA4A4"
				return false;
			} else  document.getElementById("DFcurso").style.backgroundColor="";
		}
		if (parseInt(MFcurso.value) == 4 || parseInt(MFcurso.value) == 6 || parseInt(MFcurso.value) == 9 || parseInt(MFcurso.value) == 11) {
			if (parseInt(DFcurso.value) > 30) {
				DIcurso.focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				return false;
			} else  document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (AFcurso.value.length < 4) {
			AFcurso.focus();
			document.getElementById("AFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de fin de curso v\xe1lido';
			document.getElementById("AFcurso").style.backgroundColor="#FFA4A4";
			return false;
		} else  document.getElementById("AFcurso").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(MFcurso.value) == 2) {
			if (parseInt(AFcurso.value) % 4 == 0) {
				if (parseInt(DFcurso.value) > 29) {
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
					DFcurso.style.backgroundColor="#FFA4A4";
					DFcurso.focus();
					return false;
				} else DFcurso.style.backgroundColor="";
			} else {
				if (parseInt(DFcurso.value) > 28) {
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
					DFcurso.style.backgroundColor="#FFA4A4";
					DFcurso.focus();
					return false;
				} else DFcurso.style.backgroundColor="";
			}
		}
		
		if (!validarNumero(DFcurso.value)) {
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
			DFcurso.style.backgroundColor="#FFA4A4";
			DFcurso.focus();
			return false;
		} else DFcurso.style.backgroundColor="";
		if (!validarNumero(MFcurso.value)) {
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			MFcurso.style.backgroundColor="#FFA4A4";
			MFcurso.focus();
			return false;
		} else MFcurso.style.backgroundColor="";
		if (!validarNumero(AFcurso.value)) {
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de fin de curso v\xe1lido';
			AFcurso.style.backgroundColor="#FFA4A4";
			AFcurso.focus();
			return false;
		} else AFcurso.style.backgroundColor="";
		
		/*if (document.getElementById("txtHorasLectivasOf").value == "") {
			
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre la cantidad de tiempo del curso de Office';
			document.getElementById("txtHorasLectivasOf").style.backgroundColor="#FFA4A4";
			document.getElementById("txtHorasLectivasOf").focus();
			return false;
		} else document.getElementById("txtHorasLectivasOf").style.backgroundColor="";
		
		if (document.getElementById("txtTiempoOf").value == "0") {
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre la descripci\xf3n del tiempo del curso de Office';
			document.getElementById("txtTiempoOf").style.backgroundColor="#FFA4A4";
			document.getElementById("txtTiempoOf").focus();
			return false;
		} else document.getElementById("txtTiempoOf").style.backgroundColor="";*/
		
	}

		if (document.getElementById("cmbdisposicion").value == "") {
			$("#dialog").dialog("open");
			document.getElementById("mensaje").innerHTML = 'Seleccione veracidad de datos';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		} else
			document.getElementById("cmbVeracidad").style.backgroundColor="";
			
		if (document.getElementById("cmbdisposicion").value == 2) {
			document.getElementById("mensaje").innerHTML = 'Debe contar con disponibilidad a tiempo completo';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		} else
			document.getElementById("cmbVeracidad").style.backgroundColor="";
		
		
		if (document.getElementById("cmbdisposicion").value == "0") {
			document.getElementById("mensaje").innerHTML = 'Seleccione la Disposici\xf3n de tiempo';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		} else 
			document.getElementById("cmbVeracidad").style.backgroundColor="";
			
		if (document.getElementById("cmbVeracidad").value == "2") {
			document.getElementById("mensaje").innerHTML = 'Seleccione SI en veracidad de datos';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		}	else 
			document.getElementById("cmbVeracidad").style.backgroundColor="";
		
		if (document.getElementById("cmbVeracidad").value == "" || document.getElementById("cmbVeracidad").value == "0") {
			document.getElementById("mensaje").innerHTML = 'Seleccione veracidad de datos';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		}	else 
			document.getElementById("cmbVeracidad").style.backgroundColor="";
		





				var valUbigeo = document.getElementById('valUbigeo').value;
				var depa1 = document.getElementById('txtDpto1').value.substring(0,2);   
				var depa2 = document.getElementById('txtDpto2').value.substring(0,2);  
				
				if 	(valUbigeo==1 || valUbigeo==2 || valUbigeo==3 || valUbigeo==5) {
				if (depa1!=15){
				
					if(depa1 != '0'){
					if(depa2 != depa1 )
					{
						
						$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Deben de coincidir los Departamentos de postulaci\xf3n y de residencia';
							document.getElementById('txtDpto2').focus();
							document.getElementById("button1").disabled=true;
							document.getElementById("txtDpto2").style.backgroundColor="#FFA4A4";
							return false;
					}   
					else
					{ 
					document.getElementById("txtDpto2").style.backgroundColor="";
					document.getElementById('txtDpto1').disabled=false;
					document.getElementById("button1").disabled=false;
					}
				  }
				} else {
					 if (depa2==15 || depa2==07 ){
							document.getElementById('txtDpto1').disabled=false;
							document.getElementById("button1").disabled=false;
							document.getElementById("txtDpto2").style.backgroundColor="";
						 }
						 else{
							 $("#dialog").dialog("open");
							 document.getElementById("mensaje").innerHTML = 'Deben de coincidir los Departamentos de postulaci\xf3n y de residencia';
							document.getElementById('txtDpto2').focus();
							document.getElementById("button1").disabled=true;
							document.getElementById("txtDpto2").style.backgroundColor="#FFA4A4";
							return false;
							 }
					}
				
				}
				else {
					document.getElementById("txtDpto2").style.backgroundColor="";
				}	
	
					var lsIdConvCargo=document.getElementById("id_cc").value;
					var lsIdProyecto=document.getElementById("id_proyecto").value;
					var ccddo1 = document.getElementById("txtDpto1").value;
					var ccdd1 = ccddo1.substring(0,2);
					var ccppo1 = document.getElementById("txtProv1").value;
					var ccpp1 = ccppo1.substring(2,4);
					var ccdio1 = document.getElementById("txtDist1").value;
					var ccdi1 = ccdio1.substring(4);
					var lsApePaterno=document.getElementById("txtApePaterno").value;
					var lsApeMaterno=document.getElementById("txtApeMaterno").value;
					var lsNombre1=document.getElementById("txtNombre1").value;
					var lsNombre2=document.getElementById("txtNombre2").value;
					var lsSexo=document.getElementById("cmbSexo").value;
					var oDia = document.getElementById("txtDia").value;
					var oMes = document.getElementById("txtMes").value;
					var oAnio = document.getElementById("txtAnio").value;
					var fecha_actual = new Date();   
					var anioA = fecha_actual.getFullYear(); 
					var lsFecNac = oDia +'/'+ oMes+'/'+oAnio;
					var lsEdad = anioA -oAnio;
					var lspais=document.getElementById("cmbpais").value;
					var lsDptoNc =document.getElementById("txtDpto3").value;
					var lsProvNc =document.getElementById("txtProv3").value;
					var lsDistNc = document.getElementById("txtDist4").value;
					var lsDNI = document.getElementById("txtDNI").value;
					var lsRUC = document.getElementById("txtRUC").value;	
					var lsECivil = document.getElementById("txtECivil").value;
					var lsCmbLen = 	document.getElementById("cmbLeng").value;
					var lsTelefono = document.getElementById("txtTelefono").value;
					var lsCelular = document.getElementById("txtCelular").value;
					var lsOperCel =	document.getElementById("cmbOperTel").value;
					var lsEmail = document.getElementById("txtEmail").value;
					var lsTipoVia = document.getElementById("cmbTipovia").value;
					var lsNomVia = document.getElementById("txtNomVia").value;
					var lsNumPuerta = document.getElementById("txtNumPuerta").value;
					var lsNumKilometro = document.getElementById("txtNumKilometro").value;
					var lsNumManzana = document.getElementById("txtNumManzana").value;
					var lsNumInterior = document.getElementById("txtNumInterior").value;
					var lsDepa = document.getElementById("txtdepa").value;
					var lsNumPiso = document.getElementById("txtNumPiso").value;
					var lsNumLote = document.getElementById("txtNumLote").value;
					var lsTipoZona = document.getElementById("cmbZona").value;
					var lsNomZona = document.getElementById("txtNomZona").value;
					var lsDptoR = document.getElementById("txtDpto2").value;
					var lsProvR = document.getElementById("txtProv2").value;
					var lsDistR = document.getElementById("txtDist2").value;
					var lsNivInst = document.getElementById("cmbNivelInstr").value;
					var lsTipEst = document.getElementById("cmbTipoEstudios").value;
					var lsGrado = document.getElementById("cmbGrado").value;
					var oDia2 = document.getElementById("txtDia2").value;
					var oMes2 = document.getElementById("txtMes2").value;
					var oAnio2 = document.getElementById("txtAnio2").value;
					if (oAnio2!='' &&  oMes2!='' && oDia2!='') 
						var lsfec_exp= oDia2 +'/'+ oMes2 +'/'+ oAnio2
					 else 
						var lsfec_exp='';
					var lsperioAlc = document.getElementById("txtperioalc").value;
					var lsTiPerAlc = document.getElementById("cmbPeriodo").value;
					var lsprofesion = document.getElementById("cmbProfesion").value;
					var lsUniv = document.getElementById("cmbUniversidad").value;
					var lsLugEst = document.getElementById("txtLugEst").value;
					var lsExpGen_anio = document.getElementById("txtExpGenAnio").value;
					var lsExpGen_meses = document.getElementById("txtExpGenMeses").value;
					var lsExpCampoanio = document.getElementById("txtExpCampoAnio").value;
					var lsExpCampomeses = document.getElementById("txtExpCampoMeses").value;
					var lsExpGrupoanio = document.getElementById("txtExpGrupoAnio").value;
					var lsExpGrupomeses = document.getElementById("txtExpGrupoMeses").value;
					var lsCapsanio = document.getElementById("txtCapaAnio").value;
					var lsCapameses = document.getElementById("txtCapaMeses").value;
					var lsDocanio = document.getElementById("txtDocAnio2").value;
					var lsDocmeses = "0";
					var lsIneiProc = document.getElementById("txtIneiProc").value;
					var lsProyecto = document.getElementById("txtProyecto").value;
					var lsIneiAnio = document.getElementById("txtIneiAnio").value;
					var lsCargoInei = document.getElementById("txtCargoInei").value;
					var lsDisposicion = document.getElementById("cmbdisposicion").value
					var lsVeracidad = document.getElementById("cmbVeracidad").value;
					var lsCargo = document.getElementById("cmbCargo").value;
					var lsmeta = document.getElementById("meta").value;
					var lsIdiomaQ = "0"; //document.getElementById("cmbIdiomaQ").value;
					var lsdispoSabDom = "0"; //document.getElementById("cmbdispoSabDom").value;
					var lsCompromiso = "0"; // document.getElementById("cmbdCompromiso").value;
					var lsid_caroQ = document.getElementById("id_caroQ").value;
					var lsHijoUnico= document.getElementById("cmbHijoUnico").value; 
					var lsJEfeHogar = document.getElementById("cmbJefeHogar").value;
					var lsLEnguaMAt= document.getElementById("cmbLengMat").value;
					var lsCurso= document.getElementById("txtCurso").value;
					var DIcurso1 = document.getElementById("DIcurso").value;
					var MIcurso1 = document.getElementById("MIcurso").value;
					var AIcurso1 = document.getElementById("AIcurso").value;
					if (AIcurso1!='' &&  MIcurso1!='' && DIcurso1!='') 
						var lsfec_Icap= DIcurso1 +'/'+ MIcurso1 +'/'+ AIcurso1
					 else 
						var lsfec_Icap='';
						
					var DFcurso1 = document.getElementById("DFcurso").value;
					var MFcurso1 = document.getElementById("MFcurso").value;
					var AFcurso1 = document.getElementById("AFcurso").value;
					if (AFcurso1!='' &&  MFcurso1!='' && DFcurso1!='') 
						var lsfec_Fcap= DFcurso1 +'/'+ MFcurso1 +'/'+ AFcurso1
					 else 
						var lsfec_Fcap='';
						
					var lsHorasLectivas=document.getElementById("txtHorasLectivas").value;
					var DiaComp = document.getElementById("DiaComp").value;
					var MesComp = document.getElementById("MesComp").value;
					var AnioComp = document.getElementById("AnioComp").value;
					if (AnioComp!='' &&  MesComp!='' && DiaComp!='') 
						var lsFecDatoCom= DiaComp +'/'+ MesComp +'/'+ AnioComp
					 else 
						var lsFecDatoCom='';
						
					if (lsFecDatoCom==""){
						$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese dato complementario';
					document.getElementById("DiaComp").style.backgroundColor="#FFA4A4";
					document.getElementById("DiaComp").focus();
					return false;
						
					} else
						{
							document.getElementById("DiaComp").style.backgroundColor="";
							}

						
					var  txtNum_reg_grado = document.getElementById("txtNum_reg_grado").value;
					var  txtlugar_capacitacion = document.getElementById("txtlugar_capacitacion").value;
					var  txtExpAplicacion = document.getElementById("txtExpAplicacion").value;
					var  txtNombreAplicacion = document.getElementById("txtNombreAplicacion").value;
					var  txtTiempoAplicacion = document.getElementById("txtTiempoAplicacion").value;
					var  txtExpFormacion = document.getElementById("txtExpFormacion").value;
					var  txtNombreFormacion = document.getElementById("txtNombreFormacion").value;
					var  txtTiempoFormacion = document.getElementById("txtTiempoFormacion").value;
					var  txtCargo1 = document.getElementById("txtCargo1").value;
					var  txtEmpCargo1 = document.getElementById("txtEmpCargo1").value;
					var  txttiempoCargo1 = document.getElementById("txttiempoCargo1").value;
					var  txtCargo2 = document.getElementById("txtCargo2").value;
					var  txtEmpCargo2 = document.getElementById("txtEmpCargo2").value;
					var  txttiempoCargo2 = document.getElementById("txttiempoCargo2").value;
					var  cmbIdiomaC = document.getElementById("cmbIdiomaC").value;
					var  cmbNivelIdioma = document.getElementById("cmbNivelIdioma").value;
					var  cmbDomIdioma = document.getElementById("cmbDomIdioma").value;
					var txtSiDescuento=document.getElementById("txtSiDescuento").value;
					var txtSIPension="0";
					var txtSiDescuento=document.getElementById("txtSiDescuento").value;
					var txtTipoPension=document.getElementById("txtTipoPension").value;
					var txtAFP=document.getElementById("txtAFP").value;
					var txtFCUSSP=document.getElementById("txtFCUSSP").value;
					var txtPo_TipoPension="1";//document.getElementById("txtPo_TipoPension").value;
					var txtFecAfiliacion=document.getElementById("txtFecAfiliacion").value;
					var txtComision=document.getElementById("txtComision").value;
						if (txtPo_TipoPension=="AFP") {
							var txtPo_AFP="10";
							} else {
								var txtPo_AFP="";
							}
					
					var txtExpCampoInst =document.getElementById("txtExpCampoInst").value;
					var txtExpCampoFef =document.getElementById("txtExpCampoFef").value;
					var txtExpGrupoInst =document.getElementById("txtExpGrupoInst").value;
					var txtExpGrupoFec =document.getElementById("txtExpGrupoFec").value;
					var txtExpGenInst =document.getElementById("txtExpGenInst").value;
					var txtExpGenFec =document.getElementById("txtExpGenFec").value;
					var txtExpProcesos =document.getElementById("txtExpProcesos").value;
					var txtCargoAplicacion =document.getElementById("txtCargoAplicacion").value;
					var txtNombreProcesos =document.getElementById("txtNombreProcesos").value;
					var txtCargoProcesos =document.getElementById("txtCargoProcesos").value;
					var txtCargoFormacion =document.getElementById("txtCargoFormacion").value;
					var txtTiempoProcesos =document.getElementById("txtTiempoProcesos").value;
					var txtTiempoApli =document.getElementById("txtTiempoApli").value;
					var txtCargoProc =document.getElementById("txtCargoProc").value;
					var txtTiempoFor =document.getElementById("txtTiempoFor").value;
					var txtCursoOf =document.getElementById("txtCursoOf").value;
					var txtlugar_capacitacionOf =document.getElementById("txtlugar_capacitacionOf").value;
					var DIcursoOf = document.getElementById("DIcursoOf").value;
					var MIcursoOf = document.getElementById("MIcursoOf").value;
					var AIcursoOf = document.getElementById("AIcursoOf").value;
					if (AIcursoOf!='' &&  MIcursoOf!='' && DIcursoOf!='') 
						var lsfec_IOf= DIcursoOf +'/'+ MIcursoOf +'/'+ AIcursoOf
					 else 
						var lsfec_IOf='';
					var DFcursoOf = document.getElementById("DFcursoOf").value;
					var MFcursoOf = document.getElementById("MFcursoOf").value;
					var AIcursoOf = document.getElementById("AIcursoOf").value;
					if (DFcursoOf!='' &&  MFcursoOf!='' && AIcursoOf!='') 
						var lsfec_FOf= DFcursoOf +'/'+ MFcursoOf +'/'+ AIcursoOf
					 else 
						var lsfec_FOf='';
					var txtHorasLectivasOf =document.getElementById("txtHorasLectivasOf").value;
					var txtTiempoHL =document.getElementById("txtTiempoHL").value;
					var txtTiempoOf =document.getElementById("txtTiempoOf").value;
					var preg1 =document.getElementById("preg1").value;
					var preg2 =document.getElementById("preg2").value;
					var preg3 =document.getElementById("preg3").value;
					var preg4=document.getElementById("preg4").value;
					var preg5=document.getElementById("preg5").value;
					var preg6 =document.getElementById("preg6").value;
					var preg7 =document.getElementById("preg7").value;
					var preg8 =document.getElementById("preg8").value;
					var preg9 =document.getElementById("preg9").value;
					var preg10=document.getElementById("preg10").value;
					var preg11 =document.getElementById("preg11").value;
					var preg12 =document.getElementById("preg12").value;
					var preg13 =document.getElementById("preg13").value;
					
					var existe =document.getElementById("existe").value;
					var txtFecEmi=document.getElementById("txtFecEmi").value;
						
					var cod_tambo=""
					if (document.getElementById("ver_tambo").value==1){
						cod_tambo=document.getElementById("txtTambo").value;
					}
					var ubicacion="";
					var centro_poblado=""
					
					if (document.getElementById("ver_centroPob").value==1){
						ubicacion=document.getElementById("cmbUbicacion").value;
						centro_poblado=document.getElementById("txtCentroPob").value;
					}

					if (document.getElementById("validarCargo1").value==2) {
						if (txtCargo1==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el \xfaltimo cargo desempeñado';
							document.getElementById("txtCargo1").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargo1").focus();
							return false;
							} else document.getElementById("txtCargo1").style.backgroundColor="";
						if (txtEmpCargo1==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la empresa del \xfaltimo cargo desempeñado';
							document.getElementById("txtEmpCargo1").style.backgroundColor="#FFA4A4";
							document.getElementById("txtEmpCargo1").focus();
							return false;
							} else document.getElementById("txtEmpCargo1").style.backgroundColor="";
						if (txttiempoCargo1=="" || txttiempoCargo1=="0"){
							
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de desempeño en el \xfaltimo cargo';
							document.getElementById("txttiempoCargo1").style.backgroundColor="#FFA4A4";
							document.getElementById("txttiempoCargo1").focus();
							return false;
							} else document.getElementById("txttiempoCargo1").style.backgroundColor="";
					}
					if (document.getElementById("validarCargo2").value==2) {	
						if (txtCargo2==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el penultimo cargo desempeñado';
							document.getElementById("txtCargo2").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargo2").focus();
							return false;
							} else document.getElementById("txtCargo2").style.backgroundColor="";
						if (txtEmpCargo2==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la empresa del penultimo cargo desempeñado';
							document.getElementById("txtEmpCargo2").style.backgroundColor="#FFA4A4";
							document.getElementById("txtEmpCargo2").focus();
							return false;
							} else document.getElementById("txtEmpCargo2").style.backgroundColor="";
						if (txttiempoCargo2=="" || txttiempoCargo2=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de desempeño en el penultimo cargo';
							document.getElementById("txttiempoCargo2").style.backgroundColor="#FFA4A4";
							document.getElementById("txttiempoCargo2").focus();
							return false;
							} else document.getElementById("txttiempoCargo2").style.backgroundColor="";
					}
					
					if (lsid_caroQ==489 || lsid_caroQ==492 || lsid_caroQ==490 ) {	
						if (txtExpCampoInst==""){
							alert("Registre el nombre de la instituci\xf3n de la primera experiencia solicitada");
							document.getElementById("txtExpCampoInst").focus();
							return false;
							}
						if (txtExpCampoFef==""){

							alert("Registre la fecha del \xfaltimo dia de labor de la primera experiencia solicitada");
							document.getElementById("txtExpCampoFef").focus();
							return false;
							}
						if (txtExpCampoAnio==""){
							alert("Registre el tiempo en anios de la primera experiencia solicitada");
							document.getElementById("txtExpCampoAnio").focus();
							return false;
							}
						if (txtExpCampoMeses==""){
							alert("Registre el tiempo en meses de la primera experiencia solicitada");
							document.getElementById("txtExpCampoMeses").focus();
							return false;
							}
							
						if (txtExpGrupoInst==""){
							alert("Registre el nombre de la instituci\xf3n de la segunda experiencia solicitada");
							document.getElementById("txtExpCampoInst").focus();
							return false;
							}
						if (txtExpGrupoFec==""){
							alert("Registre la fecha del \xfaltimo dia de labor de la segunda experiencia solicitada");
							document.getElementById("txtExpGrupoFec").focus();
							return false;
							}
						if (txtExpGrupoAnio==""){
							alert("Registre el tiempo en anios de la segunda experiencia solicitada");
							document.getElementById("txtExpGrupoAnio").focus();
							return false;
							}
						if (txtExpGrupoMeses==""){
							alert("Registre el tiempo en meses de la seginda experiencia solicitada");
							document.getElementById("txtExpGrupoMeses").focus();
							return false;
							}
					}
					
					
					if (document.getElementById("ValidarExp1").value==2) {
						if (txtExpAplicacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el Nombre de la \xdaltima Experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtExpAplicacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtExpAplicacion").focus();
							return false;
							} else document.getElementById("txtExpAplicacion").style.backgroundColor="";
						
						if (txtNombreAplicacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la Instituci\xf3n de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtNombreAplicacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtNombreAplicacion").focus();
							return false;
							} else document.getElementById("txtNombreAplicacion").style.backgroundColor="";
						
						if (txtCargoAplicacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el cargo de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtCargoAplicacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargoAplicacion").focus();
							return false;
							} else document.getElementById("txtCargoAplicacion").style.backgroundColor="#FFA4A4";
							
						if (txtTiempoAplicacion=="" || txtTiempoAplicacion=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtTiempoAplicacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoAplicacion").focus();
							return false;
							} else document.getElementById("txtTiempoAplicacion").style.backgroundColor="";
							
						if (txtTiempoApli=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Seleccione la descripci\xf3n del tiempo de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtTiempoApli").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoApli").focus();
							return false;
							} else document.getElementById("txtTiempoApli").style.backgroundColor="";
					}
					
					if (document.getElementById("validarExp2").value==2) {
						if (txtExpProcesos==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el Nombre de la \xfaltima Experiencia en procesos de operaciones de aplicaci\xf3nn de instrumentos en campo';
							document.getElementById("txtExpProcesos").style.backgroundColor="#FFA4A4";
							document.getElementById("txtExpProcesos").focus();
							return false;
							} else document.getElementById("txtExpProcesos").style.backgroundColor="";
							
						if (txtNombreProcesos==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la Instituci\xf3n de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtNombreProcesos").style.backgroundColor="#FFA4A4";
							document.getElementById("txtNombreProcesos").focus();
							return false;
							} else document.getElementById("txtNombreProcesos").style.backgroundColor="";
							
						if (txtCargoProcesos==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el cargo de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtCargoProcesos").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargoProcesos").focus();
							return false;
							} else document.getElementById("txtCargoProcesos").style.backgroundColor="";
							
						if (txtTiempoProcesos=="" || txtTiempoProcesos=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtTiempoProcesos").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoProcesos").focus();
							return false;
							} else document.getElementById("txtTiempoProcesos").style.backgroundColor="";
							
						if (txtCargoProc=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Seleccione la descripci\xf3n del tiempo de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtCargoProc").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargoProc").focus();
							return false;
							}	else document.getElementById("txtCargoProc").style.backgroundColor="";
					}
					
					if (document.getElementById("validarExp3").value==2) { 
						if (txtExpFormacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el Nombre de la \xfaltima experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtExpFormacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtExpFormacion").focus();
							return false;
							} else document.getElementById("txtExpFormacion").style.backgroundColor="";
							
						if (txtNombreFormacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la Instituci\xf3n de la experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtNombreFormacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtNombreFormacion").focus();
							return false;
							} else document.getElementById("txtNombreFormacion").style.backgroundColor="";
							
						if (txtCargoFormacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el cargo de la experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtCargoFormacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargoFormacion").focus();
							return false;
							} else document.getElementById("txtCargoFormacion").style.backgroundColor="";
							
						if (txtTiempoFormacion=="" || txtTiempoFormacion=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de la experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtTiempoFormacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoFormacion").focus();
							return false;
							}
							
						if (txtTiempoFor=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Seleccione la descripci\xf3n del tiempo de la experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtTiempoFor").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoFor").focus();
							return false;
							} else document.getElementById("txtTiempoFor").style.backgroundColor="";
					}
				
				if (document.getElementById("preguntasAdicionales").value!="0"){
					
					
					
						
					if (preg1==0 && document.getElementById("valPreg1").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene impedimento de contratar con el estado';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene impedimento de contratar con el estado';
							}
						document.getElementById("preg1").style.backgroundColor="#FFA4A4";
						document.getElementById("preg1").focus();
						return false;
					} else document.getElementById("preg1").style.backgroundColor="";
					
					if (preg2==0 && document.getElementById("valPreg2").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene disponibilidad exclusiva y a tiempo completo, para trabajar durante todas las bases del operativo';
						} else {
						document.getElementById("mensaje").innerHTML = 'Registre si tiene antecedentes sobre sanci\xf3n por falta administrativa';
						}
						document.getElementById("preg2").style.backgroundColor="#FFA4A4";
						document.getElementById("preg2").focus();
						return false;
					} else document.getElementById("preg2").style.backgroundColor="";
					
					if (preg3==0 && document.getElementById("valPreg3").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene habilidades para el manejo de equipos interdisciplinarios';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene familiares hasta el 4to grado de consanguinidad 2do de afinidad con facultad de nombrar, designar en nuestra instituci\xf3n';}
						document.getElementById("preg3").style.backgroundColor="#FFA4A4";
						document.getElementById("preg3").focus();
						return false;
					} else document.getElementById("preg3").style.backgroundColor="";
					
					if (preg4==0 && document.getElementById("valPreg4").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene habilidades comunicativas para la resolucion de problemas';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si acepta solo postular en esta convocatoria';
							}
						document.getElementById("preg4").style.backgroundColor="#FFA4A4";
						document.getElementById("preg4").focus();
						return false;
					} else document.getElementById("preg4").style.backgroundColor="";
					
					if (preg5==0 && document.getElementById("valPreg5").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad para coordinar con autoridades de distintas instituciones publicas y privadas';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene habilidades para el manejo de equipos interdisciplinarios';
							}
						document.getElementById("preg5").style.backgroundColor="#FFA4A4";
						document.getElementById("preg5").focus();
						return false;
					} else document.getElementById("preg5").style.backgroundColor="";
					
					if (preg6==0 && document.getElementById("valPreg6").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad para trabajar bajo presion y con tolerancia y frustracion';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene habilidades comunicativas y para la resoluci\xf3n de problemas';
							}
						document.getElementById("preg6").style.backgroundColor="#FFA4A4";
						document.getElementById("preg6").focus();
						return false;
					} else document.getElementById("preg6").style.backgroundColor="";
					
					if (preg7==0 && document.getElementById("valPreg7").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si acepta la obligatoriedad de asistir a sesiones de capacitacion?';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad de trabajar bajo presi\xf3n';
						}
						document.getElementById("preg7").style.backgroundColor="#FFA4A4";
						document.getElementById("preg7").focus();
						return false;
					} else document.getElementById("preg7").style.backgroundColor="";
					
					if (preg8==0 && document.getElementById("valPreg8").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre tiene buen nivel de lectura comprensiva y adecuada diccion';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad para coordinar con autoridades de distintas instituciones p\xfablicas y privadas';
							}
						document.getElementById("preg8").style.backgroundColor="#FFA4A4";
						document.getElementById("preg8").focus();
						return false;
					} document.getElementById("preg8").style.backgroundColor="";
					
					if (preg9==0 && document.getElementById("valPreg9").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre usted cuenta con mas de 10 horas capacitando';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad para coordinar con autoridades de distintas instituciones p\xfablicas y privadas';
						}
						document.getElementById("preg9").style.backgroundColor="#FFA4A4";
						document.getElementById("preg9").focus();
						return false;
					} else document.getElementById("preg9").style.backgroundColor="";
							
					if (preg10==0 && document.getElementById("valPreg10").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si usted reside en la sede a la que postula';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si es docente con aula a cargo en IE estatales';
						}
						document.getElementById("preg10").style.backgroundColor="#FFA4A4";
						document.getElementById("preg10").focus();
						return false;
					} else document.getElementById("preg10").style.backgroundColor="";
					
					if (preg11==0 && document.getElementById("valPreg11").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene contrato vigente como docente en el sector publico';
						} else {document.getElementById("mensaje").innerHTML = 'Registre si tiene disposici\xf3n exclusiva y a tiempo completo durante las fases del Operativo de campo';
						}
						document.getElementById("valPreg11").style.backgroundColor="#FFA4A4";
						document.getElementById("valPreg11").focus();
						return false;
					} else document.getElementById("valPreg11").style.backgroundColor="";
					
					if (preg12==0 && document.getElementById("valPreg12").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene disponibilidad para viajar';
						} else {
						document.getElementById("mensaje").innerHTML = 'Registre si acepta la obligatoriedad de asistir a las sesiones de capacitaci\xf3n'; 
						}
						document.getElementById("preg12").style.backgroundColor="#FFA4A4";
						document.getElementById("preg12").focus();
						return false;
					} document.getElementById("preg12").style.backgroundColor="";
					
					if (preg13==0 && document.getElementById("valPreg13").value==2){
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre si es residente en la sede que le corresponde (Est\xe1 postulando)';
						document.getElementById("preg13").style.backgroundColor="#FFA4A4";
						document.getElementById("preg13").focus();
						return false;
					}	 else document.getElementById("preg13").style.backgroundColor="";
					
			}
			
			ajax=http_request();
					var valores;	
					valores= "lsIdConvCargo="+escape(lsIdConvCargo)+ "&ccdd1="+escape(ccdd1)+ "&ccpp1="+escape(ccpp1)+ "&ccdi1="+escape(ccdi1)+ "&lsApePaterno="+escape(lsApePaterno)+ "&lsApeMaterno="+escape(lsApeMaterno)+ "&lsNombre1="+escape(lsNombre1)+ "&lsNombre2="+escape(lsNombre2)+ "&lsSexo="+escape(lsSexo)+ "&lsFecNac ="+escape(lsFecNac)+ "&lsEdad ="+escape(lsEdad)+ "&lspais="+escape(lspais)+ "&lsDptoNc ="+escape(lsDptoNc)+ "&lsProvNc ="+escape(lsProvNc)+ "&lsDistNc ="+escape(lsDistNc)+ "&lsDNI ="+escape(lsDNI)+ "&lsRUC="+escape(lsRUC)+ "&lsECivil="+escape(lsECivil)+ "&lsCmbLen="+escape(lsCmbLen)+ "&lsTelefono="+escape(lsTelefono)+ "&lsCelular="+escape(lsCelular)+ "&lsOperCel="+escape(lsOperCel)+ "&lsEmail="+escape(lsEmail)+ "&lsTipoVia ="+escape(lsTipoVia)+ "&lsNomVia="+escape(lsNomVia)+ "&lsNumPuerta ="+escape(lsNumPuerta)+ "&lsNumKilometro="+escape(lsNumKilometro)+ "&lsNumManzana="+escape(lsNumManzana)+ "&lsNumInterior="+escape(lsNumInterior)+ "&lsDepa ="+escape(lsDepa)+ "&lsNumPiso ="+escape(lsNumPiso)+ "&lsNumLote ="+escape(lsNumLote)+ "&lsTipoZona="+escape(lsTipoZona)+ "&lsNomZona ="+escape(lsNomZona)+ "&lsDptoR ="+escape(lsDptoR)+ "&lsProvR ="+escape(lsProvR)+ "&lsDistR ="+escape(lsDistR)+ "&lsNivInst="+escape(lsNivInst)+ "&lsTipEst="+escape(lsTipEst)+ "&lsGrado ="+escape(lsGrado)+ "&lsfec_exp="+escape(lsfec_exp)+ "&lsperioAlc ="+escape(lsperioAlc)+ "&lsTiPerAlc="+escape(lsTiPerAlc)+ "&lsprofesion="+escape(lsprofesion)+ "&lsUniv="+escape(lsUniv)+"&lsLugEst="+escape(lsLugEst)+"&lsExpGen_anio="+escape(lsExpGen_anio)+"&lsExpGen_meses="+escape(lsExpGen_meses)+"&lsExpCampoanio="+escape(lsExpCampoanio)+ "&lsExpCampomeses="+escape(lsExpCampomeses)+ "&lsExpGrupoanio="+escape(lsExpGrupoanio)+ "&lsExpGrupomeses="+escape(lsExpGrupomeses)+ "&lsCapsanio="+escape(lsCapsanio)+ "&lsCapameses ="+escape(lsCapameses)+ "&lsDocanio ="+escape(lsDocanio)+ "&lsDocmeses="+escape(lsDocmeses)+ "&lsIneiProc="+escape(lsIneiProc)+ "&lsProyecto="+escape(lsProyecto)+ "&lsIneiAnio ="+escape(lsIneiAnio)+ "&lsCargoInei="+escape(lsCargoInei)+ "&lsDisposicion="+escape(lsDisposicion)+ "&lsVeracidad="+escape(lsVeracidad)+ "&lsCargo="+escape(lsCargo)+ "&lsmeta="+escape(lsmeta)+ "&lsIdProyecto="+escape(lsIdProyecto)+ "&lsid_caroQ="+escape(lsid_caroQ)+ "&lsHijoUnico="+escape(lsHijoUnico)+ "&lsJEfeHogar="+escape(lsJEfeHogar)+ "&lsLEnguaMAt="+escape(lsLEnguaMAt)+ "&lsCurso="+escape(lsCurso)+ "&lsfec_Icap="+escape(lsfec_Icap)+ "&lsfec_Fcap="+escape(lsfec_Fcap)+ "&lsHorasLectivas="+escape(lsHorasLectivas)+ "&lsFecDatoCom="+escape(lsFecDatoCom)+ "&txtNum_reg_grado="+escape(txtNum_reg_grado)+ "&txtlugar_capacitacion="+escape(txtlugar_capacitacion)+ "&txtExpAplicacion="+escape(txtExpAplicacion)+ "&txtNombreAplicacion="+escape(txtNombreAplicacion)+ "&txtTiempoAplicacion="+escape(txtTiempoAplicacion)+ "&txtExpFormacion="+escape(txtExpFormacion)+ "&txtNombreFormacion="+escape(txtNombreFormacion)+ "&txtTiempoFormacion="+escape(txtTiempoFormacion)+ "&txtCargo1="+escape(txtCargo1)+ "&txtEmpCargo1="+escape(txtEmpCargo1)+ "&txttiempoCargo1="+escape(txttiempoCargo1)+ "&txtCargo2="+escape(txtCargo2)+ "&txtEmpCargo2="+escape(txtEmpCargo2)+ "&txttiempoCargo2="+escape(txttiempoCargo2)+ "&cmbIdiomaC="+escape(cmbIdiomaC)+ "&cmbNivelIdioma="+escape(cmbNivelIdioma)+ "&cmbDomIdioma="+escape(cmbDomIdioma)+ "&txtSiDescuento="+escape(txtSiDescuento)+ "&txtSIPension="+escape(txtSIPension)+ "&txtTipoPension="+escape(txtTipoPension)+ "&txtAFP="+escape(txtAFP)+ "&txtFCUSSP="+escape(txtFCUSSP)+ "&txtPo_AFP="+escape(txtPo_AFP)+ "&txtPo_TipoPension="+escape(txtPo_TipoPension) + "&txtFecAfiliacion="+escape(txtFecAfiliacion)+ "&txtComision="+escape(txtComision)+ "&txtExpCampoInst="+escape(txtExpCampoInst)+ "&txtExpCampoFef="+escape(txtExpCampoFef)+ "&txtExpGrupoInst="+escape(txtExpGrupoInst)+ "&txtExpGrupoFec="+escape(txtExpGrupoFec)+ "&txtExpGenInst="+escape(txtExpGenInst)+ "&txtExpGenFec="+escape(txtExpGenFec)+ "&txtExpProcesos="+escape(txtExpProcesos)+ "&txtCargoAplicacion="+escape(txtCargoAplicacion)+ "&txtNombreProcesos="+escape(txtNombreProcesos)+ "&txtCargoProcesos="+escape(txtCargoProcesos)+ "&txtCargoFormacion="+escape(txtCargoFormacion)+ "&txtTiempoProcesos="+escape(txtTiempoProcesos)+ "&txtTiempoApli="+escape(txtTiempoApli)+ "&txtCargoProc="+escape(txtCargoProc)+ "&txtTiempoFor ="+escape(txtTiempoFor)+ "&txtCursoOf ="+escape(txtCursoOf)+ "&txtlugar_capacitacionOf="+escape(txtlugar_capacitacionOf)+ "&lsfec_IOf ="+escape(lsfec_IOf)+ "&lsfec_FOf ="+escape(lsfec_FOf)+ "&txtHorasLectivasOf ="+escape(txtHorasLectivasOf)+ "&txtTiempoHL  ="+escape(txtTiempoHL)+ "&txtTiempoOf ="+escape(txtTiempoOf)+ "&preg1  ="+escape(preg1)+ "&preg2  ="+escape(preg2)+ "&preg3  ="+escape(preg3)+ "&preg4  ="+escape(preg4)+ "&preg5  ="+escape(preg5)+ "&preg6  ="+escape(preg6)+ "&preg7  ="+escape(preg7)+ "&preg8  ="+escape(preg8)+ "&preg9  ="+escape(preg9)+ "&preg10 ="+escape(preg10)+ "&preg11  ="+escape(preg11)+ "&preg12  ="+escape(preg12)+ "&preg13  ="+escape(preg13)+ "&txtFecEmi="+escape(txtFecEmi)+"&existe="+escape(existe)+"&mod_edu_1="+escape(mod_edu_1)+"&mod_edu_2="+escape(mod_edu_2)+"&mod_edu_3="+escape(mod_edu_3)+"&mod_edu_4="+escape(mod_edu_4)+"&mod_edu_5="+escape(mod_edu_5)+"&mod_edu_6="+escape(mod_edu_6)+"&mod_cod_1="+escape(mod_cod_1)+"&mod_cod_2="+escape(mod_cod_2)+"&mod_cod_3="+escape(mod_cod_3)+"&desc_mod_edu_1="+escape(desc_mod_edu_1)+"&desc_mod_edu_2="+escape(desc_mod_edu_2)+"&desc_mod_edu_3="+escape(desc_mod_edu_3)+"&desc_mod_edu_4="+escape(desc_mod_edu_4)+"&desc_mod_edu_5="+escape(desc_mod_edu_5)+"&desc_mod_edu_6="+escape(desc_mod_edu_6)+"&otro_mod_edu_5="+escape(otro_mod_edu_5)+"&otro_mod_edu_6="+escape(otro_mod_edu_6)+"&desc_mod_cod_1="+escape(desc_mod_cod_1)+"&desc_mod_cod_2="+escape(desc_mod_cod_2)+"&desc_mod_cod_3="+escape(desc_mod_cod_3)+"&cod_tambo="+escape(cod_tambo)+"&ubicacion="+escape(ubicacion)+"&centro_poblado="+escape(centro_poblado)+"&subDistrito="+escape(subDistrito) +"&flag_rnp="+escape(flag_rnp)+"&fechainirnp="+escape(fechainirnp)+"&fechafinrnp="+escape(fechafinrnp) +"&txtexpad_anio_1="+escape(txtexpad_anio_1) +"&txtexpad_anio_2="+escape(txtexpad_anio_2) +"&txtexpad_meses_1="+escape(txtexpad_meses_1) +"&txtexpad_meses_2="+escape(txtexpad_meses_2) ;	
					
					url="pd_confirmacion.asp";
					
					ajax.open ('POST', url, true);
					ajax.onreadystatechange = function() {
					 if (ajax.readyState==1) {
					 }
					 else if (ajax.readyState==4){
						
						if(ajax.status==200){		

							if (ajax.responseText==3 ){
								var lsDNI = document.getElementById("txtDNI").value;
								var meta=document.getElementById("meta").value;
								var id_proyecto=document.getElementById("id_proyecto").value;
								var lsIdConvCargo=document.getElementById("id_cc").value;
								var lsCargo = document.getElementById("cmbCargo").value;
								var testP = document.getElementById("testP").value;
								var testC = document.getElementById("testC").value;
								var MomentoP = document.getElementById("MomentoP").value;
								var MomentoC = document.getElementById("MomentoC").value;
								
								if (MomentoC==1) {
									var w= window.open("TestInformatico.asp?nocache="+Math.random()+"&hdni="+escape(lsDNI)+"&hcodProyecto="+meta+"&periodo="+lsCargo+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
								} else {
										if (MomentoP==1){
											if (testP==1){
												var w= window.open("principal.asp?nocache="+Math.random()+"&hdni="+escape(lsDNI)+"&hcodProyecto="+meta+"&hid_puesto="+lsCargo+"&hperiodo="+lsIdConvCargo+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
											}
											if (testP==2){
												 var w= window.open("examen2.asp?nocache="+Math.random()+"&hdni="+escape(lsDNI)+"&hcodProyecto="+meta+"&hid_puesto="+lsCargo+"&hperiodo="+lsIdConvCargo+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
											}
									  } else
										 var w= window.open("pd_confirmacion_test.asp?nocache="+Math.random()+"&dni="+escape(lsDNI)+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
									}
								
								}
							else 	
								document.getElementById("dist4").innerHTML = ajax.responseText;								
						}
						else if(ajax.status==404){
							
						}
						else{ 
						}
					}
				}
				ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				ajax.send(valores);
			   return;					
	}
	
	
}

function validarNumero (texto) {
	var numero = "0123456789"
	var respuesta = true;
	var caracter;
	
	for (var i = 0; i < texto.length; i++) {
		caracter = texto.substring(i, i + 1);
		if (numero.indexOf(caracter) == "-1") respuesta = false;
	}
	return respuesta;
}

function grabarActualiza(existe){

if (confirm("¿Esta seguro(a) que desea registrar sus datos?")) {

		var lsIdConvCargo=document.getElementById("id_cc").value;
		var valUbigeo=document.getElementById("valUbigeo").value;
		var txtSede=document.getElementById("txtSede").value;
		
		if (valUbigeo=="4")	{
			//txtSede
			if (txtSede == "") {
				document.getElementById("txtSede").focus();
				document.getElementById("txtSede").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione la sede de Postulaci\xf3n';
					return false;
			} else  document.getElementById("txtSede").style.backgroundColor="";
			}
		else{
			if (document.getElementById("txtDpto1").value == "") {
				document.getElementById("txtDpto1").focus();
				document.getElementById("txtDpto1").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione el Departamento de inscripci\xf3n';
				return false;
			} else  document.getElementById("txtDpto1").style.backgroundColor="";
			
			if (document.getElementById("txtProv1").value == "" || document.getElementById("txtProv1").value == "le" ) {
				document.getElementById("txtProv1").focus();
				document.getElementById("txtProv1").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione la Provincia de inscripci\xf3n';
				return false;
			} else  document.getElementById("txtProv1").style.backgroundColor="";
			
			if (document.getElementById("txtDist1").value == "" || document.getElementById("txtDist1").value == "cc") {
				document.getElementById("txtDist1").focus();
				document.getElementById("txtDist1").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione el Distrito de inscripci\xf3n';
				return false;
			} else  document.getElementById("txtDist1").style.backgroundColor="";
		}
		
var subDistrito="0";
		if (valUbigeo==5){
				if (document.getElementById("txtSubDistrito").value=="0"){
					document.getElementById("txtSubDistrito").focus();
					document.getElementById("txtSubDistrito").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione Local de UGEL';
					return false;
				}
				else {
					document.getElementById("txtSubDistrito").style.backgroundColor=""; 
					subDistrito=document.getElementById("txtSubDistrito").value;
				}
		}
		
		
		if (document.getElementById("ver_tambo").value=="1"){
			if (document.getElementById("txtTambo").value=="0")	{
				document.getElementById("txtTambo").focus();
				document.getElementById("txtTambo").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione Tambo';
				return false;
			}
			else {
				 document.getElementById("txtTambo").style.backgroundColor=""; 
				}
		}
		
		
		
		if (document.getElementById("txtApePaterno").value.length < 2) {
			document.getElementById("txtApePaterno").focus();
			document.getElementById("txtApePaterno").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Apellido Paterno v\xe1lido';
			return false;
		} else document.getElementById("txtApePaterno").style.backgroundColor=""; 
		
		/*if (document.getElementById("txtApeMaterno").value == "") {
			document.getElementById("txtApeMaterno").focus();
			document.getElementById("txtApeMaterno").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Apellido Materno v\xe1lido';
			return false;
		} else document.getElementById("txtApeMaterno").style.backgroundColor="";*/
		
		if (document.getElementById("txtNombre1").value == "" || document.getElementById("txtNombre1").value.length < 2) {
			document.getElementById("txtNombre1").focus();
			document.getElementById("txtNombre1").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Nombre v\xe1lido';
			return false;
		} else document.getElementById("txtNombre1").style.backgroundColor="";
		
		if (document.getElementById("txtDNI").value == "" || document.getElementById("txtDNI").value.length < 8) {
			document.getElementById("txtDNI").focus();
			document.getElementById("txtDNI").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese n\xfamero de DNI v\xe1lido';
			return false;
		} else document.getElementById("txtDNI").style.backgroundColor="";
		
		if (!validarNumero(document.getElementById("txtDNI").value)) {
			document.getElementById("txtDNI").focus();
			document.getElementById("txtDNI").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese n\xfamero de DNI v\xe1lido';
			return false;
		}
		
		if (document.getElementById("cmbSexo").value == "") {
			document.getElementById("cmbSexo").focus();
			document.getElementById("cmbSexo").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Seleccione su sexo';
			return false;
		} else document.getElementById("cmbSexo").style.backgroundColor="";	
		
		if (document.getElementById("cmbpais").value == "0") {
			document.getElementById("cmbpais").focus();
			document.getElementById("cmbpais").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Seleccione el pais de Nacimiento';
			return false;
		} else document.getElementById("cmbpais").style.backgroundColor="";		
		
		
		if (document.getElementById("cmbpais").value == "4028") {
			
			if(document.getElementById("txtDpto3").value=="0" || document.getElementById("txtDpto3").value=="" )
			{
				document.getElementById("txtDpto3").focus();
				document.getElementById("txtDpto3").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Seleccione el Departamento de Nacimiento';
				return false;
			}  else document.getElementById("txtDpto3").style.backgroundColor="";	
			
			if(document.getElementById("txtProv3").value=="0" || document.getElementById("txtProv3").value=="" || document.getElementById("txtProv3").value=="le")
			{
				document.getElementById("txtProv3").focus();
				document.getElementById("txtProv3").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Seleccione la provincia de Nacimiento';
				return false;
			} else document.getElementById("txtProv3").style.backgroundColor="";	
			
			if(document.getElementById("txtDist4").value=="0" || document.getElementById("txtDist4").value=="" || document.getElementById("txtDist4").value=="cc")
			{
				document.getElementById("txtDist4").focus();
				document.getElementById("txtDist4").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Seleccione la distrito de Nacimiento';
				return false;
			} else document.getElementById("txtDist4").style.backgroundColor="";	
		}	
		
		oDia = document.getElementById("txtDia");
		oMes = document.getElementById("txtMes");
		oAnio = document.getElementById("txtAnio");
		
		if (oDia.value.length < 2) {
			oDia.focus();
			document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtDia").style.backgroundColor="";	
		if (oMes.value.length < 2) {
			oMes.focus();
			document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtMes").style.backgroundColor="";	
		if (oMes.value == "00" || oMes.value > "12") {
			oMes.focus();
			document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtMes").style.backgroundColor="";
		if (parseInt(oMes.value) == 1 || parseInt(oMes.value) == 3 || parseInt(oMes.value) == 5 || parseInt(oMes.value) == 7 || parseInt(oMes.value) == 8 || parseInt(oMes.value) == 10 || parseInt(oMes.value) == 12) {
			if (parseInt(oDia.value) > 31) {
				oDia.focus();
				document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
				return false;
			} else document.getElementById("txtDia").style.backgroundColor="";
		}
		if (parseInt(oMes.value) == 4 || parseInt(oMes.value) == 6 || parseInt(oMes.value) == 9 || parseInt(oMes.value) == 11) {
			if (parseInt(oDia.value) > 30) {
				oDia.focus();
				document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
				return false;
			} else document.getElementById("txtDia").style.backgroundColor="";
		}
		if (oAnio.value.length < 4) {
			oAnio.focus();
			document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtAnio").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (anioA - parseInt(oAnio.value) <18) {
			oAnio.focus();
			document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'El a\xf1o no corresponde a un mayor de edad';
			return false;
		} else document.getElementById("txtAnio").style.backgroundColor="";
		if (anioA - parseInt(oAnio.value)>90) {
			oAnio.focus();
			document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A&ntilde;o de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtAnio").style.backgroundColor="";
		
		if (parseInt(oMes.value) == 2) {
			if (parseInt(oAnio.value) % 4 == 0) {
				if (parseInt(oDia.value) > 29) {
					oDia.focus();
					document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
					return false;
				} else document.getElementById("txtDia").style.backgroundColor="";
			} else {
				if (parseInt(oDia.value) > 28) {
					oDia.focus();
					document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
					return false;
				} else document.getElementById("txtDia").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(oDia.value)) {
			oDia.focus();
			document.getElementById("txtDia").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtDia").style.backgroundColor="";
		
		if (!validarNumero(oMes.value)) {
			oMes.focus();
			document.getElementById("txtMes").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtMes").style.backgroundColor="";
		
		if (!validarNumero(oAnio.value)) {
			oAnio.focus();
			document.getElementById("txtAnio").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de nacimiento v\xe1lido';
			return false;
		} else document.getElementById("txtAnio").style.backgroundColor="";	

		if (document.getElementById("valRuc").value=="2") {
			
			if (document.getElementById("txtRUC").value==""){
				 $("#dialog").dialog("open");
	   	    	document.getElementById("mensaje").innerHTML = 'El registro del RUC es obligatorio para este proceso';
				document.getElementById("txtRUC").style.backgroundColor="#FFA4A4";
				}
				else 
					document.getElementById("txtRUC").style.backgroundColor="";
					
			if (document.getElementById("txtRUC2").value==""){
				 $("#dialog").dialog("open");
	   	    	document.getElementById("mensaje").innerHTML = 'El registro de la confirmaci\xf3n del RUC es obligatorio';
				document.getElementById("txtRUC2").style.backgroundColor="#FFA4A4";
				}
				else 
					document.getElementById("txtRUC2").style.backgroundColor="";
		}
		
		   		
		if (document.getElementById("txtECivil").value == "0") {
			document.getElementById("txtECivil").focus();
			document.getElementById("txtECivil").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione estado civil';
			return false;
		} else document.getElementById("txtECivil").style.backgroundColor="";
		
		if (document.getElementById("cmbHijoUnico").value == "") {
			document.getElementById("cmbHijoUnico").focus();
			document.getElementById("cmbHijoUnico").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione informaci\xf3n sobre si es hijo \xfanico';
			return false;
		} else document.getElementById("cmbHijoUnico").style.backgroundColor="";	
		
		if (document.getElementById("cmbJefeHogar").value == "") {
			document.getElementById("cmbJefeHogar").focus();
			document.getElementById("cmbJefeHogar").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione informaci\xf3n sobre si es hijo \xfanico';
			return false;
		} else document.getElementById("cmbJefeHogar").style.backgroundColor="";		
		
		if (document.getElementById("cmbLengMat").value == "") {
			document.getElementById("cmbLengMat").focus();
			document.getElementById("cmbLengMat").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione informaci\xf3n sobre su cual es la lengua materna que aprendi\xf3 en su ni\xdaez';
			return false;
		} else document.getElementById("cmbLengMat").style.backgroundColor="";
		
		if (document.getElementById("cmbLeng").value == "") {
			document.getElementById("cmbLeng").focus();
			document.getElementById("cmbLeng").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione Lengua originaria';
			return false;
		} else document.getElementById("cmbLeng").style.backgroundColor="";

		if (document.getElementById("cmbIdiomaC").value !=0 && document.getElementById("cmbNivelIdioma").value =="" ) {
			document.getElementById("cmbNivelIdioma").focus();
			document.getElementById("cmbNivelIdioma").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione nivel de conocimiento de otro idioma';
			return false;
		} else document.getElementById("cmbNivelIdioma").style.backgroundColor="";

		if (document.getElementById("cmbIdiomaC").value !=0 && document.getElementById("cmbDomIdioma").value =="" ) {
			document.getElementById("cmbDomIdioma").focus();
			document.getElementById("cmbDomIdioma").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione dominio de conocimiento de otro idioma';
			return false;
		}

/*-RNP VALIDACIONES-*/
		//Solo para cuando tiene flag RNP 
		ls_rnp = "0";
		if($("#txtRnP").is(':checked')){
			ls_rnp = "1";
			}
		
		
			
		
		if (document.getElementById("valRnP").value=="1") {
			
			if( ls_rnp == "0")
			{
			
			document.getElementById("txtRnP").focus();
			document.getElementById("txtRnP").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Debe de contar con el RNP';
			return false;
			}
		}
		
		//Solo para cuando tiene flag RNP valida las fechas
		if( ls_rnp == "1") {
			if ( document.getElementById("txtfechainirnp").value=="" ) 
			 {
			
			document.getElementById("txtfechainirnp").focus();
			document.getElementById("txtfechainirnp").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese FECHA Inicio RNP';
			return false;
		} else { document.getElementById("txtfechainirnp").style.backgroundColor="";};
		
		if ( document.getElementById("txtfechafinrnp").value=="" ) 
			 {
			
			document.getElementById("txtfechafinrnp").focus();
			document.getElementById("txtfechafinrnp").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese FECHA Fin RNP';
			return false;
		} else {document.getElementById("txtfechafinrnp").style.backgroundColor="";};
		
		}
		
		//Rango de Fechas
		if(ls_rnp == "1") {
			if ( document.getElementById("txtfechainirnp").value!="" &&  document.getElementById("txtfechafinrnp").value!="" ) 
			{
				if ( Date.parse(document.getElementById("txtfechainirnp").value)>Date.parse(document.getElementById("txtfechafinrnp").value) ) 
				{$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Fecha de inicio rnp debe ser menor a la fin';
			return false;
					
					}
				}
		}
		
			
		/*-RNP FIN VALIDACIONES-*/	
		
		var txtexpad_anio_1 =document.getElementById("txtexpad_anio_1").value;
		var txtexpad_anio_2 =document.getElementById("txtexpad_anio_2").value;
		var txtexpad_meses_1 =document.getElementById("txtexpad_meses_1").value;
		var txtexpad_meses_2 =document.getElementById("txtexpad_meses_2").value;
		
		
			/*-RNP-*/
			
	var flag_rnp="0";
	if($("#txtRnP").is(':checked')){
				 flag_rnp= "1";
			}
			
	var fechainirnp=document.getElementById("txtfechainirnp").value;
	var fechafinrnp=document.getElementById("txtfechafinrnp").value;
		
		/*	
		if (txtSiDescuento=="1"){
			
			if (txtSIPension=="0"){
				alert("Seleccione Si esta afiliado a un sistema de Pensiones");
					document.getElementById("txtSIPension").focus();
					return false;
				}
			
			if (txtSIPension=="1"){
				if (document.getElementById("txtTipoPension").value==""){
					alert("Seleccione Tipo de pensi\xf3n al que est\xe1 afiliado");
					document.getElementById("txtTipoPension").focus();
					return false;					
				} else{
					if (document.getElementById("txtAFP").value=="" && document.getElementById("txtTipoPension").value=="AFP" ){
						alert('Seleccione la AFP al que se ha afiliado');
						document.getElementById("AFP").focus();
						return false;
						}
						
					if (document.getElementById("txtFCUSSP").value=="" && document.getElementById("txtTipoPension").value=="AFP" ){

						alert('Registre el n\xfamero de CUSSP (C\xf3digo de Afiliado)');
						document.getElementById("txtFCUSSP").focus();
						return false;
						}
					if (document.getElementById("txtFecAfiliacion").value=="" && document.getElementById("txtTipoPension").value=="AFP" ){
						alert('Registre Fecha de afiliaci\xf3n');
						document.getElementById("txtFecAfiliacion").focus();
						return false;
						}
					}
			}
		
		} */
		

		if (document.getElementById("txtTelefono").value == "" && document.getElementById("txtCelular").value == "") {
			document.getElementById("txtTelefono").focus();
			document.getElementById("txtTelefono").style.backgroundColor="#FFA4A4";
			document.getElementById("txtCelular").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Registre un n\xfamero de tel\xe9fono fijo o celular ';
			return false;
		} else {
			document.getElementById("txtTelefono").style.backgroundColor="";
			document.getElementById("txtCelular").style.backgroundColor="";
		}
		
		if (document.getElementById("txtTelefono").value != "" && document.getElementById("cmbOperTel").value == "") {
			document.getElementById("cmbOperTel").focus();
			document.getElementById("cmbOperTel").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbOperTel").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Registre Operador Celular';
			return false;
		} else {
			document.getElementById("cmbOperTel").style.backgroundColor="";
			document.getElementById("cmbOperTel").style.backgroundColor="";
		}
		
		
		
		if (document.getElementById("valCorreo").value == "2" && document.getElementById("txtEmail").value == "") {
			document.getElementById("txtEmail").focus();
			document.getElementById("txtEmail").style.backgroundColor="#FFA4A4";
			document.getElementById("txtEmail").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Debe registrar su correo electronico';
			return false;
		} else {
			document.getElementById("txtEmail").style.backgroundColor="";
			document.getElementById("txtEmail").style.backgroundColor="";
		}
		
		
		if (document.getElementById("cmbTipovia").value == "") {
			document.getElementById("cmbTipovia").focus();
			document.getElementById("cmbTipovia").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione tipo de via';
			return false;
		} else document.getElementById("cmbTipovia").style.backgroundColor="";
				
		if (document.getElementById("txtNomVia").value == "") {
			document.getElementById("txtNomVia").focus();
			document.getElementById("txtNomVia").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Ingrese el nombre de la v\xeda donde reside';
			return false;
		} else document.getElementById("txtNomVia").style.backgroundColor="";	
		
  		if (document.getElementById("cmbZona").value == "0") {
			document.getElementById("cmbZona").focus();
			document.getElementById("cmbZona").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione la Zona de la residencia';
			return false;
		} else document.getElementById("cmbZona").style.backgroundColor="";	
		
		
		if (document.getElementById("txtNomZona").value == "") {
			document.getElementById("txtNomZona").focus();
			document.getElementById("txtNomZona").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Ingrese el nombre de la Zona';
			return false;
		} else document.getElementById("txtNomZona").style.backgroundColor="";	


		var lsNumPuerta = document.getElementById("txtNumPuerta").value;
		var lsNumKilometro = document.getElementById("txtNumKilometro").value;
		var lsNumManzana = document.getElementById("txtNumManzana").value;
		var lsNumInterior = document.getElementById("txtNumInterior").value;
		var lsDepa = document.getElementById("txtdepa").value;
		var lsNumPiso = document.getElementById("txtNumPiso").value;
		var lsNumLote = document.getElementById("txtNumLote").value;
					
		if (lsNumPuerta=="" && lsNumKilometro=="" && lsNumManzana=="" && lsNumInterior=="" && lsDepa=="" && lsNumPiso==""  && lsNumLote=="" ){
			
			document.getElementById("txtNumPuerta").focus();
			document.getElementById("txtNumPuerta").style.backgroundColor="#FFA4A4";
		    $("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Registre datos de residencia (Nro de puerta, kilometro, manzana, interior, lote, etc)';
			return false;
		}
		else document.getElementById("txtNumPuerta").style.backgroundColor="";
				

		if (document.getElementById("txtDpto2").value == "0" || document.getElementById("txtDpto2").value == "" ) {
				document.getElementById("txtDpto2").focus();
				document.getElementById("txtDpto2").style.backgroundColor="#FFA4A4";
		   		$("#dialog").dialog("open");
	   	    	document.getElementById("mensaje").innerHTML = 'Seleccione el departamento de residencia';
				return false;
		} else document.getElementById("txtDpto2").style.backgroundColor="";
			
		if (document.getElementById("txtProv2").value == "" || document.getElementById("txtProv2").value == "0" || document.getElementById("txtProv2").value == "le") {
			document.getElementById("txtProv2").focus();
			document.getElementById("txtProv2").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione la provincia de residencia';
			return false;
		} else document.getElementById("txtProv2").style.backgroundColor="";
		
		if (document.getElementById("txtDist2").value == "0" || document.getElementById("txtDist2").value == "" || document.getElementById("txtDist2").value == "le") {
			document.getElementById("txtDist2").focus();
			document.getElementById("txtDist2").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione el distrito de residencia';
			return false;
		} else document.getElementById("txtDist2").style.backgroundColor="";		
				
if (document.getElementById("ver_centroPob").value=="1"){
			if (document.getElementById("cmbUbicacion").value=="0" || document.getElementById("cmbUbicacion").value=="" ){
				document.getElementById("cmbUbicacion").focus();
				document.getElementById("cmbUbicacion").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione Ubicaci\xf3n de su Vivienda';
				return false;
			} else {
					document.getElementById("cmbUbicacion").style.backgroundColor="";
				}
				
			if (document.getElementById("cmbUbicacion").value=="2" ){
				if (document.getElementById("txtCentroPob").value=="0" ){
					document.getElementById("txtCentroPob").focus();
					document.getElementById("txtCentroPob").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione centro poblado donde reside';
					return false;
				}	
				else {
					document.getElementById("txtCentroPob").style.backgroundColor="";
					}
			}
		}
		
		if (parseInt(document.getElementById("cmbNivelInstr").value) == 0  ) {
			document.getElementById("cmbNivelInstr").focus();
			document.getElementById("cmbNivelInstr").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione Nivel de Instrucci\xf3n';
			return false;
		} else document.getElementById("cmbNivelInstr").style.backgroundColor="";	
		
		
		if ((document.getElementById("cmbNivelInstr").value=='04' || document.getElementById("cmbNivelInstr").value=='05' || document.getElementById("cmbNivelInstr").value=='4' || document.getElementById("cmbNivelInstr").value=='5' ) && document.getElementById("txtperioalc").value=='' ) {
			document.getElementById("txtperioalc").focus();
			document.getElementById("txtperioalc").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Ingrese el Periodo';
			return false;
		} else document.getElementById("txtperioalc").style.backgroundColor="";	
		
		if ((document.getElementById("cmbNivelInstr").value=='04' || document.getElementById("cmbNivelInstr").value=='05' || document.getElementById("cmbNivelInstr").value=='4' || document.getElementById("cmbNivelInstr").value=='5' ) && document.getElementById("cmbPeriodo").value=='0' ) {
			document.getElementById("cmbPeriodo").focus();
			document.getElementById("cmbPeriodo").style.backgroundColor="#FFA4A4";
		   	$("#dialog").dialog("open");
	   	    document.getElementById("mensaje").innerHTML = 'Seleccione el tipo de Periodo';
			return false;
		} else document.getElementById("cmbPeriodo").style.backgroundColor="";	
		
		
		if (parseInt(document.getElementById("cmbNivelInstr").value)>3 && document.getElementById("cmbGrado").value=='0' ) {
		document.getElementById("cmbGrado").focus();
		document.getElementById("cmbGrado").style.backgroundColor="#FFA4A4";
		$("#dialog").dialog("open");
	   	document.getElementById("mensaje").innerHTML = 'Seleccione el Grado Alcanzado';
		return false;
		} else document.getElementById("cmbGrado").style.backgroundColor="";	
		
		if ((parseInt(document.getElementById("cmbGrado").value) >=3 && parseInt(document.getElementById("cmbGrado").value) <=6 ) && (document.getElementById("txtNum_reg_grado").value=='') ) {
			document.getElementById("txtNum_reg_grado").focus();
			document.getElementById("txtNum_reg_grado").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese el registro de Expedici\xf3n del grado';
			return false;
		} else document.getElementById("txtNum_reg_grado").style.backgroundColor="";	
		
		if ((parseInt(document.getElementById("cmbGrado").value) >=3 && parseInt(document.getElementById("cmbGrado").value) <=6) && (document.getElementById("txtDia2").value=='' || document.getElementById("txtMes2").value=='' ||  document.getElementById("txtAnio2").value=='' ) ) {
			document.getElementById("txtDia2").focus();
			document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
			document.getElementById("txtMes2").style.backgroundColor="#FFA4A4";
			document.getElementById("txtAnio2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingresa la fecha de expedici\xf3n del grado alcanzado';
			return false;
		} else 
			{document.getElementById("txtDia2").style.backgroundColor="";
			 document.getElementById("txtMes2").style.backgroundColor="";
			 document.getElementById("txtAnio2").style.backgroundColor="";	
			}
		
		if (parseInt(document.getElementById("cmbGrado").value) >=3 && parseInt(document.getElementById("cmbGrado").value) <=6) {
		
		o2Dia = document.getElementById("txtDia2");
		o2Mes = document.getElementById("txtMes2");
		o2Anio = document.getElementById("txtAnio2");
		
		if (o2Dia.value.length < 2) {
			o2Dia.focus();
			document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese D\xeda de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtDia2").style.backgroundColor="";
		
		if (o2Mes.value.length < 2) {
			o2Mes.focus();
			document.getElementById("txtMes2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtMes2").style.backgroundColor="";
		
		if (o2Mes.value == "00" || o2Mes.value > "12") {
			o2Mes.focus();
			document.getElementById("txtMes2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de expedici\xf3n de grado v\xe1lido';
			return false;
		}else document.getElementById("txtMes2").style.backgroundColor="";
		
		if (parseInt(o2Mes.value) == 1 || parseInt(o2Mes.value) == 3 || parseInt(o2Mes.value) == 5 || parseInt(o2Mes.value) == 7 || parseInt(o2Mes.value) == 8 || parseInt(o2Mes.value) == 10 || parseInt(o2Mes.value) == 12) {
			if (parseInt(o2Dia.value) > 31) {
				o2Dia.focus();
				document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
				return false;
			} else document.getElementById("txtDia2").style.backgroundColor="";
		}
		if (parseInt(o2Mes.value) == 4 || parseInt(o2Mes.value) == 6 || parseInt(o2Mes.value) == 9 || parseInt(o2Mes.value) == 11) {
			if (parseInt(o2Dia.value) > 30) {
				o2Dia.focus();
				document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
				return false;
			} else document.getElementById("txtDia2").style.backgroundColor="";
		}
		if (o2Anio.value.length < 4) {
			o2Anio.focus();
			document.getElementById("txtAnio2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtAnio2").style.backgroundColor="";
		
			
		if (parseInt(o2Mes.value) == 2) {
			if (parseInt(o2Anio.value) % 4 == 0) {
				if (parseInt(o2Dia.value) > 29) {
					o2Dia.focus();
					document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
					return false;
				} else document.getElementById("txtDia2").style.backgroundColor="";
			} else {
				if (parseInt(o2Dia.value) > 28) {
					o2Dia.focus();
					document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
					return false;
				} else document.getElementById("txtDia2").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(o2Dia.value)) {
			o2Dia.focus();
			document.getElementById("txtDia2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtDia2").style.backgroundColor="";
		
		if (!validarNumero(o2Mes.value)) {
			o2Mes.focus();
			document.getElementById("txtMes2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtMes2").style.backgroundColor="";
		
		if (!validarNumero(o2Anio.value)) {
			o2Anio.focus();
			document.getElementById("txtAnio2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de expedici\xf3n de grado v\xe1lido';
			return false;
		} else document.getElementById("txtAnio2").style.backgroundColor="";
	}
		
	var id_proyecto=document.getElementById("id_proyecto").value;
		if (id_proyecto==42 && (lsIdConvCargo==773 || lsIdConvCargo==774)){
		
			if ( document.getElementById("prof_ednom").value=="0"){
				
				$("#dialog").dialog("open");
				document.getElementById("mensaje").innerHTML = 'Seleccione la carrera y/o Profesi\xf3n';
				document.getElementById("prof_ednom").style.backgroundColor="#FFA4A4";
				document.getElementById("prof_ednom").focus();
				return false;
			} else {
				
				if (document.getElementById("cmbProfesion").value == "0" && document.getElementById("prof_ednom").value=="3"){
					$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione la otra ocupaci\xf3n y/o Profesi\xf3';
					document.getElementById("cmbProfesion").style.backgroundColor="#FFA4A4";
					document.getElementById("cmbProfesion").focus();
					
				} else document.getElementById("cmbProfesion").style.backgroundColor="";
				
				if (document.getElementById("especialidad_ednom").value== "" && document.getElementById("prof_ednom").value=="1"){
					$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Anote su especialidad como educador';
					document.getElementById("especialidad_ednom").style.backgroundColor="#FFA4A4";
					document.getElementById("especialidad_ednom").focus();
					return false;
				} else document.getElementById("especialidad_ednom").style.backgroundColor="";
			}
		} else{
			if (document.getElementById("cmbProfesion").value == "0" ) {
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Seleccione la Profesi\xf3n';
					document.getElementById("cmbProfesion").style.backgroundColor="#FFA4A4";
					document.getElementById("cmbProfesion").focus();
					return false;
			} else document.getElementById("cmbProfesion").style.backgroundColor="";
		}
		
		if (document.getElementById("cmbUniversidad").value == "0" && document.getElementById("txtLugEst").value == "" ) {
			document.getElementById("txtLugEst").focus();
			document.getElementById("txtLugEst").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese \xf2 Seleccione la Universidad \xf2 el Centro de Estudios';
			return false;
		} else document.getElementById("txtLugEst").style.backgroundColor="";
		
		
		var annio_exp=parseInt(document.getElementById("txtAnio2").value);
		var txtAnio=parseInt(document.getElementById("txtAnio").value);
		
		if (annio_exp<txtAnio+17)
		{
			
			document.getElementById("txtAnio2").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
			document.getElementById("txtAnio2").focus();
	   		document.getElementById("mensaje").innerHTML = 'El a\xf1o de expedici\xf3n de grado no puede ser menor o tan cercano al a\xf1o de nacimiento';
			return false;
		} else document.getElementById("txtAnio2").style.backgroundColor="";
		
	
	var ConvCargo=document.getElementById("id_cc").value;
	
	var GenInst=document.getElementById("txtExpGenInst").value;
	var GenFef=document.getElementById("txtExpGenFec").value;
	var GenAnio=document.getElementById("txtExpGenAnio").value;
	var GenMeses=document.getElementById("txtExpGenMeses").value;
	
	var GrupoInst=document.getElementById("txtExpGrupoInst").value;
	var GrupoFec=document.getElementById("txtExpGrupoFec").value;
	var GrupoAnio=document.getElementById("txtExpGrupoAnio").value;
	var GrupoMeses=document.getElementById("txtExpGrupoMeses").value;
	
	
	var CampoInst=document.getElementById("txtExpCampoInst").value;
	var CampoFef=document.getElementById("txtExpCampoFef").value;
	var CampoAnio=document.getElementById("txtExpCampoAnio").value;
	var CampoMeses=document.getElementById("txtExpCampoMeses").value;


	/*-RNP-*/
	var flag_rnp="0";
	if($("#txtRnP").is(':checked')){
				 flag_rnp= "1";
			}


		var valida2= document.getElementById("valExpGen2").value;
		if (valida2=="1"){
			if ( (GrupoAnio=="" && GrupoMeses=="") || (GrupoAnio=="0" && GrupoMeses=="0")){
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Registre correctamente el tiempo de labores de la Experiencia solicitada';
					document.getElementById("txtExpGrupoAnio").style.backgroundColor="#FFA4A4";
					document.getElementById("txtExpGrupoAnio").focus();
					return false;
			} else {
				document.getElementById("txtExpGrupoAnio").style.backgroundColor="";
				}
		}
		
		var valida1= document.getElementById("valExpGen1").value;
		if (valida1=="1"){	
			if ( (CampoAnio=="" && CampoMeses=="") || (CampoAnio=="0" && CampoMeses=="0") ){
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Registre correctamente el tiempo de labores de la Experiencia solicitada';
					document.getElementById("txtExpCampoAnio").style.backgroundColor="#FFA4A4";
					document.getElementById("txtExpCampoAnio").focus();
					return false;
			} else {
				document.getElementById("txtExpCampoAnio").style.backgroundColor="";
				}
		}
		
		var valida3= document.getElementById("valExpGen3").value;
		if (valida3=="1"){	
			if ( (GenAnio=="" && GenMeses=="") ||  (GenAnio=="0" && GenMeses=="0") ){
				$("#dialog").dialog("open");
					document.getElementById("mensaje").innerHTML = 'Registre correctamente el tiempo de labores de la Experiencia solicitada';
					document.getElementById("txtExpGenAnio").style.backgroundColor="#FFA4A4";
					document.getElementById("txtExpGenAnio").focus();
					return false;
			} else {
				document.getElementById("txtExpGenAnio").style.backgroundColor="";
				}	
		}

		var validarCap1 = document.getElementById("validarCap1").value;
		if (validarCap1==2) {
			if 	(document.getElementById("txtCurso").value == "" ){
				document.getElementById("txtCurso").focus();
				document.getElementById("txtCurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Registre \xdaltima capacitaci\xf3n Profesional';
				return false;
			} else document.getElementById("txtCurso").style.backgroundColor="";
	
		}	
		
		var val_exp_especifica= document.getElementById("val_exp_especifica").value;
		 if (val_exp_especifica==0){
			 var mod_edu_1= 0;
			var mod_edu_2= 0;
			var mod_edu_3= 0;
			var mod_edu_4= 0;
			var mod_edu_5= 0;
			var mod_edu_6= 0;
			var mod_cod_1= 0;
			var mod_cod_2= 0;
			var mod_cod_3= 0;
			var desc_mod_edu_1= "";
			var desc_mod_edu_2= "";
			var desc_mod_edu_3= "";
			var desc_mod_edu_4= "";
			var desc_mod_edu_5= "";
			var desc_mod_edu_6= "";
			var otro_mod_edu_5= "";
			var otro_mod_edu_6= "";
			var desc_mod_cod_1= "";
			var desc_mod_cod_2= "";
			var desc_mod_cod_3= "";

			 }
		 else {
			 
			var mod_edu_1= 0; // listo
			var mod_edu_2= 0; // listo
			var mod_edu_3= 0;
			var mod_edu_4= 0;
			var mod_edu_5= 0;
			var mod_edu_6= 0;
			var mod_cod_1= 0; //listo
			var mod_cod_2= 0;
			var mod_cod_3= 0;
			var desc_mod_edu_1= "";  // listo
			var desc_mod_edu_2= "";  // listo
			var desc_mod_edu_3= "";
			var desc_mod_edu_4= "";
			var desc_mod_edu_5= "";
			var desc_mod_edu_6= "";
			var otro_mod_edu_5= "";
			var otro_mod_edu_6= "";
			var desc_mod_cod_1= "";  // listo
			var desc_mod_cod_2= "";
			var desc_mod_cod_3= "";

			
			
			var val_mod_edu_1 = document.getElementById("val_mod_edu_1").value; 
			
			if (val_mod_edu_1==1) {
				if($("#mod_edu_1").is(':checked')) {  
            		mod_edu_1=1;  
				} 
				if (mod_edu_1==1){
					desc_mod_edu_1= document.getElementById("desc_mod_edu_1").value;
					if (desc_mod_edu_1==""){
						document.getElementById("desc_mod_edu_1").focus();
						document.getElementById("desc_mod_edu_1").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 labores de Coordinaci\xf3n o Supervisi\xf3n ';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_1").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_edu_2 = document.getElementById("val_mod_edu_2").value; 
			
			if (val_mod_edu_2==1) {
				if($("#mod_edu_2").is(':checked')) {  
            		mod_edu_2=1;  
				} 
				if (mod_edu_2==1){
					desc_mod_edu_2= document.getElementById("desc_mod_edu_2").value;
					if (desc_mod_edu_2==""){
						document.getElementById("desc_mod_edu_2").focus();
						document.getElementById("desc_mod_edu_2").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Capacitaci\xf3n ';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_2").style.backgroundColor="";
						}		
				}
			}
			
			
			var val_mod_cod_1 = document.getElementById("val_mod_cod_1").value; 
			
			if (val_mod_cod_1==1) {
				if($("#mod_cod_1").is(':checked')) {  
            		mod_cod_1=1;  
				} 
				if (mod_cod_1==1){
					desc_mod_cod_1= document.getElementById("desc_mod_cod_1").value;
					if (desc_mod_cod_1==""){
						document.getElementById("desc_mod_cod_1").focus();
						document.getElementById("desc_mod_cod_1").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n de experiencia en Elaboraci\xf3n de Pruebas Estandarizadas';
						return false;
					}	
					else {
						document.getElementById("desc_mod_cod_1").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_cod_2 = document.getElementById("val_mod_cod_2").value; 
			
			if (val_mod_cod_2==1) {
				if($("#mod_cod_2").is(':checked')) {  
            		mod_cod_2=1;  
				} 
				if (mod_cod_2==1){
					desc_mod_cod_2= document.getElementById("desc_mod_cod_2").value;
					if (desc_mod_cod_2==""){
						document.getElementById("desc_mod_cod_2").focus();
						document.getElementById("desc_mod_cod_2").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Capacitaci\xf3n ';
						return false;
					}	
					else {
						document.getElementById("desc_mod_cod_2").style.backgroundColor="";
						}		
				}
			}
			
			
			var val_mod_cod_3 = document.getElementById("val_mod_cod_3").value; 
			
			if (val_mod_cod_3==1) {
				if($("#mod_cod_3").is(':checked')) {  
            		mod_cod_3=1;  
				} 
				if (mod_cod_3==1){
					desc_mod_cod_3= document.getElementById("desc_mod_cod_3").value;
					if (desc_mod_cod_3==""){
						document.getElementById("desc_mod_cod_3").focus();
						document.getElementById("desc_mod_cod_3").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Capacitaci\xf3n ';
						return false;
					}	
					else {
						document.getElementById("desc_mod_cod_3").style.backgroundColor="";
						}		
				}
			}
			
			
			
			var val_mod_edu_3 = document.getElementById("val_mod_edu_3").value; 
			
			if (val_mod_edu_3==1) {
				if($("#mod_edu_3").is(':checked')) {  
            		mod_edu_3=1;  
				} 
				if (mod_edu_3==1){
					desc_mod_edu_3= document.getElementById("desc_mod_edu_3").value;
					if (desc_mod_edu_3==""){
						document.getElementById("desc_mod_edu_3").focus();
						document.getElementById("desc_mod_edu_3").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Aplicaci\xf3n de Pruebas Estandarizadas';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_3").style.backgroundColor="";
						}		
				}
			}
			
			
			var val_mod_edu_4 = document.getElementById("val_mod_edu_4").value; 
			
			if (val_mod_edu_4==1) {
				if($("#mod_edu_4").is(':checked')) {  
            		mod_edu_4=1;  
				} 
				if (mod_edu_4==1){
					desc_mod_edu_4= document.getElementById("desc_mod_edu_4").value;
					if (desc_mod_edu_4==""){
						document.getElementById("desc_mod_edu_4").focus();
						document.getElementById("desc_mod_edu_4").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Trabajos de Recojo de informaci\xf3n';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_4").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_edu_4 = document.getElementById("val_mod_edu_4").value; 
			
			if (val_mod_edu_4==1) {
				if($("#mod_edu_4").is(':checked')) {  
            		mod_edu_4=1;  
				} 
				if (mod_edu_4==1){
					desc_mod_edu_4= document.getElementById("desc_mod_edu_4").value;
					if (desc_mod_edu_4==""){
						document.getElementById("desc_mod_edu_4").focus();
						document.getElementById("desc_mod_edu_4").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre empresa o instituci\xf3n donde realiz\xf3 Trabajos de Recojo de informaci\xf3n';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_4").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_edu_5 = document.getElementById("val_mod_edu_5").value; 
			
			if (val_mod_edu_5==1) {
				if($("#mod_edu_5").is(':checked')) {  
            		mod_edu_5=1;  
				} 
				if (mod_edu_5==1){
					otro_mod_edu_5= document.getElementById("otro_mod_edu_5").value;
					if (otro_mod_edu_5==""){
						document.getElementById("otro_mod_edu_5").focus();
						document.getElementById("otro_mod_edu_5").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre Descripci\xf3n de la experiencia';
						return false;
					}	
					else {
						document.getElementById("otro_mod_edu_5").style.backgroundColor="";
						}
						
					desc_mod_edu_5= document.getElementById("desc_mod_edu_5").value;
					if (desc_mod_edu_5==""){
						document.getElementById("desc_mod_edu_5").focus();
						document.getElementById("desc_mod_edu_5").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre nombre de empresa o instituci\xf3n';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_5").style.backgroundColor="";
						}		
				}
			}
			
			var val_mod_edu_6 = document.getElementById("val_mod_edu_6").value; 
			
			if (val_mod_edu_6==1) {
				if($("#mod_edu_6").is(':checked')) {  
            		mod_edu_6=1;  
				} 
				if (mod_edu_6==1){
					otro_mod_edu_6= document.getElementById("otro_mod_edu_6").value;
					if (otro_mod_edu_6==""){
						document.getElementById("otro_mod_edu_6").focus();
						document.getElementById("otro_mod_edu_6").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre Descripci\xf3n de la experiencia';
						return false;
					}	
					else {
						document.getElementById("otro_mod_edu_6").style.backgroundColor="";
						}
						
					desc_mod_edu_6= document.getElementById("desc_mod_edu_6").value;
					if (desc_mod_edu_6==""){
						document.getElementById("desc_mod_edu_6").focus();
						document.getElementById("desc_mod_edu_6").style.backgroundColor="#FFA4A4";
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre nombre de empresa o instituci\xf3n';
						return false;
					}	
					else {
						document.getElementById("desc_mod_edu_6").style.backgroundColor="";
						}		
				}
			}
		}
		
		DIcurso= document.getElementById("DIcurso");
		MIcurso = document.getElementById("MIcurso");
		AIcurso = document.getElementById("AIcurso");
		
		DFcurso= document.getElementById("DFcurso");
		MFcurso = document.getElementById("MFcurso");
		AFcurso = document.getElementById("AFcurso");
		
		if ( (DIcurso.value!="" || MIcurso.value!=""  || AIcurso.value!="" || DFcurso.value!=""  || MFcurso.value!=""  || AFcurso.value!="")  && document.getElementById("txtCurso").value == ""  ){
			document.getElementById("txtCurso").focus();
			document.getElementById("txtCurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese correctamente los datos sobre el curso de capacitaci\xf3n';
			return false;
			} else document.getElementById("txtCurso").style.backgroundColor=""; 
		
		if ( (DIcurso.value!="" || MIcurso.value!=""  || AIcurso.value!="" || DFcurso.value!=""  || MFcurso.value!=""  || AFcurso.value!="")  && document.getElementById("txtlugar_capacitacion").value == ""  ){
			document.getElementById("txtlugar_capacitacion").focus();
			document.getElementById("txtlugar_capacitacion").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese correctamente el lugar donde realiz\xf3 su capacitaci\xf3n';
			return false;
		} else document.getElementById("txtlugar_capacitacion").style.backgroundColor=""; 	
		
		if (document.getElementById("txtCurso").value == "" ) {
		} else {

		DIcurso= document.getElementById("DIcurso");
		MIcurso = document.getElementById("MIcurso");
		AIcurso = document.getElementById("AIcurso");
		
		DFcurso= document.getElementById("DFcurso");
		MFcurso = document.getElementById("MFcurso");
		AFcurso = document.getElementById("AFcurso");
		
		if (DIcurso.value.length < 2) {
			DIcurso.focus();
			document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("DIcurso").style.backgroundColor="";
		
		if (MIcurso.value.length < 2) {
			MIcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("MIcurso").style.backgroundColor="";
		
		if (MIcurso.value == "00" || MIcurso.value > "12") {
			MIcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("MIcurso").style.backgroundColor="";
		
		if (parseInt(MIcurso.value) == 1 || parseInt(MIcurso.value) == 3 || parseInt(MIcurso.value) == 5 || parseInt(MIcurso.value) == 7 || parseInt(MIcurso.value) == 8 || parseInt(MIcurso.value) == 10 || parseInt(MIcurso.value) == 12) {
			if (parseInt(DIcurso.value) > 31) {
				DIcurso.focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
				return false;
			} else document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (parseInt(MIcurso.value) == 4 || parseInt(MIcurso.value) == 6 || parseInt(MIcurso.value) == 9 || parseInt(MIcurso.value) == 11) {
			if (parseInt(DIcurso.value) > 30) {
				DIcurso.focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
				return false;
			} else document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (AIcurso.value.length < 4) {
			AIcurso.focus();
			document.getElementById("AIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("AIcurso").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (parseInt(MIcurso.value) == 2) {
			if (parseInt(AIcurso.value) % 4 == 0) {
				if (parseInt(DIcurso.value) > 29) {
					DIcurso.focus();
					document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
					return false;
				} else document.getElementById("DIcurso").style.backgroundColor="";
			} else {
				if (parseInt(DIcurso.value) > 28) {
					document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
					return false;
				} else document.getElementById("DIcurso").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(DIcurso.value)) {
			DIcurso.focus();
			document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("DIcurso").style.backgroundColor="";
		
		if (!validarNumero(MIcurso.value)) {
			MIcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else document.getElementById("MIcurso").style.backgroundColor="";
		
		if (!validarNumero(AIcurso.value)) {
			AIcurso.focus();
			document.getElementById("AIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de inicio de curso v\xe1lido';
			return false;
		}	 else document.getElementById("AIcurso").style.backgroundColor="";
		
		if (DFcurso.value.length < 2) {
			DFcurso.focus();
			document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese dia de fin de curso v\xe1lido';
			return false;
		} else document.getElementById("DFcurso").style.backgroundColor="";
		
		if (MFcurso.value.length < 2) {
			MFcurso.focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			return false;
		} else document.getElementById("MFcurso").style.backgroundColor="";
		
		if (MFcurso.value == "00" || MFcurso.value > "12") {
			MFcurso.focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';

			return false;
		} else document.getElementById("MFcurso").style.backgroundColor="";
		
		if (parseInt(MFcurso.value) == 1 || parseInt(MFcurso.value) == 3 || parseInt(MFcurso.value) == 5 || parseInt(MFcurso.value) == 7 || parseInt(MFcurso.value) == 8 || parseInt(MFcurso.value) == 10 || parseInt(MFcurso.value) == 12) {
			if (parseInt(DFcurso.value) > 31) {

				DFcurso.focus();
				document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese dia de fin de curso v\xe1lido';
				return false;
			} else document.getElementById("DFcurso").style.backgroundColor="";
		}
		if (parseInt(MFcurso.value) == 4 || parseInt(MFcurso.value) == 6 || parseInt(MFcurso.value) == 9 || parseInt(MFcurso.value) == 11) {
			if (parseInt(DFcurso.value) > 30) {
				DFcurso.focus();
				document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
				return false;
			} else document.getElementById("DFcurso").style.backgroundColor="";
		}
		if (AFcurso.value.length < 4) {
			AFcurso.focus();
			document.getElementById("AFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
			return false;
		} else document.getElementById("AFcurso").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(MFcurso.value) == 2) {
			if (parseInt(AFcurso.value) % 4 == 0) {
				if (parseInt(DFcurso.value) > 29) {
					DFcurso.focus();
					document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
					return false;
				} else document.getElementById("DFcurso").style.backgroundColor="";
			} else {
				if (parseInt(DFcurso.value) > 28) {
					DFcurso.focus();
					document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
					return false;
				} else document.getElementById("DFcurso").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(DFcurso.value)) {
			DFcurso.focus();
			document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
			return false;
		} else document.getElementById("DFcurso").style.backgroundColor="";
		
		if (!validarNumero(MFcurso.value)) {
			MFcurso.focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("MFcurso").style.backgroundColor="";
		
		if (!validarNumero(AFcurso.value)) {
			AFcurso.focus();
			document.getElementById("AFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("AFcurso").style.backgroundColor="";
		
		if (document.getElementById("txtHorasLectivas").value == "") {
			document.getElementById("txtHorasLectivas").focus();
			document.getElementById("txtHorasLectivas").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre la cantidad de tiempo del curso profesional';
			return false;
		} else  document.getElementById("txtHorasLectivas").style.backgroundColor="";
		
		if (document.getElementById("txtTiempoHL").value == "0") {
			document.getElementById("txtTiempoHL").focus();
			document.getElementById("txtTiempoHL").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre la descripci\xf3n del tiempo del curso profesional';
			return false;
		} else  document.getElementById("txtTiempoHL").style.backgroundColor="";
		
	}
	
	var validarCap2 = document.getElementById("validarCap2").value;
	
	if (validarCap2==2){
		if (document.getElementById("txtCursoOf").value == "" ){
			document.getElementById("txtCursoOf").focus()
			document.getElementById("txtCursoOf").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre curso de Office realizado';
			return false;
		} else  document.getElementById("txtCursoOf").style.backgroundColor="";
	}	
	if (document.getElementById("txtCursoOf").value == "" ) {
		} else {

		DIcurso= document.getElementById("DIcursoOf");
		MIcurso = document.getElementById("MIcursoOf");
		AIcurso = document.getElementById("AIcursoOf");
		
		DFcurso= document.getElementById("DFcursoOf");
		MFcurso = document.getElementById("MFcursoOf");
		AFcurso = document.getElementById("AFcursoOf");
		
		if (DIcurso.value.length < 2) {
			DIcurso.focus();
			document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("DIcurso").style.backgroundColor="";
		
		if (MIcurso.value.length < 2) {
			MIcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("MIcurso").style.backgroundColor="";
		
		if (MIcurso.value == "00" || MIcurso.value > "12") {
			MIcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("MIcurso").style.backgroundColor="";
		if (parseInt(MIcurso.value) == 1 || parseInt(MIcurso.value) == 3 || parseInt(MIcurso.value) == 5 || parseInt(MIcurso.value) == 7 || parseInt(MIcurso.value) == 8 || parseInt(MIcurso.value) == 10 || parseInt(MIcurso.value) == 12) {
			if (parseInt(DIcurso.value) > 31) {
				DIcurso.focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
				return false;
			} else  document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (parseInt(MIcurso.value) == 4 || parseInt(MIcurso.value) == 6 || parseInt(MIcurso.value) == 9 || parseInt(MIcurso.value) == 11) {
			if (parseInt(DIcurso.value) > 30) {
				DIcurso.focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
				return false;
			} else  document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (AIcurso.value.length < 4) {
			AIcurso.focus();
			document.getElementById("AIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("AIcurso").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (parseInt(MIcurso.value) == 2) {
			if (parseInt(AIcurso.value) % 4 == 0) {
				if (parseInt(DIcurso.value) > 29) {
					DIcurso.focus();
					document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
					return false;
				} else  document.getElementById("DIcurso").style.backgroundColor="";
			} else {
				if (parseInt(DIcurso.value) > 28) {
					DIcurso.focus();
					document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
					return false;
				} else  document.getElementById("DIcurso").style.backgroundColor="";
			}
		}
		
		if (!validarNumero(DIcurso.value)) {
			DIcurso.focus();
			document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("DIcurso").style.backgroundColor="";
		if (!validarNumero(MIcurso.value)) {
			MIcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("MIcurso").style.backgroundColor="";
		if (!validarNumero(AIcurso.value)) {
			AIcurso.focus();
			document.getElementById("AIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de inicio de curso v\xe1lido';
			return false;
		} else  document.getElementById("AIcurso").style.backgroundColor="";
		
		if (DFcurso.value.length < 2) {
			DFcurso.focus();
			document.getElementById("MIcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese dia de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("MIcurso").style.backgroundColor="";
		if (MFcurso.value.length < 2) {
			MFcurso.focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("MFcurso").style.backgroundColor="";
		if (MFcurso.value == "00" || MFcurso.value > "12") {
			MFcurso.focus();
			document.getElementById("MFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			return false;
		} else  document.getElementById("MFcurso").style.backgroundColor="";
		if (parseInt(MFcurso.value) == 1 || parseInt(MFcurso.value) == 3 || parseInt(MFcurso.value) == 5 || parseInt(MFcurso.value) == 7 || parseInt(MFcurso.value) == 8 || parseInt(MFcurso.value) == 10 || parseInt(MFcurso.value) == 12) {
			if (parseInt(DFcurso.value) > 31) {
				DFcurso.focus();
				document.getElementById("DFcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese dia de fin de curso v\xe1lido';
				document.getElementById("DFcurso").style.backgroundColor="#FFA4A4"
				return false;
			} else  document.getElementById("DFcurso").style.backgroundColor="";
		}
		if (parseInt(MFcurso.value) == 4 || parseInt(MFcurso.value) == 6 || parseInt(MFcurso.value) == 9 || parseInt(MFcurso.value) == 11) {
			if (parseInt(DFcurso.value) > 30) {
				DIcurso.focus();
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				$("#dialog").dialog("open");
	   			document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
				document.getElementById("DIcurso").style.backgroundColor="#FFA4A4";
				return false;
			} else  document.getElementById("DIcurso").style.backgroundColor="";
		}
		if (AFcurso.value.length < 4) {
			AFcurso.focus();
			document.getElementById("AFcurso").style.backgroundColor="#FFA4A4";
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de fin de curso v\xe1lido';
			document.getElementById("AFcurso").style.backgroundColor="#FFA4A4";
			return false;
		} else  document.getElementById("AFcurso").style.backgroundColor="";
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(MFcurso.value) == 2) {
			if (parseInt(AFcurso.value) % 4 == 0) {
				if (parseInt(DFcurso.value) > 29) {
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
					DFcurso.style.backgroundColor="#FFA4A4";
					DFcurso.focus();
					return false;
				} else DFcurso.style.backgroundColor="";
			} else {
				if (parseInt(DFcurso.value) > 28) {
					$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
					DFcurso.style.backgroundColor="#FFA4A4";
					DFcurso.focus();
					return false;
				} else DFcurso.style.backgroundColor="";
			}
		}
		
		if (!validarNumero(DFcurso.value)) {
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Dia de fin de curso v\xe1lido';
			DFcurso.style.backgroundColor="#FFA4A4";
			DFcurso.focus();
			return false;
		} else DFcurso.style.backgroundColor="";
		if (!validarNumero(MFcurso.value)) {
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese Mes de fin de curso v\xe1lido';
			MFcurso.style.backgroundColor="#FFA4A4";
			MFcurso.focus();
			return false;
		} else MFcurso.style.backgroundColor="";
		if (!validarNumero(AFcurso.value)) {
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Ingrese A\xf1o de fin de curso v\xe1lido';
			AFcurso.style.backgroundColor="#FFA4A4";
			AFcurso.focus();
			return false;
		} else AFcurso.style.backgroundColor="";
		
		/*if (document.getElementById("txtHorasLectivasOf").value == "") {
			
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre Registre la cantidad de tiempo del curso de Office';
			document.getElementById("txtHorasLectivasOf").style.backgroundColor="#FFA4A4";
			document.getElementById("txtHorasLectivasOf").focus();
			return false;
		} else document.getElementById("txtHorasLectivasOf").style.backgroundColor="";
		
		if (document.getElementById("txtTiempoOf").value == "0") {
			$("#dialog").dialog("open");
	   		document.getElementById("mensaje").innerHTML = 'Registre la descripci\xf3n del tiempo del curso de Office';
			document.getElementById("txtTiempoOf").style.backgroundColor="#FFA4A4";
			document.getElementById("txtTiempoOf").focus();
			return false;
		} else document.getElementById("txtTiempoOf").style.backgroundColor="";*/
		
	}

		if (document.getElementById("cmbdisposicion").value == "") {
			$("#dialog").dialog("open");
			document.getElementById("mensaje").innerHTML = 'Seleccione veracidad de datos';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		} else
			document.getElementById("cmbVeracidad").style.backgroundColor="";
			
		if (document.getElementById("cmbdisposicion").value == 2) {
			document.getElementById("mensaje").innerHTML = 'Debe contar con disponibilidad a tiempo completo';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		} else
			document.getElementById("cmbVeracidad").style.backgroundColor="";
		
		
		if (document.getElementById("cmbdisposicion").value == "0") {
			document.getElementById("mensaje").innerHTML = 'Seleccione la Disposici\xf3n de tiempo';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		} else 
			document.getElementById("cmbVeracidad").style.backgroundColor="";
			
		if (document.getElementById("cmbVeracidad").value == "2") {
			document.getElementById("mensaje").innerHTML = 'Seleccione SI en veracidad de datos';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		}	else 
			document.getElementById("cmbVeracidad").style.backgroundColor="";
		/*
		if (document.getElementById("cmbVeracidad").value == "" || document.getElementById("cmbVeracidad").value == "0") {
			document.getElementById("mensaje").innerHTML = 'Seleccione veracidad de datos';
			document.getElementById("cmbVeracidad").style.backgroundColor="#FFA4A4";
			document.getElementById("cmbVeracidad").focus();
			return false;
		}	else 
			document.getElementById("cmbVeracidad").style.backgroundColor="";
		*/

	var valUbigeo = document.getElementById('valUbigeo').value;
				var depa1 = document.getElementById('txtDpto1').value.substring(0,2);   
				var depa2 = document.getElementById('txtDpto2').value.substring(0,2);  
				
				if 	(valUbigeo==1 || valUbigeo==2 || valUbigeo==3 || valUbigeo==5) {
				if (depa1!=15){
				
					if(depa1 != '0'){
					if(depa2 != depa1 )
					{
						
						$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Deben de coincidir los Departamentos de postulaci\xf3n y de residencia';
							document.getElementById('txtDpto2').focus();
							document.getElementById("button1").disabled=true;
							document.getElementById("txtDpto2").style.backgroundColor="#FFA4A4";
							return false;
					}   
					else
					{ 
					document.getElementById("txtDpto2").style.backgroundColor="";
					document.getElementById('txtDpto1').disabled=false;
					document.getElementById("button1").disabled=false;
					}
				  }
				} else {
					 if (depa2==15 || depa2==07 ){
							document.getElementById('txtDpto1').disabled=false;
							document.getElementById("button1").disabled=false;
							document.getElementById("txtDpto2").style.backgroundColor="";
						 }
						 else{
							 $("#dialog").dialog("open");
							 document.getElementById("mensaje").innerHTML = 'Deben de coincidir los Departamentos de postulaci\xf3n y de residencia';
							document.getElementById('txtDpto2').focus();
							document.getElementById("button1").disabled=true;
							document.getElementById("txtDpto2").style.backgroundColor="#FFA4A4";
							return false;
							 }
					}
				
				}
				else {
					document.getElementById("txtDpto2").style.backgroundColor="";
				}	
	
					var lsIdConvCargo=document.getElementById("id_cc").value;
					var lsIdProyecto=document.getElementById("id_proyecto").value;
					var ccddo1 = document.getElementById("txtDpto1").value;
					var ccdd1 = ccddo1.substring(0,2);
					var ccppo1 = document.getElementById("txtProv1").value;
					var ccpp1 = ccppo1.substring(2,4);
					var ccdio1 = document.getElementById("txtDist1").value;
					var ccdi1 = ccdio1.substring(4);
					var lsApePaterno=document.getElementById("txtApePaterno").value;
					var lsApeMaterno=document.getElementById("txtApeMaterno").value;
					var lsNombre1=document.getElementById("txtNombre1").value;
					var lsNombre2=document.getElementById("txtNombre2").value;
					var lsSexo=document.getElementById("cmbSexo").value;
					var oDia = document.getElementById("txtDia").value;
					var oMes = document.getElementById("txtMes").value;
					var oAnio = document.getElementById("txtAnio").value;
					var fecha_actual = new Date();   
					var anioA = fecha_actual.getFullYear(); 
					var lsFecNac = oDia +'/'+ oMes+'/'+oAnio;
					var lsEdad = anioA -oAnio;
					var lspais=document.getElementById("cmbpais").value;
					var lsDptoNc =document.getElementById("txtDpto3").value;
					var lsProvNc =document.getElementById("txtProv3").value;
					var lsDistNc = document.getElementById("txtDist4").value;
					var lsDNI = document.getElementById("txtDNI").value;
					var lsRUC = document.getElementById("txtRUC").value;	
					var lsECivil = document.getElementById("txtECivil").value;
					var lsCmbLen = 	document.getElementById("cmbLeng").value;
					var lsTelefono = document.getElementById("txtTelefono").value;
					var lsCelular = document.getElementById("txtCelular").value;
					var lsOperCel =	document.getElementById("cmbOperTel").value;
					var lsEmail = document.getElementById("txtEmail").value;
					var lsTipoVia = document.getElementById("cmbTipovia").value;
					var lsNomVia = document.getElementById("txtNomVia").value;
					var lsNumPuerta = document.getElementById("txtNumPuerta").value;
					var lsNumKilometro = document.getElementById("txtNumKilometro").value;
					var lsNumManzana = document.getElementById("txtNumManzana").value;
					var lsNumInterior = document.getElementById("txtNumInterior").value;
					var lsDepa = document.getElementById("txtdepa").value;
					var lsNumPiso = document.getElementById("txtNumPiso").value;
					var lsNumLote = document.getElementById("txtNumLote").value;
					var lsTipoZona = document.getElementById("cmbZona").value;
					var lsNomZona = document.getElementById("txtNomZona").value;
					var lsDptoR = document.getElementById("txtDpto2").value;
					var lsProvR = document.getElementById("txtProv2").value;
					var lsDistR = document.getElementById("txtDist2").value;
					var lsNivInst = document.getElementById("cmbNivelInstr").value;
					var lsTipEst = document.getElementById("cmbTipoEstudios").value;
					var lsGrado = document.getElementById("cmbGrado").value;
					var oDia2 = document.getElementById("txtDia2").value;
					var oMes2 = document.getElementById("txtMes2").value;
					var oAnio2 = document.getElementById("txtAnio2").value;
					if (oAnio2!='' &&  oMes2!='' && oDia2!='') 
						var lsfec_exp= oDia2 +'/'+ oMes2 +'/'+ oAnio2
					 else 
						var lsfec_exp='';
					var lsperioAlc = document.getElementById("txtperioalc").value;
					var lsTiPerAlc = document.getElementById("cmbPeriodo").value;
					var lsprofesion = document.getElementById("cmbProfesion").value;
					var lsUniv = document.getElementById("cmbUniversidad").value;
					var lsLugEst = document.getElementById("txtLugEst").value;
					var lsExpGen_anio = document.getElementById("txtExpGenAnio").value;
					var lsExpGen_meses = document.getElementById("txtExpGenMeses").value;
					var lsExpCampoanio = document.getElementById("txtExpCampoAnio").value;
					var lsExpCampomeses = document.getElementById("txtExpCampoMeses").value;
					var lsExpGrupoanio = document.getElementById("txtExpGrupoAnio").value;
					var lsExpGrupomeses = document.getElementById("txtExpGrupoMeses").value;
					var lsCapsanio = document.getElementById("txtCapaAnio").value;
					var lsCapameses = document.getElementById("txtCapaMeses").value;
					var lsDocanio = document.getElementById("txtDocAnio2").value;
					var lsDocmeses = "0";
					var lsIneiProc = document.getElementById("txtIneiProc").value;
					var lsProyecto = document.getElementById("txtProyecto").value;
					var lsIneiAnio = document.getElementById("txtIneiAnio").value;
					var lsCargoInei = document.getElementById("txtCargoInei").value;
					var lsDisposicion = document.getElementById("cmbdisposicion").value
					var lsVeracidad = document.getElementById("cmbVeracidad").value;
					var lsCargo = document.getElementById("cmbCargo").value;
					var lsmeta = document.getElementById("meta").value;
					var lsIdiomaQ = "0"; //document.getElementById("cmbIdiomaQ").value;
					var lsdispoSabDom = "0"; //document.getElementById("cmbdispoSabDom").value;
					var lsCompromiso = "0"; // document.getElementById("cmbdCompromiso").value;
					var lsid_caroQ = document.getElementById("id_caroQ").value;
					var lsHijoUnico= document.getElementById("cmbHijoUnico").value; 
					var lsJEfeHogar = document.getElementById("cmbJefeHogar").value;
					var lsLEnguaMAt= document.getElementById("cmbLengMat").value;
					var lsCurso= document.getElementById("txtCurso").value;
					var DIcurso1 = document.getElementById("DIcurso").value;
					var MIcurso1 = document.getElementById("MIcurso").value;
					var AIcurso1 = document.getElementById("AIcurso").value;
					if (AIcurso1!='' &&  MIcurso1!='' && DIcurso1!='') 
						var lsfec_Icap= DIcurso1 +'/'+ MIcurso1 +'/'+ AIcurso1
					 else 
						var lsfec_Icap='';
						
					var DFcurso1 = document.getElementById("DFcurso").value;
					var MFcurso1 = document.getElementById("MFcurso").value;
					var AFcurso1 = document.getElementById("AFcurso").value;
					if (AFcurso1!='' &&  MFcurso1!='' && DFcurso1!='') 
						var lsfec_Fcap= DFcurso1 +'/'+ MFcurso1 +'/'+ AFcurso1
					 else 
						var lsfec_Fcap='';
						
					var lsHorasLectivas=document.getElementById("txtHorasLectivas").value;
					var DiaComp = document.getElementById("DiaComp").value;
					var MesComp = document.getElementById("MesComp").value;
					var AnioComp = document.getElementById("AnioComp").value;
					if (AnioComp!='' &&  MesComp!='' && DiaComp!='') 
						var lsFecDatoCom= DiaComp +'/'+ MesComp +'/'+ AnioComp
					 else 
						var lsFecDatoCom='';

					/*if (lsFecDatoCom==""){
						$("#dialog").dialog("open");
	   				document.getElementById("mensaje").innerHTML = 'Ingrese dato complementario';
					document.getElementById("DiaComp").style.backgroundColor="#FFA4A4";
					document.getElementById("DiaComp").focus();
					return false;
						
					} else
						{
							document.getElementById("DiaComp").style.backgroundColor="";
							}*/

						
					var  txtNum_reg_grado = document.getElementById("txtNum_reg_grado").value;
					var  txtlugar_capacitacion = document.getElementById("txtlugar_capacitacion").value;
					var  txtExpAplicacion = document.getElementById("txtExpAplicacion").value;
					var  txtNombreAplicacion = document.getElementById("txtNombreAplicacion").value;
					var  txtTiempoAplicacion = document.getElementById("txtTiempoAplicacion").value;
					var  txtExpFormacion = document.getElementById("txtExpFormacion").value;
					var  txtNombreFormacion = document.getElementById("txtNombreFormacion").value;
					var  txtTiempoFormacion = document.getElementById("txtTiempoFormacion").value;
					var  txtCargo1 = document.getElementById("txtCargo1").value;
					var  txtEmpCargo1 = document.getElementById("txtEmpCargo1").value;
					var  txttiempoCargo1 = document.getElementById("txttiempoCargo1").value;
					var  txtCargo2 = document.getElementById("txtCargo2").value;
					var  txtEmpCargo2 = document.getElementById("txtEmpCargo2").value;
					var  txttiempoCargo2 = document.getElementById("txttiempoCargo2").value;
					var  cmbIdiomaC = document.getElementById("cmbIdiomaC").value;
					var  cmbNivelIdioma = document.getElementById("cmbNivelIdioma").value;
					var  cmbDomIdioma = document.getElementById("cmbDomIdioma").value;
					var txtSiDescuento=document.getElementById("txtSiDescuento").value;
					var txtSIPension="0";
					var txtSiDescuento=document.getElementById("txtSiDescuento").value;
					var txtTipoPension=document.getElementById("txtTipoPension").value;
					var txtAFP=document.getElementById("txtAFP").value;
					var txtFCUSSP=document.getElementById("txtFCUSSP").value;
					var txtPo_TipoPension="1";//document.getElementById("txtPo_TipoPension").value;
					var txtFecAfiliacion=document.getElementById("txtFecAfiliacion").value;
					var txtComision=document.getElementById("txtComision").value;
						if (txtPo_TipoPension=="AFP") {
							var txtPo_AFP="10";
							} else {
								var txtPo_AFP="";
							}
					
					var txtExpCampoInst =document.getElementById("txtExpCampoInst").value;
					var txtExpCampoFef =document.getElementById("txtExpCampoFef").value;
					var txtExpGrupoInst =document.getElementById("txtExpGrupoInst").value;
					var txtExpGrupoFec =document.getElementById("txtExpGrupoFec").value;
					var txtExpGenInst =document.getElementById("txtExpGenInst").value;
					var txtExpGenFec =document.getElementById("txtExpGenFec").value;
					var txtExpProcesos =document.getElementById("txtExpProcesos").value;
					var txtCargoAplicacion =document.getElementById("txtCargoAplicacion").value;
					var txtNombreProcesos =document.getElementById("txtNombreProcesos").value;
					var txtCargoProcesos =document.getElementById("txtCargoProcesos").value;
					var txtCargoFormacion =document.getElementById("txtCargoFormacion").value;
					var txtTiempoProcesos =document.getElementById("txtTiempoProcesos").value;
					var txtTiempoApli =document.getElementById("txtTiempoApli").value;
					var txtCargoProc =document.getElementById("txtCargoProc").value;
					var txtTiempoFor =document.getElementById("txtTiempoFor").value;
					var txtCursoOf =document.getElementById("txtCursoOf").value;
					var txtlugar_capacitacionOf =document.getElementById("txtlugar_capacitacionOf").value;
					var DIcursoOf = document.getElementById("DIcursoOf").value;
					var MIcursoOf = document.getElementById("MIcursoOf").value;
					var AIcursoOf = document.getElementById("AIcursoOf").value;
					if (AIcursoOf!='' &&  MIcursoOf!='' && DIcursoOf!='') 
						var lsfec_IOf= DIcursoOf +'/'+ MIcursoOf +'/'+ AIcursoOf
					 else 
						var lsfec_IOf='';
					var DFcursoOf = document.getElementById("DFcursoOf").value;
					var MFcursoOf = document.getElementById("MFcursoOf").value;
					var AIcursoOf = document.getElementById("AIcursoOf").value;
					if (DFcursoOf!='' &&  MFcursoOf!='' && AIcursoOf!='') 
						var lsfec_FOf= DFcursoOf +'/'+ MFcursoOf +'/'+ AIcursoOf
					 else 
						var lsfec_FOf='';
					var txtHorasLectivasOf =document.getElementById("txtHorasLectivasOf").value;
					var txtTiempoHL =document.getElementById("txtTiempoHL").value;
					var txtTiempoOf =document.getElementById("txtTiempoOf").value;
					var preg1 =document.getElementById("preg1").value;
					var preg2 =document.getElementById("preg2").value;
					var preg3 =document.getElementById("preg3").value;
					var preg4=document.getElementById("preg4").value;
					var preg5=document.getElementById("preg5").value;
					var preg6 =document.getElementById("preg6").value;
					var preg7 =document.getElementById("preg7").value;
					var preg8 =document.getElementById("preg8").value;
					var preg9 =document.getElementById("preg9").value;
					var preg10=document.getElementById("preg10").value;
					var preg11 =document.getElementById("preg11").value;
					var preg12 =document.getElementById("preg12").value;
					var preg13 =document.getElementById("preg13").value;
					
					var existe =document.getElementById("existe").value;
					var txtFecEmi=document.getElementById("txtFecEmi").value;
					var id_usuario=document.getElementById("id_usuario").value;

					var cod_tambo=""
					if (document.getElementById("ver_tambo").value==1){
						cod_tambo=document.getElementById("txtTambo").value;
					}
					var ubicacion="";
					var centro_poblado=""
					
					if (document.getElementById("ver_centroPob").value==1){
						ubicacion=document.getElementById("cmbUbicacion").value;
						centro_poblado=document.getElementById("txtCentroPob").value;
					}

					if (document.getElementById("validarCargo1").value==2) {
						if (txtCargo1==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el \xfaltimo cargo desempeñado';
							document.getElementById("txtCargo1").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargo1").focus();
							return false;
							} else document.getElementById("txtCargo1").style.backgroundColor="";
						if (txtEmpCargo1==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la empresa del \xfaltimo cargo desempeñado';
							document.getElementById("txtEmpCargo1").style.backgroundColor="#FFA4A4";
							document.getElementById("txtEmpCargo1").focus();
							return false;
							} else document.getElementById("txtEmpCargo1").style.backgroundColor="";
						if (txttiempoCargo1=="" || txttiempoCargo1=="0"){
							
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de desempeño en el \xfaltimo cargo';
							document.getElementById("txttiempoCargo1").style.backgroundColor="#FFA4A4";
							document.getElementById("txttiempoCargo1").focus();
							return false;
							} else document.getElementById("txttiempoCargo1").style.backgroundColor="";
					}
					if (document.getElementById("validarCargo2").value==2) {	
						if (txtCargo2==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el penultimo cargo desempeñado';
							document.getElementById("txtCargo2").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargo2").focus();
							return false;
							} else document.getElementById("txtCargo2").style.backgroundColor="";
						if (txtEmpCargo2==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la empresa del penultimo cargo desempeñado';
							document.getElementById("txtEmpCargo2").style.backgroundColor="#FFA4A4";
							document.getElementById("txtEmpCargo2").focus();
							return false;
							} else document.getElementById("txtEmpCargo2").style.backgroundColor="";
						if (txttiempoCargo2=="" || txttiempoCargo2=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de desempeño en el penultimo cargo';
							document.getElementById("txttiempoCargo2").style.backgroundColor="#FFA4A4";
							document.getElementById("txttiempoCargo2").focus();
							return false;
							} else document.getElementById("txttiempoCargo2").style.backgroundColor="";
					}
					
					if (lsid_caroQ==489 || lsid_caroQ==492 || lsid_caroQ==490 ) {	
						if (txtExpCampoInst==""){
							alert("Registre el nombre de la instituci\xf3n de la primera experiencia solicitada");
							document.getElementById("txtExpCampoInst").focus();
							return false;
							}
						if (txtExpCampoFef==""){
							alert("Registre la fecha del \xfaltimo dia de labor de la primera experiencia solicitada");
							document.getElementById("txtExpCampoFef").focus();
							return false;
							}
						if (txtExpCampoAnio==""){
							alert("Registre el tiempo en anios de la primera experiencia solicitada");
							document.getElementById("txtExpCampoAnio").focus();
							return false;
							}
						if (txtExpCampoMeses==""){
							alert("Registre el tiempo en meses de la primera experiencia solicitada");
							document.getElementById("txtExpCampoMeses").focus();
							return false;
							}
							
						if (txtExpGrupoInst==""){
							alert("Registre el nombre de la instituci\xf3n de la segunda experiencia solicitada");
							document.getElementById("txtExpCampoInst").focus();
							return false;
							}
						if (txtExpGrupoFec==""){
							alert("Registre la fecha del \xfaltimo dia de labor de la segunda experiencia solicitada");
							document.getElementById("txtExpGrupoFec").focus();
							return false;
							}
						if (txtExpGrupoAnio==""){
							alert("Registre el tiempo en anios de la segunda experiencia solicitada");
							document.getElementById("txtExpGrupoAnio").focus();
							return false;
							}
						if (txtExpGrupoMeses==""){
							alert("Registre el tiempo en meses de la seginda experiencia solicitada");
							document.getElementById("txtExpGrupoMeses").focus();
							return false;
							}
					}
					
					
					if (document.getElementById("ValidarExp1").value==2) {
						if (txtExpAplicacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el Nombre de la \xdaltima Experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtExpAplicacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtExpAplicacion").focus();
							return false;
							} else document.getElementById("txtExpAplicacion").style.backgroundColor="";
						
						if (txtNombreAplicacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la Instituci\xf3n de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtNombreAplicacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtNombreAplicacion").focus();
							return false;
							} else document.getElementById("txtNombreAplicacion").style.backgroundColor="";
						
						if (txtCargoAplicacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el cargo de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtCargoAplicacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargoAplicacion").focus();
							return false;
							} else document.getElementById("txtCargoAplicacion").style.backgroundColor="#FFA4A4";
							
						if (txtTiempoAplicacion=="" || txtTiempoAplicacion=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtTiempoAplicacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoAplicacion").focus();
							return false;
							} else document.getElementById("txtTiempoAplicacion").style.backgroundColor="";
							
						if (txtTiempoApli=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Seleccione la descripci\xf3n del tiempo de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtTiempoApli").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoApli").focus();
							return false;
							} else document.getElementById("txtTiempoApli").style.backgroundColor="";
					}
					
					if (document.getElementById("validarExp2").value==2) {
						if (txtExpProcesos==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el Nombre de la \xfaltima Experiencia en procesos de operaciones de aplicaci\xf3nn de instrumentos en campo';
							document.getElementById("txtExpProcesos").style.backgroundColor="#FFA4A4";
							document.getElementById("txtExpProcesos").focus();
							return false;
							} else document.getElementById("txtExpProcesos").style.backgroundColor="";
							
						if (txtNombreProcesos==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la Instituci\xf3n de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtNombreProcesos").style.backgroundColor="#FFA4A4";
							document.getElementById("txtNombreProcesos").focus();
							return false;
							} else document.getElementById("txtNombreProcesos").style.backgroundColor="";
							
						if (txtCargoProcesos==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el cargo de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtCargoProcesos").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargoProcesos").focus();
							return false;
							} else document.getElementById("txtCargoProcesos").style.backgroundColor="";
							
						if (txtTiempoProcesos=="" || txtTiempoProcesos=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtTiempoProcesos").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoProcesos").focus();
							return false;
							} else document.getElementById("txtTiempoProcesos").style.backgroundColor="";
							
						if (txtCargoProc=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Seleccione la descripci\xf3n del tiempo de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo';
							document.getElementById("txtCargoProc").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargoProc").focus();
							return false;
							}	else document.getElementById("txtCargoProc").style.backgroundColor="";
					}
					
					if (document.getElementById("validarExp3").value==2) { 
						if (txtExpFormacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el Nombre de la \xfaltima experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtExpFormacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtExpFormacion").focus();
							return false;
							} else document.getElementById("txtExpFormacion").style.backgroundColor="";
							
						if (txtNombreFormacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el nombre de la Instituci\xf3n de la experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtNombreFormacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtNombreFormacion").focus();
							return false;
							} else document.getElementById("txtNombreFormacion").style.backgroundColor="";
							
						if (txtCargoFormacion==""){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el cargo de la experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtCargoFormacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtCargoFormacion").focus();
							return false;
							} else document.getElementById("txtCargoFormacion").style.backgroundColor="";
							
						if (txtTiempoFormacion=="" || txtTiempoFormacion=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Registre el tiempo de la experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtTiempoFormacion").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoFormacion").focus();
							return false;
							}
							
						if (txtTiempoFor=="0"){
							$("#dialog").dialog("open");
							document.getElementById("mensaje").innerHTML = 'Seleccione la descripci\xf3n del tiempo de la experiencia en aula o proyectos de Formaci\xf3n';
							document.getElementById("txtTiempoFor").style.backgroundColor="#FFA4A4";
							document.getElementById("txtTiempoFor").focus();
							return false;
							} else document.getElementById("txtTiempoFor").style.backgroundColor="";
					}
				if (document.getElementById("preguntasAdicionales").value!="0"){
					if (preg1==0 && document.getElementById("valPreg1").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene impedimento de contratar con el estado';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene impedimento de contratar con el estado';
							}
						document.getElementById("preg1").style.backgroundColor="#FFA4A4";
						document.getElementById("preg1").focus();
						return false;
					} else document.getElementById("preg1").style.backgroundColor="";
					
					if (preg2==0 && document.getElementById("valPreg2").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene disponibilidad exclusiva y a tiempo completo, para trabajar durante todas las bases del operativo';
						} else {
						document.getElementById("mensaje").innerHTML = 'Registre si tiene antecedentes sobre sanci\xf3n por falta administrativa';
						}
						document.getElementById("preg2").style.backgroundColor="#FFA4A4";
						document.getElementById("preg2").focus();
						return false;
					} else document.getElementById("preg2").style.backgroundColor="";
					
					if (preg3==0 && document.getElementById("valPreg3").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene habilidades para el manejo de equipos interdisciplinarios';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene familiares hasta el 4to grado de consanguinidad 2do de afinidad con facultad de nombrar, designar en nuestra instituci\xf3n';}
						document.getElementById("preg3").style.backgroundColor="#FFA4A4";
						document.getElementById("preg3").focus();
						return false;
					} else document.getElementById("preg3").style.backgroundColor="";
					
					if (preg4==0 && document.getElementById("valPreg4").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene habilidades comunicativas para la resolucion de problemas';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si acepta solo postular en esta convocatoria';
							}
						document.getElementById("preg4").style.backgroundColor="#FFA4A4";
						document.getElementById("preg4").focus();
						return false;
					} else document.getElementById("preg4").style.backgroundColor="";
					
					if (preg5==0 && document.getElementById("valPreg5").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad para coordinar con autoridades de distintas instituciones publicas y privadas';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene habilidades para el manejo de equipos interdisciplinarios';
							}
						document.getElementById("preg5").style.backgroundColor="#FFA4A4";
						document.getElementById("preg5").focus();
						return false;
					} else document.getElementById("preg5").style.backgroundColor="";
					
					if (preg6==0 && document.getElementById("valPreg6").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad para trabajar bajo presion y con tolerancia y frustracion';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene habilidades comunicativas y para la resoluci\xf3n de problemas';
							}
						document.getElementById("preg6").style.backgroundColor="#FFA4A4";
						document.getElementById("preg6").focus();
						return false;
					} else document.getElementById("preg6").style.backgroundColor="";
					
					if (preg7==0 && document.getElementById("valPreg7").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si acepta la obligatoriedad de asistir a sesiones de capacitacion?';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad de trabajar bajo presi\xf3n';
						}
						document.getElementById("preg7").style.backgroundColor="#FFA4A4";
						document.getElementById("preg7").focus();
						return false;
					} else document.getElementById("preg7").style.backgroundColor="";
					
					if (preg8==0 && document.getElementById("valPreg8").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre tiene buen nivel de lectura comprensiva y adecuada diccion';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad para coordinar con autoridades de distintas instituciones p\xfablicas y privadas';
							}
						document.getElementById("preg8").style.backgroundColor="#FFA4A4";
						document.getElementById("preg8").focus();
						return false;
					} document.getElementById("preg8").style.backgroundColor="";
					
					if (preg9==0 && document.getElementById("valPreg9").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre usted cuenta con mas de 10 horas capacitando';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si tiene capacidad para coordinar con autoridades de distintas instituciones p\xfablicas y privadas';
						}
						document.getElementById("preg9").style.backgroundColor="#FFA4A4";
						document.getElementById("preg9").focus();
						return false;
					} else document.getElementById("preg9").style.backgroundColor="";
							
					if (preg10==0 && document.getElementById("valPreg10").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si usted reside en la sede a la que postula';
						} else {
							document.getElementById("mensaje").innerHTML = 'Registre si es docente con aula a cargo en IE estatales';
						}
						document.getElementById("preg10").style.backgroundColor="#FFA4A4";
						document.getElementById("preg10").focus();
						return false;
					} else document.getElementById("preg10").style.backgroundColor="";
					
					if (preg11==0 && document.getElementById("valPreg11").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene contrato vigente como docente en el sector publico';
						} else {document.getElementById("mensaje").innerHTML = 'Registre si tiene disposici\xf3n exclusiva y a tiempo completo durante las fases del Operativo de campo';
						}
						document.getElementById("valPreg11").style.backgroundColor="#FFA4A4";
						document.getElementById("valPreg11").focus();
						return false;
					} else document.getElementById("valPreg11").style.backgroundColor="";
					
					if (preg12==0 && document.getElementById("valPreg12").value==2){
						$("#dialog").dialog("open");
						if (lsIdProyecto==103){
							document.getElementById("mensaje").innerHTML = 'Registre si tiene disponibilidad para viajar';
						} else {
						document.getElementById("mensaje").innerHTML = 'Registre si acepta la obligatoriedad de asistir a las sesiones de capacitaci\xf3n'; 
						}
						document.getElementById("preg12").style.backgroundColor="#FFA4A4";
						document.getElementById("preg12").focus();
						return false;
					} document.getElementById("preg12").style.backgroundColor="";
					
					if (preg13==0 && document.getElementById("valPreg13").value==2){
						$("#dialog").dialog("open");
						document.getElementById("mensaje").innerHTML = 'Registre si es residente en la sede que le corresponde (Est\xe1 postulando)';
						document.getElementById("preg13").style.backgroundColor="#FFA4A4";
						document.getElementById("preg13").focus();
						return false;
					}	 else document.getElementById("preg13").style.backgroundColor="";
			}
			
			ajax=http_request();
					var valores;	
					valores= "lsIdConvCargo="+escape(lsIdConvCargo)+ "&ccdd1="+escape(ccdd1)+ "&ccpp1="+escape(ccpp1)+ "&ccdi1="+escape(ccdi1)+ "&lsApePaterno="+escape(lsApePaterno)+ "&lsApeMaterno="+escape(lsApeMaterno)+ "&lsNombre1="+escape(lsNombre1)+ "&lsNombre2="+escape(lsNombre2)+ "&lsSexo="+escape(lsSexo)+ "&lsFecNac ="+escape(lsFecNac)+ "&lsEdad ="+escape(lsEdad)+ "&lspais="+escape(lspais)+ "&lsDptoNc ="+escape(lsDptoNc)+ "&lsProvNc ="+escape(lsProvNc)+ "&lsDistNc ="+escape(lsDistNc)+ "&lsDNI ="+escape(lsDNI)+ "&lsRUC="+escape(lsRUC)+ "&lsECivil="+escape(lsECivil)+ "&lsCmbLen="+escape(lsCmbLen)+ "&lsTelefono="+escape(lsTelefono)+ "&lsCelular="+escape(lsCelular)+ "&lsOperCel="+escape(lsOperCel)+ "&lsEmail="+escape(lsEmail)+ "&lsTipoVia ="+escape(lsTipoVia)+ "&lsNomVia="+escape(lsNomVia)+ "&lsNumPuerta ="+escape(lsNumPuerta)+ "&lsNumKilometro="+escape(lsNumKilometro)+ "&lsNumManzana="+escape(lsNumManzana)+ "&lsNumInterior="+escape(lsNumInterior)+ "&lsDepa ="+escape(lsDepa)+ "&lsNumPiso ="+escape(lsNumPiso)+ "&lsNumLote ="+escape(lsNumLote)+ "&lsTipoZona="+escape(lsTipoZona)+ "&lsNomZona ="+escape(lsNomZona)+ "&lsDptoR ="+escape(lsDptoR)+ "&lsProvR ="+escape(lsProvR)+ "&lsDistR ="+escape(lsDistR)+ "&lsNivInst="+escape(lsNivInst)+ "&lsTipEst="+escape(lsTipEst)+ "&lsGrado ="+escape(lsGrado)+ "&lsfec_exp="+escape(lsfec_exp)+ "&lsperioAlc ="+escape(lsperioAlc)+ "&lsTiPerAlc="+escape(lsTiPerAlc)+ "&lsprofesion="+escape(lsprofesion)+ "&lsUniv="+escape(lsUniv)+"&lsLugEst="+escape(lsLugEst)+"&lsExpGen_anio="+escape(lsExpGen_anio)+"&lsExpGen_meses="+escape(lsExpGen_meses)+"&lsExpCampoanio="+escape(lsExpCampoanio)+ "&lsExpCampomeses="+escape(lsExpCampomeses)+ "&lsExpGrupoanio="+escape(lsExpGrupoanio)+ "&lsExpGrupomeses="+escape(lsExpGrupomeses)+ "&lsCapsanio="+escape(lsCapsanio)+ "&lsCapameses ="+escape(lsCapameses)+ "&lsDocanio ="+escape(lsDocanio)+ "&lsDocmeses="+escape(lsDocmeses)+ "&lsIneiProc="+escape(lsIneiProc)+ "&lsProyecto="+escape(lsProyecto)+ "&lsIneiAnio ="+escape(lsIneiAnio)+ "&lsCargoInei="+escape(lsCargoInei)+ "&lsDisposicion="+escape(lsDisposicion)+ "&lsVeracidad="+escape(lsVeracidad)+ "&lsCargo="+escape(lsCargo)+ "&lsmeta="+escape(lsmeta)+ "&lsIdProyecto="+escape(lsIdProyecto)+ "&lsid_caroQ="+escape(lsid_caroQ)+ "&lsHijoUnico="+escape(lsHijoUnico)+ "&lsJEfeHogar="+escape(lsJEfeHogar)+ "&lsLEnguaMAt="+escape(lsLEnguaMAt)+ "&lsCurso="+escape(lsCurso)+ "&lsfec_Icap="+escape(lsfec_Icap)+ "&lsfec_Fcap="+escape(lsfec_Fcap)+ "&lsHorasLectivas="+escape(lsHorasLectivas)+ "&lsFecDatoCom="+escape(lsFecDatoCom)+ "&txtNum_reg_grado="+escape(txtNum_reg_grado)+ "&txtlugar_capacitacion="+escape(txtlugar_capacitacion)+ "&txtExpAplicacion="+escape(txtExpAplicacion)+ "&txtNombreAplicacion="+escape(txtNombreAplicacion)+ "&txtTiempoAplicacion="+escape(txtTiempoAplicacion)+ "&txtExpFormacion="+escape(txtExpFormacion)+ "&txtNombreFormacion="+escape(txtNombreFormacion)+ "&txtTiempoFormacion="+escape(txtTiempoFormacion)+ "&txtCargo1="+escape(txtCargo1)+ "&txtEmpCargo1="+escape(txtEmpCargo1)+ "&txttiempoCargo1="+escape(txttiempoCargo1)+ "&txtCargo2="+escape(txtCargo2)+ "&txtEmpCargo2="+escape(txtEmpCargo2)+ "&txttiempoCargo2="+escape(txttiempoCargo2)+ "&cmbIdiomaC="+escape(cmbIdiomaC)+ "&cmbNivelIdioma="+escape(cmbNivelIdioma)+ "&cmbDomIdioma="+escape(cmbDomIdioma)+ "&txtSiDescuento="+escape(txtSiDescuento)+ "&txtSIPension="+escape(txtSIPension)+ "&txtTipoPension="+escape(txtTipoPension)+ "&txtAFP="+escape(txtAFP)+ "&txtFCUSSP="+escape(txtFCUSSP)+ "&txtPo_AFP="+escape(txtPo_AFP)+ "&txtPo_TipoPension="+escape(txtPo_TipoPension) + "&txtFecAfiliacion="+escape(txtFecAfiliacion)+ "&txtComision="+escape(txtComision)+ "&txtExpCampoInst="+escape(txtExpCampoInst)+ "&txtExpCampoFef="+escape(txtExpCampoFef)+ "&txtExpGrupoInst="+escape(txtExpGrupoInst)+ "&txtExpGrupoFec="+escape(txtExpGrupoFec)+ "&txtExpGenInst="+escape(txtExpGenInst)+ "&txtExpGenFec="+escape(txtExpGenFec)+ "&txtExpProcesos="+escape(txtExpProcesos)+ "&txtCargoAplicacion="+escape(txtCargoAplicacion)+ "&txtNombreProcesos="+escape(txtNombreProcesos)+ "&txtCargoProcesos="+escape(txtCargoProcesos)+ "&txtCargoFormacion="+escape(txtCargoFormacion)+ "&txtTiempoProcesos="+escape(txtTiempoProcesos)+ "&txtTiempoApli="+escape(txtTiempoApli)+ "&txtCargoProc="+escape(txtCargoProc)+ "&txtTiempoFor ="+escape(txtTiempoFor)+ "&txtCursoOf ="+escape(txtCursoOf)+ "&txtlugar_capacitacionOf="+escape(txtlugar_capacitacionOf)+ "&lsfec_IOf ="+escape(lsfec_IOf)+ "&lsfec_FOf ="+escape(lsfec_FOf)+ "&txtHorasLectivasOf ="+escape(txtHorasLectivasOf)+ "&txtTiempoHL  ="+escape(txtTiempoHL)+ "&txtTiempoOf ="+escape(txtTiempoOf)+ "&preg1  ="+escape(preg1)+ "&preg2  ="+escape(preg2)+ "&preg3  ="+escape(preg3)+ "&preg4  ="+escape(preg4)+ "&preg5  ="+escape(preg5)+ "&preg6  ="+escape(preg6)+ "&preg7  ="+escape(preg7)+ "&preg8  ="+escape(preg8)+ "&preg9  ="+escape(preg9)+ "&preg10 ="+escape(preg10)+ "&preg11  ="+escape(preg11)+ "&preg12  ="+escape(preg12)+ "&preg13  ="+escape(preg13)+ "&txtFecEmi="+escape(txtFecEmi)+"&existe="+escape(existe)+"&id_usuario="+escape(id_usuario)+"&mod_edu_1="+escape(mod_edu_1)+"&mod_edu_2="+escape(mod_edu_2)+"&mod_edu_3="+escape(mod_edu_3)+"&mod_edu_4="+escape(mod_edu_4)+"&mod_edu_5="+escape(mod_edu_5)+"&mod_edu_6="+escape(mod_edu_6)+"&mod_cod_1="+escape(mod_cod_1)+"&mod_cod_2="+escape(mod_cod_2)+"&mod_cod_3="+escape(mod_cod_3)+"&desc_mod_edu_1="+escape(desc_mod_edu_1)+"&desc_mod_edu_2="+escape(desc_mod_edu_2)+"&desc_mod_edu_3="+escape(desc_mod_edu_3)+"&desc_mod_edu_4="+escape(desc_mod_edu_4)+"&desc_mod_edu_5="+escape(desc_mod_edu_5)+"&desc_mod_edu_6="+escape(desc_mod_edu_6)+"&otro_mod_edu_5="+escape(otro_mod_edu_5)+"&otro_mod_edu_6="+escape(otro_mod_edu_6)+"&desc_mod_cod_1="+escape(desc_mod_cod_1)+"&desc_mod_cod_2="+escape(desc_mod_cod_2)+"&desc_mod_cod_3="+escape(desc_mod_cod_3)+"&cod_tambo="+escape(cod_tambo)+"&ubicacion="+escape(ubicacion)+"&centro_poblado="+escape(centro_poblado)+"&subDistrito="+escape(subDistrito)+"&flag_rnp="+escape(flag_rnp)+"&fechainirnp="+escape(fechainirnp)+"&fechafinrnp="+escape(fechafinrnp) +"&txtexpad_anio_1="+escape(txtexpad_anio_1) +"&txtexpad_anio_2="+escape(txtexpad_anio_2) +"&txtexpad_meses_1="+escape(txtexpad_meses_1) +"&txtexpad_meses_2="+escape(txtexpad_meses_2) ;	
					
					url="pd_confirmacion_act.asp";
					
					ajax.open ('POST', url, true);
					ajax.onreadystatechange = function() {
					 if (ajax.readyState==1) {
					 }
					 else if (ajax.readyState==4){
						
						if(ajax.status==200){		

							if (ajax.responseText==3 ){
								alert ('Actualziaci\xf3n exitosa.');			
							}
													
						}
						else if(ajax.status==404){
							
						}
						else{ 
						}
					}
				}
				ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				ajax.send(valores);
			   return;					
	}
	
	
}