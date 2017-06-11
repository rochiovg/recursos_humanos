// JavaScript Document

function ValidaMes(){ 
  var mes = document.getElementById("txtMes").value;
  var dia = document.getElementById("txtDia").value;
   


  
  if(mes != ''){
     if(parseInt(mes,10) > 12 ){
		 alert("mes err\xf3neo");
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
                  alert("Fecha introducida err\xf3nea");
                  document.getElementById("txtDia").focus();
		          return false;
          }    
		  if (parseInt(dia,10)>numDias || parseInt(dia,10)==0){
            alert("Fecha introducida err\xf3nea");
            document.getElementById("txtMes").focus();		   
            return false;
        }        
	}
}
function ValidaDia()
{ var dia = parseInt(document.getElementById("txtDia").value,10);         
	if(dia > 31){
		 alert("dia err&oacute;neo");
         document.getElementById("txtDia").focus();
		 return false;
	}
	document.getElementById("txtMes").focus();
	
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

else { 
var fecha_actual = new Date();   
var anioA = fecha_actual.getFullYear(); 
if (long==10){ if ((ano==0) || (ano<1900) || (ano>anioA)) { fecha=fecha.substr(0,6); } } } 

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



function verificaFechaT (valor, id)
{
	if (valor.length<10 && valor.length>=1) 
	{
		alert('fecha incorrecta');
		document.getElementById(id).value="";
		document.getElementById(id).focus();
	}	
}




function ValidaMes2(){ 
  var mes = document.getElementById("txtMes2").value;
  var dia = document.getElementById("txtDia2").value;
  var fecha_actual = new Date();
  var mesActual = fecha_actual.getMonth() + 1 ;
  
    if(mes != ''){
     if(parseInt(mes,10) > 12){
		 alert("mes err\xf3neo");
         document.getElementById("txtMes2").focus();		
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
                  alert("Fecha introducida err\xf3nea");
                  document.getElementById("txtDia2").focus();
		          return false;
          }    
		  if (parseInt(dia,10)>numDias || parseInt(dia,10)==0){
            alert("Fecha introducida err\xf3nea");
            document.getElementById("txtMes2").focus();		   
            return false;
        }        
	}
}

function ValidaDia2()
{ var dia = parseInt(document.getElementById("txtDia2").value,10);         
	if(dia > 31){
		 alert("dia err&oacute;neo");
         document.getElementById("txtDia2").focus();
		 return false;
	}
	document.getElementById("txtMes2").focus();
	
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
	  alert('A\xf1o incorrecto');
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
							alert ('Registro de fecha err\xf3neo, no es a\xd1o bisiesto');
							diaD.focus();
							mesF.value="";
							anioD.value="";
							return false;
							}
                 break;
              default:
                  alert("Fecha introducida err\xf3nea");
				  diaD.value="";
	    		  mesF.value="";
			      anioD.value="";
                  mesF.focus();		         
                  return false;
          }
		  }
		  else {
		alert("Ingrese el mes o el a\xf1o segun corresponda");
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
		diaD.value="";
	    mesF.value="";
	    anioD.value="";
		diaD.focus();
		alert("Fecha introducida err\xf3nea");
	}
}







function fu_ValidarApePat(obj1)
{
	var re1  = /([AEIOU]{4})|([BCDFGHJKLMNÑPQRSTVWXYZ]{6})/;
	 if (re1.test( (obj1.value).toUpperCase() ))
	{
	 obj1.focus();
	 obj1.select();
	 alert('Error en el Apellido Paterno.');	    
	}	
}

function fu_ValidarApeMat(obj2)
 {
	var re2  = /([AEIOU]{4})|([BCDFGHJKLMNÑPQRSTVWXYZ]{6})/;
	if (re2.test( (obj2.value).toUpperCase() ))
	{
	 obj2.focus();
	 obj2.select();
	 alert('Error en el Apellido Materno.');	    
	}	
}

function fu_ValidarNombre(obj3)
 {
	var re3  = /([AEIOU]{3})|([BCDFGHJKLMNÑPQRSTVWXYZ]{4})/;
	if (re3.test( (obj3.value).toUpperCase() ))
	{
	 obj3.focus();
	 obj3.select();
	 alert('Error en el Nombre.');	    
	}	
}
function validarNumeroTel(obj) {
	var tel  = /(0){6}|(1){6}|(2){6}|(3){6}|(4){6}|(5){6}|(6){6}|(7){6}|(8){6}|(9){6}/ ;
	if (tel.test(obj.value)) 
	{
	 obj.focus();
	 obj.select();
	 alert('Numero de Teléfono Incorrecto.');	    
	}	
}
function validarNumeroCel(obj) {
	var re  = /(0){6}|(1){6}|(2){6}|(3){6}|(4){6}|(5){6}|(6){6}|(7){6}|(8){6}|(9){6}/ ;
	if (re.test(obj.value)) 
	{
	 obj.focus();
	 obj.select();
	 alert('Numero de Celular Incorrecto.');	    
	}	
}
function fu_ValidarNombreVia(obj5)
 {
	var re5  = /([AEIOU]{3})|([BCDFGHJKLMNÑPQRSTVWXYZ]{4})/;
	if (re5.test( (obj5.value).toUpperCase() ))
	{
	 obj5.focus();
	 obj5.select();
	 alert('Error en el Nombre de la V\xeda.');	    
	}	
}

function bloq_nivel(nivel)
{
if	(nivel==3)
{	document.getElementById("txtDia2").value="";
	document.getElementById("txtMes2").value="";
	document.getElementById("txtAnio2").value="";
	document.getElementById("txtperioalc").value="";

	document.getElementById("cmbTipoEstudios").setAttribute("disabled",true);
	document.getElementById("cmbGrado").setAttribute("disabled",true);
	document.getElementById("txtDia2").setAttribute("readOnly",true);
	document.getElementById("txtMes2").setAttribute("readOnly",true);
	document.getElementById("txtAnio2").setAttribute("readOnly",true);
	document.getElementById("txtperioalc").setAttribute("readOnly",true);
	document.getElementById("cmbPeriodo").setAttribute("disabled",true);
	document.getElementById("cmbUniversidad").setAttribute("disabled",true);

}if	(nivel==5)
{	document.getElementById("txtDia2").value="";
	document.getElementById("txtMes2").value="";
	document.getElementById("txtAnio2").value="";
	document.getElementById("txtDia2").setAttribute("readOnly",false);
	document.getElementById("txtMes2").setAttribute("readOnly",false);
	document.getElementById("txtAnio2").setAttribute("readOnly",false);
	document.getElementById("cmbUniversidad").setAttribute("disabled",true);

}else 
{
	
	document.getElementById("cmbTipoEstudios").setAttribute("disabled",false);
	document.getElementById("cmbGrado").setAttribute("disabled",false);
	document.getElementById("txtDia2").setAttribute("readOnly",false);
	document.getElementById("txtMes2").setAttribute("readOnly",false);
	document.getElementById("txtAnio2").setAttribute("readOnly",false);
	document.getElementById("txtperioalc").setAttribute("readOnly",false);
	document.getElementById("cmbPeriodo").setAttribute("disabled",false);
		document.getElementById("cmbUniversidad").setAttribute("disabled",false);

	}

	}


function validar_grado(valor)
{
	
	grado=parseInt(valor)
			
					if ( grado ==3 || grado==4  || grado==5 || grado==6 ) 
				{
					

	
	document.getElementById("txtDia2").disabled=false
				  document.getElementById("txtMes2").disabled=false
				   document.getElementById("txtAnio2").disabled=false
	
				}else
				{
					document.getElementById("txtDia2").value="";
				  document.getElementById("txtMes2").value="";
				   document.getElementById("txtAnio2").value="";
				 document.getElementById("txtDia2").disabled=true
				  document.getElementById("txtMes2").disabled=true
				   document.getElementById("txtAnio2").disabled=true
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


function validanac(valor)
{ if (valor==4028)
{	
document.getElementById("txtDpto3").disabled=false;
}else 
		{
			document.getElementById("txtDpto3").disabled=true;
document.getElementById("txtProv3").disabled=true;
document.getElementById("txtDist4").disabled=true;

			
		}
	}

function valida_nivel2(valor)
{

nivel=parseInt(document.getElementById("cmbNivelInstr").value);
	var acargo = document.getElementById("cmbCargo").value;
	var lcargo=acargo.split("*");
	cargo=lcargo[1];
	
	
	}




function validar_ano(valor)
{
	var fecha_actual = new Date();   
	 var anioA = fecha_actual.getFullYear(); 
	 
	if(valor<1960 )
	{
		alert("A\xf1o Incorrecto");
				document.getElementById("txtIneiAnio").value="";
		document.getElementById("txtIneiAnio").focus();

		}
	
		if(valor>anioA )
	{
		alert("A\xf1o Incorrecto");
				document.getElementById("txtIneiAnio").value="";
		document.getElementById("txtIneiAnio").focus();

		}
	
	}
	
	
function cambiar_doc(valor)	
{
	if (valor == 04)
	{
		document.getElementById("txtExpDocenAnio").setAttribute(readOnly,true);
				document.getElementById("txtExpDocenMeses").setAttribute(readOnly,true);
		
		}
	
	}
	
function fu_ValidarProyecto(obj6)
 {
	var re6  = /([AEIOU]{3})|([BCDFGHJKLMNÑPQRSTVWXYZ]{4})/;
	if (re6.test( (obj6.value).toUpperCase() ))
	{
	 obj6.focus();
	 obj6.select();
	 alert('Error en el Nombre del Proyecto.');	    
	}	
}

function comprobarSiBisisesto(anio){
if ( ( anio % 100 != 0) && ((anio % 4 == 0) || (anio % 400 == 0))) {
    return true;
    }
else {
    return false;
    }
}


function ValidaAnio2(){ 
  var mes = document.getElementById("txtMes2").value;
  var dia = document.getElementById("txtDia2").value;
  var anio = document.getElementById("txtAnio2").value; 
  
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
							alert ('Registro de fecha err\xf3neo, no es a\xd1o bisiesto');
							document.getElementById("txtDia2").focus();
							document.getElementById("txtMes2").value="";
							document.getElementById("txtAnio2").value="";
							return false;
							}
                 break;
              default:
                  alert("Fecha introducida err\xf3nea");
				  document.getElementById("txtDia2").value="";
				  document.getElementById("txtMes2").value="";
				  document.getElementById("txtAnio2").value="";
                  document.getElementById("txtDia2").focus();		         
                  return false;
          }
		  }
		  else {
		alert("Ingrese el mes o el a\xf1o segun corresponda");
		document.getElementById("txtAnio2").value="";
		return false;
		}
		  
  	if(anio < anioA || (anio == anioA && (mes < mesA || (mes == mesA && dia <= diaA)))) {
			document.getElementById("button1").disabled=false;
	}
	else {
		alert("Fecha introducida err\xf3nea");
		document.getElementById("txtDia2").value="";
		document.getElementById("txtMes2").value="";
		document.getElementById("txtAnio2").value="";
        document.getElementById("txtDia2").focus();
	}
}









function ValidaAnio(){ 
  var mes = document.getElementById("txtMes").value;
  var dia = document.getElementById("txtDia").value;
  var anio = document.getElementById("txtAnio").value; 
  
    	var fecha_actual = new Date(); 
	var diaA = fecha_actual.getDate();   
    var mesA = fecha_actual.getMonth() + 1;   
    var anioA = fecha_actual.getFullYear(); 
  
  if(mes != '' && anio != '' && dia != '' ){
     if(parseInt(mes,10) > 12){
		 alert("mes err\xf3neo");
         document.getElementById("txtMes").focus();		
		 return false;
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
							alert ('Registro de fecha err\xf3neo, no es a\xd1o bisiesto');
							document.getElementById("txtDia").focus();
							document.getElementById("txtMes").value="";
							document.getElementById("txtAnio").value="";
							return false;
				}

                 break;
              default:
                  alert("Fecha introducida err\xf3nea");
				  document.getElementById("txtDia").value="";
				  document.getElementById("txtMes").value="";
				  document.getElementById("txtAnio").value="";
                  document.getElementById("txtDia").focus();		         
                  return false;
          }
		  
		  	var acargo = document.getElementById("cmbCargo").value;
	var lcargo=acargo.split("*");
	cargo=lcargo[1];
		  

	
		  if (parseInt(anio,10)>1995 || parseInt(anio,10)<1931){
            alert("A\xf1o err\xf3neo");
            document.getElementById("txtAnio").focus();
            return false;
        }    
		  
		  
		  
		  if (parseInt(dia,10)>numDias || parseInt(dia,10)==0){
            alert("Fecha introducida err\xf3nea");
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

		var acargo = document.getElementById("cmbCargo").value;
	var lcargo=acargo.split("*");
	cargo=lcargo[1];
	
	if (cargo==0)
	{
		alert("Seleccione el Cargo a Postular");
			document.getElementById("button1").disabled=true;
			return false;
		
	}else {

		
	if (cargo == 22 || cargo == 23 || cargo == 26 || cargo == 6 )
	{
		
		var flag = false;

			if((anioA-anio)<30 || (anioA-anio)>56) flag=true;
			
			if((anioA-anio)==30 && mes > mesA) flag=true; 
			if((anioA-anio)==55 && mes < mesA) flag=true;
			
			if((anioA-anio)==30 && mes == mesA && dia > diaA) flag=true;
			if((anioA-anio)==55 && mes == mesA && dia <= diaA) flag=true;
									  
			if(flag){
				alert("No cumple con el perfil");
				document.getElementById("txtMes").value='';
				document.getElementById("txtDia").value='';
				document.getElementById("txtAnio").value='';
			}
	}
	
	
	if (cargo == 36 ) //Técnico de Archivo
	{
		
		var flag = false;

			if((anioA-anio)<18 || (anioA-anio)>61) flag=true;
			
			if((anioA-anio)==18 && mes > mesA) flag=true; 
			if((anioA-anio)==60 && mes < mesA) flag=true;
			
			if((anioA-anio)==18 && mes == mesA && dia > diaA) flag=true;
			if((anioA-anio)==60 && mes == mesA && dia <= diaA) flag=true;
									  
			if(flag){
				alert("No cumple con el perfil");
				document.getElementById("txtMes").value='';
				document.getElementById("txtDia").value='';
				document.getElementById("txtAnio").value='';
			}
	}
	
	
		if (cargo == 24 || cargo == 25 || cargo == 12)
		{
			
		var flag = false;

			if((anioA-anio)<25 || (anioA-anio)>56) flag=true;
			
			if((anioA-anio)==25 && mes > mesA) flag=true; 
			if((anioA-anio)==55 && mes < mesA) flag=true;
			
			if((anioA-anio)==25 && mes == mesA && dia > diaA) flag=true;
			if((anioA-anio)==55 && mes == mesA && dia <= diaA) flag=true;
									  
			if(flag){
				alert("No cumple con el perfil");
				document.getElementById("txtMes").value='';
				document.getElementById("txtDia").value='';
				document.getElementById("txtAnio").value='';
			}

	}
	
	
	if (cargo == 39 || cargo == 42 || cargo == 43 || cargo == 44  || cargo == 46 || cargo == 48 || cargo == 50 || cargo == 51 || cargo == 53 || cargo == 54 || cargo == 56 || cargo == 57 || cargo == 58 || cargo == 59 || cargo == 60 || cargo == 61 || cargo == 17) //Asistente Administrativo, Programador de ruta, Tecnico de legajo, Monitor nacional
		{
			
		var flag = false;

			if((anioA-anio)<18 || (anioA-anio)>81) flag=true;
			
			if((anioA-anio)==18 && mes > mesA) flag=true; 
			if((anioA-anio)==80 && mes < mesA) flag=true;
			
			if((anioA-anio)==18 && mes == mesA && dia > diaA) flag=true;
			if((anioA-anio)==80 && mes == mesA && dia <= diaA) flag=true;
									  
			if(flag){
				alert("No cumple con el perfil");
				document.getElementById("txtMes").value='';
				document.getElementById("txtDia").value='';
				document.getElementById("txtAnio").value='';
			}

	}
	
}	   
document.getElementById("button1").disabled=false;
	}else {
	alert("Ingrese el mes o el a\xf1o segun corresponda");
	document.getElementById("txtAnio").value="";
	return false;
	}	
}


function validaDist()
{
	var dist1 = document.getElementById('txtDist1').value;   
   	var dist2 = document.getElementById('txtDist2').value.substring(0,6); 
	
	var acargo = document.getElementById("cmbCargo").value;
	var lcargo=acargo.split("*");
	cargo=lcargo[1]; 

	if (cargo==46 || cargo==48 || cargo==50 || cargo==51 || cargo==53 ){
			if(dist1 != '0'){
				if(dist2 != dist1 )
				{
				   alert("Deben de coincidir los Distritos de postulaci\xf3n y de residencia");	   
				  document.getElementById("button1").disabled=true;
			
				}   
					else
					{ document.getElementById('txtDist2').disabled=false;
					  document.getElementById("button1").disabled=false;
					}
		  }
	
		
		}

}



function f_aprobar2(){
	exper=document.getElementById("cmbInst").options[document.getElementById("cmbInst").selectedIndex].value
	if (exper=="2") 
			document.getElementById("txtProyecto").selectedIndex='';
}



function validaProv()
{
	var prov1 = document.getElementById('txtProv1').value.substring(0,4);   
   	var prov2 = document.getElementById('txtProv2').value.substring(0,4); 
	
	var acargo = document.getElementById("cmbCargo").value;
	var lcargo=acargo.split("*");
	cargo=lcargo[1];
	

	if (cargo!=22 || cargo!=6){  
		if(prov1 != '0'){
			if(prov2 != prov1 )
			{
			   alert("Deben de coincidir las Provincias de postulaci\xf3n y de residencia");	   
				  document.getElementById("button1").disabled=true;
		
			}   
			else
			{ document.getElementById('txtProv2').disabled=false;
				  document.getElementById("button1").disabled=false;
		
			}
	  }
	}
}


function validadepa()
{
	
	var depa1 = document.getElementById('txtDpto1').value;   
   	var depa2 = document.getElementById('txtDpto2').value.substring(0,2); 
	
		
	if(depa1 != '0'){
	if(depa2 != depa1 )
	{
	   alert("Deben de coincidir los Departamentos de postulaci\xf3n y de residencia");	
	   	   	  document.getElementById("button1").disabled=true;
   
    }   
	else
	{ document.getElementById('txtDpto1').disabled=false;
	document.getElementById("button1").disabled=false;
	}
  }	
}

function valor_mes(valor,id)
{
	if(valor>11)
	{
		alert ("Mes incorrecto");
		document.getElementById(id).focus();
		
		}
	
	
	}
	
	function valor_ano(valor,id)
{
	if(valor>40)
	{
		alert ("A\xf1o incorrecto");
		document.getElementById(id).focus();
		
		}
	}
	
	
	
function edad()
{
  hoy=new Date() 
			oDia = document.getElementById("txtDia");
		oMes = document.getElementById("txtMes");
		oAnio = document.getElementById("txtAnio");
  
    if (oAnio<=99) 
       oAnio +=1900 

var edad1;
  edad=hoy.getYear()- oAnio - 1; //-1 porque no se si ha cumplido años ya este año 
    if (hoy.getMonth() + 1 - oMes < 0) //+ 1 porque los meses empiezan en 0 
       edad1= edad 
    if (hoy.getMonth() + 1 - oMes > 0) 
       edad1= edad+1 
    if (hoy.getUTCDate() - oDia >= 0) 
       edad1= edad + 1 




		var acargo = document.getElementById("cmbCargo").value;
	var lcargo=acargo.split("*");
	cargo=lcargo[1];
	
	if (cargo == 9 )
	{
		if (edad1<18 && edad1>80)
		alert("No cumple con el perfil2");
		return false;
		
		}
		if (cargo == 6 || cargo== 7 || cargo== 8)
	{
		if (edad1<18 && edad1>80)
		alert("No cumple con el perfil");
		return false;
		
		}	   
	   
	
	}
	
	
	