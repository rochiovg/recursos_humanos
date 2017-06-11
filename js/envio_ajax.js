﻿// JavaScript Document
  
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

var primerslap=false; 
var segundoslap=false; 

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


function fs_numeros(e) {
	
        tecla = (document.all) ? e.keyCode : e.which; 

	
			if (tecla < 48 || tecla > 57 ) {
				return false;
				
			}

        if (tecla==8 || tecla!=13) return true;
}

function fs_numeros_dec(e) {
	
        tecla = (document.all) ? e.keyCode : e.which; 

	
			if ((tecla < 48 || tecla > 57) && tecla!=46 ) {
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


function enviar_Presu(){

	var lsproyecto =document.frmMiForm.txtactividad.value ;
	var lsFuncional =document.frmMiForm.txtNombre.value ;
	var lsSiga =document.frmMiForm.cmbCargo.value ;
	var lsUsuario =document.frmMiForm.txtUsuario.value ;
	var lsnPerido =document.frmMiForm.txtnperiodo.value ;
	var lsPeriodo =document.frmMiForm.cmbperiodo.value ;
	var lsCant =document.frmMiForm.txtcant.value ;
	var lsftto =document.frmMiForm.cmbftto.value ;
	var lstcont =document.frmMiForm.tcontrato.value ;
	var lsnivel =document.frmMiForm.cmbnivel.value ;
	var lsAct =document.frmMiForm.cmbActividad.value ;

	if(lsFuncional =="")
	{alert("Debes de Seleccionar el Cargo Funcional")
		return false
		}
		
	if(lsSiga  =="0")
	{alert("Debes de Seleccionar el cargo Segun escala SIGA")
		return false
		}


	if(lsPeriodo  =="0")
	{alert("Debes de Seleccionar el tipo  periodo")
		return false
		}
			if(lsCant  =="")
	{alert("Debes de Ingresar la Cantidad de Pea a Contratar")
		return false
		}
	if(lsnPerido  =="")
	{alert("Debes de Ingresar el cantidad del  periodo")
		return false
		}
		if(lsftto =="0")
	{alert("Debes de Seleccionar la fuente de Financiamiento")
		return false
		}

		if(lstcont =="0")
	{alert("Debes de Seleccionar el Tipo de Contrato")
		return false
		}
		
		
			if(lsAct =="0")
	{alert("Debes de Seleccionar la Actividad")
		return false
		}
		
		
		
		if(lsnivel =="0")
	{alert("Debes de Seleccionar el Nivel de RRHH")
		return false
		}


	ajax=http_request();
	var valores;	
	valores= "lsproyecto=" + lsproyecto+"&lsFuncional=" + escape(lsFuncional)+"&lsSiga="+lsSiga+"&lsUsuario="+escape(lsUsuario)+"&lsnPerido="+escape(lsnPerido)+"&lsPeriodo="+escape(lsPeriodo)+"&lsCant="+escape(lsCant)+"&lsFtto="+escape(lsftto)+"&lstcont="+lstcont+"&lsnivel="+lsnivel+"&lsAct="+lsAct+"&lsTipo=44";  // parametros a enviar al servidor	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("divCriterio").style.display="block";
                 document.getElementById("divCriterio").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){

				alert('Se guard\xf3 el registro correctamente.')
				document.getElementById("frmMiForm").reset();
				MostrarPresupuestos();
            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                    document.getElementById("divCriterio").innerHTML =ajax.responseText;
					
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 

}




function enviar_cargo_nvo(){
 
	var cmbCargo =document.frmMiForm.cmbCargo.value ;
	var lsCPea =document.frmMiForm.txtCantPea.value ;
	var lsDepen =document.frmMiForm.cmbDependencia.value ;
	var lsnPeriodo =document.frmMiForm.txtnperiodo.value ;
	
	var lstperiodo =document.frmMiForm.cmbperiodo1.value ;
	var lsArmadas =document.frmMiForm.txtarmadas.value ;
	var lsUsuario =document.frmMiForm.txtUsuario.value ;

	var nperiodo=document.getElementById("txtnperiodo").value;
	var tperiodo=document.getElementById("cmbperiodo1").value;
	var pago=document.getElementById("txttsueldo").value;

	var maximo;
	var sum = 0;
	var tiempo=0;
	 var arrArmadas = new Array();
	 for (var i=1; i<= parseInt(lsArmadas); i++) {
		 
		var txt = 'n'+i;
		var totalArmadas=0;
		sum = sum + parseFloat (document.getElementById(txt).value);
		arm =i.toString()+parseFloat (document.getElementById(txt).value);
		arrArmadas.push(arm);
	 }
	 
	 if( lstperiodo==1){
		nperiodo=nperiodo/30.0; 
		tiempo=nperiodo
		} else 
		tiempo=nperiodo;
			
		sum=roundToTwo(sum);	 
	 	maximo = roundToTwo(tiempo*pago);
/*	
if (sum<=maximo)
{*/
	if(cmbCargo =="")
	{
		alert("Debes de Ingresar el nombre del Cargo Funcional")
		return false
		}
		
		if(lsDepen =="0")
	{alert("Debes de Seleccionar la ODEI ")
		return false
		}
			if(lsnPeriodo =="" || lsnPeriodo =="0" )
	{alert("Debes de Ingresar el N\xfamero de Per\xedodos")
		return false
		}
			if(lstperiodo =="0")
	{alert("Debes de Seleccionar el Tipo de Periodo")
		return false
		}
		
		if(lsArmadas ==""|| lsArmadas =="0")
	{alert("Debes de Ingresar el N\xfamero de armadas")
		return false
		}
		if(lsCPea =="" || lsCPea =="0")
	{alert("Debes de Ingresar el N\xfamero de Peas a solicitar disponibilidad")
		return false
		}	
	ajax=http_request();
	var valores;	
	valores= "cmbCargo="+escape(cmbCargo)+"&lsnPeriodo="+escape(lsnPeriodo)+"&lstperiodo="+lstperiodo+"&lsArmadas="+lsArmadas+"&lsCPea="+lsCPea+"&lsDepen="+lsDepen+"&lsNArmadas="+arrArmadas+"&lsUsuario="+lsUsuario+"&lsTipo=174";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("divCriterio").style.display="block";
                 document.getElementById("divCriterio").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
			document.getElementById("frmMiForm").reset();
			$( "#users tbody" ).empty();
			MostrarCCPresupuestario();
            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                    	document.getElementById("divCriterio").innerHTML =ajax.responseText;
					
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 
/*}else 

{
	alert ("Error al ingreso de las armadas, verificar montos a pagar")
	return false;
	
	}*/
   
}

function enviar_cargo(){
 
	var cmbCargo =document.frmMiForm.cmbCargo.value ;
	var lsCPea =document.frmMiForm.txtCantPea.value ;
	var lsDepen =document.frmMiForm.cmbDependencia.value ;
	var lsnPeriodo =document.frmMiForm.txtnperiodo.value ;
	
	var lstperiodo =document.frmMiForm.cmbperiodo1.value ;
	var lsArmadas =document.frmMiForm.txtarmadas.value ;
	var lsUsuario =document.frmMiForm.txtUsuario.value ;

	var nperiodo=document.getElementById("txtnperiodo").value;
	var tperiodo=document.getElementById("cmbperiodo1").value;
	var pago=document.getElementById("txttsueldo").value;

	var maximo;
	var sum = 0;
	var tiempo=0;
	var arrArmadas = new Array();
	for (var i=1; i<= parseInt(lsArmadas); i++) {
		 
		var txt = 'n'+i;
		var totalArmadas=0;
		sum = sum + parseFloat (document.getElementById(txt).value);
		arm =i.toString()+parseFloat (document.getElementById(txt).value);
		arrArmadas.push(arm);
	}
	 
	if( lstperiodo==1)
	{
		nperiodo=nperiodo/30.0; 
		tiempo=nperiodo
	} else 
		tiempo=nperiodo;
			
	sum=roundToTwo(sum);	 
	maximo = roundToTwo(tiempo*pago);
	
if (sum<=maximo)
{
	if(cmbCargo =="")
	{
		alert("Debes de Ingresar el nombre del Cargo Funcional")
		return false
	}
		
	if(lsDepen =="0")
	{
		alert("Debes de Seleccionar la ODEI ")
		return false
	}
	
	if(lsnPeriodo =="" || lsnPeriodo =="0" )
	{
		alert("Debes de Ingresar el N\xfamero de Per\xedodos")
		return false
	}
	
	if(lstperiodo =="0")
	{
		alert("Debes de Seleccionar el Tipo de Periodo")
		return false
	}
		
	if(lsArmadas ==""|| lsArmadas =="0")
	{
		alert("Debes de Ingresar el N\xfamero de armadas")
		return false
	}
		
	if(lsCPea =="" || lsCPea =="0")
	{
		alert("Debes de Ingresar el N\xfamero de Peas a solicitar disponibilidad")
		return false
	}

	ajax=http_request();
	var valores;	
	valores= "cmbCargo="+escape(cmbCargo)+"&lsnPeriodo="+escape(lsnPeriodo)+"&lstperiodo="+lstperiodo+"&lsArmadas="+lsArmadas+"&lsCPea="+lsCPea+"&lsDepen="+lsDepen+"&lsNArmadas="+arrArmadas+"&lsUsuario="+lsUsuario+"&lsTipo=41";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("divCriterio").style.display="block";
                 document.getElementById("divCriterio").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
			document.getElementById("frmMiForm").reset();
			$( "#users tbody" ).empty();
			MostrarCCPresupuestario();
            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                    	document.getElementById("divCriterio").innerHTML =ajax.responseText;
					
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 
}else 

	{
		alert ("Error al ingreso de las armadas, verificar montos a pagar")
		return false;
	}

}


function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}


function calificarCV(VALOR)
{
	
	 if(document.frmMiForm.txtDpto1.value == '' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 	alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			 
	/*if(document.frmMiForm.txtDpto1.value == '0' )
	{
		alert("Selecciona el Departamento");
		document.frmMiForm.txtDpto1.focus();
		return false;
	}
	if(document.frmMiForm.txtProv1.value == 9999 )
	{
		alert("Selecciona la Provincia");
		document.frmMiForm.txtDpto1.focus();
		return false;
	}
	if(document.frmMiForm.txtDist1.value == 999999 )
	{
		alert("Selecciona el Distrito");
		document.frmMiForm.txtDpto1.focus();
		return false;
	}
	if(document.frmMiForm.cmbCargo.value == '0' )
	{
		alert("Selecciona el combo del Cargo");
		document.frmMiForm.cmbCargo.focus();
		return false;
	}*/
	var lsDPTO = document.frmMiForm.txtDpto1.value;
	var lsPROV = document.frmMiForm.txtProv1.value;
	var lsDIST = document.frmMiForm.txtDist1.value;
	var lsUsuario = document.frmMiForm.txtUsuario.value;
	var lsCargo = document.frmMiForm.cmbCargo.value;

		//var lsCargo = document.frmMiForm.cmbCargo1.value;
		// var txtzona= document.frmMiForm.txtzona1.value;
		// var txtseccion = document.frmMiForm.txtseccion1.value;
	//	var lsCargo='900';
	//	 var txtzona='999999';
	//	 var txtseccion='999999';		
//		 if(lsCargo1=='900'){
	//		 lsCargo=lsCargo;
	//	} else 
	//		 lsCargo=lsCargo1;
	var lsConvCar=document.frmMiForm.txtConvocartoria.value;
	ajax=http_request();
	var valores;	
/*	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar) +"&VALOR="+VALOR+"&txtzona="+escape(txtzona) +"&txtseccion="+escape(txtseccion) ; // parametros a enviar al servidor	
	*/
	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar) +"&VALOR="+VALOR; // parametros a enviar al servidor
	
	url="m_GeneraNOTACV_div.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) 
		 {
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

                     document.getElementById("contenido").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 
}
function CEntrevista(VALOR)
{
	
	 if(document.frmMiForm.txtDpto1.value == '' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 	alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 }  
	var lsDPTO = document.frmMiForm.txtDpto1.value;
	var lsPROV = document.frmMiForm.txtProv1.value;
	var lsDIST = document.frmMiForm.txtDist1.value;
	var lsUsuario = document.frmMiForm.txtUsuario.value;
	var lsCargo = document.frmMiForm.cmbCargo.value;


	var lsConvCar=document.frmMiForm.txtConvocartoria.value;
	ajax=http_request();
	var valores;	

	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar) +"&VALOR="+VALOR; // parametros a enviar al servidor
	
	url="m_GeneraEntrevista.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) 
		 {
			document.getElementById("contenido2").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("contenido2").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("contenido2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("contenido2").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 
}
function verTest(){
	
		if(document.frmMiForm.txtDpto1.value == '0' ){
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
		}

		if(document.frmMiForm.cmbCargo.value == '0' ){
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false; 
		}
			 
			 var VALOR=0;
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;
		 	 
		
			 

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar) +"&VALOR="+VALOR; // parametros a enviar al servidor	
	
	url="m_testPiscologico.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 
}


function verTestCAS(){
	
			 if(document.frmMiForm.cmbProceso.value == '0' )
		 {
			 alert("Selecciona el numero de Proceso");
			 document.frmMiForm.cmbProceso.focus();
			 return false;
			 
			 }
			 
			 		 	
		 var lsProceso = document.frmMiForm.cmbProceso.value;


	ajax=http_request();
	var valores;	
	valores= "lsProceso=" + escape(lsProceso); // parametros a enviar al servidor	
	
	url="m_testPiscologicoCAS.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 
}

function verTestCASExcel(){
	
			 if(document.frmMiForm.cmbProceso.value == '0' )
		 {
			 alert("Selecciona el numero de Proceso");
			 document.frmMiForm.cmbProceso.focus();
			 return false;
			 
			 }
			 
			 		 	
		 var lsProceso = document.frmMiForm.cmbProceso.value;

pagina = "m_testPiscologicoCASExcel.asp?lsProceso=" + lsProceso;
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	
}



function Calificacion_automatica(valor){
	
			 if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
			 	 if(document.frmMiForm.txtProv1.value == 9999 )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 	 if(document.frmMiForm.txtDist1.value == 999999 )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
							 
			 	 if(document.frmMiForm.cmbCargo.value == '0' )
		 {
			 alert("Selecciona el combo del Cargo");
			
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 }
			 if (valor==1 ){
				vmin=0;
				vmax=0;
				vcantidad=0;		 
			} else if (valor==2){
				vmin= document.frmMiForm.txtmin.value;
				vmax=document.frmMiForm.txtmax.value;
				vcantidad=0;
				if (vmin==""){
				alert('Ingrese Valor minimo de nota para la seleccion');
				document.frmMiForm.txtmin.focus();
				return false;
				}
				if (vmin<0 || vmin>20 ){
				alert('Los valores se deben de encontrar entre 0 y 20, verificar');
				document.frmMiForm.txtmin.focus();
				return false;
				}
				if (vmax==""){
				alert('Ingrese Valor minimo de nota para la seleccion');
				document.frmMiForm.txtmax.focus();
				return false;
				}
				if (vmax<0 || vmax>20 ){
				alert('Los valores se deben de encontrar entre 0 y 20, verificar');
				document.frmMiForm.txtmax.focus();
				return false;
				}
				if (vmin>vmax){
					alert ('valor minimo mayor al valor maximo, verificar');
					 document.frmMiForm.txtmin.value="";
					 document.frmMiForm.txtmax.value="";
					 document.frmMiForm.txtmin.focus();
					return false;
				}
			}else{
				vmin= 0;
				vmax=0;
				vcantidad=document.frmMiForm.txtcantidad.value;
				if (vcantidad==""){
					alert('Registre la cantidad de personas que desea revisar');
					document.frmMiForm.txtcantidad.focus();
					return false
					}
			}

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&valor="+escape(valor)+"&vmin="+escape(vmin)+"&vmax="+escape(vmax)+"&vcantidad="+escape(vcantidad);  // parametros a enviar al servidor	
	url="m_califiacion_automatica.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


function Calificacion_automaticaFicha(){
	
			 if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
			 	 if(document.frmMiForm.txtProv1.value == 9999 )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 	 if(document.frmMiForm.txtDist1.value == 999999 )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
							 
			 	 if(document.frmMiForm.cmbCargo.value == '0' )
		 {
			 alert("Selecciona el combo del Cargo");
			
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 }
			 if (valor==1 ){
				vmin=0;
				vmax=0;
				vcantidad=0;		 
			} else if (valor==2){
				vmin= document.frmMiForm.txtmin.value;
				vmax=document.frmMiForm.txtmax.value;
				vcantidad=0;
				if (vmin==""){
				alert('Ingrese Valor minimo de nota para la seleccion');
				document.frmMiForm.txtmin.focus();
				return false;
				}
				if (vmin<0 || vmin>20 ){
				alert('Los valores se deben de encontrar entre 0 y 20, verificar');
				document.frmMiForm.txtmin.focus();
				return false;
				}
				if (vmax==""){
				alert('Ingrese Valor minimo de nota para la seleccion');
				document.frmMiForm.txtmax.focus();
				return false;
				}
				if (vmax<0 || vmax>20 ){
				alert('Los valores se deben de encontrar entre 0 y 20, verificar');
				document.frmMiForm.txtmax.focus();
				return false;
				}
				if (vmin>vmax){
					alert ('valor minimo mayor al valor maximo, verificar');
					 document.frmMiForm.txtmin.value="";
					 document.frmMiForm.txtmax.value="";
					 document.frmMiForm.txtmin.focus();
					return false;
				}
			}else{
				vmin= 0;
				vmax=0;
				vcantidad=document.frmMiForm.txtcantidad.value;
				if (vcantidad==""){
					alert('Registre la cantidad de personas que desea revisar');
					document.frmMiForm.txtcantidad.focus();
					return false
					}
			}

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&valor="+escape(valor)+"&vmin="+escape(vmin)+"&vmax="+escape(vmax)+"&vcantidad="+escape(vcantidad);  // parametros a enviar al servidor	
	url="m_califiacion_automatica.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}





function grabar_NotaCV(ID_PER, band ,usuario)
{
	if (band>20){
		alert('La nota a ingresar debe estar entre 0-20');
		document.getElementById("txtnota"+ID_PER).focus();
		return false;	
	}
	else{
	
ajax=http_request();
	var valores;	
	valores= "ID_PER=" + escape(ID_PER) + "&band=" + escape(band)+ "&USUARIO=" + escape(usuario)+"&lsTipo=52";  // parametros a enviar al servidor	


	url="m_ingreso.asp";   // nombre de url a invocar
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 
         }
         else if (ajax.readyState==4){
		
            if(ajax.status==200){
            }
            else if(ajax.status==404){
            }
            else{

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return ;
	}
}


function enviar_consulta(nivel){
		
		 if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte");
			 document.frmMiForm.cboReporte.focus();
			 return false;
			 
			 }
		 if(document.frmMiForm.txtDpto1.value == '' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
		var lsReporte = document.frmMiForm.cboReporte.value;
		
		if (lsReporte==21 || lsReporte==23 || lsReporte==24 || lsReporte==25|| lsReporte==28) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9

 		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var txtSedeop = document.frmMiForm.txtSedeop.value;
		 var txtProvSed = document.frmMiForm.txtProvSed.value;
		 var txtDistSed = document.frmMiForm.txtDistSed.value;
		 var txtzona= document.frmMiForm.txtzona1.value;
		 var txtseccion = document.frmMiForm.txtseccion1.value;
		 
		 
		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
			 
		for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		 }

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;

	
	for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }

txtfecha=document.getElementById("txtfecha").value;

if (txtfecha.length <10 && txtfecha.length>0 )
{
	alert('Fecha incorrecta, favor verificar');
	document.getElementById("txtfecha").value="";
	document.getElementById("txtfecha").focus();
	return false;
	}
txtTrabI=document.getElementById("txtTrabI").value;	

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsReporte="+escape(lsReporte)+"&lsConvocaroria="+escape(lsConvocaroria)+"&valor="+escape(valor)+"&lsnivel="+escape(lsnivel)+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed)+"&txtfecha="+escape(txtfecha)+"&txtTrabI="+escape(txtTrabI)+"&txtzona="+escape(txtzona)+"&txtseccion="+escape(txtseccion);  // parametros a enviar al servidor	
	
	url="Consulta_1_ins.asp";	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			if(lsReporte=='5' )
				{
							document.getElementById("mostar_detalle2").style.display="block";
							
				}else 
				
				{
		
							document.getElementById("mostar_detalle2").style.display="block";
							

				}								
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


function enviar_consulta_ece(nivel){
		
		 if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte");
			 document.frmMiForm.cboReporte.focus();
			 return false;
			 
			 }
		 if(document.frmMiForm.txtDpto1.value == '' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
		var lsReporte = document.frmMiForm.cboReporte.value;
		
		if (lsReporte==21 || lsReporte==23 || lsReporte==24 || lsReporte==25|| lsReporte==28) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9

 		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var txtSedeop = document.frmMiForm.txtSedeop.value;
		 var txtProvSed = document.frmMiForm.txtProvSed.value;
		 var txtDistSed = document.frmMiForm.txtDistSed.value;

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
			 
		for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		 }

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;

	
	for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }

txtfecha=document.getElementById("txtfecha").value;

if (txtfecha.length <10 && txtfecha.length>0 )
{
	alert('Fecha incorrecta, favor verificar');
	document.getElementById("txtfecha").value="";
	document.getElementById("txtfecha").focus();
	return false;
	}
txtTrabI=document.getElementById("txtTrabI").value;	

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsReporte="+escape(lsReporte)+"&lsConvocaroria="+escape(lsConvocaroria)+"&valor="+escape(valor)+"&lsnivel="+escape(lsnivel)+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed)+"&txtfecha="+escape(txtfecha)+"&txtTrabI="+escape(txtTrabI);  // parametros a enviar al servidor	
	
	url="Consulta_1_ins_ece.asp";
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			if(lsReporte=='5' )
				{
							document.getElementById("mostar_detalle2").style.display="block";
							
				}else 
				
				{
		
							document.getElementById("mostar_detalle2").style.display="block";
							

				}								
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}





function enviar_consulta_ece_minedu(nivel){
		
		 if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte");
			 document.frmMiForm.cboReporte.focus();
			 return false;
			 
			 }
		 if(document.frmMiForm.txtDpto1.value == '' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
		var lsReporte = document.frmMiForm.cboReporte.value;
		
		if (lsReporte==21 || lsReporte==23 || lsReporte==24 || lsReporte==25|| lsReporte==28) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9

 		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var txtSedeop = document.frmMiForm.txtSedeop.value;
		 var txtProvSed = document.frmMiForm.txtProvSed.value;
		 var txtDistSed = document.frmMiForm.txtDistSed.value;

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
			 
		for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		 }

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;

	
	for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }

txtfecha=document.getElementById("txtfecha").value;

if (txtfecha.length <10 && txtfecha.length>0 )
{
	alert('Fecha incorrecta, favor verificar');
	document.getElementById("txtfecha").value="";
	document.getElementById("txtfecha").focus();
	return false;
	}
txtTrabI=document.getElementById("txtTrabI").value;	

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsReporte="+escape(lsReporte)+"&lsConvocaroria="+escape(lsConvocaroria)+"&valor="+escape(valor)+"&lsnivel="+escape(lsnivel)+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed)+"&txtfecha="+escape(txtfecha)+"&txtTrabI="+escape(txtTrabI);  // parametros a enviar al servidor	
	
	url="Consulta_1_ins_ece_minedu.asp";
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			if(lsReporte=='5' )
				{
							document.getElementById("mostar_detalle2").style.display="block";
							
				}else 
				
				{
		
							document.getElementById("mostar_detalle2").style.display="block";
							

				}								
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}



function enviar_consultaReporte_ece(){
		
		  if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte");
			 document.frmMiForm.cboReporte.focus();
			 return false;
			 
			 }
		 if(document.frmMiForm.txtDpto1.value == '' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
		var lsReporte = document.frmMiForm.cboReporte.value;
		
		if (lsReporte==21 || lsReporte==23 || lsReporte==24 || lsReporte==25|| lsReporte==28) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9

 		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var txtSedeop = document.frmMiForm.txtSedeop.value;
		 var txtProvSed = document.frmMiForm.txtProvSed.value;
		 var txtDistSed = document.frmMiForm.txtDistSed.value;

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
			 
		for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		 }

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;

	
	for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }

txtfecha=document.getElementById("txtfecha").value;

if (txtfecha.length <10 && txtfecha.length>0 )
{
	alert('Fecha incorrecta, favor verificar');
	document.getElementById("txtfecha").value="";
	document.getElementById("txtfecha").focus();
	return false;
	}
txtTrabI=document.getElementById("txtTrabI").value;	

	pagina = "m_reporteConsultas_ece.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsReporte="+escape(lsReporte)+"&lsConvocaroria="+escape(lsConvocaroria)+"&valor="+escape(valor)+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&sede="+escape(sede)+"&txtfecha="+escape(txtfecha)+"&txtTrabI="+escape(txtTrabI)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed);
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}


function enviar_consultaReporte(){
		
		 if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte");
			 document.frmMiForm.cboReporte.focus();
			 return false;
			 
			 }
		 if(document.frmMiForm.txtDpto1.value == '' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
		var lsReporte = document.frmMiForm.cboReporte.value;
		
		if (lsReporte==21 || lsReporte==23 || lsReporte==24|| lsReporte==25) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		
		 else 
		valor=9

 		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var txtSedeop = document.frmMiForm.txtSedeop.value;
		 
		var txtProvSed = document.frmMiForm.txtProvSed.value;
		var txtDistSed = document.frmMiForm.txtDistSed.value;
		
		 var txtzona= document.frmMiForm.txtzona1.value;
		 var txtseccion = document.frmMiForm.txtseccion1.value;
		 

		for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }


		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;
txtfecha=document.getElementById("txtfecha").value;


if (txtfecha.length < 10 && txtfecha.length>0 )
{
	alert('Fecha incorrecta, favor verificar');
	document.getElementById("txtfecha").value="";
	document.getElementById("txtfecha").focus();
	return false;
	}

txtTrabI=document.getElementById("txtTrabI").value;

	pagina = "m_reporteConsultas.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsReporte="+escape(lsReporte)+"&lsConvocaroria="+escape(lsConvocaroria)+"&valor="+escape(valor)+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&sede="+escape(sede)+"&txtfecha="+escape(txtfecha)+"&txtTrabI="+escape(txtTrabI)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed)+"&txtzona="+escape(txtzona)+"&txtseccion="+escape(txtseccion);
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}


function SeleccionarDat2()
{
	var lsDPTO = document.frmMiForm.txtDpto1.value;
	var lsPROV = document.frmMiForm.txtProv1.value;
	var lsDIST = document.frmMiForm.txtDist1.value;
	var lsCargo = document.frmMiForm.cmbCargo.value;
	var lsCargo1 = document.frmMiForm.cmbCargo1.value;

	if(document.frmMiForm.txtDpto1.value == '' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 

		 if(lsCargo1=='900')
		 {
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;
	
	
	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsConvocaroria="+	lsConvocaroria;  // parametros a enviar al servidor	
		url="m_GeneraSel2.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function()
	{
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem2").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divDetallem2").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divDetallem2").innerHTML = ajax.responseText;	
					                      
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);	
   	return;	 
}



function SeleccionarDat(){

		var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsUsuario = document.frmMiForm.txtUsuario.value;
		var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		var lsCargo = document.frmMiForm.cmbCargo.value;

		var lsZona = document.frmMiForm.txtzona1.value;
		var lsSeccion = document.frmMiForm.txtseccion1.value;

		var combo = document.getElementById("txtzona1");
		var combo1 = document.getElementById("txtseccion1");

		var zona=combo.options[combo.selectedIndex].text;
		var seccion=combo1.options[combo1.selectedIndex].text;

		if (lsZona=='999999'){
			zona=lsZona;
		}
		if (lsSeccion=='999999'){
			seccion=lsSeccion;
		}

		var lsRol = document.frmMiForm.lsRol.value;
		 
		 

			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}
	
		
		
		
		  if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;

		if (lsCargo=='200'){
			alert('Seleccione el cargo');
			return false;
			}

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;

		if (lsConvocaroria=='0'){
			alert('Seleccione la convocatoria');
			return false;
		}


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvocaroria="+	lsConvocaroria+"&zona="+zona+"&seccion="+seccion;  // parametros a enviar al servidor	
	url="m_GeneraSel1.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
					                      
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	







	/*	var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsUsuario = document.frmMiForm.txtUsuario.value;
		var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsRol = document.frmMiForm.lsRol.value;

		var txtzona= document.frmMiForm.txtzona1.value;
		var txtseccion = document.frmMiForm.txtseccion1.value;
		


		if (lsRol<=66 && lsRol>=62) {
			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
		}

		if (lsRol<=66 && lsRol>=63) {
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
		}

		if (lsRol<=66 && lsRol>=64) {
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}
		}

		if (lsRol<=66 && lsRol>=65) {
			if (txtzona=='999999'){
				alert('Seleccione la zona');
				document.frmMiForm.txtzona1.focus();
				return false
			}
		}

		if (lsRol==66) {
			if (txtseccion=='999999'){
				alert('Seleccione la secci\xf3n');
				document.frmMiForm.txtseccion1.focus();
				return false
			}
		} 
		 
		  if (lsRol==34) {
			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}
		}
		
		
		
		  if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;

		if (lsCargo=='900'){
			alert('Seleccione el cargo');
			return false;
			}

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvocaroria="+escape(lsConvocaroria);  // parametros a enviar al servidor	
	url="m_GeneraSel1.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
					                      
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 */

}

function exportarRANKING (valor)
{		

	 	
var lsDPT = document.frmMiForm.txtDpto1.value;
		
			var lsDPTO = lsDPT.substr(3, 2);
			var lsPROV = lsDPT.substr(5, 2);
			var lsDIST = lsDPT.substr(7, 2);
	
	 pagina = "m_reporteRanking.asp?lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST;
	
	 
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

 
	
}


function exportarRA(valor)
{		

 	 	
var lsReporte = document.frmMiForm.cboReporte.value;
	if (lsReporte!='')
	{
		
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsconvocatoria = document.frmMiForm.txtConvocartoria.value;
		var txtSedeop = document.frmMiForm.txtSedeop.value;
		var txtProvSed = document.frmMiForm.txtProvSed.value;
		var txtDistSed = document.frmMiForm.txtDistSed.value;
		
		var txtzona= document.frmMiForm.txtzona1.value;
		 var txtseccion = document.frmMiForm.txtseccion1.value;
		 
				var lsConvocaroria = document.frmMiForm.txtConvocartoria.value; 
		 
		
		if (lsReporte==21 || lsReporte==23 || lsReporte==24|| lsReporte==25) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9
		
		 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		}


	for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }

txtfecha=document.getElementById("txtfecha").value;


if (txtfecha.length < 10 && txtfecha.length>0 )
{
	alert('Fecha incorrecta, favor verificar');
	document.getElementById("txtfecha").value="";
	document.getElementById("txtfecha").focus();
	return false;
	}

txtTrabI=document.getElementById("txtTrabI").value;

	
	 pagina = "exportarRA.asp?lsCargo=" + lsCargo+"&lsreporte="+lsReporte+"&lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST+"&valor="+valor+"&lsconvocatoria="+lsconvocatoria+"&lsnivel="+lsnivel+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed) +"&txtfecha="+escape(txtfecha) +"&txtTrabI="+escape(txtTrabI)+"&txtzona="+escape(txtzona)+"&txtseccion="+escape(txtseccion)+"&lsConvocaroria="+escape(lsConvocaroria);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	}else 
	{
	alert("Seleccione el tipo de reporte que desea")
	} 
	
}

function exportarRA_ece(valor)
{		
 	 	
var lsReporte = document.frmMiForm.cboReporte.value;
	if (lsReporte!='')
	{
		
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsconvocatoria = document.frmMiForm.txtConvocartoria.value;
		var txtSedeop = document.frmMiForm.txtSedeop.value;
		var txtProvSed = document.frmMiForm.txtProvSed.value;
		var txtDistSed = document.frmMiForm.txtDistSed.value;
		
		if (lsReporte==21 || lsReporte==23 || lsReporte==24|| lsReporte==25) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9
		
		 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		}


	for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }

txtfecha=document.getElementById("txtfecha").value;


if (txtfecha.length < 10 && txtfecha.length>0 )
{
	alert('Fecha incorrecta, favor verificar');
	document.getElementById("txtfecha").value="";
	document.getElementById("txtfecha").focus();
	return false;
	}

txtTrabI=document.getElementById("txtTrabI").value;

	
	 pagina = "exportarRA_ece.asp?lsCargo=" + lsCargo+"&lsreporte="+lsReporte+"&lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST+"&valor="+valor+"&lsconvocatoria="+lsconvocatoria+"&lsnivel="+lsnivel+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed) +"&txtfecha="+escape(txtfecha) +"&txtTrabI="+escape(txtTrabI);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	}else 
	{
	alert("Seleccione el tipo de reporte que desea")
	} 
	
}


function verAptosEntrevista(VALOR){
	
			 if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
			 		 	 if(document.frmMiForm.txtProv1.value == 9999 )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 	 if(document.frmMiForm.txtDist1.value == 999999 )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
							 
			 	 if(document.frmMiForm.cmbCargo.value == '0' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 }
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 	 
		
			 

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario) +"&VALOR="+VALOR; // parametros a enviar al servidor	
	
	url="m_entrevista_div.asp";  
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

                     document.getElementById("contenido").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 
}




function ResultadoFinal(){
	
	 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 valor=document.frmMiForm.nivelRRHH[i].value;
		}
	
	if(document.frmMiForm.cmbCargo.value == '999' )
	{
		 alert("Selecciona el combo del Cargo");
		 document.frmMiForm.cmbCargo.focus();
		 return false; 
	}

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&valor="+escape(valor);  // parametros a enviar al servidor	
	url="m_resultado_final.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}




function enviarMeta_APLI_esta(){
	
			 if(document.frmMiForm.txtDpto.value == '0' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto.focus();
			 return false;
			 
			 }
			 
			 
			  if(document.frmMiForm.txtProv1.value == '0' && (document.frmMiForm.txtDpto.value != '98' || document.frmMiForm.txtDpto.value != '99'))
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 }
			 
			 	 if(document.frmMiForm.cmbCargo.value == '0' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 }

		 var lsDPTO = document.frmMiForm.txtDpto.value;
		 var lsprov = document.frmMiForm.txtProv1.value;

		 var lsRol = document.frmMiForm.cmbCargo.value;

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsprov="+escape(lsprov)+"&lsRol="+escape(lsRol);  // parametros a enviar al servidor	
	url="g_apli_esta.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("mensaje").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("mensaje").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("mensaje").innerHTML = ajax.responseText;	
					                      
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
		 document.getElementById("icono").style.display="block";

	
   return;	 

}


function enviar_contrato(){
	
	var cargo =document.getElementById("cmbCargo").value;
	
	if (cargo=='' || cargo==0){
		alert ("Seleccione el cargo");
		document.getElementById("cmbCargo").focus();
		return false;
	} else {

		var lstotalPea =document.getElementById("txtTotalPea").value ;
		var pea_faltante =document.getElementById("txtpea_f").value ;
	
		if (lstotalPea==0){
			alert("No existe PEA pendiente de contrataci\u00f3n");
			return false;
		}
		
		if (parseInt(lstotalPea)>parseInt(pea_faltante)){
			alert("La cantidad ed Personas a contratar supera lo requerido. Favor verificar");
			return false;
		}
		
	
		var lsIdpresupuesto =document.getElementById("txtIdPresupuesto").value ;
		var lsidCcpresupuestario =document.getElementById("txtIdCcpresupuestario").value ;
		var lsNumConvocatoria =document.getElementById("txtNumConvocatoria").value ;
		var lsIdConvCargo =document.getElementById("txtIdConvCargo").value ;
		var lsFechaContrato =document.getElementById("txtfechaContrato").value ;
		var lsFechainicio =document.getElementById("txtfechaInicio").value ;
		var lsFechaFin =document.getElementById("txtfechaFin").value ;
		var lsIdCuenta =document.getElementById("txtUsuario").value ;
		var lsIpRegistro =document.getElementById("txtIPregistro").value ;
		var lsObservacion =document.getElementById("txtObservacion").value ;
		var lsProyecto =document.getElementById("txtproyecto").value ;
		var lsFecIniCap =document.getElementById("txtFecIniCap").value ;
		var lsFecFinCap=document.getElementById("txtFecFinCap").value ;
		
		if(lsFecIniCap=='')
		{lsFecIniCap='1900-01-01'; }
		
		if(lsFecFinCap=='')
		{lsFecFinCap='1900-01-01'; }
		
		
		
		if(lsFechaContrato==''){
			alert ("Ingrese la fecha de Contrato");
			document.getElementById("txtfechaContrato").focus();
			return false;
		} else if (lsFechainicio==''){
			alert ("Ingrese la fecha de Inicio de Labores");
			document.getElementById("txtfechaInicio").focus();
			return false;
			} else if (lsFechaFin==''){
				alert ("Ingrese la fecha de Fin");
				document.getElementById("txtfechaFin").focus();
				return false;
				} else{ 
					if(lsFechaContrato!=lsFechainicio && lsObservacion=='' ){
						alert("Ingrese Observacion");
						document.getElementById("txtObservacion").focus();
						return false;
					}else{
					ajax=http_request();
					var valores;	
					valores= "lsIdpresupuesto="+escape(lsIdpresupuesto)+"&lsidCcpresupuestario="+escape(lsidCcpresupuestario)+"&lsNumConvocatoria="+escape(lsNumConvocatoria)+"&lsIdConvCargo="+escape(lsIdConvCargo)+"&lstotalPea="+escape(lstotalPea)+"&lsFechaContrato="+escape(lsFechaContrato)+"&lsFechainicio="+escape(lsFechainicio)+"&lsFechaFin="+escape(lsFechaFin)+"&lsIdCuenta="+escape(lsIdCuenta)+"&lsIpRegistro="+escape(lsIpRegistro)+"&lsObservacion="+escape(lsObservacion)+"&lsFecIniCap="+escape(lsFecIniCap)+"&lsFecFinCap="+escape(lsFecFinCap)+"&lsProyecto="+escape(lsProyecto)+"&lsTipo=57";  // parametros a enviar al servidor	
		
	
					url="m_ingreso.asp";  
					ajax.open ('POST', url, true);
					ajax.onreadystatechange = function() {
						 if (ajax.readyState==1) {
							 document.getElementById("divCriterio").style.display="block";
								 document.getElementById("divCriterio").innerHTML ="<span class=etiqueta>Cargando......</span>";
						 }
						 else if (ajax.readyState==4){
							if(ajax.status==200){
									  
									document.getElementById("divCriterio").innerHTML =ajax.responseText;
									document.getElementById("frmMiForm").reset();
									$( "#users tbody" ).empty();
				
							}
							else if(ajax.status==404){
								document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
								}
								else{
									document.getElementById("divCriterio").innerHTML =ajax.responseText;
								}
						}
					}
					ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
					ajax.send(valores);
					
				   return;	
					}
			}
	}
}





function SeleccionarAperturaConf(VALOR){
 
 if (VALOR=='1')
 {
  var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
  var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
  var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
  var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 
  var lsrolusu = document.frmMiForm.txtRol.value;

 
  if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }


  if (  (document.frmMiForm.txtRol.value!='7') && (document.frmMiForm.txtRol.value!='1'))
   {  
				
        if(document.getElementById("txtDpto1").value == '0' )
		 {
			 alert("Seleccionar el Departamento");
			 document.getElementById("txtDpto1").focus();
			 return false;
			 
		 }
			 
   }	


   var i

   for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH[i].value;
                                               }

                               }

                

                ajax=http_request();
        
                var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel)+"&VALOR="+VALOR+"&lsrolusu="+lsrolusu;		
 }
 if(VALOR=='2')
 {
	 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
     if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }
  		
       ajax=http_request();
       
     var valores= "lsperiodo=" + escape(lsperiodo)+"&VALOR="+VALOR;
 }
 if(VALOR=='3')
 {
	 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
     if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }
				
	  var i

   for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH[i].value;
                                               }

                               }			
				
				
				
  		
       ajax=http_request();
       
     var valores= "lsperiodo=" + escape(lsperiodo)+"&VALOR="+VALOR+"&lsnivel="+escape(lsnivel);

 } 
 
  if(VALOR=='4')
 {
	var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
  var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
  var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
  var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 
  var lsrolusu = document.frmMiForm.txtRol.value;

 
  if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }


  if (  (document.frmMiForm.txtRol.value!='7') && (document.frmMiForm.txtRol.value!='1'))
   {  
				
        if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Seleccionar el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
		 }
			 
		if(document.frmMiForm.txtProv1.value == '9999' )
		 {
			 alert("Seleccionar la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
		}
	    if(document.frmMiForm.txtDist1.value == '999998' )
		 {
			 alert("Seleccionar el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
	     }				
   }	

				
				
				
  		
       ajax=http_request();
       

	 
var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&VALOR="+VALOR+"&lsrolusu="+lsrolusu;	

 } 
 
 
                
                url="pd_dtAperturarConformidad.asp"; 
                ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
        else if (ajax.readyState==4){
            if(ajax.status==200){
                                                                                                                                                             
                        document.getElementById("divResultado").innerHTML =ajax.responseText;
						 ActMontoPlanilla(1);
						                                                                        
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;           
                                                                                                    
                                                                
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
                
                
   return;              

}


function VerExcelApertura()
{              
    
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 


 if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }             
                
                
var i

for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               lsnivel=document.frmMiForm.nivelRRHH[i].value;
                               }              
                


ajax=http_request();


var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel);                 

                
url = "Expd_dtAperturarConformidad.asp?"+valores;  

window.open(url,'Exportar','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
                                              
}



function SeleccionarAprobarConf(VALOR){
 
 if (VALOR=='1')
 {
  var lsperiodo2=document.getElementById("cmboPerConfPlanilla").value; 
  var lsDPTO =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
  var lsPROV =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
  var lsDIST =document.getElementById("txtDist2").options[document.getElementById("txtDist2").selectedIndex].value; 
  var lsrolusu = document.frmMiForm.txtRol.value;

 
  if ( lsperiodo2=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerConfPlanilla").focus();
                  return false
                }


  if (  (document.frmMiForm.txtRol.value!='7') && (document.frmMiForm.txtRol.value!='1') && (document.frmMiForm.txtRol.value!='14'))
   {  
				
        if(document.frmMiForm.txtDpto2.value == '0' )
		 {
			 alert("Seleccionar el Departamento");
			 document.frmMiForm.txtDpto2.focus();
			 return false;
			 
		 }
			 
   }	


   var i

   for (i=0;i<document.frmMiForm.nivelRRHH2.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH2[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH2[i].value;
                                               }

                               }

                

                ajax=http_request();
        
                var valores= "lsperiodo2=" + escape(lsperiodo2)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel)+"&VALOR="+VALOR+"&lsrolusu="+lsrolusu;		

 
 }
 if(VALOR=='2')
 {
	 var lsperiodo2=document.getElementById("cmboPerConfPlanilla").value; 
     if ( lsperiodo2=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerConfPlanilla").focus();
                  return false
                }
  		
       ajax=http_request();
       
     var valores= "lsperiodo2=" + escape(lsperiodo2)+"&VALOR="+VALOR;
 }
 if(VALOR=='3')
 {
	 var lsperiodo2=document.getElementById("cmboPerConfPlanilla").value; 
     if ( lsperiodo2=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerConfPlanilla").focus();
                  return false
                }
				
	  var i

   for (i=0;i<document.frmMiForm.nivelRRHH2.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH2[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH2[i].value;
                                               }

                               }			
				
				
				
  		
       ajax=http_request();
       
     var valores= "lsperiodo2=" + escape(lsperiodo2)+"&VALOR="+VALOR+"&lsnivel="+escape(lsnivel);

 } 
 
  if(VALOR=='4')
 {
	var lsperiodo2=document.getElementById("cmboPerConfPlanilla").value; 
  var lsDPTO =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
  var lsPROV =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
  var lsDIST =document.getElementById("txtDist2").options[document.getElementById("txtDist2").selectedIndex].value; 
  var lsrolusu = document.frmMiForm.txtRol.value;

 
  if ( lsperiodo2=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerConfPlanilla").focus();
                  return false
                }


  if (  (document.frmMiForm.txtRol.value!='7') && (document.frmMiForm.txtRol.value!='1'))
   {  
				
        if(document.frmMiForm.txtDpto2.value == '0' )
		 {
			 alert("Seleccionar el Departamento");
			 document.frmMiForm.txtDpto2.focus();
			 return false;
			 
		 }
			 
		if(document.frmMiForm.txtProv2.value == '9999' )
		 {
			 alert("Seleccionar la Provincia");
			 document.frmMiForm.txtProv2.focus();
			 return false;
			 
		}
	    if(document.frmMiForm.txtDist2.value == '999998' )
		 {
			 alert("Seleccionar el Distrito");
			 document.frmMiForm.txtDist2.focus();
			 return false;
			 
	     }				
   }	

				
				
				
  		
       ajax=http_request();
       

	 
var valores= "lsperiodo2=" + escape(lsperiodo2)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&VALOR="+VALOR+"&lsrolusu="+lsrolusu;	

 }  
                
                url="pd_dtAprobarConformidad.asp"; 
                ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
        else if (ajax.readyState==4){
            if(ajax.status==200){
                                                                                                                                                             
                        document.getElementById("divResultado").innerHTML =ajax.responseText;
						 ActMontoAprobarPlanilla(1);
						                                                                        
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;           
                                                                                                    
                                                                
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
                
                
   return;              

}



function VerExcelAprobar()
{              
    
 var lsperiodo=document.getElementById("cmboPerConfPlanilla").value; 
 var lsDPTO =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
var lsPROV =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
var lsDIST =document.getElementById("txtDist2").options[document.getElementById("txtDist2").selectedIndex].value; 


 if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerConfPlanilla").focus();
                  return false
                }             
                
                
var i

for (i=0;i<document.frmMiForm.nivelRRHH2.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH2[i].checked == true)
                                               lsnivel=document.frmMiForm.nivelRRHH2[i].value;
                               }              
                


ajax=http_request();


var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel);                 

                
url = "Expd_dtAprobarConformidad.asp?"+valores;  

window.open(url,'Exportar','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
                                              
}



function ActMontoAprobarPlanilla()
{
   
   var lsperiodo2=document.getElementById("cmboPerConfPlanilla").value; 
   var lsDPTO =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
   var lsPROV =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
   var lsDIST =document.getElementById("txtDist2").options[document.getElementById("txtDist2").selectedIndex].value; 
  
    if ( lsperiodo2=='0')
     {
     alert ("Seleccionar el periodo")
     document.getElementById("cmboPerConfPlanilla").focus();
     return false
     }

    var i

     for (i=0;i<document.frmMiForm.nivelRRHH2.length;i++)
      {
          if (document.frmMiForm.nivelRRHH2[i].checked == true)
           { lsnivel=document.frmMiForm.nivelRRHH2[i].value;
           }
       }

                
                ajax=http_request();


   
     var  valores= "lsperiodo2=" + escape(lsperiodo2)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel); 

		  
	
	var peticion=$.ajax(
		{
	     url:'pd_ActMontoAprobarPlanilla.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
                        
							  },
		success:function (respuesta) {
		 $('#detalle_regMontoAprobar').html(respuesta);

	          
      } ,
      error:function (){alert('Se a producido un Error'); 
	  $("#detalle_regMontoAprobar").html("");
			 
      }
  }
  );
		 
}





function ConsultarPreConf(VALOR){
 
 if (VALOR=='1')
 {
  var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
  var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
  var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
  var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 
  var lsrolusu = document.frmMiForm.txtRol.value;

 
  if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }


  if (  (document.frmMiForm.txtRol.value!='7') && (document.frmMiForm.txtRol.value!='1'))
   {  
				
        if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Seleccionar el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
		 }
			 		
   }	


   var i

   for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH[i].value;
                                               }

                               }

                

                ajax=http_request();
        
                var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel)+"&VALOR="+VALOR+"&lsrolusu="+lsrolusu;		

 }
 if(VALOR=='2')
 {
	 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
     if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }
  		
       ajax=http_request();
       
     var valores= "lsperiodo=" + escape(lsperiodo)+"&VALOR="+VALOR;
 }
 if(VALOR=='3')
 {
	 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
     if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }
				
	  var i

   for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH[i].value;
                                               }

                               }			
				
				
				
  		
       ajax=http_request();
       
     var valores= "lsperiodo=" + escape(lsperiodo)+"&VALOR="+VALOR+"&lsnivel="+escape(lsnivel);

 } 
 
  if(VALOR=='4')
 {
	var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
  var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
  var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
  var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 
  var lsrolusu = document.frmMiForm.txtRol.value;

 
  if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }


  if (  (document.frmMiForm.txtRol.value!='7') && (document.frmMiForm.txtRol.value!='1'))
   {  
				
        if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Seleccionar el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
		 }
			 
		if(document.frmMiForm.txtProv1.value == '9999' )
		 {
			 alert("Seleccionar la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
		}
	    if(document.frmMiForm.txtDist1.value == '999998' )
		 {
			 alert("Seleccionar el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
	     }				
   }	

				
				
				
  		
       ajax=http_request();
       

	 
var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&VALOR="+VALOR+"&lsrolusu="+lsrolusu;	

 } 
 
               
                url="pd_dtConsultarPreConformidad.asp"; 
                ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
        else if (ajax.readyState==4){
            if(ajax.status==200){
                                                                                                                                                             
                        document.getElementById("divResultado").innerHTML =ajax.responseText;
						 ActMontoPlanilla(1);
						                                                                        
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;           
                                                                                                    
                                                                
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
                
                
   return;              

}


function ActMontoPlanilla()
{
   
   var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
   var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
   var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
   var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 
  
    if ( lsperiodo=='0')
     {
     alert ("Seleccionar el periodo")
     document.getElementById("cmboPerPlanilla").focus();
     return false
     }

    var i

     for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
      {
          if (document.frmMiForm.nivelRRHH[i].checked == true)
           { lsnivel=document.frmMiForm.nivelRRHH[i].value;
           }
       }
                ajax=http_request();
     var  valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel); 
	var peticion=$.ajax(
		{
	     url:'pd_ActMontoPlanilla.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
                        
							  },
		success:function (respuesta) {
		 $('#detalle_regMonto').html(respuesta);  
      } ,
      error:function (){alert('Se a producido un Error'); 
	  $("#detalle_regMonto").html("");
			 
      }
  }
  );
		 
}











function VerExcelConsultarPreConf()
{              
    
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 


 if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }             
                
                
var i

for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               lsnivel=document.frmMiForm.nivelRRHH[i].value;
                               }              
                


ajax=http_request();


var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel);                 

                
url = "Expd_dtConsultarPreConformidad.asp?"+valores;  

window.open(url,'Exportar','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
                                              
}




function SeleccionarConfPlan(VALOR){
                
var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 
var lsrolusu = document.frmMiForm.txtRol.value;

 
 if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }


if (  (document.frmMiForm.txtRol.value!='7') && (document.frmMiForm.txtRol.value!='1'))
   {  
				
        if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Seleccionar el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
		 }
			 
}	


var i

for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH[i].value;
                                               }

                               }

                
var lsUsuario = document.frmMiForm.txtUsuario.value; 
 

                ajax=http_request();
                var valores;        
                valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&lsnivel="+escape(lsnivel)+"&VALOR="+VALOR+"&lsrolusu="+lsrolusu;		
				

                
                url="pd_dtActualizarPlanilla.asp"; 
                ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
        else if (ajax.readyState==4){
            if(ajax.status==200){
                                                                                                                                                             
                        document.getElementById("divResultado").innerHTML =ajax.responseText;
						 ActMontoPlanilla(1);
						                                                                        
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;           
                                                                                                    
                                                                
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
                
                
   return;              

}




function SeleccionarPlanResumen(VALOR){
           
 if (VALOR=='1')
 {
  var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
  var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
  var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
  var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 

   if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }
				
   if (  (document.frmMiForm.txtRol.value!='7') && (document.frmMiForm.txtRol.value!='1'))
   {  
				
        if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Seleccionar el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
		 }
			 
		if(document.frmMiForm.txtProv1.value == '9999' )
		 {
			 alert("Seleccionar la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
		}
	    if(document.frmMiForm.txtDist1.value == '999998' )
		 {
			 alert("Seleccionar el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
	     }				
     }	
				
				

     var i

     for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH[i].value;
                                               }

                               }

                
         ajax=http_request();
       
     var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel)+"&VALOR="+VALOR;		
		
		
   }
   
   if (VALOR=='2')	
  {
  var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
  if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }
  		
       ajax=http_request();
       
     var valores= "lsperiodo=" + escape(lsperiodo)+"&VALOR="+VALOR;		
		
   
   
   }
   
                
                url="pd_dtPlanillaResumen.asp"; 
                ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
                                                                                                                                                             
              document.getElementById("divResultado").innerHTML =ajax.responseText;
                                                               
                                                               
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;           
                                                                                                    
                                                                
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
                
                
   return;              

}



function expoconformi()
{              
    var fin=document.getElementById("cmboPerPlanilla").value; 
                var valores="fin="+fin;
                
    if ( fin=='0')
    {
                alert ("Seleccionar el periodo")
                document.getElementById("cmboPerPlanilla").focus();
                return false
                }              
url = "exportarConfor_periodo.asp?"+valores;  

window.open(url,'Exportar','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

                                              
}

function SeleccionarPlanResumenConfAp(VALOR){
           
 if (VALOR=='1')
 {
  var lsperiodo=document.getElementById("cmboPerConfPlanilla").value; 
  var lsDPTO =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
  var lsPROV =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
  var lsDIST =document.getElementById("txtDist2").options[document.getElementById("txtDist2").selectedIndex].value; 

   if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerConfPlanilla").focus();
                  return false
                }
				
   if (  (document.frmMiForm.txtRol.value!='7') && (document.frmMiForm.txtRol.value!='1'))
   {  
				
        if(document.frmMiForm.txtDpto2.value == '0' )
		 {
			 alert("Seleccionar el Departamento");
			 document.frmMiForm.txtDpto2.focus();
			 return false;
			 
		 }
			 
		if(document.frmMiForm.txtProv2.value == '9999' )
		 {
			 alert("Seleccionar la Provincia");
			 document.frmMiForm.txtProv2.focus();
			 return false;
			 
		}
	    if(document.frmMiForm.txtDist2.value == '999998' )
		 {
			 alert("Seleccionar el Distrito");
			 document.frmMiForm.txtDist2.focus();
			 return false;
			 
	     }				
     }	
				
				

     var i

     for (i=0;i<document.frmMiForm.nivelRRHH2.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH2[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH2[i].value;
                                               }

                               }

                
         ajax=http_request();
       
     var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel)+"&VALOR="+VALOR;		

		
   }
   
   if (VALOR=='2')	
  {
  var lsperiodo=document.getElementById("cmboPerConfPlanilla").value; 
  if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerConfPlanilla").focus();
                  return false
                }
  		
       ajax=http_request();
       
     var valores= "lsperiodo=" + escape(lsperiodo)+"&VALOR="+VALOR;		
		
   
   
   }
   
                
                url="pd_dtPlanillaResumenConfAp.asp"; 
                ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
                                                                                                                                                             
              document.getElementById("divResultado").innerHTML =ajax.responseText;
                                                               
                                                               
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;           
                                                                                                    
                                                                
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
                
                
   return;              

}





function expSIGA()
{           
      
var proyecto =document.getElementById("id_proyecto").value;	var lsCargo = document.frmMiForm.cmboPerConfPlanilla.value;
var valores="lsCargo="+lsCargo+"&id_proyecto="+proyecto+"&lsTipo=97";
               
if ( lsCargo=='0')
    {
                alert ("Seleccionar el periodo")
                document.getElementById("cmboPerConfPlanilla").focus();
                return false;
                }              
                
ajax=http_request();
               
url="m_ingreso.asp";


    ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {                                                       
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				if (ajax.responseText==1){
					alert('Los datos ya fueron enviados al SIGA');
					SeleccionarPlanillaSIGA();
					
				}else{
				alert('Los datos fueron enviados con exito');
				 document.getElementById("divResultado").innerHTML = ajax.responseText;
				 SeleccionarPlanillaSIGA();
				 }
            }
            else if(ajax.status==404){
				
            }
            else{
				document.getElementById("divResultado").innerHTML = ajax.responseText;
 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
                
                
   return; 
                
                
}


function cons_Vcapa(){

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsRol = document.frmMiForm.txtRol.value;
		 var url;
		 
		
			 if(document.frmMiForm.txtDpto1.value == '99' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }

		 if(document.frmMiForm.txtProv1.value == 9999 )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 	 if(document.frmMiForm.txtDist1.value == 999999 )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }

	ajax=http_request();
	var valores;	
	valores= "lsDIST=" + escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&lsRol="+escape(lsRol);  // parametros a enviar al servidor	

url="m_asistenciaCap.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divResultado").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);	
   return;	 
}



function rotar_local(){

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsRol = document.frmMiForm.txtRol.value;
		 var url;
		 
		
			 if(document.frmMiForm.txtDpto1.value == '99' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }

		 if(document.frmMiForm.txtProv1.value == 9999 )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 	 if(document.frmMiForm.txtDist1.value == 999999 )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }

	ajax=http_request();
	var valores;	
	valores= "lsDIST=" + escape(lsDIST)+"&lsPROV="+escape(lsPROV)+"&lsUsuario="+escape(lsUsuario)+"&lsRol="+escape(lsRol);  // parametros a enviar al servidor	

url="m_rotarLocal.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divResultado").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);	
   return;	 
}



function enviar_consulta2(){
	
		 
		 
		 	 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		
 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 lsnivel=document.frmMiForm.nivelRRHH[i].value;
		}
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 
		 
		
		document.getElementById("divDetallem").style.display="block";
	 	document.getElementById("deta").innerHTML ="";

			 if(document.frmMiForm.txtDpto1.value == '99' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 if (lsnivel==2)
			 {
				 if(document.frmMiForm.txtProv1.value == '9999' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 
			 
	 
			 	 if(document.frmMiForm.txtDist1.value == '999999' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 }
		 }
			

		
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel)+"&lsUsuario="+escape(lsUsuario);  // parametros a enviar al servidor	
	
	url="m_alta_baja.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


function enviar_PosBaja(){
	
		 
		 
		 	 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		
 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 lsnivel=document.frmMiForm.nivelRRHH[i].value;
		}
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 
		 
		
		document.getElementById("divDetallem").style.display="block";
	 	document.getElementById("deta").innerHTML ="";

			 if(document.frmMiForm.txtDpto1.value == '99' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 if (lsnivel==2)
			 {
				 if(document.frmMiForm.txtProv1.value == '9999' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 
			 
	 
			 	 if(document.frmMiForm.txtDist1.value == '999999' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 }
		 }
			

		
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsnivel="+escape(lsnivel)+"&lsUsuario="+escape(lsUsuario);  // parametros a enviar al servidor	
	
	url="m_posBaja.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}




function mostrar_datos(contrato, id){
	
	var url;
	ajax=http_request();
	var valores;	
	valores= "slcontrato=" +contrato;  // parametros a enviar al servidor
	if (id==1)
	url="consulta2.asp";
	else
	url="consultaCapac.asp";
	
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("deta").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				document.getElementById("divDetallem").innerHTML =ajax.responseText;
				document.getElementById("deta").innerHTML ="";

            }
            else if(ajax.status==404){
                     document.getElementById("deta").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}



function capacitacionCon(){
	
			
		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		var lsUsuario = document.frmMiForm.txtUsuario.value;
		var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		  if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvocaroria="+escape(lsConvocaroria);  // parametros a enviar al servidor	
	url="m_capacitaCon.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
					                      
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}



function Ing_Alt_Baj(valproce){
			 if(document.form1.txtititu.value == '' )
		 {
			 alert("Ingrese la Fecha de Inicio de Trabajo del Personal ");
			 document.form1.txtititu.focus();
			 return false;
			 
			 }
			 
			 	 if(document.form1.txtititu.value.length <10 )
		 {
			 alert("Ingrese adecuadamente la fecha");
			 document.form1.txtititu.focus();
			 return false;
			 
			 }
			 	 if(document.form1.txtftitu.value == '' )
		 {
			 alert("Ingrese la fecha de Final del Contrato de Trabajador");
			 document.form1.txtftitu.focus();
			 return false;
			 
			 }
			 	 if(document.form1.txtftitu.value.length <10 )
		 {
			 alert("Ingrese adecuadamente la fecha");
			 document.form1.txtftitu.focus();
			 return false;
			 
			 }
			 	 
			 	 if(document.form1.cmbejust.value == '0' )
		 {
			 alert("Seleccione la Justificacion ");
			 document.form1.cmbejust.focus();
			 return false;
			 
			 }
			 	
		 for (i=0;i<document.forms.item(1).rbtppCompleto.length;i++)
		 {
			 if (document.forms.item(1).rbtppCompleto[i].checked == true)
			 lspagoPeriodo=document.form1.rbtppCompleto[i].value;
		}	
		
	
					
				
			 
	var lsId_per_Ing =document.form1.txtid_per_Ing.value;
	var lstxt_ruta =document.form1.txt_ruta.value;
	var lsIniTitu =document.form1.txtititu.value ;
	var lsFinTitu =document.form1.txtftitu.value ;
	var lsFinCon =document.form1.txtfinFecha.value ;
	var lsJust =document.form1.cmbejust.value ;
	var lsid_PER_sale =document.form1.txtid_per_sale.value	;	 
	var lsIniRe =document.form1.txtirem.value ;
	var lsIp =document.form1.txtip.value ;
	var lsUsu =document.form1.txtUsu.value;
 	var lsid_Contrato =document.form1.lsid_contrato.value;
	var lsccdd_r =document.form1.txtccdd_r.value;
 	var lsccpp_r =document.form1.txtccpp_r.value;
	var lsccdi_r =document.form1.txtccdi_r.value;
	var lsid_puesto_r = document.form1.txtid_puesto_r.value;
	ajax=http_request();
	var valores;	
  valores= "lsIniTitu=" + escape(lsIniTitu)+"&lsFinTitu="+escape(lsFinTitu)+"&lsJust="+escape(lsJust)+"&lsid_PER_sale="+lsid_PER_sale+"&lsIniRe="+escape(lsIniRe)+"&lsId_per_Ing="+lsId_per_Ing+"&lsIp="+lsIp+"&lsUsu="+escape(lsUsu)+"&lsid_Contrato="+escape(lsid_Contrato)+"&lsccdd_r="+escape(lsccdd_r)+"&lsccpp_r="+escape(lsccpp_r)+"&lsccdi_r="+escape(lsccdi_r)+"&lsid_puesto_r="+escape(lsid_puesto_r)+"&lsFinCon="+escape(lsFinCon)+"&lstxt_ruta="+escape(lstxt_ruta)+"&lspagoPeriodo="+escape(lspagoPeriodo)+"&lsvalproce="+escape(valproce)+"&lsTipo=22";  // parametros a enviar al servidor	 

	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensa").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("deta").innerHTML =ajax.responseText;
				document.getElementById("divDetallem").innerHTML ="";
								document.getElementById("mensa").innerHTML ="";
																

            }
            else if(ajax.status==404){
                     document.getElementById("mensa").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                    	document.getElementById("deta").innerHTML =ajax.responseText;
				document.getElementById("divDetallem").innerHTML ="";
					document.getElementById("mensa").innerHTML ="";

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 

}



function ejecutar_baja(usuario){
	
		 if(document.frmMiForm.txtfecha.value == '' )
		 {
			 alert("Ingresa la Fecha de reporte");
			 document.frmMiForm.txtfecha.focus();
			 return false;
			 
			 }	 
		
		   var lsfecha = document.frmMiForm.txtfecha.value;
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsfecha=" + escape(lsfecha)+"&usuario="+escape(usuario) ;  // parametros a enviar al servidor	
	url="m_ejeBajas.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}

	function expoEsta()
{		

 var lsDPTO = document.frmMiForm.txtDpto.value;
 var lsProv = document.frmMiForm.txtProv1.value;
 var lsRol = document.frmMiForm.cmbCargo.value;
	 			
 pagina = "exp_esta.asp?lsRol=" + lsRol+"&lsProv="+lsProv+"&lsDPTO="+lsDPTO;
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');


	}
	
	
function cons_asigna(valor,cont){

	valor=valor
	if (valor==2 && cont!=2){
		alert("Tiene que cerrar proceso de selecci\u00f3n")
		return false;
		}
		
			 
			 if(document.frmMiForm.txtDpto1.value == '99' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
				 if(document.frmMiForm.txtProv1.value == '9999' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 
			 
	 
			 	 if(document.frmMiForm.txtDist1.value == '999999' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			  
		
		 if(document.frmMiForm.cmbCargo.value == '999' )
		 {
			 alert("Selecciona el Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 } 
		

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsUsuario = document.frmMiForm.usuario.value;
		 var lsRol = document.frmMiForm.txtRol.value;
		 var Cargo = document.frmMiForm.cmbCargo.value.substring(1); 
			 
		 if (Cargo== 6 || Cargo==22 || Cargo==23 || Cargo==24 || Cargo==25 ){
			 alert("Este cargo no tiene seleccion Automatica. Para este cargo seleccionar Reporte ")
			 return false;
			 }
		 

		var url;
  

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&lsCargo="+escape(lsCargo)+"&lsRol="+escape(lsRol)+"&valor="+valor;  // parametros a enviar al servidor	

url="m_asigna11.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divResultado").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}
	
	
	
	
	function Validacons_asigna(valor,cont)
{
var agree=confirm("Esta seguro de iniciar la Asignaci\u00f3n de rutas?");
if (agree)
	cons_asigna(valor,cont) ;
else
	return false ;
}


function Validacons_asigna_ece()
{
var agree=confirm("Esta seguro de iniciar la Asignaci\u00f3n de rutas?");
if (agree)
	ver_asignacion_ece(2) ;
else
	return false ;
}


function reporte_asigna(){
	
		 
			 if(document.frmMiForm.txtDpto1.value == '99' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
				 if(document.frmMiForm.txtProv1.value == '9999' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 
			 
	 
			 	 if(document.frmMiForm.txtDist1.value == '999999' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			  
		
		 if(document.frmMiForm.cmbCargo.value == '999' )
		 {
			 alert("Selecciona el Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 } 
		

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsUsuario = document.frmMiForm.usuario.value;

		var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&lsCargo="+escape(lsCargo);  // parametros a enviar al servidor	

url="m_reporteAsignacion.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divResultado").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}



function envioReporte(){
	
		 
			 if(document.frmMiForm.txtDpto1.value == '99' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
				 if(document.frmMiForm.txtProv1.value == '9999' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 
			 
	 
			 	 if(document.frmMiForm.txtDist1.value == '999999' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			  
		
		 if(document.frmMiForm.cmbCargo.value == '999' )
		 {
			 alert("Selecciona el Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 } 
		

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;

		var url;
		

pagina = "m_asignareporte.asp?lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST+"&lsCargo="+lsCargo;
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}



function enviar_consultaAsigna(){
		
					 if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
			 		 	 if(document.frmMiForm.txtProv1.value == 9999 )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 	 if(document.frmMiForm.txtDist1.value == '999998TODOS' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
							 
			 	 if(document.frmMiForm.cmbCargo.value == '999' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 }
		
		
 		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo);  // parametros a enviar al servidor	

	url="m_reporteAsignacion.asp";
	
	
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
									
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


function ReporteSiga(){

		 	for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 lsnivel=document.frmMiForm.nivelRRHH[i].value;
		 }
		
		
 		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsnivel="+escape(lsnivel);  // parametros a enviar al servidor	

	url="m_reporteSIGA.asp";
	
	
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
									
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 
	
}


function envioReporteSIGA(){
	
		 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 lsnivel=document.frmMiForm.nivelRRHH[i].value;
		 }


		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsUsuario = document.frmMiForm.usuario.value;

		var url;
		

pagina = "m_reporteSIGAExcel.asp?lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST+"&lsCargo="+lsCargo+"&lsnivel="+lsnivel;
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}



function ReporteResumen(){
		
		
 		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo);  // parametros a enviar al servidor	

	url="pd_dtAsignacionRutas_Resumen.asp";
	
	
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
									
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}



function guardarRuta(ccdd,ccpp,ccdi,id_per,id_pre,usuario, id_contratos)
{
	var valor=document.getElementById('r'+id_per).value;
		if (valor=="0" )
{
 alert("Selecciona la ruta");
 document.getElementById('r'+id_per+'').focus();
return false;
			 
	}
	
	var agree=confirm("Esta seguro Asignar Ruta");
if (agree)
	AsignarRutaI(ccdd,ccpp,ccdi,valor,id_per,id_pre,usuario,id_contratos) ;
else
	return false ;
}


function AsignarRutaI(ccdd,ccpp,ccdi,valor,id_per,id_pre,usuario, id_contratos){
	
	ajax=http_request();
	var valores;	
	valores= "ccdd=" + escape(ccdd) + "&ccpp=" + escape(ccpp)+ "&ccdi=" + escape(ccdi)+ "&valor=" + escape(valor)+ "&id_pre=" + escape(id_pre)+ "&id_per=" + id_per+ "&id_contratos=" + id_contratos+ "&usuario=" + usuario;  // parametros a enviar al servidor	

	url="m_Proc_rutas.asp";   // nombre de url a invocar
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 
         }
         else if (ajax.readyState==4){
		
            if(ajax.status==200){
					alert('Los Datos Han Sido Correctamente Grabados');
					cons_asigna('1','1');



            }
            else if(ajax.status==404){
            }
            else{

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return ;		
}



function modificarRuta_ece(id_per,ind)
{
	var txt="";
	var txt2="";
	if (ind==1){
			txt="Seleccione la ruta a asignar";
			txt2="Esta seguro de asignar la rura?";
	}
	else {
			txt="No existe ruta asignada para eliminar";
			txt2="Esta seguro de eliminar la rura?"
		}
	var valor=document.getElementById('r'+id_per).value;
	if (valor=="0" ){
		 alert(txt);
		 document.getElementById('r'+id_per+'').focus();
		 return false;
	}
	
	alert (valor);
	
	var agree=confirm(txt2);
	if (agree)
		AsignarRutaI_ece(id_per,valor, ind) ;
	else
		return false ;
}

function AsignarRutaI_ece(id_per,valor, ind){
	
	ajax=http_request();
	var valores;	
	valores= "id_per=" + escape(id_per) + "&valor=" + escape(valor)+ "&ind=" + escape(ind);  // parametros a enviar al servidor	

	url="m_Proc_rutas_ece.asp";   // nombre de url a invocar
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 
         }
         else if (ajax.readyState==4){
		
            if(ajax.status==200){
					alert('Los Datos Han Sido Correctamente Grabados');
					//cons_asigna('1','1');
            }
            else if(ajax.status==404){
            }
            else{

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return ;		
}

function capacitacionCon(){
	
			
		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		var lsUsuario = document.frmMiForm.txtUsuario.value;
		var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		  if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvocaroria="+escape(lsConvocaroria);  // parametros a enviar al servidor	
			
	url="m_capacitacon.asp"; 



	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
					                      
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}

function getRadioButtonSelectedValue(ctrl)
{
    for(i=0;i<ctrl.length;i++)
        if(ctrl[i].checked) return ctrl[i].value;
}

function capacitacionCampo(idProyecto){
	
	var capacitacion=document.getElementById("txtCap").value;
	

	
		if (capacitacion=='99'){
		alert ('Seleccione la capacitacion a evaluar')
		document.frmMiForm.txtCap.focus();
		return false;
		
		}
		
	if (idProyecto==45 || idProyecto==74 || idProyecto==99){
		if (capacitacion==2 || capacitacion==4 ){
			url="m_capacitaCampoN2_inf.asp"; 
		} else {
			url="m_capacitaCampoN2_45.asp";
			} 
	} else {
			url="m_capacitaCampoN2_10.asp";
		}
		
		if (idProyecto==139){
			url="m_GeneraCapac_campo.asp";
		}

		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona el Local de Capacitacion");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Aula");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 

			var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
		 	var valuenivelRRHH='1';
	

			var lsUsuario = document.frmMiForm.txtUsuario.value;
			ajax=http_request();
			var valores;	
			valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&nivelRRHH="+escape(valuenivelRRHH)+"&capacitacion="+escape(capacitacion);  // parametros a enviar al servidor	

			ajax.open ('POST', url, true);
		    ajax.onreadystatechange = function() {
		         if (ajax.readyState==1) {
		                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
		         }
		         else if (ajax.readyState==4){
		            if(ajax.status==200){
		            										
							document.getElementById("divDetallem").innerHTML =ajax.responseText;
						
						
		            }
		            else if(ajax.status==404){
		                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
		            }
		            else{

		                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
							                      
						 
		            }
		        }
		    }
		    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		    ajax.send(valores);
			
			
		   return;	 

}




function capacitacionCampo_pealocales_n3(idProyecto){
	
		var capacitacion=document.getElementById("txtProv11").value;//local
		var lsCargo=document.getElementById("cmbCargo").value;
	
		if (capacitacion=='99'){
		alert ('Seleccione la capacitacion a evaluar')
		document.frmMiForm.txtCap.focus();
		return false;
		
		}
		
	if (idProyecto==45 || idProyecto==74 || idProyecto==99){
		if (capacitacion==2 || capacitacion==4 ){
			url="m_capacitaCampoN2_inf.asp"; 
		} else {
			url="m_capacitaCampoN2_45.asp";
			} 
	} else {
			url="m_capacitaCampoN2_10.asp";
		}
		
		if (idProyecto==139){
			url="m_generapea_localn3.asp";
		}

		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
			 if(document.frmMiForm.txtProv1.value == '' ||document.frmMiForm.txtProv1.value == '99' || document.frmMiForm.txtProv1.value == '0' )
		 {
			 alert("Selecciona el Local de Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 
			 
				 if(document.frmMiForm.txtProv11.value == '' )
		 {
			 alert("Selecciona el Local de Capacitacion");
			 document.frmMiForm.txtProv11.focus();
			 return false;
			 
			 } 

		if(document.frmMiForm.txtDist1.value == '' ||document.frmMiForm.txtDist1.value == '99' || document.frmMiForm.txtDist1.value == '0' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			 
			 
			 if(document.frmMiForm.cmbCargo.value == '' )
		 {
			 alert("Selecciona el cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 } 

			var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
		 	var valuenivelRRHH='1';
	

			var lsUsuario = document.frmMiForm.txtUsuario.value;
			ajax=http_request();
			var valores;	
			valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(capacitacion)+"&lsDIST="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&nivelRRHH="+escape(valuenivelRRHH)+"&capacitacion="+escape(capacitacion);  // parametros a enviar al servidor	

			ajax.open ('POST', url, true);
		    ajax.onreadystatechange = function() {
		         if (ajax.readyState==1) {
		                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
		         }
		         else if (ajax.readyState==4){
		            if(ajax.status==200){
		            										
							document.getElementById("divResultado").innerHTML =ajax.responseText;
						
						
		            }
		            else if(ajax.status==404){
		                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
		            }
		            else{

		                     document.getElementById("divResultado").innerHTML = ajax.responseText;	
							                      
						 
		            }
		        }
		    }
		    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		    ajax.send(valores);
			
			
		   return;	 

}



function capacitacionCampo_pealocales_n3_exp(idProyecto){
	
	
	var capacitacion=document.getElementById("txtProv11").value;//local
	var lsCargo=document.getElementById("cmbCargo").value;

	
		if (capacitacion=='99'){
		alert ('Seleccione la capacitacion a evaluar')
		document.frmMiForm.txtCap.focus();
		return false;
		
		}
		
	if (idProyecto==45 || idProyecto==74 || idProyecto==99){
		if (capacitacion==2 || capacitacion==4 ){
			url="m_capacitaCampoN2_inf.asp"; 
		} else {
			url="m_capacitaCampoN2_45.asp";
			} 
	} else {
			url="m_capacitaCampoN2_10.asp";
		}
		
		if (idProyecto==139){
			url="m_generapea_localn3.asp";
		}


		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
			 	 if(document.frmMiForm.txtProv1.value == '' ||document.frmMiForm.txtProv1.value == '99' || document.frmMiForm.txtProv1.value == '0' )
		 {
			 alert("Selecciona el Local de Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 
			 
				 if(document.frmMiForm.txtProv11.value == '' )
		 {
			 alert("Selecciona el Local de Capacitacion");
			 document.frmMiForm.txtProv11.focus();
			 return false;
			 
			 } 

		if(document.frmMiForm.txtDist1.value == '' ||document.frmMiForm.txtDist1.value == '99' || document.frmMiForm.txtDist1.value == '0' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			 
			 
			 if(document.frmMiForm.cmbCargo.value == '' )
		 {
			 alert("Selecciona el cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 } 
			 

			var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
		 	var valuenivelRRHH='1';
	

			var lsUsuario = document.frmMiForm.txtUsuario.value;
			ajax=http_request();
			var valores;	
				valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(capacitacion)+"&lsDIST="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&nivelRRHH="+escape(valuenivelRRHH)+"&capacitacion="+escape(capacitacion);  // parametros a enviar al servidor	


			

pagina = "m_GeneraPea_localn3_exp.asp?"+valores;
			
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
		
		
			
			
		   return;	 

}




function f_contador_pre1(idc,id,ID_PER,valor, usuario){
	var combo=valor;
	var valor=valor;
	var ID_PER=ID_PER;
	
	if(!confirm("Estas seguro de hacer este cambio a \n "+id))
	{
		document.getElementById(idc).value=vcombo1;
		
		vcombo1=0;
		idcombo;
	
	}else 
	{	
	var contador=parseInt(document.getElementById('txtCapacitacion').value);
		if(combo==1){
		 contador= contador+1;
		document.getElementById('txtCapacitacion').value=contador;
		}
		else{
			
			if (contador>0)
			{
	 	 contador= contador-1;
		document.getElementById('txtCapacitacion').value=contador;
			}else document.getElementById('txtCapacitacion').value=0;
		
		}
	
		ProcesarCap(ID_PER,valor,usuario);
		}
}


function capacitacionCampoOp(idProyecto){
	
	var capacitacion=document.getElementById("txtCap").value;
	
		if (capacitacion=='99'){
		alert ('Seleccione la capacitacion a evaluar')
		document.frmMiForm.txtCap.focus();
		return false;
		
		}
				
			url="m_capacitaCampoN2_inf.asp"; 
		


		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona el Local de Capacitacion");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Aula");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 

			var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
		 	var valuenivelRRHH='1';
	

			var lsUsuario = document.frmMiForm.txtUsuario.value;
			ajax=http_request();
			var valores;	
			valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&nivelRRHH="+escape(valuenivelRRHH)+"&capacitacion="+escape(capacitacion);  // parametros a enviar al servidor	

			ajax.open ('POST', url, true);
		    ajax.onreadystatechange = function() {
		         if (ajax.readyState==1) {
		                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
		         }
		         else if (ajax.readyState==4){
		            if(ajax.status==200){
		            										
							document.getElementById("divDetallem").innerHTML =ajax.responseText;
						
						
		            }
		            else if(ajax.status==404){
		                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
		            }
		            else{

		                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
							                      
						 
		            }
		        }
		    }
		    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		    ajax.send(valores);
			
			
		   return;	 

}


function capacitacionCampoApli(idProyecto){
	
	var capacitacion=document.getElementById("txtCap").value;
	
		if (capacitacion=='99'){
		alert ('Seleccione la capacitacion a evaluar')
		document.frmMiForm.txtCap.focus();
		return false;
		
		}

			url="m_capacitaCampoN2_45.asp";
	

		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona el Local de Capacitacion");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Aula");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 

			var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
		 	var valuenivelRRHH='1';
	

			var lsUsuario = document.frmMiForm.txtUsuario.value;
			ajax=http_request();
			var valores;	
			valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&nivelRRHH="+escape(valuenivelRRHH)+"&capacitacion="+escape(capacitacion);  // parametros a enviar al servidor	

			ajax.open ('POST', url, true);
		    ajax.onreadystatechange = function() {
		         if (ajax.readyState==1) {
		                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
		         }
		         else if (ajax.readyState==4){
		            if(ajax.status==200){
		            										
							document.getElementById("divDetallem").innerHTML =ajax.responseText;
						
						
		            }
		            else if(ajax.status==404){
		                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
		            }
		            else{

		                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
							                      
						 
		            }
		        }
		    }
		    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		    ajax.send(valores);
			
			
		   return;	 

}


function preseleccionCampoAula(idProyecto){
	
	    var capacitacion=document.getElementById("txtCap").value;
	
		if (capacitacion=='99'){
		alert ('Seleccione la etapa de preselecci\xf3n a evaluar')
		document.frmMiForm.txtCap.focus();
		return false;
		}

		
			
		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 	alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv11.value == '' )
		 {
			 alert("Selecciona el Local de Preselecci\xf3n");
			 document.frmMiForm.txtProv11.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist11.value == '' )
		 {
			 alert("Selecciona el Aula");
			 document.frmMiForm.txtDist11.focus();
			 return false;
			 
			 } 
			
			var url="m_GeneraPreInst.asp";
			
			var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv11.value;
			var lsDIST = document.frmMiForm.txtDist11.value;
	 		var valuenivelRRHH='2';
	
			var lsUsuario = document.frmMiForm.txtUsuario.value;
			ajax=http_request();
			var valores;	
			valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&capacitacion="+escape(capacitacion);  // parametros a enviar al servidor	

			ajax.open ('POST', url, true);
		    ajax.onreadystatechange = function() {
		         if (ajax.readyState==1) {
		                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
		         }
		         else if (ajax.readyState==4){
		            if(ajax.status==200){
		            										
							document.getElementById("divDetallem").innerHTML =ajax.responseText;
						
						
		            }
		            else if(ajax.status==404){
		                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
		            }
		            else{
		                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
		            }
		        }
		    }
		    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		    ajax.send(valores);
			
			
		   return;	 

}

function preseleccionCampo(idProyecto){
	
	    var capacitacion=document.getElementById("txtCap").value;
	
		if (capacitacion=='99'){
		alert ('Seleccione la etapa de preselecci\xf3n a evaluar')
		document.frmMiForm.txtCap.focus();
		return false;
		}

		
			
		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 	alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona el Local de Preselecci\xf3n");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Aula");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			
			var url="m_GeneraPreInst.asp";
			
			var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
	 		var valuenivelRRHH='2';
	
			var lsUsuario = document.frmMiForm.txtUsuario.value;
			ajax=http_request();
			var valores;	
			valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&capacitacion="+escape(capacitacion);  // parametros a enviar al servidor	

			ajax.open ('POST', url, true);
		    ajax.onreadystatechange = function() {
		         if (ajax.readyState==1) {
		                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
		         }
		         else if (ajax.readyState==4){
		            if(ajax.status==200){
		            										
							document.getElementById("divDetallem").innerHTML =ajax.responseText;
						
						
		            }
		            else if(ajax.status==404){
		                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
		            }
		            else{
		                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
		            }
		        }
		    }
		    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		    ajax.send(valores);
			
			
		   return;	 

}


function verReporte_pres(idProyecto){
	
	    var capacitacion=document.getElementById("txtCap").value;
	
		if (capacitacion=='99'){
		alert ('Seleccione la etapa de preselecci\xf3n a evaluar')
		document.frmMiForm.txtCap.focus();
		return false;
		}

		
			
		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 	alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona el Local de Preselecci\xf3n");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Aula");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			 var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
	 		var valuenivelRRHH='2';
	
			var lsUsuario = document.frmMiForm.txtUsuario.value;
			
			 pagina = "m_GeneraPreInstExp.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&capacitacion="+escape(capacitacion);
			 
			 
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}



function ver_reporte(id){
	
	var capacitacion=document.getElementById("txtCap").value;
	
		if (capacitacion=='99'){
		alert ('Seleccione la capacitacion a evaluar')
		document.frmMiForm.txtCap.focus();
		return false;
		
		}

			
		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona el Local de Capacitacion");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Aula");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 

			var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
			var lsUsuario = document.frmMiForm.txtUsuario.value;
			 var valuenivelRRHH=1;
			 
			pagina = "m_capacitaCampoN2_inf_exp.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&nivelRRHH="+escape(valuenivelRRHH)+"&capacitacion="+escape(capacitacion)+'&nocache=' + Math.random();
			
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
		
}


function verReporte_cap(id){
	if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsRol = document.frmMiForm.lsRol.value;
		 
		 
		  if (lsRol==34) {
			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}
		}

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;
		 	 

pagina = "m_GeneraCapac_exp_ECE.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar);
			
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');


}

function verReporte_cap_contrato(id){
	if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsRol = document.frmMiForm.lsRol.value;
		 
		 
		  if (lsRol==34) {
			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}
		}

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;
		 	 

pagina = "m_GeneraCapac_contratos_exp.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar);
			
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');


}

function segundaHoja(idProyecto){

 var capacitacion=document.getElementById("txtCap").value;
 
	valuenivelRRHH='1'
	url="m_capacitaCampoN2_10_2.asp";

			
		 if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona el Local de Capacitacion");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Aula");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 

			var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
			
			
		

			
			var lsUsuario = document.frmMiForm.txtUsuario.value;
			ajax=http_request();
			var valores;	
			valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&nivelRRHH="+escape(valuenivelRRHH)+'&capacitacion='+capacitacion;  // parametros a enviar al servidor	
			
		

	
			ajax.open ('POST', url, true);
		    ajax.onreadystatechange = function() {
		         if (ajax.readyState==1) {
		                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
		         }
		         else if (ajax.readyState==4){
		            if(ajax.status==200){
		            										
							document.getElementById("divDetallem").innerHTML =ajax.responseText;
						
						
		            }
		            else if(ajax.status==404){
		                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
		            }
		            else{

		                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
							                      
						 
		            }
		        }
		    }
		    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		    ajax.send(valores);
			
			
		   return;	 

}

function modificar(valor,destino){
		 if(valor == '1' )
		 {
			 if (document.getElementById("txtApePaterno").value=="")
			 {
				 
			 alert("Ingresar el Apellido Paterno");
			 document.getElementById("txtApePaterno").focus();
			 return false;

				 }
				 
					 if (document.getElementById("txtApeMaterno").value=="")
			 {
				 
			 alert("Ingresar el Apellido Materno");
			 document.getElementById("txtApeMaterno").focus();
			 return false;

				 }
		 			 if (document.getElementById("txtNombre").value=="")
			 {
				 
			 alert("Ingresar el Nombre");
			 document.getElementById("txtDNIB").focus();
			 return false;

				 }
		 
			 }
		 if(valor == '2' )
		 {
			 	 if (document.getElementById("txtDNIB").value=="" || document.getElementById("txtDNIB").length<8)
			 {
				 
			 alert("Ingresar el Numero de DNI");
			 document.getElementById("txtDNIB").focus();
			 return false;

				 }
			 
			 }		 

		 var lsPaterno = document.form1.txtApePaterno.value;
		 var lsMaterno = document.form1.txtApeMaterno.value;
		 var lsNombre = document.form1.txtNombre.value;
		 var lsDNI= document.form1.txtDNIB.value;

	ajax=http_request();
	var valores;	
	valores= "lsPaterno=" + escape(lsPaterno)+"&lsMaterno="+escape(lsMaterno)+"&lsNombre="+escape(lsNombre)+"&lsDNI="+escape(lsDNI)+"&lsOpcion="+escape(valor);  // parametros a enviar al servidor
	if (destino==1)	
	url="m_fich.asp";
	else if (destino==2)
	url="m_fich.asp";
	  
	  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("ficha").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            		document.getElementById("ficha").style.display="";								
					document.getElementById("ficha").innerHTML =ajax.responseText;
			document.getElementById("formulario").style.display="none";
				
            }
            else if(ajax.status==404){
                     document.getElementById("ficha").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("ficha").innerHTML = ajax.responseText;	
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 

}






function modificarDatosPer(valor,destino){
                               if(valor == '1' )
                               {
                                               if (document.getElementById("txtApePaterno").value=="")
                                               {
                                                               
                                                alert("Ingresar el Apellido Paterno");
                                               document.getElementById("txtApePaterno").focus();
                                               return false;

                                                               }
                                                               
                                                                               if (document.getElementById("txtApeMaterno").value=="")
                                               {
                                                               
                                                alert("Ingresar el Apellido Materno");
                                               document.getElementById("txtApeMaterno").focus();
                                               return false;

                                                               }
                                                                              if (document.getElementById("txtNombre").value=="")
                                               {
                                                               
                                                alert("Ingresar el Nombre");
                                               document.getElementById("txtDNIB").focus();
                                               return false;

                                                               }
                               
                                                }
                               if(valor == '2' )
                               {
                                                               if (document.getElementById("txtDNIB").value=="" || document.getElementById("txtDNIB").length<8)
                                               {
                                                               
                                                alert("Ingresar el Numero de DNI");
                                               document.getElementById("txtDNIB").focus();
                                               return false;

                                                               }
                                               
                                                }                             

                               var lsPaterno = document.form1.txtApePaterno.value;
                               var lsMaterno = document.form1.txtApeMaterno.value;
                               var lsNombre = document.form1.txtNombre.value;
                               var lsDNI= document.form1.txtDNIB.value;

                ajax=http_request();
                var valores;        
                valores= "lsPaterno=" + escape(lsPaterno)+"&lsMaterno="+escape(lsMaterno)+"&lsNombre="+escape(lsNombre)+"&lsDNI="+escape(lsDNI)+"&lsOpcion="+escape(valor);  // parametros a enviar al servidor

                if (destino==1) 
                url="pd_ActualizarFichaPersona.asp";
                else if (destino==2)
                url="pd_ActualizarFichaPersona.asp";
                  
                  
                ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("ficha").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
                                                                                                                                                             
                                                                              document.getElementById("ficha").innerHTML =ajax.responseText;
                                               document.getElementById("formulario").style.display="none";
                                                               
            }
            else if(ajax.status==404){
                     document.getElementById("ficha").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("ficha").innerHTML = ajax.responseText;            
                                                               
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;              

}



function mosbaja2(rol){
		

		 if(document.frmMiForm.txtfecha.value == '' )
		 {
			 alert("Ingresa la Fecha de reporte");
			 document.frmMiForm.txtfecha.focus();
			 return false;
			 
			 }	 
		
		   var lsfecha = document.frmMiForm.txtfecha.value;
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsfecha=" + escape(lsfecha)+"&rol="+escape(rol) ;  // parametros a enviar al servidor	
	url="m_Alt_Bajas.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divResultado").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}

function mosbajaexec(rol){
		

		 if(document.frmMiForm.txtfecha.value == '' )
		 {
			 alert("Ingresa la Fecha de reporte");
			 document.frmMiForm.txtfecha.focus();
			 return false;
			 
			 }	 
		
		   var lsfecha = document.frmMiForm.txtfecha.value;
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsfecha=" + escape(lsfecha)+"&rol="+escape(rol) ;  // parametros a enviar al servidor	
	url="m_Alt_Bajas2.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divResultado").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


function mosbaja(){
		

		 if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
		

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		  var lsProv = document.frmMiForm.txtProv1.value;
		   var lsDIST = document.frmMiForm.txtDist1.value;
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsProv="+escape(lsProv)+"&lsDIST="+escape(lsDIST);  // parametros a enviar al servidor	
	url="m_ebajas.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divResultado").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}

function expAB()
{		

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
	 			
 pagina = "exp_Alt_Bajas.asp?lsDPTO=" + lsDPTO + "&lsPROV=" + lsPROV + "&lsDIST=" + lsDIST;
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');


	}
function ejecutar_baja(usuario){
	
		 if(document.frmMiForm.txtfecha.value == '' )
		 {
			 alert("Ingresa la Fecha de reporte");
			 document.frmMiForm.txtfecha.focus();
			 return false;
			 
			 }	 
		
		   var lsfecha = document.frmMiForm.txtfecha.value;
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsfecha=" + escape(lsfecha)+"&usuario="+escape(usuario) ;  // parametros a enviar al servidor	
	url="m_ejeBajas.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


function exp_A2A(){
		

		 if(document.frmMiForm.txtfecha.value == '' )
		 {
			 alert("Ingresa la Fecha de reporte");
			 document.frmMiForm.txtfecha.focus();
			 return false;
			 
			 }	 
		
		   var lsfecha = document.frmMiForm.txtfecha.value;

 pagina = "exp_Alt_Bajas_fecha.asp?lsfecha=" + lsfecha;
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	
	
}


function alta_nueva(){
	
		 
		 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		

		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 
		 
		
		document.getElementById("divDetallem").style.display="block";
	 	document.getElementById("deta").innerHTML ="";

			 if(document.frmMiForm.txtDpto1.value == '99' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 }
			 var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario);  // parametros a enviar al servidor	
	
	url="m_alta_nueva.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}




function ingresar_Alta(cod){
	
	var url;
	ajax=http_request();
	var valores;	
	valores= "cod=" + escape(cod);  // parametros a enviar al servidor	
	
	url="ing_alta.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("deta").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				document.getElementById("divDetallem").innerHTML =ajax.responseText;
				document.getElementById("deta").innerHTML ="";

            }
            else if(ajax.status==404){
                     document.getElementById("deta").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }

    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


function Ing_Alt(){
			 if(document.form1.txtirem.value == '' )
		 {
			 alert("Ingrese la Fecha de Inicio de Trabajo del Personal ");
			 document.form1.txtirem.focus();
			 return false;
			 
			 }
			 
			 	 if(document.form1.txtirem.value.length <10 )
		 {
			 alert("Ingrese adecuadamente la fecha");
			 document.form1.txtititu.focus();
			 return false;
			 
			 }
			 	
			 	
			 
	var lsDniRe =document.form1.txtid_per_Ing.value	;	 
	var lsIniRe =document.form1.txtirem.value ;
	var lsccdd_r =document.form1.txtccdd_r.value;
 	var lsccpp_r =document.form1.txtccpp_r.value;
	var lsccdi_r =document.form1.txtccdi_r.value;
	var lsid_puesto_r = document.form1.txtid_puesto_r.value;

	var lscod =document.form1.txtcod.value;
	var lsIp =document.form1.txtip.value ;
	var lsUsu =document.form1.txtUsu.value;
	ajax=http_request();
	var valores;	
valores= "lsDniRe=" + escape(lsDniRe)+"&lsIniRe="+escape(lsIniRe)+"&lscod="+escape(lscod)+"&lsccdd_r="+escape(lsccdd_r)+"&lsccpp_r="+escape(lsccpp_r)+"&lsccdi_r="+escape(lsccdi_r)+"&lsid_puesto_r="+escape(lsid_puesto_r)+"&lsIp="+escape(lsIp)+"&lsUsu="+lsUsu+"&lsTipo=40";  // parametros a enviar al servidor	

	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensa").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("deta").innerHTML =ajax.responseText;
				document.getElementById("divDetallem").innerHTML ="";
								document.getElementById("mensa").innerHTML ="";

            }
            else if(ajax.status==404){
                     document.getElementById("mensa").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                    	document.getElementById("deta").innerHTML =ajax.responseText;
				document.getElementById("divDetallem").innerHTML ="";
					document.getElementById("mensa").innerHTML ="";
					              

				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 

}




function exp_AB3(){
		

		 if(document.frmMiForm.txtfecha.value == '' )
		 {
			 alert("Ingresa la Fecha de reporte");
			 document.frmMiForm.txtfecha.focus();
			 return false;
			 
			 }	 
		
		   var lsfecha = document.frmMiForm.txtfecha.value;

 pagina = "exp_Alt_Bajasexec_fecha.asp?lsfecha=" + lsfecha;
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	
	
}


function enviar_consultaFono(){
		
			 
		 if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
	 	
			 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 
			 
	 
			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			 
		
 if(document.frmMiForm.cmbCargo.value == '0' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 }
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo);  // parametros a enviar al servidor	
	
	url="Consulta_4.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
								
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


function grabar_rpm(dni,valor)
{

	ajax=http_request();
	var valores;	
	valores= "lsdni=" + dni+"&lsvalor="+valor+"&lsTipo=9";  // parametros a enviar al servidor	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById('t'+dni+'').innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					  
					document.getElementById('t'+dni+'').innerHTML =ajax.responseText;
				

            }
            else if(ajax.status==404){
                     document.getElementById('t'+dni+'').innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                    	document.getElementById('t'+dni+'').innerHTML =ajax.responseText;
				
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 
	}
	
	
function ver_Conocimientos(){
		
		 if(document.frmMiForm.txtDpto1.value == '' || document.frmMiForm.txtDpto1.value == '0' )
		 {
		 			alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }	 
				 if(document.frmMiForm.txtProv1.value == '' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 

			 	 if(document.frmMiForm.txtDist1.value == '' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 

 		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsConvocaroria="+escape(lsConvocaroria);  // parametros a enviar al servidor	
	
	url="m_conocimientos.asp";
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}

	
	
	function VerExcel()
{              
    
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var lsDPTO =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
var lsPROV =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
var lsDIST =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value; 


 if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
                }             
                
                
var i

for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               lsnivel=document.frmMiForm.nivelRRHH[i].value;
                               }              
                
var lsUsuario = document.frmMiForm.txtUsuario.value; 
 

ajax=http_request();


var valores= "lsperiodo=" + escape(lsperiodo)+"&lsDPTO="+escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&lsnivel="+escape(lsnivel);                 

                
url = "ExpdtActualizarPlanilla.asp?"+valores;  

window.open(url,'Exportar','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
                                              
}

function ActflagSN(id,periodoPla,id_Contratos,valor)
{
if (	document.getElementById(''+id+'').checked==false)
val=0
else 
val=valor



ajax=http_request();
	var valores;	
	
	
valores= "lsidper=" +escape(id)+"&periodoPla="+escape(periodoPla)+"&id_Contratos="+escape(id_Contratos)+"&lsvalor="+escape(val); // parametros a enviar al servidor		
	


url="pd_ActDatosPlanilla.asp";


	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divR"+id).innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("divR"+id).innerHTML =ajax.responseText;
					
					if (ajax.responseText=='2')
					{
					alert('No se puede actualizar el registro, el periodo se encuentra con Conformidad Aprobada');
					SeleccionarConfPlan(1);
					}
					else
					{
                       ActMontoPlanilla(1);						
					}
					
					
					
            }
            else if(ajax.status==404){
                     document.getElementById("divR").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";

            }
            else{
                     document.getElementById("divR"+id).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 	
}



function ActObs(id_per,periodoPla,id_Contratos,observ,idtxt)
{
	

ajax=http_request();
                var valores;        
                
valores= "id_per=" + id_per+"&periodoPla="+periodoPla+"&id_Contratos=" + id_Contratos+"&observ="+escape(observ)+"&lsTipo=62";// parametros a enviar al servidor   

                
url="pd_ActObsPlanilla.asp";


                ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {

        document.getElementById("id2"+id_per).innerHTML ="<span class=etiqueta>Cargando......</span>";
                                                       
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){

            document.getElementById("id2"+id_per).innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){

                    document.getElementById("id2"+id_per).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                  document.getElementById("id2"+id_per).innerHTML = ajax.responseText;  
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
                
                
   return;                             
}



function enviar_Proceso(){

	var txtcant =document.frmMiForm.txtcant.value ; 
	var cmbCargo =document.frmMiForm.cmbCargo.value ;
	var cmbComptencias =document.frmMiForm.cmbComptencias.value ;
	var cmbMeta =document.frmMiForm.cmbMeta.value ;
	
	if(txtcant ==""){	
		alert("Ingrese N\xfamero de proceso CAS")
		document.frmMiForm.txtcant.focus();
		return false
	}
	
	if(cmbCargo =="" || cmbCargo =="0"){	
		alert("Seleccione el cargo del proceso CAS")
		document.frmMiForm.cmbCargo.focus();
		return false
	}
	
	if(cmbComptencias =="" || cmbComptencias =="0"){	
		alert("Seleccione el test de competencias para el proceso CAS")
		document.frmMiForm.cmbComptencias.focus();
		return false
	}
	
	if(cmbMeta =="" || cmbMeta =="0"){	
		alert("Seleccione la META del Proceso CAS")
		document.frmMiForm.cmbMeta.focus();
		return false
	}

	var lcargo=cmbCargo.split("*");
	var codi_carg=lcargo[0];
	var desc_carg=lcargo[1];
	
	var lmeta=cmbMeta.split("*");
	var codi_meta=lmeta[0];
	var desc_meta=lmeta[1];

	ajax=http_request();
	var valores;	
	valores= "txtcant=" + txtcant+"&codi_carg=" + escape(codi_carg)+"&desc_carg="+escape(desc_carg)+"&codi_meta="+escape(codi_meta)+"&desc_meta="+escape(desc_meta)+"&cmbComptencias="+escape(cmbComptencias)+"&lsTipo=111";  // parametros a enviar al servidor	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("divCriterio").style.display="block";
                 document.getElementById("divCriterio").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				if (ajax.responseText==2){
					alert("El proceso CAS ya existe, verificar.");
					return false;
				} else {
					MostrarProceso()			
					document.getElementById("frmMiForm").reset();
				}

            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                    	document.getElementById("divCriterio").innerHTML =ajax.responseText;
					
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 

}


function consultarDemeritos(valor){
		 if(valor == '1' )
		 {
			 if (document.getElementById("txtApePaterno").value=="")
			 {
				 
			 alert("Ingresar el Apellido Paterno");
			 document.frmMiForm.txtApePaterno.focus();
			 return false;

				 }
				 
					 if (document.getElementById("txtApeMaterno").value=="")
			 {
				 
			 alert("Ingresar el Apellido Materno");
			 document.frmMiForm.txtApeMaterno.focus();
			 return false;

				 }
		 
		 			 if (document.getElementById("txtNombre").value=="")
			 {
				 
			 alert("Ingresar el Nombre");
			 document.frmMiForm.txtNombre.focus();
			 return false;

				 }
		 
		 
		 
		 
			 
			 }
		 if(valor == '2' )
		 {
			 	 if (document.getElementById("txtDNI").value=="")
			 {
				 
			 alert("Ingresar el Numero de DNI");
			 document.frmMiForm.txtDNI.focus();
			 return false;

				 }
			 
			 }		 

		 var lsPaterno = document.form1.txtApePaterno.value;
		 var lsMaterno = document.form1.txtApeMaterno.value;
		 var lsNombre = document.form1.txtNombre.value;
		 var lsDNI= document.form1.txtDNI.value;
		 var lsUsuario=document.form1.txtUsuario.value;

	ajax=http_request();
	var valores;	
	valores= "lsPaterno=" + escape(lsPaterno)+"&lsMaterno="+escape(lsMaterno)+"&lsNombre="+escape(lsNombre)+"&lsDNI="+escape(lsDNI)+"&lsUsuario="+escape(lsUsuario)+"&lsOpcion="+escape(valor);  // parametros a enviar al servido
	
		
	url="m_Demerito.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("mensaje").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("mensaje").innerHTML = "La direccion buscada no existe o Conulno esta disponible temporalmente";
            }
            else{

                     document.getElementById("mensaje").innerHTML = ajax.responseText;	
					                  
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 

}


function procesarCierre(indic){
	
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsRol = document.frmMiForm.lsRol.value;
		 
		 

			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;
		 
		if (lsConvCar=='0'){
				alert('Seleccione la convocatoria');
				document.frmMiForm.txtConvocartoria.focus();
				return false
			}
			
		var lsCierre=document.frmMiForm.txtCierre.value;	
			if (lsCierre=='0'){
				alert('Seleccione el tipo de cierre');
				document.frmMiForm.txtCierre.focus();
				return false
			} 
			
			
		 	 
	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar)+"&lsCierre="+escape(lsCierre)+"&indic="+escape(indic)+'&lsTipo=125'; // parametros a enviar al servidor	

		url="m_ingreso.asp";  


	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						if (lsCierre==1 || lsCierre==3){
            			alert ('Se procedio con el cierre');}
						
						if (lsCierre==2 || lsCierre==4){
            			alert ('Se procedio con la apertura');}
						
						
						
						preseleccionar(indic);							
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


function procesarCierreEdnom(id_proy){
	
		 
		 	var lsDPTO = document.frmMiForm.txtDpto1.value;
			var lsPROV = document.frmMiForm.txtProv1.value;
			var lsDIST = document.frmMiForm.txtDist1.value;
		 
		 
			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}

			
		var lsCierre=document.frmMiForm.txtCierre.value;	
			if (lsCierre=='0'){
				alert('Seleccione el tipo de cierre');
				document.frmMiForm.txtCierre.focus();
				return false
			} 
		 	 
	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCierre="+escape(lsCierre)+'&lsTipo=157'; // parametros a enviar al servidor	

		url="m_ingreso.asp";  


	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						if (lsCierre==1 || lsCierre==3){
            			alert ('Se procedio con el cierre');}
						
						if (lsCierre==2 || lsCierre==4){
            			alert ('Se procedio con la apertura');}
						
						preseleccionCampoAula(id_proy);							
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

function procesarCierre_ece(indic){
	
	if (indic!=6) {
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
	}
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 if (indic!=6){
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 }
		 var lsRol = document.frmMiForm.lsRol.value;
		 
		 

			if (lsDPTO=='99'){
				alert('Seleccione la Sede Regional');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Sede Provincial');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		if (indic!=6){		 
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value; 
		 
		if (lsConvCar=='0'){
				alert('Seleccione la convocatoria');
				document.frmMiForm.txtConvocartoria.focus();
				return false
			}
		}
		else {
			 for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
      {
          if (document.frmMiForm.nivelRRHH[i].checked == true)
           { lsConvCar=document.frmMiForm.nivelRRHH[i].value;
           }
       }
			}
		
		
		var lsCierre=document.frmMiForm.txtCierre.value;	
			if (lsCierre=='0'){
				alert('Seleccione el tipo de cierre');
				document.frmMiForm.txtCierre.focus();
				return false
			} 
			
	 	 
	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar)+"&lsCierre="+escape(lsCierre)+"&indic="+escape(indic)+'&lsTipo=133'; // parametros a enviar al servidor	
	
	

		url="m_ingreso.asp";  


	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						if (lsCierre==1 || lsCierre==3){
            			alert ('Se procedio con el cierre');}
						
						if (lsCierre==2 || lsCierre==4){
            			alert ('Se procedio con la apertura');}

						if (indic==6){
							ver_asignacion_ece(3);
							}
						else {
							ver_detalle_ece(indic);	
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




function rankeo_ednom(id)
{
                var tipo=0;
                
				//Rankeo de Aprobados 	CV
                if (id==1){
                               tipo=156;
                }
				//ANKIN SUPERVISOR NACIONAL
                if (id==2){
                               tipo=158;
                }
				//ANKIN SUPERVISOR NACIONAL
                if (id==3){
                               tipo=159;
                }				

                
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
			 
	  	 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;

		 var convo = document.frmMiForm.txtConvocartoria.value;

//		alert(document.frmMiForm.txtConvocartoria.value)		
//		if (convo!=6447	&& convo!=6446) { 
//		alert(document.frmMiForm.txtConvocartoria.value)
//		alert('Rankeo solo para cargos CL Y ACL / INF. LOCAL');
//		return;}

		if (convo==0){
			alert ('Para este proceso debe seleccionar el cargo y la convocatoria');
			return false;
			}	
			//document.getElementById("msj2").innerHTML ="Procesando......";
			 
			ajax=http_request();

		valor= "ccdd="+lsDPTO+"&ccpp="+lsPROV+"&ccdi="+lsDIST+"&cargo="+lsCargo+"&convo="+convo+"&lsTipo="+tipo;  // parametros a enviar al servidor	alert(valor)		
		   var url = "m_ingreso.asp";		  


	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
	
	
	alert("Se finalizo el rankeo");	
	 
         if (ajax.readyState==1) {
               //  document.getElementById("msj2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            									
					document.getElementById("msj2").innerHTML ="Se finalizo con el rankeo"
            }
            else if(ajax.status==404){
                     document.getElementById("msj2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("msj2").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valor);
   return;

}







function preseleccionar(indic){
	
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsRol = document.frmMiForm.lsRol.value;
		 var id_proy = document.frmMiForm.id_proy.value;
		 
		 
		 var txtzona= document.frmMiForm.txtzona1.value;
		 var txtseccion = document.frmMiForm.txtseccion1.value;
		 
		 
		 var txtseccion = document.frmMiForm.txtseccion1.value;
		  var estados ="";
		  
		 if ( indic==2 || indic==5  ) {
			 estados=  document.frmMiForm.estados.value;
			 }
		 
		 var ls_aula =""

//alert( "lsCargo" )
//alert( lsCargo )
//alert( "lsCargo1" )
//alert( lsCargo1 )


		 
		 if (id_proy==156){
			 if (indic==2){
				indic=8;	
			}
		}
		 
		 
		if (lsRol<=66 && lsRol>=62) {
			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
		}

		if (lsRol<=66 && lsRol>=63) {
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
		}

		if (lsRol<=66 && lsRol>=64) {
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}
		}

		if (lsRol<=66 && lsRol>=65) {
			if (txtzona=='999999'){
				alert('Seleccione la zona');
				document.frmMiForm.txtzona1.focus();
				return false
			}
		}

		if (lsRol==66) {
			if (txtseccion=='999999'){
				alert('Seleccione la secci\xf3n');
				document.frmMiForm.txtseccion1.focus();
				return false
			}
		}


		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;

		 if (lsConvCar=='0'){
			alert('Seleccione una opcion en el convo de convocatoria');
			document.frmMiForm.txtConvocartoria.focus();
			return false
		}
		 
		 //Solo para los casos NIVEL III EDNOM 2016
		 if (lsCargo==22605  &&lsConvCar==0  ) { lsConvCar=5194
			 }
			 
			 if (lsCargo==22606 &&lsConvCar==0 ) { lsConvCar=5195
			 }
		 
	if (indic==10){
		
			ls_aula = document.frmMiForm.txtDist11.value;

	}	 
		 	 
	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar)+"&aula="+ls_aula+"&txtzona="+escape(txtzona)+"&txtseccion="+escape(txtseccion)+"&estados="+escape(estados); // parametros a enviar al servidor	
//alert("***bbbb***lsCargo")	
//alert(lsCargo)	
//alert("***valores***")	
//alert(valores)	


	
	if (indic==1){
		url="m_GeneraPre.asp";  
	}
	
	if (indic==2){
		
		url="m_GeneraEvalCV.asp";  
		
		//Solo para el nivel 3 de ednom 2016 por ser diferentes criterios
		
		if (lsConvCar ==5194 || lsConvCar ==5195)
		{ url="m_GeneraEvalCV_ednom3.asp";  }
		
	}
	
	if (indic==3){
		url="m_GeneraCapac.asp";  
		
		if (id_proy==155){
			url="m_GeneraCapacECE16.asp";
		}
	}
	
	if (indic==4){
		url="m_cambiocargo.asp";  
	}
	
	if (indic==5){
		url="m_genera_preFicha.asp";  
	}
	if (indic==6){
		url="m_generaCapac_contrato.asp";  
	}
	if (indic==7){
		url="m_evaluacionPer.asp";  
	}
	
	
	if (indic==8){
		
		url="m_GeneraEvalCV_EDNOM2.asp";  
//		url="m_GeneraEvalCVECE16.asp";  
		//Solo para ece 2016	
	}
	
	
	if (indic==9){
		url="m_GeneraEvalCVECE16.asp";  
		//Solo para ece 2016		
	}
	
	
		
	if (indic==10){
		url="m_GeneraCapac_aula.asp";  
		

	}
	
	

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;

}


function ver_detalle_ece(indic){
	
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsRol = document.frmMiForm.lsRol.value;
		 

			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}


		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;
		 	 
	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar); // parametros a enviar al servidor	
	if (indic==1){
		url="m_genera_preficha_ece.asp";  
	}
	
	if (indic==2){
		url="m_generaevalcv_ece.asp";  
	}
	
	if (indic==3){
		url="m_generapre_ece.asp";  
	}
	
	if (indic==4){
		url="m_generacapac_ece.asp";  
	}
	
	if (indic==5){
		url="m_generasel1_ece.asp";  
	}
	if (indic==6){
		url="m_cambio_cargo_ece.asp";  
	}
	if (indic==7){
		url="m_evaluacionPer.asp";  
	}
	
	if (indic==8){
		url="m_asignacionEce.asp";  
	}
	

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;

}


function ver_asignacion_ece(tipo){
		
		 for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
      {
          if (document.frmMiForm.nivelRRHH[i].checked == true)
           { lsnivel=document.frmMiForm.nivelRRHH[i].value;
           }
       }
	   
	   	 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsubidist = document.frmMiForm.lsubidist.value;
alert(lsCargo)
			if (lsDPTO=='99'){
				alert('Seleccione la Sede Regional');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Sede Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
		
			if (lsubidist!="999999" && lsDIST=="9999999" ){
				alert('Seleccione la Sede Distrital');
				document.frmMiForm.txtDist1.focus();
				return false
				}

		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
		}
		 	 
			 
	ajax=http_request();
	var valores;	
	
	if (tipo==1 || tipo==2 ){
	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsnivel="+escape(lsnivel)+"&tipo="+escape(tipo); // parametros a enviar al servidor	
	
		url="m_asignacionEce.asp";  
	}
	else if (tipo==4){
		valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsnivel="+escape(lsnivel)+"&tipo="+escape(tipo); // parametros a enviar al servidor	
	
		url="m_asignacionEce_Montos.asp";  
		}
	else {
				
		var tipoRot = document.frmMiForm.txtTipoRot.value;
		if (tipoRot=="0"){
			alert ('Seleccione el tipo de cambio a realizar')
			return false;
			}
		
		valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsnivel="+escape(lsnivel)+"&tipo="+escape(tipo)+"&tipoRot="+tipoRot; // parametros a enviar al servidor	
	
		url="m_cambioAsignacion_ece.asp"; 
		}

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;

}


function ver_reporteCambio_ece(tipo){
		
		 for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
      {
          if (document.frmMiForm.nivelRRHH[i].checked == true)
           { lsnivel=document.frmMiForm.nivelRRHH[i].value;
           }
       }
	   
	   	 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsubidist = document.frmMiForm.lsubidist.value;

	if (tipo==1){
			if (lsDPTO=='99'){
				alert('Seleccione la Sede Regional');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Sede Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
		
			if (lsubidist!="999999" && lsDIST=="9999999" ){
				alert('Seleccione la Sede Distrital');
				document.frmMiForm.txtDist1.focus();
				return false
				}
	}
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
		}
		
		var tipoRot = document.frmMiForm.txtTipoRot.value;
		if (tipoRot=="0"){
			alert ('Seleccione el tipo de cambio a realizar')
			return false;
			}
			 	 
	 pagina = "m_reporteCambioRutas_ece.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsnivel="+escape(lsnivel)+"&tipo="+escape(tipo)+"&tipoRot="+tipoRot;
	 
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
	

}


function ver_reporte_ece(tipo){
		
		 for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
      {
          if (document.frmMiForm.nivelRRHH[i].checked == true)
           { lsnivel=document.frmMiForm.nivelRRHH[i].value;
           }
       }
	   
	   	 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsubidist = document.frmMiForm.lsubidist.value;

			if (lsDPTO=='99'){
				alert('Seleccione la Sede Regional');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Sede Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
		
			if (lsubidist!="999999" && lsDIST=="9999999" ){
				alert('Seleccione la Sede Distrital');
				document.frmMiForm.txtDist1.focus();
				return false
				}

		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
		}
		 	 
	 pagina = "m_reporteAsignacionEce.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsnivel="+escape(lsnivel)+"&tipo="+escape(tipo);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}
 

function ver_formatoB_ece(){
		
		 for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
      {
          if (document.frmMiForm.nivelRRHH[i].checked == true)
           { lsnivel=document.frmMiForm.nivelRRHH[i].value;
           }
       }
	   
	   	 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsubidist = document.frmMiForm.lsubidist.value;
		 
		 var tipo = document.frmMiForm.txttipoB.value;
		 var id_proyecto = document.frmMiForm.id_proy.value;
		 var id_cuenta = document.frmMiForm.txtUsuario.value;

			if (lsDPTO=='99'){
				alert('Seleccione la Sede Regional');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Sede Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
		
			if (lsubidist!="999999" && lsDIST=="9999999" ){
				alert('Seleccione la Sede Distrital');
				document.frmMiForm.txtDist1.focus();
				return false
				}

		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
		}
		
		 if(document.frmMiForm.txttipoB.value == '0' )
		 {
			 alert("Selecciona el tipo de Formato a exportar");
			 document.frmMiForm.txttipoB.focus();
			 return false;
		}	 
		lsPROV=lsPROV.substring(3); 
		lsDIST=lsDIST.substring(5); 
	
		var w= window.open("http://aplicaciones.inei.gob.pe/sys.sgpc/web/ece_gastos/reporteGastos_pdf_01?dpto="+escape(lsDPTO)+"&prov="+escape(lsPROV)+"&dist="+escape(lsDIST)+"&cargo="+lsCargo+"&id_proyecto="+id_proyecto+"&nivel="+lsnivel+"&tipo="+tipo+"&id_cuenta="+id_cuenta+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
			
			
			
}


function ver_formatoB_ednom(){
		
		
        var lsnivel=document.frmMiForm.txtProv11.value;
        
	   	 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsubidist = '000';
		 
		 var tipo = document.frmMiForm.txttipoB.value;
		 var id_proyecto = document.frmMiForm.id_proy.value;
		 var id_cuenta ='1';

			if (lsDPTO=='99'){
				alert('Seleccione la Sede Regional');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Sede Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
		
			if (lsubidist!="999999" && lsDIST=="9999999" ){
				alert('Seleccione la Sede Distrital');
				document.frmMiForm.txtDist1.focus();
				return false
				}

		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
		}
		
		 if(document.frmMiForm.txttipoB.value == '0' )
		 {
			 alert("Selecciona el tipo de Formato a exportar");
			 document.frmMiForm.txttipoB.focus();
			 return false;
		}	 
		lsPROV=lsPROV.substring(2); 
		lsDIST=lsDIST.substring(4); 
		
		lsDPTO = lsDPTO.substring(0, 2);
		
		lsPROV = lsPROV.substring(0, 2);
		lsDIST = lsDIST.substring(0, 2);
		lsCargo =lsCargo.substring(1,5); 
				
	
		var w= window.open("http://aplicaciones.inei.gob.pe/sys.sgpc/web/ednom2016gastos/reporteGastos_pdf_01?dpto="+escape(lsDPTO)+"&prov="+escape(lsPROV)+"&dist="+escape(lsDIST)+"&cargo="+lsCargo+"&id_proyecto="+id_proyecto+"&nivel="+lsnivel+"&tipo="+tipo+"&id_cuenta="+id_cuenta+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
			
			
			
}




function reporte_preseleccion(){
	
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsRol = document.frmMiForm.lsRol.value;
		 
		 
		 
			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}
		

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;
		 
		 if (lsConvCar=="0"){
			 alert ('Seleccione convocatoria');
			 document.frmMiForm.txtConvocartoria.focus();
			 return false;
			 }	
			 
		 pagina = "m_GeneraPreExp.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}

function verReporte_Evaluacion(indic){
	
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsRol = document.frmMiForm.lsRol.value;
		 
		 
		  if (lsRol==34) {
			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}
		}

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;
		 	 
	pagina = "m_evaluacionPer_exp.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}


function cargosCambio(){
	
		if(document.frmMiForm.cmbCargo.value == '0' )
		 {
			 alert("Selecciona un Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 }
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;

		var lcargo=lsCargo.split("*");
		cargo=lcargo[0];
		lsConvCar=lcargo[1];
		 	 
	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(cargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar); // parametros a enviar al servidor	
	
		url="m_cambiocargo.asp";  
		
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divResultado").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;

}



function enviar_consultaCV(){
	
			 if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
			 		 	 if(document.frmMiForm.txtProv1.value == 9999 )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 	 if(document.frmMiForm.txtDist1.value == 999999 )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
							 
			 	 if(document.frmMiForm.cmbCargo.value == '0' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 }
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;

		 var txtzona= document.frmMiForm.txtzona1.value;
		 var txtseccion = document.frmMiForm.txtseccion1.value;
		 
		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;
		 	 
	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar); // parametros a enviar al servidor	

pagina = "m_ExpoGeneraEvalCV.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar)+"&txtzona="+escape(txtzona) +"&txtseccion="+escape(txtseccion) ;

	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}




function enviar_consultaCV_ece(){
	
			if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
			 
		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var lsRol = document.frmMiForm.lsRol.value;
		 

			if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}


		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
		 var lsConvCar=document.frmMiForm.txtConvocartoria.value;

pagina = "m_ExpGeneraEvalCV_ece.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar);

	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}


function exportarEDNOM(valorR)
{		

 	 	
var lsReporte = document.frmMiForm.cboReporte.value;
	if (lsReporte!='')
	{
		
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsconvocatoria = document.frmMiForm.txtConvocartoria.value;
		var txtSedeop = document.frmMiForm.txtSedeop.value;
		var txtProvSed = document.frmMiForm.txtProvSed.value;
		var txtDistSed = document.frmMiForm.txtDistSed.value;
	
		if (lsReporte==21 || lsReporte==23 || lsReporte==24|| lsReporte==25) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9
		
		 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		}
		
			for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }
		 

	 pagina = "exportarEDNOM.asp?lsCargo=" + lsCargo+"&lsreporte="+lsReporte+"&lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST+"&valor="+valor+"&lsconvocatoria="+lsconvocatoria+"&lsnivel="+lsnivel+"&reporte="+valorR+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	}else 
	{
	alert("Seleccione el tipo de reporte que desea")
	} 
	
}

function exportarECE(valorR)
{		

 	 	
var lsReporte = document.frmMiForm.cboReporte.value;
	if (lsReporte!='')
	{
		
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsconvocatoria = document.frmMiForm.txtConvocartoria.value;
		var txtSedeop = document.frmMiForm.txtSedeop.value;
		var txtProvSed = document.frmMiForm.txtProvSed.value;
		var txtDistSed = document.frmMiForm.txtDistSed.value;
	
		if (lsReporte==21 || lsReporte==23 || lsReporte==24|| lsReporte==25) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9
		
		 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		}
		
			for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }
		 

	 pagina = "exportarECE.asp?lsCargo=" + lsCargo+"&lsreporte="+lsReporte+"&lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST+"&valor="+valor+"&lsconvocatoria="+lsconvocatoria+"&lsnivel="+lsnivel+"&reporte="+valorR+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	}else 
	{
	alert("Seleccione el tipo de reporte que desea")
	} 
	
}

function cobertura_cargo()
{		

		
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsconvocatoria = document.frmMiForm.txtConvocartoria.value;
		var txtSedeop = document.frmMiForm.txtSedeop.value;
		var txtProvSed = document.frmMiForm.txtProvSed.value;
		var txtDistSed = document.frmMiForm.txtDistSed.value;
		
		if (lsCargo=='900'){
			alert('Seleccione el cargo y la convocatoria');
			document.frmMiForm.cmbCargo.focus();
			return false;
		}
		
		if (lsconvocatoria=='0'){
			alert('Seleccione la convocatoria');
			document.frmMiForm.txtConvocartoria.focus();
			return false;
		}
	
	 pagina = "cobertura.asp?lsCargo=" + lsCargo+"&lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST+"&lsconvocatoria="+lsconvocatoria+"&txtSedeop="+escape(txtSedeop)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	
}


function cobertura_cargo_ece(tipo)
{		

		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsconvocatoria = document.frmMiForm.txtConvocartoria.value;
		
		if (lsCargo=='900'){
			alert('Seleccione el cargo y la convocatoria');
			document.frmMiForm.cmbCargo.focus();
			return false;
		}
		
		if (lsconvocatoria=='0'){
			alert('Seleccione la convocatoria');
			document.frmMiForm.txtConvocartoria.focus();
			return false;
		}
	
	 pagina = "cobertura_ece.asp?lsCargo=" + lsCargo+"&lsconvocatoria="+lsconvocatoria+"&tipo="+tipo;
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	
}

function eliminar(valor){
		 if(valor == '1' )
		 {
			 if (document.getElementById("txtApePaterno").value=="")
			 {
				 
			 alert("Ingresar el Apellido Paterno");
			 document.frmMiForm.txtApePaterno.focus();
			 return false;

				 }
				 
					 if (document.getElementById("txtApeMaterno").value=="")
			 {
				 
			 alert("Ingresar el Apellido Materno");
			 document.frmMiForm.txtApeMaterno.focus();
			 return false;

				 }
		 
		 			 if (document.getElementById("txtNombre").value=="")
			 {
				 
			 alert("Ingresar el Nombre");
			 document.frmMiForm.txtNombre.focus();
			 return false;

				 }
			 
			 }
		 if(valor == '2' )
		 {
			 	 if (document.getElementById("txtDNI").value=="")
			 {
				 
			 alert("Ingresar el Numero de DNI");
			 document.frmMiForm.txtDNI.focus();
			 return false;

				 }
			 
			 }		 

		 var lsPaterno = document.form1.txtApePaterno.value;
		 var lsMaterno = document.form1.txtApeMaterno.value;
		 var lsNombre = document.form1.txtNombre.value;
		 var lsDNI= document.form1.txtDNI.value;
		 var lsUsuario=document.form1.txtUsuario.value;

	ajax=http_request();
	var valores;	
	valores= "lsPaterno=" + escape(lsPaterno)+"&lsMaterno="+escape(lsMaterno)+"&lsNombre="+escape(lsNombre)+"&lsDNI="+escape(lsDNI)+"&lsUsuario="+escape(lsUsuario)+"&lsOpcion="+escape(valor);  // parametros a enviar al servidor	
	url="m_directorio_eliminar.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("mensaje").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("mensaje").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("mensaje").innerHTML = ajax.responseText;	
					                  
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 

}


function cambiarUbigeo (valor){
		 if(valor == '1' )
		 {
			 if (document.getElementById("txtApePaterno").value=="")
			 {
				 
			 alert("Ingresar el Apellido Paterno");
			 document.frmMiForm.txtApePaterno.focus();
			 return false;

				 }
				 
					 if (document.getElementById("txtApeMaterno").value=="")
			 {
				 
			 alert("Ingresar el Apellido Materno");
			 document.frmMiForm.txtApeMaterno.focus();
			 return false;

				 }
		 
		 			 if (document.getElementById("txtNombre").value=="")
			 {
				 
			 alert("Ingresar el Nombre");
			 document.frmMiForm.txtNombre.focus();
			 return false;

				 }
			 
			 }
		 if(valor == '2' )
		 {
			 	 if (document.getElementById("txtDNI").value=="")
			 {
				 
			 alert("Ingresar el Numero de DNI");
			 document.frmMiForm.txtDNI.focus();
			 return false;

				 }
			 
			 }		 

		 var lsPaterno = document.form1.txtApePaterno.value;
		 var lsMaterno = document.form1.txtApeMaterno.value;
		 var lsNombre = document.form1.txtNombre.value;
		 var lsDNI= document.form1.txtDNI.value;
		 var lsUsuario=document.form1.txtUsuario.value;

	ajax=http_request();
	var valores;	
	valores= "lsPaterno=" + escape(lsPaterno)+"&lsMaterno="+escape(lsMaterno)+"&lsNombre="+escape(lsNombre)+"&lsDNI="+escape(lsDNI)+"&lsUsuario="+escape(lsUsuario)+"&lsOpcion="+escape(valor);  // parametros a enviar al servidor	
	url="m_cambiar_ubigeo.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
				document.getElementById("mensaje").innerHTML =ajax.responseText;
				cargarZonas();
				
            }
            else if(ajax.status==404){
                     document.getElementById("mensaje").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("mensaje").innerHTML = ajax.responseText;	
					                  
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 

}

function VerProvCambio(){
  
    var varDpto =document.getElementById("txtDpto").value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m711_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("tr_prov").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("tr_prov").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("tr_prov").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("tr_prov").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function borrar(dni,usuario,activo)
{
				
			if(confirm("Desea permitir postulaci\xf3n a la persona?"))
			{
			ajax=http_request();
			var valores;	
			valores= "lsDNI=" +dni+"&lsUsuario="+usuario+"&lsActivo="+activo+"&lsTipo=21";  // parametros a enviar al servidor	
			url="m_ingreso.asp";  
			ajax.open ('POST', url, true);
			ajax.onreadystatechange = function() {
				 if (ajax.readyState==1) {
						 document.getElementById("mensaje").innerHTML ="<span class=etiqueta>Cargando......</span>";
				 }
				 else if (ajax.readyState==4){
					if(ajax.status==200){
							document.getElementById("mensaje").innerHTML =ajax.responseText;
				  }
					else if(ajax.status==404){
							 document.getElementById("mensaje").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					}
					else{
							 document.getElementById("mensaje").innerHTML = ajax.responseText;	
					}
				}
			}
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.send(valores);
		   return;	 
			}
}


function lista_calificar(nivel){
		
		 if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte Fuente");
			 document.frmMiForm.cboReporte.focus();
			 return false;
		 }
		
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
		
		if (document.frmMiForm.txtConvocartoria.value=='0'){
			alert("Selecciona el combo de la Convocatoria");
			document.frmMiForm.txtConvocartoria.focus();
			return false;
		}
		
		var lsReporte = document.frmMiForm.cboReporte.value;
		var valor=9

 		 var lsDPTO = 99;
		 var lsPROV = 9999;
		 var lsDIST = 999999;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var txtSedeop = 0;
		 var txtProvSed = 9999;
		 var txtDistSed = 999999;

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
			 
			 
			 
		for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		 }
		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;
		
		var sede=9;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsReporte="+escape(lsReporte)+"&lsConvocaroria="+escape(lsConvocaroria)+"&valor="+escape(valor)+"&lsnivel="+escape(lsnivel)+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed);  // parametros a enviar al servidor	
	
	url="m_seleccionGlobal.asp";
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			if(lsReporte=='5' )
				{
					document.getElementById("mostar_detalle2").style.display="block";
							
				}else 
				
				{
		
					document.getElementById("mostar_detalle2").style.display="block";
							

				}								
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}

function exportarEDNOMNotas(valorR)
{		

 	 	
var lsReporte = document.frmMiForm.cboReporte.value;
	if (lsReporte!='')
	{
		
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsconvocatoria = document.frmMiForm.txtConvocartoria.value;
		var txtSedeop = document.frmMiForm.txtSedeop.value;
		var txtProvSed = document.frmMiForm.txtProvSed.value;
		var txtDistSed = document.frmMiForm.txtDistSed.value;
	
		if (lsReporte==21 || lsReporte==23 || lsReporte==24|| lsReporte==25) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9
		
		 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		}
		
			for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }
		 

	 pagina = "exportarEDNOMNotas.asp?lsCargo=" + lsCargo+"&lsreporte="+lsReporte+"&lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST+"&valor="+valor+"&lsconvocatoria="+lsconvocatoria+"&lsnivel="+lsnivel+"&reporte="+valorR+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	}else 
	{
	alert("Seleccione el tipo de reporte que desea")
	} 
	
}



function exportarECENotas(valorR)
{		

 	 	
var lsReporte = document.frmMiForm.cboReporte.value;
	if (lsReporte!='')
	{
		
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsconvocatoria = document.frmMiForm.txtConvocartoria.value;
		var txtSedeop = document.frmMiForm.txtSedeop.value;
		var txtProvSed = document.frmMiForm.txtProvSed.value;
		var txtDistSed = document.frmMiForm.txtDistSed.value;
	
		if (lsReporte==21 || lsReporte==23 || lsReporte==24|| lsReporte==25) { 
			 
			for (i=0;i<document.forms.item(0).treportes.length;i++)
			 {
				 if (document.forms.item(0).treportes[i].checked == true)
				 valor=document.frmMiForm.treportes[i].value;
			} 
		} else if (lsReporte==1){
			for (i=0;i<document.forms.item(0).treportes1.length;i++)
			 {
				 if (document.forms.item(0).treportes1[i].checked == true)
				 valor=document.frmMiForm.treportes1[i].value;
			} 
		}
		else 
		valor=9
		
		 for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		}
		
			for (i=0;i<document.forms.item(0).divPA.length;i++)
		 {
			 if (document.forms.item(0).divPA[i].checked == true)
			 var sede=document.frmMiForm.divPA[i].value;
		 }
		 

	 pagina = "exportarECENotas.asp?lsCargo=" + lsCargo+"&lsreporte="+lsReporte+"&lsDPTO="+lsDPTO+"&lsPROV="+lsPROV+"&lsDIST="+lsDIST+"&valor="+valor+"&lsconvocatoria="+lsconvocatoria+"&lsnivel="+lsnivel+"&reporte="+valorR+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed);
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	}else 
	{
	alert("Seleccione el tipo de reporte que desea")
	} 
	
}


function calcular_rankinSedes()
{
 
	  	 var lsDPT = document.frmMiForm.txtDpto1.value;
		 
		 if (lsDPT=='99'){
				alert('Seleccione la Sede Operativa');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			
			var lsDPTO = lsDPT.substr(3, 2);
			var lsPROV = lsDPT.substr(5, 2);
			var lsDIST = lsDPT.substr(7, 2);
			
			 document.getElementById("msj2").innerHTML ="Procesando......";
			 
			ajax=http_request();
		   
			
	valor= "ccdd="+lsDPTO+"&ccpp="+lsPROV+"&ccdi="+lsDIST+"&lsTipo=132";  // parametros a enviar al servidor	

		   var url = "m_ingreso.asp";		  

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
	
	
	
	 
         if (ajax.readyState==1) {
               //  document.getElementById("msj2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("msj2").innerHTML ="Se finalizo con el rankeo"
            }
            else if(ajax.status==404){
                     document.getElementById("msj2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("msj2").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valor);
   return;

}


function calcular_rankin_ece(id)
{

                var tipo=0;
                
                if (id==1){
                               tipo=134;
                }
                
                if (id==3){
                               tipo=137;
                }
                
                if (id==4){
                               tipo=138;
                }
                
                if (id==5){
                               tipo=139;
                }
                                                               
                 if (id==6){
                               tipo=140;
                }
                
                if (id==7){
                               tipo=141;
               }


	
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;


			
 
	  	  var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;

		 var convo = document.frmMiForm.txtConvocartoria.value;
		
		if (convo==0){
			alert ('Para este proceso debe seleccionar el cargo y la convocatoria');
			return false;
			}	
			//document.getElementById("msj2").innerHTML ="Procesando......";
			 
			ajax=http_request();
		   
		valor= "ccdd="+lsDPTO+"&ccpp="+lsPROV+"&ccdi="+lsDIST+"&cargo="+lsCargo+"&convo="+convo+"&lsTipo="+tipo;  // parametros a enviar al servidor	

		   var url = "m_ingreso.asp";		  


	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
	
	
	alert("Se finalizo el rankeo");	
	 
         if (ajax.readyState==1) {
               //  document.getElementById("msj2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            									
					document.getElementById("msj2").innerHTML ="Se finalizo con el rankeo"
            }
            else if(ajax.status==404){
                     document.getElementById("msj2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("msj2").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valor);
   return;

}



function calcular_rankinNac(){
	
		// var lsCargo = document.frmMiForm.cmbCargo.value;
//		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 
	/*var lsCargo=3113
	var lsconvocatoria=2756*/
	
/*		 var lsconvocatoria = document.frmMiForm.txtConvocartoria.value;
		 
	document.getElementById("msj3").innerHTML ="Procesando......";
	
	ajax=http_request();
	var valores;	
	valores= "lsCargo=" + escape(lsCargo)+"&lsconvocatoria="+escape(lsconvocatoria)+"&lsTipo=131";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
		
         if (ajax.readyState==1) {
                // document.getElementById("msj3").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("msj3").innerHTML ="Se finalizo con el rankeo Nacional"
            }
            else if(ajax.status==404){
                     document.getElementById("msj3").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("msj3").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;*/
   
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 		 
		 var lsDPTO = ''//document.frmMiForm.txtDpto1.value;
		 var lsPROV = ''//document.frmMiForm.txtProv1.value;
		 var lsDIST = ''//document.frmMiForm.txtDist1.value;

		 var convo = ''//document.frmMiForm.txtConvocartoria.value;
		
//alert("convo")alert(convo)
		/*if (convo!=6447	&& convo!=6446) { 

		alert('Rankeo solo para cargos CL Y ACL / INF. LOCAL');
		return;}*/
	
		/*if (convo==0){
			alert ('Para este proceso debe seleccionar el cargo y la convocatoria');
			return false;
			}	*/
			//document.getElementById("msj2").innerHTML ="Procesando......";
			 
			ajax=http_request();
		   
		//valor= "ccdd="+lsDPTO+"&ccpp="+lsPROV+"&ccdi="+lsDIST+"&cargo="+lsCargo+"&convo="+convo+"&lsTipo=131";  // parametros a enviar al servidor
		valor= "cargo="+lsCargo+"&lsTipo=131";  // parametros a enviar al servidor
		alert(lsCargo);
		var url = "m_ingreso.asp";		  

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
	
	
	alert("Rankeo finalizado");	
	 
         if (ajax.readyState==1) {
               //  document.getElementById("msj2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            									
					document.getElementById("msj2").innerHTML ="Se finalizo con el rankeo"
            }
            else if(ajax.status==404){
                     document.getElementById("msj2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("msj2").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valor);
   return;
   
}
