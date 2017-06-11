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


var TITULO = "--";
var DERECHO_AUTOR = "Copyright © INEI CENSOS NACIONALES - 2011. Derechos Reservados";


var NIVEL_DPTO = "dpto";
var NIVEL_PROV = "prov";
var NIVEL_DIST = "dist";

function getCliente(){
	if (!top.oCliente) {
		top.oCliente = new cliente();
	}
	return top.oCliente;
}


function iniciar () {
	oCliente = getCliente();
  oCliente.iniciar();
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
			document.frmMiForm.txtIneiAnio.disabled = false;
			document.frmMiForm.txtCargoInei.disabled = false;
			oObj.focus();
		} else {
			oObj.value = "";
			document.frmMiForm.txtIneiAnio.value = "";
			oObj.disabled = true;
			document.frmMiForm.txtCargoInei.disabled = true;
			document.frmMiForm.txtIneiAnio.disabled = true;
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
			document.frmMiForm.txtIneiAnio.disabled = false;
			document.frmMiForm.txtCargoInei.disabled = false;
			oObj.focus();
		} else {
			oObj.value = "";
			document.frmMiForm.txtIneiAnio.value = "";
			oObj.disabled = true;
			document.frmMiForm.txtCargoInei.disabled = true;
			document.frmMiForm.txtIneiAnio.disabled = true;
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

function iniciarCuerpo () {
	oCliente = getCliente();
	oCliente.iniciarCuerpo();
}

function cerrar(){
	window.close();
}



function enviarBusqueda (operacion) {
	if (operacion =="1") {
		if (document.frmMiForm.txtApePaterno.value == "") {
			alert("Ingrese Apellido Paterno");
			document.frmMiForm.txtApePaterno.focus();
			return false;
		}
		
	}
	
	if (operacion =="2") {
		
		if (document.frmMiForm.txtDNI.value == "" || document.frmMiForm.txtDNI.value.length < 8) {
			alert("Ingrese número de DNI válido");
			document.frmMiForm.txtDNI.focus();
			return false;
		}
	}

	document.getElementById("txtOpcion").value=operacion;
	document.getElementById("txtOper").value="1";
	document.frmMiForm.submit();
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

  


function enviarConsulta (operacion) {
	if (operacion =="1") {
		
		if (document.form1.txtApePaterno.value == "") {
			alert("Ingrese Apellido Paterno");
			document.form1.txtApePaterno.focus();
			return false;
		}
		if (document.form1.txtApePaterno.length < 3) {
			alert("Ingrese Apellido Paterno de por lo menos 3 letras");
			document.form1.txtApePaterno.focus();
			return false;
		}
		
				
		if (document.form1.txtApeMaterno.value == "") {
			alert("Ingrese Apellido Materno");
			document.form1.txtApeMaterno.focus();
			return false;
		}
		if (document.form1.txtApeMaterno.length < 3) {
			alert("Ingrese Apellido Materno de por lo menos 3 letras");
			document.form1.txtApeMaterno.focus();
			return false;
		}		
		
		
		if (document.form1.txtNombre.value == "") {
			alert("Ingrese Nombre");
			document.form1.txtNombre.focus();
			return false;
		}
		if (document.form1.txtNombre.length < 2) {
			alert("Ingrese Nombre de por lo menos 2 letras");
			document.form1.txtNombre.focus();
			return false;
		}
		

		
	}
	if (operacion =="2") {
		if (document.form1.txtDNI.value == "" || document.form1.txtDNI.value.length < 8) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			 document.form1.txtDNI.value='';
			document.form1.txtDNI.focus();
			return false;
		}

	}
	if (operacion =="3") {
		
		if (document.form1.txtCODIGO.value == "" || document.form1.txtCODIGO.value.length < 12) {
			alert("Ingrese n\xfamero de CODIGO v\xe1lido");
			document.form1.txtCODIGO.focus();
			return false;
		}
	}
		
	document.getElementById("txtOpcion").value=operacion;
	document.getElementById("txtOper").value="1";
	document.form1.submit();
}
	
	


function enviarFicha83(operacion) {

	var cv=1;
	
	if (cv==1){
		a1=1
	    a2=1
	    a3=1
		}
	else {
		var a1=document.frmMiForm.a1.value;
		var a2=document.frmMiForm.a2.value;
		var a3=document.frmMiForm.a3.value;
	}

	if (a1==0){
		alert('Adjunte documento que acredite experiencia solicitada.');
		return false;
	}
	
	if (a2==0){
		alert('Adjunte imagen de su DNI');
		return false;
	}
	
	
	if (a3==0){
		alert('Adjunte \xfaltima certificaci\xf3n de nivel acad\xe9mico alcanzado');
		return false;
	}
	
	


if (confirm("¿Esta seguro(a) que desea registrar sus datos?")) {
	if (operacion =="1" || operacion =="2") {
		
		var lsIdConvCargo=document.frmMiForm.id_cc.value;
			
		if (document.frmMiForm.txtDpto1.value == "") {
			alert("Seleccione el Departamento de inscripci\xf3n");
			document.frmMiForm.txtDpto1.focus();
			return false;
		}
		
		if (document.frmMiForm.txtProv1.value == "" ) {
			alert("Seleccione la Provincia de inscripci\xf3n");
			document.frmMiForm.txtProv1.focus();
			return false;
		}
		
			
		var ccddo1 = document.frmMiForm.txtDpto1.value;
		var ccdd1 = ccddo1.substring(0,2);
		
		var ccppo1 = document.frmMiForm.txtProv1.value;
		var ccpp1 = ccppo1.substring(2,4);

		var ccdio1 = document.frmMiForm.txtDist1.value;
		var ccdi1 = ccdio1.substring(4,2);
		

		if (document.frmMiForm.txtDist1.value == "") {
			alert("Seleccione el Distrito de inscripci\xf3n");
			document.frmMiForm.txtDist1.focus();
			return false;
		}
		
		if (document.frmMiForm.txtApePaterno.value.length < 2) {
			alert("Ingrese Apellido Paterno v\xe1lido");
			document.frmMiForm.txtApePaterno.focus();
			return false;
		}
		if (document.frmMiForm.txtApeMaterno.value == "") {
			alert("Ingrese Apellido Materno");
			document.frmMiForm.txtApeMaterno.focus();
			return false;
		}
		if (document.frmMiForm.txtApeMaterno.value.length < 2) {
			alert("Ingrese Apellido Materno v\xe1lido");
			document.frmMiForm.txtApeMaterno.focus();
			return false;
		}
		if (document.frmMiForm.txtNombre1.value == "") {
			alert("Ingrese Nombre");
			document.frmMiForm.txtNombre1.focus();
			return false;
		}
		if (document.frmMiForm.txtNombre1.value.length < 2) {
			alert("Ingrese Nombre v\xe1lido");
			document.frmMiForm.txtNombre1.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbSexo.value == "") {
			alert("Seleccione su sexo");
			document.frmMiForm.cmbSexo.focus();
			return false;
		}	
		
		oDia = document.getElementById("txtDia");
		oMes = document.getElementById("txtMes");
		oAnio = document.getElementById("txtAnio");
		
		if (oDia.value.length < 2) {
			alert("Ingrese Dia de nacimiento v\xe1lido");
			oDia.focus();
			return false;
		}
		if (oMes.value.length < 2) {
			alert("Ingrese Mes de nacimiento v\xe1lido");
			oMes.focus();
			return false;
		}
		if (oMes.value == "00" || oMes.value > "12") {
			alert("Ingrese Mes de nacimiento v\xe1lido");
			oMes.focus();
			return false;
		}
		if (parseInt(oMes.value) == 1 || parseInt(oMes.value) == 3 || parseInt(oMes.value) == 5 || parseInt(oMes.value) == 7 || parseInt(oMes.value) == 8 || parseInt(oMes.value) == 10 || parseInt(oMes.value) == 12) {
			if (parseInt(oDia.value) > 31) {
				alert("Ingrese Dia de nacimiento v\xe1lido");
				oDia.focus();
				return false;
			}
		}
		if (parseInt(oMes.value) == 4 || parseInt(oMes.value) == 6 || parseInt(oMes.value) == 9 || parseInt(oMes.value) == 11) {
			if (parseInt(oDia.value) > 30) {
				alert("Ingrese Dia de nacimiento v\xe1lido");
				oDia.focus();
				return false;
			}
		}
		if (oAnio.value.length < 4) {
			alert("Ingrese A\xf1o de nacimiento v\xe1lido");
			oAnio.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (anioA - parseInt(oAnio.value) <18) {
			alert("El a\xf1o no corresponde a un mayor de edad");
			oAnio.focus();
			return false;
		}
		if (anioA - parseInt(oAnio.value)>90) {
			alert("Ingrese A&ntilde;o de nacimiento v\xe1lido");
			oAnio.focus();
			return false;
		}
		
		if (parseInt(oMes.value) == 2) {
			if (parseInt(oAnio.value) % 4 == 0) {
				if (parseInt(oDia.value) > 29) {
					alert("Ingrese Dia de nacimiento v\xe1lido");
					oDia.focus();
					return false;
				}
			} else {
				if (parseInt(oDia.value) > 28) {
					alert("Ingrese Dia de nacimiento v\xe1lido");
					oDia.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(oDia.value)) {
			alert("Ingrese Dia de nacimiento v\xe1lido");
			oDia.focus();
			return false;
		}
		if (!validarNumero(oMes.value)) {
			alert("Ingrese Mes de nacimiento v\xe1lido");
			oMes.focus();
			return false;
		}
		if (!validarNumero(oAnio.value)) {
			alert("Ingrese A\xf1o de nacimiento v\xe1lido");
			oAnio.focus();
			return false;
		}	

			
		
		if (document.frmMiForm.cmbpais.value == "0") {
			alert("Seleccione el pais de Nacimiento");
			document.frmMiForm.cmbpais.focus();
			return false;
		}	
		
		
		if (document.frmMiForm.cmbpais.value == "4028") {
			
			if(document.frmMiForm.txtDpto3.value=="0")
			{
				alert("Seleccione el departamento de Nacimiento");
				document.frmMiForm.txtDpto3.focus();
				return false;
				
				}
			if(document.frmMiForm.txtProv3.value=="0")
			{
				alert("Seleccione el provincia de Nacimiento");
				document.frmMiForm.txtProv3.focus();
				return false;
				
				}
				if(document.frmMiForm.txtDist4.value=="0")
			{
				alert("Seleccione el distrito de Nacimiento");
				document.frmMiForm.txtDist4.focus();
				return false;
				
				}
		}	
		
		if (document.frmMiForm.txtDNI.value == "" || document.frmMiForm.txtDNI.value.length < 8) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			document.frmMiForm.txtDNI.focus();
			return false;
		}
		if (!validarNumero(document.frmMiForm.txtDNI.value)) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			document.frmMiForm.txtDNI.focus();
			return false;
		}
		var dni1 = document.getElementById('txtDNI').value;   
   		var dni2 = document.getElementById('txtDNI2').value;  
		if(dni1 != dni2 )
		{
		   alert("Los DNIs no coniciden");	   
		   document.frmMiForm.txtDNI.focus();
			return false;	  
		}   
   		
		if (document.frmMiForm.txtECivil.value == "0") {
			alert("Seleccione estado civil");
			document.frmMiForm.txtECivil.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbLeng.value == "")
			{
			alert("Seleccione Lengua originaria");
			document.frmMiForm.cmbLeng.focus();
			return false;
			}
			
		if (document.frmMiForm.cmbHijoUnico.value == "") {
			
			alert("Seleccione informaci\xf3n sobre si es hijo \xfanico");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (document.frmMiForm.cmbJefeHogar.value == "") {
			alert("Seleccione informaci\xf3n sobre si es jefe de hogar");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (document.frmMiForm.cmbLengMat.value == "") {
			alert("Seleccione informaci\xf3n sobre su cual es la lengua materna que eprendi\xf3 en su ni\xdaez");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}

		if (document.frmMiForm.cmbIdiomaC.value !=0 && document.frmMiForm.cmbNivelIdioma.value =="" ) {
			alert("Seleccione nivel de conocimiento de otro idioma ");
			document.frmMiForm.cmbIdiomaC.focus();
			return false;
		}

		if (document.frmMiForm.cmbIdiomaC.value !=0 && document.frmMiForm.cmbDomIdioma.value =="" ) {
			alert("Seleccione dominio de conocimiento de otro idioma");
			document.frmMiForm.cmbIdiomaC.focus();
			return false;
		}

		if (document.frmMiForm.cmbTipovia.value == "") {
			alert("Seleccione tipo de v\xeda");
			document.frmMiForm.cmbTipovia.focus();
			return false;
		}
		if (document.frmMiForm.txtNomVia.value == "") {
			alert("Ingrese el nombre de la v\xeda donde reside");
			document.frmMiForm.txtNomVia.focus();
			return false;
		}	
		
   if (document.frmMiForm.cmbZona.value == "0") {
			alert("Seleccione la Zona de la residencia");
			document.frmMiForm.cmbZona.focus();
			return false;
		}
		
		
		if (document.frmMiForm.txtNomZona.value == "") {
			alert("Ingrese el nombre de la Zona");
			document.frmMiForm.txtNomZona.focus();
			return false;
		}

			if (document.frmMiForm.txtDpto2.value == "0") {
				alert("Seleccione departamento de residencia");
				document.frmMiForm.txtDpto2.focus();
				return false;
		}		
		if (document.frmMiForm.txtProv2.value == "" ) {
			alert("Seleccione provincia de residencia");
			document.frmMiForm.txtProv2.focus();
			return false;
		}
		if (document.frmMiForm.txtDist2.value == "0" ) {
			alert("Seleccione distrito de residencia");
			document.frmMiForm.txtDist2.focus();
			return false;
		}		
				
		
		if (parseInt(document.frmMiForm.cmbNivelInstr.value) == 0  ) {
			alert("Seleccione Nivel de Instrucci\xf3n");
			document.frmMiForm.cmbNivelInstr.focus();
			return false;
		}
		
		
			if ((document.frmMiForm.cmbNivelInstr.value=='04' || document.frmMiForm.cmbNivelInstr.value=='05'  ) && document.frmMiForm.txtperioalc.value=='' ) {
			alert("Ingrese el Periodo");
			document.frmMiForm.txtperioalc.focus();
			return false;
		}
		if ((document.frmMiForm.cmbNivelInstr.value=='04' || document.frmMiForm.cmbNivelInstr.value=='05'  ) && document.frmMiForm.cmbPeriodo.value=='0' ) {
			alert("Seleccione el tipo de Periodo");
			document.frmMiForm.cmbPeriodo.focus();
			return false;
		}
		
		
		if (parseInt(document.frmMiForm.cmbNivelInstr.value)>3 && document.frmMiForm.cmbGrado.value=='0' ) {
		alert("Seleccione el Grado Alcanzado");
		document.frmMiForm.cmbGrado.focus();
		return false;
		}
		
		if ((parseInt(document.frmMiForm.cmbGrado.value) >=3 && parseInt(document.frmMiForm.cmbGrado.value) <=6 ) && (document.getElementById("txtNum_reg_grado").value=='') ) {
			alert("Ingrese el registor de Expedici\xf3n del grado");
			document.frmMiForm.txtNum_reg_grado.focus();
			return false;
		}
		
		if ((parseInt(document.frmMiForm.cmbGrado.value) >=3 && parseInt(document.frmMiForm.cmbGrado.value) <=6) && (document.getElementById("txtMes2").value=='' ||  document.getElementById("txtAnio2").value=='') ) {
			alert("Ingresa la fecha de expedici\xf3n del grado alcanzado");
			document.frmMiForm.txtLugEstudios.focus();
			return false;
		}
		
		if (parseInt(document.frmMiForm.cmbGrado.value) >=3 && parseInt(document.frmMiForm.cmbGrado.value) <=6) {
		
		o2Dia = document.getElementById("txtDia2");
		o2Mes = document.getElementById("txtMes2");
		o2Anio = document.getElementById("txtAnio2");
		
		if (o2Dia.value.length < 2) {
			alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
			o2Dia.focus();
			return false;
		}
		if (o2Mes.value.length < 2) {
			alert("Ingrese Mes de expedici\xf3n de grado v\xe1lido");
			o2Mes.focus();
			return false;
		}
		if (o2Mes.value == "00" || o2Mes.value > "12") {
			alert("Ingrese Mes de expedici\xf3n de grado v\xe1lido");
			o2Mes.focus();
			return false;
		}
		if (parseInt(o2Mes.value) == 1 || parseInt(o2Mes.value) == 3 || parseInt(o2Mes.value) == 5 || parseInt(o2Mes.value) == 7 || parseInt(o2Mes.value) == 8 || parseInt(o2Mes.value) == 10 || parseInt(o2Mes.value) == 12) {
			if (parseInt(o2Dia.value) > 31) {
				alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
				o2Dia.focus();
				return false;
			}
		}
		if (parseInt(o2Mes.value) == 4 || parseInt(o2Mes.value) == 6 || parseInt(o2Mes.value) == 9 || parseInt(o2Mes.value) == 11) {
			if (parseInt(o2Dia.value) > 30) {
				alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
				o2Dia.focus();
				return false;
			}
		}
		if (o2Anio.value.length < 4) {
			alert("Ingrese A\xf1o de expedici\xf3n de grado v\xe1lido");
			o2Anio.focus();
			return false;
		}
		
			
		if (parseInt(o2Mes.value) == 2) {
			if (parseInt(o2Anio.value) % 4 == 0) {
				if (parseInt(o2Dia.value) > 29) {
					alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
					o2Dia.focus();
					return false;
				}
			} else {
				if (parseInt(o2Dia.value) > 28) {
					alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
					o2Dia.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(o2Dia.value)) {
			alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
			o2Dia.focus();
			return false;
		}
		if (!validarNumero(o2Mes.value)) {
			alert("Ingrese Mes de expedici\xf3n de grado v\xe1lido");
			o2Mes.focus();
			return false;
		}
		if (!validarNumero(o2Anio.value)) {
			alert("Ingrese A\xf1o de expedici\xf3n de grado v\xe1lido");
			o2Anio.focus();
			return false;
		}	
		}
	var id_proyecto=document.frmMiForm.id_proyecto.value;
		if (id_proyecto==42 && (lsIdConvCargo==773 || lsIdConvCargo==774 || lsIdConvCargo==859)){
		
			if ( document.getElementById("prof_ednom").value=="0"){
				
				alert ("Seleccione la carrera y/o Profesi\xf3n");
				document.getElementById("prof_ednom").focus();
				return false;
			} else {
				
				if (document.frmMiForm.cmbProfesion.value == "0" && document.getElementById("prof_ednom").value=="3"){
					alert ("Seleccione la otra ocupaci\xf3n y/o Profesi\xf3n");
					document.getElementById("cmbProfesion").focus();
					return false;
				}
				if (document.getElementById("especialidad_ednom").value== "" && document.getElementById("prof_ednom").value=="1"){
					alert ("Anote su especialidad como educador");
					document.getElementById("especialidad_ednom").focus();
					return false;
				}
			}
		} else{
			if (document.frmMiForm.cmbProfesion.value == "0" ) {
				alert("Seleccione la Profesi\xf3n");
				document.frmMiForm.cmbProfesion.focus();
				return false;
			}
		}
		
		if (document.frmMiForm.cmbUniversidad.value == "0" && document.frmMiForm.txtLugEst.value == "" ) {
			alert("Ingrese \xf2 Seleccione la Universidad \xf2 el Centro de Estudios");
			document.frmMiForm.txtLugEst.focus();
			return false;
		}
		
	
		var proyectoVal=document.getElementById("id_proyecto").value;
		
		if (proyectoVal==42 && (lsIdConvCargo==785 || lsIdConvCargo==786)){
		
		if (document.frmMiForm.txtExpAplicacion.value == "" ) {
			alert("Ingrese descripci\xf2n de experiencia en operativo de aplicaci\xf2n");
			document.frmMiForm.txtExpAplicacion.focus();
			return false;
		}
		
		if (document.frmMiForm.txtCargo1.value == "" ) {
			alert("Ingrese descripci\xf2n del \xfaltimo cargo desempe\xf1ado ");
			document.frmMiForm.txtCargo1.focus();
			return false;
		}
		
		
		if (document.frmMiForm.txtEmpCargo1.value == "" ) {
			alert("Ingrese nombre de la empresa/instituci\xf2 de su \xfaltimo cargo desempe\xf1ado");
			document.frmMiForm.txtEmpCargo1.focus();
			return false;
		}
		
		
		if (document.frmMiForm.txttiempoCargo1.value == "" ) {
			alert("Ingrese cantidad en meses de su \xfaltimo cargo desempe\xf1ado");
			document.frmMiForm.txttiempoCargo1.focus();
			return false;
		}
}
		
		DIcurso= document.getElementById("DIcurso");
		MIcurso = document.getElementById("MIcurso");
		AIcurso = document.getElementById("AIcurso");
		
		DFcurso= document.getElementById("DFcurso");
		MFcurso = document.getElementById("MFcurso");
		AFcurso = document.getElementById("AFcurso");
		
		if ( (DIcurso.value!="" || MIcurso.value!=""  || AIcurso.value!="" || DFcurso.value!=""  || MFcurso.value!=""  || AFcurso.value!="")  && document.frmMiForm.txtCurso.value == ""  ){
			alert("Ingrese correctamente los datos sobre el curso de capacitaci\xf3n ");
			document.getElementById("txtCurso").focus();
			return false;
			}
		
		if ( (DIcurso.value!="" || MIcurso.value!=""  || AIcurso.value!="" || DFcurso.value!=""  || MFcurso.value!=""  || AFcurso.value!="")  && document.frmMiForm.txtlugar_capacitacion.value == ""  ){
			alert("Ingrese correctamente el lugar donde realiz\xf3 su capacitaci\xf3n ");
			document.getElementById("txtlugar_capacitacion").focus();
			return false;
			}	
		
		if (document.frmMiForm.txtCurso.value == "" ) {
		} else {

		DIcurso= document.getElementById("DIcurso");
		MIcurso = document.getElementById("MIcurso");
		AIcurso = document.getElementById("AIcurso");
		
		DFcurso= document.getElementById("DFcurso");
		MFcurso = document.getElementById("MFcurso");
		AFcurso = document.getElementById("AFcurso");
		
		if (DIcurso.value.length < 2) {
			alert("Ingrese Dia de inicio de curso v\xe1lido");
			DIcurso.focus();
			return false;
		}
		if (MIcurso.value.length < 2) {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (MIcurso.value == "00" || MIcurso.value > "12") {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (parseInt(MIcurso.value) == 1 || parseInt(MIcurso.value) == 3 || parseInt(MIcurso.value) == 5 || parseInt(MIcurso.value) == 7 || parseInt(MIcurso.value) == 8 || parseInt(MIcurso.value) == 10 || parseInt(MIcurso.value) == 12) {
			if (parseInt(DIcurso.value) > 31) {
				alert("Ingrese Dia de inicio de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (parseInt(MIcurso.value) == 4 || parseInt(MIcurso.value) == 6 || parseInt(MIcurso.value) == 9 || parseInt(MIcurso.value) == 11) {
			if (parseInt(DIcurso.value) > 30) {
				alert("Ingrese Dia de inicio de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (AIcurso.value.length < 4) {
			alert("Ingrese A\xf1o de inicio de curso v\xe1lido");
			AIcurso.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (parseInt(MIcurso.value) == 2) {
			if (parseInt(AIcurso.value) % 4 == 0) {
				if (parseInt(DIcurso.value) > 29) {
					alert("Ingrese Dia de inicio de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			} else {
				if (parseInt(DIcurso.value) > 28) {
					alert("Ingrese Dia de inicio de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DIcurso.value)) {
			alert("Ingrese Dia de inicio de curso v\xe1lido");
			DIcurso.focus();
			return false;
		}
		if (!validarNumero(MIcurso.value)) {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (!validarNumero(AIcurso.value)) {
			alert("Ingrese A\xf1o de inicio de curso v\xe1lido");
			AIcurso.focus();
			return false;
		}	
		
		if (DFcurso.value.length < 2) {
			alert("Ingrese dia de fin de curso v\xe1lido");
			DFcurso.focus();
			return false;
		}
		if (MFcurso.value.length < 2) {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (MFcurso.value == "00" || MFcurso.value > "12") {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (parseInt(MFcurso.value) == 1 || parseInt(MFcurso.value) == 3 || parseInt(MFcurso.value) == 5 || parseInt(MFcurso.value) == 7 || parseInt(MFcurso.value) == 8 || parseInt(MFcurso.value) == 10 || parseInt(MFcurso.value) == 12) {
			if (parseInt(DFcurso.value) > 31) {
				alert("Ingrese dia de fin de curso v\xe1lido");
				DFcurso.focus();
				return false;
			}
		}
		if (parseInt(MFcurso.value) == 4 || parseInt(MFcurso.value) == 6 || parseInt(MFcurso.value) == 9 || parseInt(MFcurso.value) == 11) {
			if (parseInt(DFcurso.value) > 30) {
				alert("Ingrese Dia de fin de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (AFcurso.value.length < 4) {
			alert("Ingrese A\xf1o de fin de curso v\xe1lido");
			AFcurso.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(MFcurso.value) == 2) {
			if (parseInt(AFcurso.value) % 4 == 0) {
				if (parseInt(DFcurso.value) > 29) {
					alert("Ingrese Dia de fin de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			} else {
				if (parseInt(DFcurso.value) > 28) {
					alert("Ingrese Dia de fin de curso v\xe1lido");
					DFcurso.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DFcurso.value)) {
			alert("Ingrese Dia de fin de curso v\xe1lido");
			DFcurso.focus();
			return false;
		}
		if (!validarNumero(MFcurso.value)) {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (!validarNumero(AFcurso.value)) {
			alert("Ingrese A\xf1o de fin de curso v\xe1lido");
			AFcurso.focus();
			return false;
		}
		
		if (document.frmMiForm.txtHorasLectivas.value == "") {
			alert("Registre horas lectivas del curso");
			document.frmMiForm.txtHorasLectivas.focus();
			return false;
		}
		
	}
	
		DiaComp= document.getElementById("DiaComp");
		MesComp = document.getElementById("MesComp");
		AnioComp = document.getElementById("AnioComp");
		
		if (DiaComp.value.length < 2) {
			alert("Ingrese dia de fecha de nacimiento de su padre o madre v\xe1lido");
			DiaComp.focus();
			return false;
		}
		if (MesComp.value.length < 2) {
			alert("Ingrese Mes de fecha de nacimiento de su padre o madre v\xe1lido");
			MesComp.focus();
			return false;
		}
		if (MesComp.value == "00" || MesComp.value > "12") {
			alert("Ingrese Mes de fecha de nacimiento de su padre o madre v\xe1lido");
			MesComp.focus();
			return false;
		}
		if (parseInt(MesComp.value) == 1 || parseInt(MesComp.value) == 3 || parseInt(MesComp.value) == 5 || parseInt(MesComp.value) == 7 || parseInt(MesComp.value) == 8 || parseInt(MesComp.value) == 10 || parseInt(MesComp.value) == 12) {
			if (parseInt(DiaComp.value) > 31) {
				alert("Ingrese dia de fecha de nacimiento de su padre o madre v\xe1lido");
				DiaComp.focus();
				return false;
			}
		}
		if (parseInt(MesComp.value) == 4 || parseInt(MesComp.value) == 6 || parseInt(MesComp.value) == 9 || parseInt(MesComp.value) == 11) {
			if (parseInt(DiaComp.value) > 30) {
				alert("Ingrese Dia de fecha de nacimiento de su padre o madre v\xe1lido");
				DiaComp.focus();
				return false;
			}
		}
		if (AnioComp.value.length < 4) {
			alert("Ingrese A\xf1o de fecha de nacimiento de su padre o madre v\xe1lido");
			AnioComp.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(MesComp.value) == 2) {
			if (parseInt(AnioComp.value) % 4 == 0) {
				if (parseInt(DiaComp.value) > 29) {
					alert("Ingrese Dia de fecha de nacimiento de su padre o madre v\xe1lido");
					DiaComp.focus();
					return false;
				}
			} else {
				if (parseInt(DiaComp.value) > 28) {
					alert("Ingrese Dia de fecha de nacimiento de su padre o madre v\xe1lido");
					DiaComp.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DiaComp.value)) {
			alert("Ingrese Dia de fecha de nacimiento de su padre o madre v\xe1lido");
			DiaComp.focus();
			return false;
		}
		if (!validarNumero(MesComp.value)) {
			alert("Ingrese Mes de fecha de nacimiento de su padre o madre v\xe1lido");
			MesComp.focus();
			return false;
		}
		if (!validarNumero(AnioComp.value)) {
			alert("Ingrese A\xf1o de fecha de nacimiento de su padre o madre v\xe1lido");
			AnioComp.focus();
			return false;
		}
	
	
		
		if (document.frmMiForm.cmbdisposicion.value == "") {
			alert("Seleccione veracidad de datos");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}if (document.frmMiForm.cmbdisposicion.value == 2) {
			alert("Debe contar con disponibilidad a tiempo completo");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbdisposicion.value == "0") {
			alert("Seleccione la Disposici\xf3n de tiempo");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}
		if (document.frmMiForm.cmbVeracidad.value == "2") {
			alert("Seleccione SI en veracidad de datos");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (document.frmMiForm.cmbVeracidad.value == "") {
			alert("Seleccione veracidad de datos");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (id_proyecto==42  && (lsIdConvCargo==773 || lsIdConvCargo==774)){
		
		if (document.getElementById("mod_cod_4").checked){
				mod_cod_4=1}
		else				{	
				mod_cod_4=0}

		var  mod_cod_desc = document.getElementById("mod_cod_desc").value;	
		
		if (mod_cod_4==1 && mod_cod_desc==""){
			alert("Especifique que otra experiencia en Codificación de pruebas estandarizadas tiene");
			document.getElementById("mod_cod_desc").focus();
			return false;	
		}
					
		var  disp_varios = document.getElementById("disp_varios").value;
		
		if (disp_varios==0){
			alert("Seleccione su disposición de tiempo");
			return false;
			}
		
		var  otro_inst = document.getElementById("otro_inst").value;
		
		if (otro_inst==0){
			alert("Seleccione si se encuentra laborando en alguja Institución educativa realcionada a la Evaluación Excepcional de Directivos de IE");
			return false;
			
			}
		}
		var id_proyecto=document.frmMiForm.id_proyecto.value;
		var ccdd=document.frmMiForm.txtDpto1.value;
		var lsIdiomaQ =document.frmMiForm.cmbIdiomaQ.value;
		var id_caroQ =document.frmMiForm.id_caroQ.value;
		var lsIdConvCargo=document.frmMiForm.id_cc.value;
		var quechua=document.frmMiForm.quechua.value;
		var quechua=document.frmMiForm.quechua.value;
		
		if (id_proyecto==2 && quechua==1  ){
			
			if (id_caroQ==354 || id_caroQ==2){
				if (lsIdiomaQ=="0" && (ccdd=="02" || ccdd=="03" || ccdd=="09" || ccdd=="08" || ccdd=="21" || ccdd=="05" || ccdd=="10")){
					alert("Seleccione dominio del idioma quechua");
					document.frmMiForm.cmbIdiomaQ.focus();
					return false;
				}
			}
			
			if (id_caroQ==355 || id_caroQ==3){
				if (lsIdiomaQ=="0" && (ccdd=="02" || ccdd=="05" || ccdd=="09" || ccdd=="10" || ccdd=="21")){
					alert("Seleccione dominio del idioma quechua");
					document.frmMiForm.cmbIdiomaQ.focus();
					return false;
				}
			}
			if (id_caroQ==1) {
			if (document.frmMiForm.cmbdispoSabDom.value == "0") {
				alert("Seleccione la disponibilidad de trabajo los sabados y domingos");
				document.frmMiForm.cmbdispoSabDom.focus();
				return false;
			}
			
			if (document.frmMiForm.cmbdispoSabDom.value == "2") {
				alert("debe tener disponibilidad de trabajo los sabados y domingos");
				document.frmMiForm.cmbVeracidad.focus();
				return false;
			}		
			
			if (document.frmMiForm.cmbdCompromiso.value == "0") {
				alert("Seleccione si tiene compromiso de trabajo en horarios de informantes");
				document.frmMiForm.cmbdCompromiso.focus();
				return false;
			}	
			
			if (document.frmMiForm.cmbdCompromiso.value == "2") {
				alert("Debe tener compromiso de trabajo en horarios de informantes");
				document.frmMiForm.cmbdCompromiso.focus();
				return false;
			}	}
		}
		
		document.getElementById("txtOper").value=operacion;
		
	}
	
					var lsIdConvCargo=document.frmMiForm.id_cc.value;
					var lsIdProyecto=document.frmMiForm.id_proyecto.value;
					var ccddo1 = document.frmMiForm.txtDpto1.value;
					var ccdd1 = ccddo1.substring(0,2);
					var ccppo1 = document.frmMiForm.txtProv1.value;
					var ccpp1 = ccppo1.substring(2,4);
					var ccdio1 = document.frmMiForm.txtDist1.value;
					var ccdi1 = ccdio1.substring(4);
					var lsApePaterno=document.frmMiForm.txtApePaterno.value;
					var lsApeMaterno=document.frmMiForm.txtApeMaterno.value;
					var lsNombre1=document.frmMiForm.txtNombre1.value;
					var lsNombre2=document.frmMiForm.txtNombre2.value;
					var lsSexo=document.frmMiForm.cmbSexo.value;
					var oDia = document.getElementById("txtDia").value;
					var oMes = document.getElementById("txtMes").value;
					var oAnio = document.getElementById("txtAnio").value;
					var fecha_actual = new Date();   
					var anioA = fecha_actual.getFullYear(); 
					var lsFecNac = oDia +'/'+ oMes+'/'+oAnio;
					var lsEdad = anioA -oAnio;
					var lspais=document.frmMiForm.cmbpais.value;
					var lsDptoNc =document.frmMiForm.txtDpto3.value;
					var lsProvNc =document.frmMiForm.txtProv3.value;
					var lsDistNc = document.getElementById("txtDist4").value;
					var lsDNI = document.frmMiForm.txtDNI.value;
					var lsRUC = document.frmMiForm.txtRUC.value;	
					var lsECivil = document.frmMiForm.txtECivil.value;
					var lsCmbLen = 	document.frmMiForm.cmbLeng.value;
					var lsTelefono = document.frmMiForm.txtTelefono.value;
					var lsCelular = document.frmMiForm.txtCelular.value;
					var lsOperCel =	document.frmMiForm.cmbOperTel.value;
					var lsEmail = document.frmMiForm.txtEmail.value;
					var lsTipoVia = document.frmMiForm.cmbTipovia.value;
					var lsNomVia = document.frmMiForm.txtNomVia.value;
					var lsNumPuerta = document.frmMiForm.txtNumPuerta.value;
					var lsNumKilometro = document.frmMiForm.txtNumKilometro.value;
					var lsNumManzana = document.frmMiForm.txtNumManzana.value;
					var lsNumInterior = document.frmMiForm.txtNumInterior.value;
					var lsDepa = document.frmMiForm.txtdepa.value;
					var lsNumPiso = document.frmMiForm.txtNumPiso.value;
					var lsNumLote = document.frmMiForm.txtNumLote.value;
					var lsTipoZona = document.frmMiForm.cmbZona.value;
					var lsNomZona = document.frmMiForm.txtNomZona.value;
					var lsDptoR = document.frmMiForm.txtDpto2.value;
					var lsProvR = document.frmMiForm.txtProv2.value;
					var lsDistR = document.frmMiForm.txtDist2.value;
					var lsNivInst = document.frmMiForm.cmbNivelInstr.value;
					var lsTipEst = document.frmMiForm.cmbTipoEstudios.value;
					var lsGrado = document.frmMiForm.cmbGrado.value;
					var oDia2 = document.getElementById("txtDia2").value;
					var oMes2 = document.getElementById("txtMes2").value;
					var oAnio2 = document.getElementById("txtAnio2").value;
					if (oAnio2!='' &&  oMes2!='' && oDia2!='') 
						var lsfec_exp= oDia2 +'/'+ oMes2 +'/'+ oAnio2
					 else 
						var lsfec_exp='';
					var lsperioAlc = document.frmMiForm.txtperioalc.value;
					var lsTiPerAlc = document.frmMiForm.cmbPeriodo.value;
					var lsprofesion = document.frmMiForm.cmbProfesion.value;
					var lsUniv = document.frmMiForm.cmbUniversidad.value;
					var lsLugEst = document.frmMiForm.txtLugEst.value;
					var lsExpGen_anio = document.frmMiForm.txtExpGenAnio.value;
					var lsExpGen_meses = document.frmMiForm.txtExpGenMeses.value;
					var lsExpCampoanio = document.frmMiForm.txtExpCampoAnio.value;
					var lsExpCampomeses = document.frmMiForm.txtExpCampoMeses.value;
					var lsExpGrupoanio = document.frmMiForm.txtExpGrupoAnio.value;
					var lsExpGrupomeses = document.frmMiForm.txtExpGrupoMeses.value;
					var lsCapsanio = document.frmMiForm.txtCapaAnio.value;
					var lsCapameses = document.frmMiForm.txtCapaMeses.value;
					var lsDocanio = document.frmMiForm.txtDocAnio2.value;
					var lsDocmeses = document.frmMiForm.txtCapaAnio2.value;
					var lsIneiProc = document.frmMiForm.txtIneiProc.value;
					var lsProyecto = document.frmMiForm.txtProyecto.value;
					var lsIneiAnio = document.frmMiForm.txtIneiAnio.value;
					var lsCargoInei = document.frmMiForm.txtCargoInei.value;
					var lsDisposicion = document.frmMiForm.cmbdisposicion.value
					var lsVeracidad = document.frmMiForm.cmbVeracidad.value;
					var lsCargo = document.frmMiForm.cmbCargo.value;
					var lsmeta = document.frmMiForm.meta.value;
					var lsIdiomaQ = document.frmMiForm.cmbIdiomaQ.value;
					var lsdispoSabDom = document.frmMiForm.cmbdispoSabDom.value;
					var lsCompromiso = document.frmMiForm.cmbdCompromiso.value;
					var lsid_caroQ = document.frmMiForm.id_caroQ.value;
					var lsHijoUnico= document.frmMiForm.cmbHijoUnico.value; 
					var lsJEfeHogar = document.frmMiForm.cmbJefeHogar.value;
					var lsLEnguaMAt= document.frmMiForm.cmbLengMat.value;
					
					var lsCurso= document.frmMiForm.txtCurso.value;
					
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
					
					if (lsIdProyecto==42 && (lsIdConvCargo== 773 || lsIdConvCargo== 774)){
						var  especialidad_ednom = document.getElementById("especialidad_ednom").value;
						if (document.getElementById("mod_edu_1").checked) {
							var mod_edu_1=1 }
						else {					
							var mod_edu_1=0 }
						if (document.getElementById("mod_edu_2").checked){
							mod_edu_2=1}
						else			{		
							mod_edu_2=0}
							
						if (document.getElementById("mod_edu_3").checked){
							mod_edu_3=1}
						else			{		
							mod_edu_3=0	}
							
						if (document.getElementById("mod_edu_4").checked){
							mod_edu_4=1}
						else			{		
							mod_edu_4=0}
						if (document.getElementById("mod_edu_5").checked){
							mod_edu_5=1}
						else			{		
							mod_edu_5=0}
						if (document.getElementById("mod_edu_6").checked){
							mod_edu_6=1}
						else			{		
							mod_edu_6=0}
						
						if (document.getElementById("mod_cod_1").checked){
							mod_cod_1=1}
						else			{		
							mod_cod_1=0}
							
						if (document.getElementById("mod_cod_2").checked){
							mod_cod_2=1}
						else			{		
							mod_cod_2=0}
						
						if (document.getElementById("mod_cod_3").checked){
							mod_cod_3=1}
						else			{		
							mod_cod_3=0}
							
						if (document.getElementById("mod_cod_4").checked){
							mod_cod_4=1}
						else			{		
							mod_cod_4=0}
						
						var  mod_cod_desc = document.getElementById("mod_cod_desc").value;	
						var  disp_varios = document.getElementById("disp_varios").value;
						var  otro_inst = document.getElementById("otro_inst").value;	
						
						var prof_ednom=document.getElementById("prof_ednom").value;
					
					} else
					{
						var especialidad_ednom ="";			
						mod_edu_1=0;
						mod_edu_2=0;	
						mod_edu_3=0;		
						mod_edu_4=0;		
						mod_edu_5=0;	
						mod_edu_6=0;	
						mod_cod_1=0;	
						mod_cod_2=0;		
						mod_cod_3=0;		
						mod_cod_4=0;
						var mod_cod_desc = "";	
						var disp_varios = "";
						var otro_inst = "";
						var prof_ednom="";
						
						}
					
			guardar_Inscripcion (2,lsIdConvCargo,ccdd1,ccpp1,ccdi1,lsApePaterno,lsApeMaterno,lsNombre1,lsNombre2,lsSexo,lsFecNac,lsEdad ,lspais,lsDptoNc ,lsProvNc ,lsDistNc ,lsDNI ,lsRUC,lsECivil,lsCmbLen,lsTelefono,lsCelular,lsOperCel,lsEmail,lsTipoVia ,lsNomVia,lsNumPuerta ,lsNumKilometro,lsNumManzana,lsNumInterior,lsDepa ,lsNumPiso  ,lsNumLote ,lsTipoZona,lsNomZona ,lsDptoR, lsProvR ,lsDistR ,lsNivInst,lsTipEst,lsGrado ,lsfec_exp,lsperioAlc,lsTiPerAlc, lsprofesion,lsUniv, lsLugEst,lsExpGen_anio,lsExpGen_meses,lsExpCampoanio,lsExpCampomeses,lsExpGrupoanio,lsExpGrupomeses,lsCapsanio,lsCapameses ,lsDocanio ,lsDocmeses,lsIneiProc,lsProyecto,lsIneiAnio  ,lsCargoInei ,lsDisposicion ,lsVeracidad ,lsCargo ,lsmeta,lsIdProyecto,lsIdiomaQ,lsdispoSabDom,lsCompromiso,lsid_caroQ,lsHijoUnico,lsJEfeHogar,lsLEnguaMAt,lsCurso,lsfec_Icap,lsfec_Fcap, lsHorasLectivas,lsFecDatoCom, operacion, txtNum_reg_grado,txtlugar_capacitacion,txtExpAplicacion,txtNombreAplicacion,txtTiempoAplicacion,txtExpFormacion,txtNombreFormacion,txtTiempoFormacion,txtCargo1,txtEmpCargo1,txttiempoCargo1,txtCargo2,txtEmpCargo2,txttiempoCargo2, cmbIdiomaC,cmbNivelIdioma,cmbDomIdioma,especialidad_ednom,mod_edu_1,mod_edu_2,mod_edu_3,mod_edu_4,mod_edu_5,mod_edu_6,mod_cod_1,mod_cod_2,mod_cod_3,mod_cod_4,mod_cod_desc,
disp_varios,otro_inst, prof_ednom); 

   		} 
	
}

function enviarFicha(operacion) {

if (confirm("¿Esta seguro(a) que desea registrar sus datos?")) {
	if (operacion =="1" || operacion =="2") {
	
		if (document.frmMiForm.txtDpto1.value == "") {
			alert("Seleccione el Departamento de inscripci\xf3n");
			document.frmMiForm.txtDpto1.focus();
			return false;
		}
		
		if (document.frmMiForm.txtProv1.value == "" ) {
			alert("Seleccione la Provincia de inscripci\xf3n");
			document.frmMiForm.txtProv1.focus();
			return false;
		}
		
			
		var ccddo1 = document.frmMiForm.txtDpto1.value;
		var ccdd1 = ccddo1.substring(0,2);
		
		var ccppo1 = document.frmMiForm.txtProv1.value;
		var ccpp1 = ccppo1.substring(2,4);

		var ccdio1 = document.frmMiForm.txtDist1.value;
		var ccdi1 = ccdio1.substring(4,2);
		
		
		if (document.frmMiForm.txtDist1.value == "") {
			alert("Seleccione el Distrito de inscripci\xf3n");
			document.frmMiForm.txtDist1.focus();
			return false;
		}

		if (document.frmMiForm.txtApePaterno.value.length < 2) {
			alert("Ingrese Apellido Paterno v\xe1lido");
			document.frmMiForm.txtApePaterno.focus();
			return false;
		}
		if (document.frmMiForm.txtApeMaterno.value == "") {
			alert("Ingrese Apellido Materno");
			document.frmMiForm.txtApeMaterno.focus();
			return false;
		}
		if (document.frmMiForm.txtApeMaterno.value.length < 2) {
			alert("Ingrese Apellido Materno v\xe1lido");
			document.frmMiForm.txtApeMaterno.focus();
			return false;
		}
		if (document.frmMiForm.txtNombre1.value == "") {
			alert("Ingrese Nombre");
			document.frmMiForm.txtNombre1.focus();
			return false;
		}
		if (document.frmMiForm.txtNombre1.value.length < 2) {
			alert("Ingrese Nombre v\xe1lido");
			document.frmMiForm.txtNombre1.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbSexo.value == "") {
			alert("Seleccione su sexo");
			document.frmMiForm.cmbSexo.focus();
			return false;
		}	
		
		oDia = document.getElementById("txtDia");
		oMes = document.getElementById("txtMes");
		oAnio = document.getElementById("txtAnio");
		
		if (oDia.value.length < 2) {
			alert("Ingrese Dia de nacimiento v\xe1lido");
			oDia.focus();
			return false;
		}
		if (oMes.value.length < 2) {
			alert("Ingrese Mes de nacimiento v\xe1lido");
			oMes.focus();
			return false;
		}
		if (oMes.value == "00" || oMes.value > "12") {
			alert("Ingrese Mes de nacimiento v\xe1lido");
			oMes.focus();
			return false;
		}
		if (parseInt(oMes.value) == 1 || parseInt(oMes.value) == 3 || parseInt(oMes.value) == 5 || parseInt(oMes.value) == 7 || parseInt(oMes.value) == 8 || parseInt(oMes.value) == 10 || parseInt(oMes.value) == 12) {
			if (parseInt(oDia.value) > 31) {
				alert("Ingrese Dia de nacimiento v\xe1lido");
				oDia.focus();
				return false;
			}
		}
		if (parseInt(oMes.value) == 4 || parseInt(oMes.value) == 6 || parseInt(oMes.value) == 9 || parseInt(oMes.value) == 11) {
			if (parseInt(oDia.value) > 30) {
				alert("Ingrese Dia de nacimiento v\xe1lido");
				oDia.focus();
				return false;
			}
		}
		if (oAnio.value.length < 4) {
			alert("Ingrese A\xf1o de nacimiento v\xe1lido");
			oAnio.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (anioA - parseInt(oAnio.value) <18) {
			alert("El a\xf1o no corresponde a un mayor de edad");
			oAnio.focus();
			return false;
		}
		if (anioA - parseInt(oAnio.value)>90) {
			alert("Ingrese A&ntilde;o de nacimiento v\xe1lido");
			oAnio.focus();
			return false;
		}
		
		if (parseInt(oMes.value) == 2) {
			if (parseInt(oAnio.value) % 4 == 0) {
				if (parseInt(oDia.value) > 29) {
					alert("Ingrese Dia de nacimiento v\xe1lido");
					oDia.focus();
					return false;
				}
			} else {
				if (parseInt(oDia.value) > 28) {
					alert("Ingrese Dia de nacimiento v\xe1lido");
					oDia.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(oDia.value)) {
			alert("Ingrese Dia de nacimiento v\xe1lido");
			oDia.focus();
			return false;
		}
		if (!validarNumero(oMes.value)) {
			alert("Ingrese Mes de nacimiento v\xe1lido");
			oMes.focus();
			return false;
		}
		if (!validarNumero(oAnio.value)) {
			alert("Ingrese A\xf1o de nacimiento v\xe1lido");
			oAnio.focus();
			return false;
		}	

			
		
		if (document.frmMiForm.cmbpais.value == "0") {
			alert("Seleccione el pais de Nacimiento");
			document.frmMiForm.cmbpais.focus();
			return false;
		}	
		
		
		if (document.frmMiForm.cmbpais.value == "4028") {
			
			if(document.frmMiForm.txtDpto3.value=="0")
			{
				alert("Seleccione el departamento de Nacimiento");
				document.frmMiForm.txtDpto3.focus();
				return false;
				
				}
			if(document.frmMiForm.txtProv3.value=="0")
			{
				alert("Seleccione el provincia de Nacimiento");
				document.frmMiForm.txtProv3.focus();
				return false;
				
				}
				if(document.frmMiForm.txtDist4.value=="0")
			{
				alert("Seleccione el distrito de Nacimiento");
				document.frmMiForm.txtDist4.focus();
				return false;
				
				}
		}	
		
		if (document.frmMiForm.txtDNI.value == "" || document.frmMiForm.txtDNI.value.length < 8) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			document.frmMiForm.txtDNI.focus();
			return false;
		}
		if (!validarNumero(document.frmMiForm.txtDNI.value)) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			document.frmMiForm.txtDNI.focus();
			return false;
		}
		var dni1 = document.getElementById('txtDNI').value;   
   		var dni2 = document.getElementById('txtDNI2').value;  
		if(dni1 != dni2 )
		{
		   alert("Los DNIs no coniciden");	   
		   document.frmMiForm.txtDNI.focus();
			return false;	  
		}   
   		
		if (document.frmMiForm.txtECivil.value == "0") {
			alert("Seleccione estado civil");
			document.frmMiForm.txtECivil.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbLeng.value == "")
			{
			alert("Seleccione Lengua originaria");
			document.frmMiForm.cmbLeng.focus();
			return false;
			}
		if (document.frmMiForm.cmbHijoUnico.value == "") {
			alert("Seleccione informaci\xf3n sobre si es hijo \xfanico");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (document.frmMiForm.cmbJefeHogar.value == "") {
			alert("Seleccione informaci\xf3n sobre si es jefe de hogar");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (document.frmMiForm.cmbLengMat.value == "") {
			alert("Seleccione informaci\xf3n sobre su cual es la lengua materna que eprendi\xf3 en su ni\xdaez");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}

		if (document.frmMiForm.cmbTipovia.value == "" || document.frmMiForm.cmbTipovia.value == "0") {
			alert("Seleccione tipo de v\xeda");
			document.frmMiForm.cmbTipovia.focus();
			return false;
		}
		if (document.frmMiForm.txtNomVia.value == "") {
			alert("Ingrese el nombre de la v\xeda donde reside");
			document.frmMiForm.txtNomVia.focus();
			return false;
		}	
		
   if (document.frmMiForm.cmbZona.value == "0") {
			alert("Seleccione la Zona de la residencia");
			document.frmMiForm.cmbZona.focus();
			return false;
		}
		
		
		if (document.frmMiForm.txtNomZona.value == "") {
			alert("Ingrese el nombre de la Zona");
			document.frmMiForm.txtNomZona.focus();
			return false;
		}

			if (document.frmMiForm.txtDpto2.value == "0") {
				alert("Seleccione departamento de residencia");
				document.frmMiForm.txtDpto2.focus();
				return false;
		}		
		if (document.frmMiForm.txtProv2.value == "" || document.frmMiForm.txtProv2.value == "0" ) {
			alert("Seleccione provincia de residencia");
			document.frmMiForm.txtProv2.focus();
			return false;
		}
		if (document.getElementById("txtDistt2").value == "0"  || document.getElementById("txtDistt2").value == "" ) {
			alert("Seleccione distrito de residencia");
			document.getElementById("txtDistt2").focus();
			return false;
		}		
				
		
		if (parseInt(document.frmMiForm.cmbNivelInstr.value) < 3  ) {
			alert("No cumple con el perfil");
			document.frmMiForm.cmbNivelInstr.focus();
			return false;
		}
		
		
			if ((document.frmMiForm.cmbNivelInstr.value=='04' || document.frmMiForm.cmbNivelInstr.value=='05'  ) && document.frmMiForm.txtperioalc.value=='' ) {
			alert("Ingrese el Periodo");
			document.frmMiForm.txtperioalc.focus();
			return false;
		}
		if ((document.frmMiForm.cmbNivelInstr.value=='04' || document.frmMiForm.cmbNivelInstr.value=='05'  ) && document.frmMiForm.cmbPeriodo.value=='0' ) {
			alert("Seleccione el tipo de Periodo");
			document.frmMiForm.cmbPeriodo.focus();
			return false;
		}
		
		
		if (parseInt(document.frmMiForm.cmbNivelInstr.value)>3 && document.frmMiForm.cmbGrado.value=='0' ) {
		alert("Seleccione el Grado Alcanzado");
		document.frmMiForm.cmbGrado.focus();
		return false;
		}
		
		
		
		if ((parseInt(document.frmMiForm.cmbGrado.value) >=3 && parseInt(document.frmMiForm.cmbGrado.value) <=6) && (document.getElementById("txtMes2").value=='' ||  document.getElementById("txtAnio2").value=='') ) {
			alert("Ingresa la fecha de expedici\xf3n del grado alcanzado");
			document.frmMiForm.txtLugEstudios.focus();
			return false;
		}
		

		if (document.frmMiForm.cmbProfesion.value == "0" ) {
			alert("Seleccione la Profesi\xf3n");
			document.frmMiForm.cmbProfesion.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbUniversidad.value == "0" && document.frmMiForm.txtLugEst.value == "" ) {
			alert("Ingrese \xf2 Seleccione la Universidad \xf2 el Centro de Estudios");
			document.frmMiForm.txtLugEst.focus();
			return false;
		}
		
		if (document.frmMiForm.txtCurso.value == "" ) {
		} else {
		
		
		DIcurso= document.getElementById("DIcurso");
		MIcurso = document.getElementById("MIcurso");
		AIcurso = document.getElementById("AIcurso");
		
		if (DIcurso.value.length < 2) {
			alert("Ingrese Dia de inicio de curso v\xe1lido");
			DIcurso.focus();
			return false;
		}
		if (MIcurso.value.length < 2) {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (MIcurso.value == "00" || MIcurso.value > "12") {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (parseInt(MIcurso.value) == 1 || parseInt(MIcurso.value) == 3 || parseInt(MIcurso.value) == 5 || parseInt(MIcurso.value) == 7 || parseInt(MIcurso.value) == 8 || parseInt(MIcurso.value) == 10 || parseInt(MIcurso.value) == 12) {
			if (parseInt(DIcurso.value) > 31) {
				alert("Ingrese Dia de inicio de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (parseInt(MIcurso.value) == 4 || parseInt(MIcurso.value) == 6 || parseInt(MIcurso.value) == 9 || parseInt(MIcurso.value) == 11) {
			if (parseInt(DIcurso.value) > 30) {
				alert("Ingrese Dia de inicio de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (AIcurso.value.length < 4) {
			alert("Ingrese A\xf1o de inicio de curso v\xe1lido");
			AIcurso.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (parseInt(MIcurso.value) == 2) {
			if (parseInt(AIcurso.value) % 4 == 0) {
				if (parseInt(DIcurso.value) > 29) {
					alert("Ingrese Dia de inicio de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			} else {
				if (parseInt(DIcurso.value) > 28) {
					alert("Ingrese Dia de inicio de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DIcurso.value)) {
			alert("Ingrese Dia de inicio de curso v\xe1lido");
			DIcurso.focus();
			return false;
		}
		if (!validarNumero(MIcurso.value)) {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (!validarNumero(AIcurso.value)) {
			alert("Ingrese A\xf1o de inicio de curso v\xe1lido");
			AIcurso.focus();
			return false;
		}	
		
		
		
		
		DFcurso= document.getElementById("DFcurso");
		MFcurso = document.getElementById("MFcurso");
		AFcurso = document.getElementById("AFcurso");
		
		if (DFcurso.value.length < 2) {
			alert("Ingrese dia de fin de curso v\xe1lido");
			DFcurso.focus();
			return false;
		}
		if (MFcurso.value.length < 2) {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (MFcurso.value == "00" || MFcurso.value > "12") {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (parseInt(MFcurso.value) == 1 || parseInt(MFcurso.value) == 3 || parseInt(MFcurso.value) == 5 || parseInt(MFcurso.value) == 7 || parseInt(MFcurso.value) == 8 || parseInt(MFcurso.value) == 10 || parseInt(MFcurso.value) == 12) {
			if (parseInt(DFcurso.value) > 31) {
				alert("Ingrese dia de fin de curso v\xe1lido");
				DFcurso.focus();
				return false;
			}
		}
		if (parseInt(MFcurso.value) == 4 || parseInt(MFcurso.value) == 6 || parseInt(MFcurso.value) == 9 || parseInt(MFcurso.value) == 11) {
			if (parseInt(DFcurso.value) > 30) {
				alert("Ingrese Dia de fin de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (AFcurso.value.length < 4) {
			alert("Ingrese A\xf1o de fin de curso v\xe1lido");
			AFcurso.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(MFcurso.value) == 2) {
			if (parseInt(AFcurso.value) % 4 == 0) {
				if (parseInt(DFcurso.value) > 29) {
					alert("Ingrese Dia de fin de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			} else {
				if (parseInt(DFcurso.value) > 28) {
					alert("Ingrese Dia de fin de curso v\xe1lido");
					DFcurso.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DFcurso.value)) {
			alert("Ingrese Dia de fin de curso v\xe1lido");
			DFcurso.focus();
			return false;
		}
		if (!validarNumero(MFcurso.value)) {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (!validarNumero(AFcurso.value)) {
			alert("Ingrese A\xf1o de fin de curso v\xe1lido");
			AFcurso.focus();
			return false;
		}
		
		if (document.frmMiForm.txtHorasLectivas.value == "") {
			alert("Registre horas lectivas del curso");
			document.frmMiForm.txtHorasLectivas.focus();
			return false;
		}
		
	}
	
		DiaComp= document.getElementById("DiaComp");
		MesComp = document.getElementById("MesComp");
		AnioComp = document.getElementById("AnioComp");
		
		if (DiaComp.value.length < 2) {
			alert("Ingrese dia de fecha de nacimiento de su padre o madre v\xe1lido");
			DiaComp.focus();
			return false;
		}
		if (MesComp.value.length < 2) {
			alert("Ingrese Mes de fecha de nacimiento de su padre o madre v\xe1lido");
			MesComp.focus();
			return false;
		}
		if (MesComp.value == "00" || MesComp.value > "12") {
			alert("Ingrese Mes de fecha de nacimiento de su padre o madre v\xe1lido");
			MesComp.focus();
			return false;
		}
		if (parseInt(MesComp.value) == 1 || parseInt(MesComp.value) == 3 || parseInt(MesComp.value) == 5 || parseInt(MesComp.value) == 7 || parseInt(MesComp.value) == 8 || parseInt(MesComp.value) == 10 || parseInt(MesComp.value) == 12) {
			if (parseInt(DiaComp.value) > 31) {
				alert("Ingrese dia de fecha de nacimiento de su padre o madre v\xe1lido");
				DiaComp.focus();
				return false;
			}
		}
		if (parseInt(MesComp.value) == 4 || parseInt(MesComp.value) == 6 || parseInt(MesComp.value) == 9 || parseInt(MesComp.value) == 11) {
			if (parseInt(DiaComp.value) > 30) {
				alert("Ingrese Dia de fecha de nacimiento de su padre o madre v\xe1lido");
				DiaComp.focus();
				return false;
			}
		}
		if (AnioComp.value.length < 4) {
			alert("Ingrese A\xf1o de fecha de nacimiento de su padre o madre v\xe1lido");
			AnioComp.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(MesComp.value) == 2) {
			if (parseInt(AnioComp.value) % 4 == 0) {
				if (parseInt(DiaComp.value) > 29) {
					alert("Ingrese Dia de fecha de nacimiento de su padre o madre v\xe1lido");
					DiaComp.focus();
					return false;
				}
			} else {
				if (parseInt(DiaComp.value) > 28) {
					alert("Ingrese Dia de fecha de nacimiento de su padre o madre v\xe1lido");
					DiaComp.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DiaComp.value)) {
			alert("Ingrese Dia de fecha de nacimiento de su padre o madre v\xe1lido");
			DiaComp.focus();
			return false;
		}
		if (!validarNumero(MesComp.value)) {
			alert("Ingrese Mes de fecha de nacimiento de su padre o madre v\xe1lido");
			MesComp.focus();
			return false;
		}
		if (!validarNumero(AnioComp.value)) {
			alert("Ingrese A\xf1o de fecha de nacimiento de su padre o madre v\xe1lido");
			AnioComp.focus();
			return false;
		}
	
	
		
		if (document.frmMiForm.cmbdisposicion.value == "") {
			alert("Seleccione veracidad de datos");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}if (document.frmMiForm.cmbdisposicion.value == 2) {
			alert("Debe contar con disponibilidad a tiempo completo");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbdisposicion.value == "0") {
			alert("Seleccione la Disposici\xf3n de tiempo");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}
		if (document.frmMiForm.cmbVeracidad.value == "2") {
			alert("Seleccione SI en veracidad de datos");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (document.frmMiForm.cmbVeracidad.value == "") {
			alert("Seleccione veracidad de datos");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		

		var id_proyecto=document.frmMiForm.id_proyecto.value;
		var ccdd=document.frmMiForm.txtDpto1.value;
		var lsIdiomaQ =document.frmMiForm.cmbIdiomaQ.value;
		var id_caroQ =document.frmMiForm.id_caroQ.value;
		var lsIdConvCargo=document.frmMiForm.id_cc.value;
		
		if (id_proyecto==2 && lsIdConvCargo==2  ){
			
			if (id_caroQ==2){
				if (lsIdiomaQ=="0" && (ccdd=="02" || ccdd=="03" || ccdd=="09" || ccdd=="08" || ccdd=="21" || ccdd=="05")){
					alert("Seleccione dominio del idioma quechua");
					document.frmMiForm.cmbIdiomaQ.focus();
					return false;
				}
			}
			
			if (id_caroQ==3){
				if (lsIdiomaQ=="0" && (ccdd=="02" || ccdd=="09" || ccdd=="21")){
					alert("Seleccione dominio del idioma quechua");
					document.frmMiForm.cmbIdiomaQ.focus();
					return false;
				}
			}
			if (lsIdiomaQ=="0"  && (id_caroQ==3 || id_caroQ==2) && (ccdd=="02" || ccdd=="03" || ccdd=="09" || ccdd=="08" || ccdd=="21")){
				alert("Seleccione dominio del idioma quechua");
				document.frmMiForm.cmbIdiomaQ.focus();
				return false;
				
			}
			if (document.frmMiForm.cmbdispoSabDom.value == "0") {
				alert("Seleccione la disponibilidad de trabajo los sabados y domingos");
				document.frmMiForm.cmbdispoSabDom.focus();
				return false;
			}
			
			if (document.frmMiForm.cmbdispoSabDom.value == "2") {
				alert("debe tener disponibilidad de trabajo los sabados y domingos");
				document.frmMiForm.cmbVeracidad.focus();
				return false;
			}		
			
			if (document.frmMiForm.cmbdCompromiso.value == "0") {
				alert("Seleccione si tiene compromiso de trabajo en horarios de informantes");
				document.frmMiForm.cmbdCompromiso.focus();
				return false;
			}	
			
			if (document.frmMiForm.cmbdCompromiso.value == "2") {
				alert("Debe tener compromiso de trabajo en horarios de informantes");
				document.frmMiForm.cmbdCompromiso.focus();
				return false;
			}	
		}
		
		document.getElementById("txtOper").value=operacion;
		
	}
	
					var lsIdConvCargo=document.frmMiForm.id_cc.value;
					var lsIdProyecto=document.frmMiForm.id_proyecto.value;
					var ccddo1 = document.frmMiForm.txtDpto1.value;
					var ccdd1 = ccddo1.substring(0,2);
					var ccppo1 = document.frmMiForm.txtProv1.value;
					var ccpp1 = ccppo1.substring(2,4);
					var ccdio1 = document.frmMiForm.txtDist1.value;
					var ccdi1 = ccdio1.substring(4);
					var lsApePaterno=document.frmMiForm.txtApePaterno.value;
					var lsApeMaterno=document.frmMiForm.txtApeMaterno.value;
					var lsNombre1=document.frmMiForm.txtNombre1.value;
					var lsNombre2=document.frmMiForm.txtNombre2.value;
					var lsSexo=document.frmMiForm.cmbSexo.value;
					var oDia = document.getElementById("txtDia").value;
					var oMes = document.getElementById("txtMes").value;
					var oAnio = document.getElementById("txtAnio").value;
					var fecha_actual = new Date();   
					var anioA = fecha_actual.getFullYear(); 
					var lsFecNac = oDia +'/'+ oMes+'/'+oAnio;
					var lsEdad = anioA -oAnio;
					var lspais=document.frmMiForm.cmbpais.value;
					var lsDptoNc =document.frmMiForm.txtDpto3.value;
					var lsProvNc =document.frmMiForm.txtProv3.value;
					var lsDistNc = document.getElementById("txtDist4").value;
					var lsDNI = document.frmMiForm.txtDNI.value;
					var lsRUC = document.frmMiForm.txtRUC.value;	
					var lsECivil = document.frmMiForm.txtECivil.value;
					var lsCmbLen = 	document.frmMiForm.cmbLeng.value;
					var lsTelefono = document.frmMiForm.txtTelefono.value;
					var lsCelular = document.frmMiForm.txtCelular.value;
					var lsOperCel =	document.frmMiForm.cmbOperTel.value;
					var lsEmail = document.frmMiForm.txtEmail.value;
					var lsTipoVia = document.frmMiForm.cmbTipovia.value; 
					var lsNomVia = document.frmMiForm.txtNomVia.value;
					var lsNumPuerta = document.frmMiForm.txtNumPuerta.value;
					var lsNumKilometro = document.frmMiForm.txtNumKilometro.value;
					var lsNumManzana = document.frmMiForm.txtNumManzana.value;
					var lsNumInterior = document.frmMiForm.txtNumInterior.value;
					var lsDepa = document.frmMiForm.txtdepa.value;
					var lsNumPiso = document.frmMiForm.txtNumPiso.value;
					var lsNumLote = document.frmMiForm.txtNumLote.value;
					var lsTipoZona = document.frmMiForm.cmbZona.value;
					var lsNomZona = document.frmMiForm.txtNomZona.value;
					var lsDptoR = document.frmMiForm.txtDpto2.value;
					var lsProvR = document.frmMiForm.txtProv2.value;
					var lsDistR = document.getElementById("txtDistt2").value;
					var lsNivInst = document.frmMiForm.cmbNivelInstr.value;
					var lsTipEst = document.frmMiForm.cmbTipoEstudios.value;
					var lsGrado = document.frmMiForm.cmbGrado.value;
					var oDia2 = document.getElementById("txtDia2").value;
					var oMes2 = document.getElementById("txtMes2").value;
					var oAnio2 = document.getElementById("txtAnio2").value;
					if (oAnio2!='' &&  oMes2!='' && oDia2!='') 
						var lsfec_exp= oDia2 +'/'+ oMes2 +'/'+ oAnio2
					 else 
						var lsfec_exp='';
					var lsperioAlc = document.frmMiForm.txtperioalc.value;
					var lsTiPerAlc = document.frmMiForm.cmbPeriodo.value;
					var lsprofesion = document.frmMiForm.cmbProfesion.value;
					var lsUniv = document.frmMiForm.cmbUniversidad.value;
					var lsLugEst = document.frmMiForm.txtLugEst.value;
					var lsExpGen_anio = document.frmMiForm.txtExpGenAnio.value;
					var lsExpGen_meses = document.frmMiForm.txtExpGenMeses.value;
					var lsExpCampoanio = document.frmMiForm.txtExpCampoAnio.value;
					var lsExpCampomeses = document.frmMiForm.txtExpCampoMeses.value;
					var lsExpGrupoanio = document.frmMiForm.txtExpGrupoAnio.value;
					var lsExpGrupomeses = document.frmMiForm.txtExpGrupoMeses.value;
					var lsCapsanio = document.frmMiForm.txtCapaAnio.value;
					var lsCapameses = document.frmMiForm.txtCapaMeses.value;
					var lsDocanio = document.frmMiForm.txtDocAnio2.value;
					var lsDocmeses = document.frmMiForm.txtCapaAnio2.value;
					var lsIneiProc = document.frmMiForm.txtIneiProc.value;
					var lsProyecto = document.frmMiForm.txtProyecto.value;
					var lsIneiAnio = document.frmMiForm.txtIneiAnio.value;
					var lsCargoInei = document.frmMiForm.txtCargoInei.value;
					var lsDisposicion = document.frmMiForm.cmbdisposicion.value
					var lsVeracidad = document.frmMiForm.cmbVeracidad.value;
					var lsCargo = document.frmMiForm.cmbCargo.value;
					var lsmeta = document.frmMiForm.meta.value;
					var lsIdiomaQ = document.frmMiForm.cmbIdiomaQ.value;
					var lsdispoSabDom = document.frmMiForm.cmbdispoSabDom.value;
					var lsCompromiso = document.frmMiForm.cmbdCompromiso.value;
					var lsid_caroQ = document.frmMiForm.id_caroQ.value;
					var lsHijoUnico= document.frmMiForm.cmbHijoUnico.value; 
					var lsJEfeHogar = document.frmMiForm.cmbJefeHogar.value;
					var lsLEnguaMAt= document.frmMiForm.cmbLengMat.value;
					
					var lsCurso= document.frmMiForm.txtCurso.value;
					
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
						
					var lsHorasLectivas= document.frmMiForm.txtHorasLectivas.value;
					
					var DiaComp = document.getElementById("DiaComp").value;
					var MesComp = document.getElementById("MesComp").value;
					var AnioComp = document.getElementById("AnioComp").value;
					if (AnioComp!='' &&  MesComp!='' && DiaComp!='') 
						var lsFecDatoCom= DiaComp +'/'+ MesComp +'/'+ AnioComp
					 else 
						var lsFecDatoCom='';

			guardar_InscripcionActu (2,lsIdConvCargo,ccdd1,ccpp1,ccdi1,lsApePaterno,lsApeMaterno,lsNombre1,lsNombre2,lsSexo,lsFecNac,lsEdad ,lspais,lsDptoNc ,lsProvNc ,lsDistNc ,lsDNI ,lsRUC,lsECivil,lsCmbLen,lsTelefono,lsCelular,lsOperCel,lsEmail,lsTipoVia ,lsNomVia,lsNumPuerta ,lsNumKilometro,lsNumManzana,lsNumInterior,lsDepa ,lsNumPiso  ,lsNumLote ,lsTipoZona,lsNomZona ,lsDptoR, lsProvR ,lsDistR ,lsNivInst,lsTipEst,lsGrado ,lsfec_exp,lsperioAlc,lsTiPerAlc, lsprofesion,lsUniv, lsLugEst,lsExpGen_anio,lsExpGen_meses,lsExpCampoanio,lsExpCampomeses,lsExpGrupoanio,lsExpGrupomeses,lsCapsanio,lsCapameses ,lsDocanio ,lsDocmeses,lsIneiProc,lsProyecto,lsIneiAnio  ,lsCargoInei ,lsDisposicion ,lsVeracidad ,lsCargo ,lsmeta,lsIdProyecto,lsIdiomaQ,lsdispoSabDom,lsCompromiso,lsid_caroQ,lsHijoUnico,lsJEfeHogar,lsLEnguaMAt,lsCurso,lsfec_Icap,lsfec_Fcap, lsHorasLectivas,lsFecDatoCom, operacion); 

   		} 
	
}


function guardar_InscripcionActu (valor,lsIdConvCargo,ccdd1,ccpp1,ccdi1,lsApePaterno,lsApeMaterno,lsNombre1,lsNombre2,lsSexo,lsFecNac,lsEdad ,lspais,lsDptoNc ,lsProvNc ,lsDistNc ,lsDNI ,lsRUC,lsECivil,lsCmbLen,lsTelefono,lsCelular,lsOperCel,lsEmail,lsTipoVia ,lsNomVia,lsNumPuerta ,lsNumKilometro,lsNumManzana,lsNumInterior,lsDepa ,lsNumPiso  ,lsNumLote ,lsTipoZona,lsNomZona ,lsDptoR, lsProvR ,lsDistR ,lsNivInst,lsTipEst,lsGrado ,lsfec_exp,lsperioAlc,lsTiPerAlc, lsprofesion,lsUniv, lsLugEst,lsExpGen_anio,lsExpGen_meses,lsExpCampoanio,lsExpCampomeses,lsExpGrupoanio,lsExpGrupomeses,lsCapsanio,lsCapameses ,lsDocanio ,lsDocmeses,lsIneiProc,lsProyecto,lsIneiAnio  ,lsCargoInei ,lsDisposicion ,lsVeracidad ,lsCargo ,lsmeta,lsIdProyecto,lsIdiomaQ,lsdispoSabDom,lsCompromiso,lsid_caroQ,lsHijoUnico,lsJEfeHogar,lsLEnguaMAt,lsCurso,lsfec_Icap,lsfec_Fcap, lsHorasLectivas, lsFecDatoCom,operacion){

					ajax=http_request();
					var valores;	
					valores= "lsIdConvCargo="+escape(lsIdConvCargo)+ "&ccdd1="+escape(ccdd1)+ "&ccpp1="+escape(ccpp1)+ "&ccdi1="+escape(ccdi1)+ "&lsApePaterno="+escape(lsApePaterno)+ "&lsApeMaterno="+escape(lsApeMaterno)+ "&lsNombre1="+escape(lsNombre1)+ "&lsNombre2="+escape(lsNombre2)+ "&lsSexo="+escape(lsSexo)+ "&lsFecNac ="+escape(lsFecNac)+ "&lsEdad ="+escape(lsEdad)+ "&lspais="+escape(lspais)+ "&lsDptoNc ="+escape(lsDptoNc)+ "&lsProvNc ="+escape(lsProvNc)+ "&lsDistNc ="+escape(lsDistNc)+ "&lsDNI ="+escape(lsDNI)+ "&lsRUC="+escape(lsRUC)+ "&lsECivil="+escape(lsECivil)+ "&lsCmbLen="+escape(lsCmbLen)+ "&lsTelefono="+escape(lsTelefono)+ "&lsCelular="+escape(lsCelular)+ "&lsOperCel="+escape(lsOperCel)+ "&lsEmail="+escape(lsEmail)+ "&lsTipoVia ="+escape(lsTipoVia)+ "&lsNomVia="+escape(lsNomVia)+ "&lsNumPuerta ="+escape(lsNumPuerta)+ "&lsNumKilometro="+escape(lsNumKilometro)+ "&lsNumManzana="+escape(lsNumManzana)+ "&lsNumInterior="+escape(lsNumInterior)+ "&lsDepa ="+escape(lsDepa)+ "&lsNumPiso ="+escape(lsNumPiso)+ "&lsNumLote ="+escape(lsNumLote)+ "&lsTipoZona="+escape(lsTipoZona)+ "&lsNomZona ="+escape(lsNomZona)+ "&lsDptoR ="+escape(lsDptoR)+ "&lsProvR ="+escape(lsProvR)+ "&lsDistR ="+escape(lsDistR)+ "&lsNivInst="+escape(lsNivInst)+ "&lsTipEst="+escape(lsTipEst)+ "&lsGrado ="+escape(lsGrado)+ "&lsfec_exp="+escape(lsfec_exp)+ "&lsperioAlc ="+escape(lsperioAlc)+ "&lsTiPerAlc="+escape(lsTiPerAlc)+ "&lsprofesion="+escape(lsprofesion)+ "&lsUniv="+escape(lsUniv)+"&lsLugEst="+escape(lsLugEst)+"&lsExpGen_anio="+escape(lsExpGen_anio)+"&lsExpGen_meses="+escape(lsExpGen_meses)+"&lsExpCampoanio="+escape(lsExpCampoanio)+ "&lsExpCampomeses="+escape(lsExpCampomeses)+ "&lsExpGrupoanio="+escape(lsExpGrupoanio)+ "&lsExpGrupomeses="+escape(lsExpGrupomeses)+ "&lsCapsanio="+escape(lsCapsanio)+ "&lsCapameses ="+escape(lsCapameses)+ "&lsDocanio ="+escape(lsDocanio)+ "&lsDocmeses="+escape(lsDocmeses)+ "&lsIneiProc="+escape(lsIneiProc)+ "&lsProyecto="+escape(lsProyecto)+ "&lsIneiAnio ="+escape(lsIneiAnio)+ "&lsCargoInei="+escape(lsCargoInei)+ "&lsDisposicion="+escape(lsDisposicion)+ "&lsVeracidad="+escape(lsVeracidad)+ "&lsCargo="+escape(lsCargo)+ "&lsmeta="+escape(lsmeta)+ "&lsIdProyecto="+escape(lsIdProyecto)+ "&lsIdiomaQ="+escape(lsIdiomaQ)+ "&lsdispoSabDom="+escape(lsdispoSabDom)+ "&lsCompromiso="+escape(lsCompromiso)+ "&lsid_caroQ="+escape(lsid_caroQ)+ "&lsHijoUnico="+escape(lsHijoUnico)+ "&lsJEfeHogar="+escape(lsJEfeHogar)+ "&lsLEnguaMAt="+escape(lsLEnguaMAt)+ "&lsCurso="+escape(lsCurso)+ "&lsfec_Icap="+escape(lsfec_Icap)+ "&lsfec_Fcap="+escape(lsfec_Fcap)+ "&lsHorasLectivas="+escape(lsHorasLectivas)+ "&lsFecDatoCom="+escape(lsFecDatoCom);
					
				if (operacion==1){	
					url="pd_confirmacion_archivo.asp";  }
				else {
					url="pd_confirmacionAct.asp";
					}

				ajax.open ('POST', url, true);
				ajax.onreadystatechange = function() {
					 if (ajax.readyState==1) {
					 }
					 else if (ajax.readyState==4){
						
					if(ajax.status==200){		

							if (ajax.responseText==3 ){
								
								var lsDNI = document.frmMiForm.txtDNI.value;
								var w= window.open("pd_confirmacion_test.asp?nocache="+Math.random()+"&dni="+escape(lsDNI)+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
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
	
	
function guardar_Inscripcion (valor,lsIdConvCargo,ccdd1,ccpp1,ccdi1,lsApePaterno,lsApeMaterno,lsNombre1,lsNombre2,lsSexo,lsFecNac,lsEdad ,lspais,lsDptoNc ,lsProvNc ,lsDistNc ,lsDNI ,lsRUC,lsECivil,lsCmbLen,lsTelefono,lsCelular,lsOperCel,lsEmail,lsTipoVia ,lsNomVia,lsNumPuerta ,lsNumKilometro,lsNumManzana,lsNumInterior,lsDepa ,lsNumPiso  ,lsNumLote ,lsTipoZona,lsNomZona ,lsDptoR, lsProvR ,lsDistR ,lsNivInst,lsTipEst,lsGrado ,lsfec_exp,lsperioAlc,lsTiPerAlc, lsprofesion,lsUniv, lsLugEst,lsExpGen_anio,lsExpGen_meses,lsExpCampoanio,lsExpCampomeses,lsExpGrupoanio,lsExpGrupomeses,lsCapsanio,lsCapameses ,lsDocanio ,lsDocmeses,lsIneiProc,lsProyecto,lsIneiAnio  ,lsCargoInei ,lsDisposicion ,lsVeracidad ,lsCargo ,lsmeta,lsIdProyecto,lsIdiomaQ,lsdispoSabDom,lsCompromiso,lsid_caroQ,lsHijoUnico,lsJEfeHogar,lsLEnguaMAt,lsCurso,lsfec_Icap,lsfec_Fcap, lsHorasLectivas, lsFecDatoCom,operacion,txtNum_reg_grado,txtlugar_capacitacion,txtExpAplicacion,txtNombreAplicacion,txtTiempoAplicacion,txtExpFormacion,txtNombreFormacion,txtTiempoFormacion,txtCargo1,txtEmpCargo1,txttiempoCargo1,txtCargo2,txtEmpCargo2,txttiempoCargo2,cmbIdiomaC,cmbNivelIdioma,cmbDomIdioma,especialidad_ednom,mod_edu_1,mod_edu_2,mod_edu_3,mod_edu_4,mod_edu_5,mod_edu_6,mod_cod_1,mod_cod_2,mod_cod_3,mod_cod_4,mod_cod_desc,disp_varios,otro_inst, prof_ednom){
	
					ajax=http_request();
					var valores;	
					valores= "lsIdConvCargo="+escape(lsIdConvCargo)+ "&ccdd1="+escape(ccdd1)+ "&ccpp1="+escape(ccpp1)+ "&ccdi1="+escape(ccdi1)+ "&lsApePaterno="+escape(lsApePaterno)+ "&lsApeMaterno="+escape(lsApeMaterno)+ "&lsNombre1="+escape(lsNombre1)+ "&lsNombre2="+escape(lsNombre2)+ "&lsSexo="+escape(lsSexo)+ "&lsFecNac ="+escape(lsFecNac)+ "&lsEdad ="+escape(lsEdad)+ "&lspais="+escape(lspais)+ "&lsDptoNc ="+escape(lsDptoNc)+ "&lsProvNc ="+escape(lsProvNc)+ "&lsDistNc ="+escape(lsDistNc)+ "&lsDNI ="+escape(lsDNI)+ "&lsRUC="+escape(lsRUC)+ "&lsECivil="+escape(lsECivil)+ "&lsCmbLen="+escape(lsCmbLen)+ "&lsTelefono="+escape(lsTelefono)+ "&lsCelular="+escape(lsCelular)+ "&lsOperCel="+escape(lsOperCel)+ "&lsEmail="+escape(lsEmail)+ "&lsTipoVia ="+escape(lsTipoVia)+ "&lsNomVia="+escape(lsNomVia)+ "&lsNumPuerta ="+escape(lsNumPuerta)+ "&lsNumKilometro="+escape(lsNumKilometro)+ "&lsNumManzana="+escape(lsNumManzana)+ "&lsNumInterior="+escape(lsNumInterior)+ "&lsDepa ="+escape(lsDepa)+ "&lsNumPiso ="+escape(lsNumPiso)+ "&lsNumLote ="+escape(lsNumLote)+ "&lsTipoZona="+escape(lsTipoZona)+ "&lsNomZona ="+escape(lsNomZona)+ "&lsDptoR ="+escape(lsDptoR)+ "&lsProvR ="+escape(lsProvR)+ "&lsDistR ="+escape(lsDistR)+ "&lsNivInst="+escape(lsNivInst)+ "&lsTipEst="+escape(lsTipEst)+ "&lsGrado ="+escape(lsGrado)+ "&lsfec_exp="+escape(lsfec_exp)+ "&lsperioAlc ="+escape(lsperioAlc)+ "&lsTiPerAlc="+escape(lsTiPerAlc)+ "&lsprofesion="+escape(lsprofesion)+ "&lsUniv="+escape(lsUniv)+"&lsLugEst="+escape(lsLugEst)+"&lsExpGen_anio="+escape(lsExpGen_anio)+"&lsExpGen_meses="+escape(lsExpGen_meses)+"&lsExpCampoanio="+escape(lsExpCampoanio)+ "&lsExpCampomeses="+escape(lsExpCampomeses)+ "&lsExpGrupoanio="+escape(lsExpGrupoanio)+ "&lsExpGrupomeses="+escape(lsExpGrupomeses)+ "&lsCapsanio="+escape(lsCapsanio)+ "&lsCapameses ="+escape(lsCapameses)+ "&lsDocanio ="+escape(lsDocanio)+ "&lsDocmeses="+escape(lsDocmeses)+ "&lsIneiProc="+escape(lsIneiProc)+ "&lsProyecto="+escape(lsProyecto)+ "&lsIneiAnio ="+escape(lsIneiAnio)+ "&lsCargoInei="+escape(lsCargoInei)+ "&lsDisposicion="+escape(lsDisposicion)+ "&lsVeracidad="+escape(lsVeracidad)+ "&lsCargo="+escape(lsCargo)+ "&lsmeta="+escape(lsmeta)+ "&lsIdProyecto="+escape(lsIdProyecto)+ "&lsIdiomaQ="+escape(lsIdiomaQ)+ "&lsdispoSabDom="+escape(lsdispoSabDom)+ "&lsCompromiso="+escape(lsCompromiso)+ "&lsid_caroQ="+escape(lsid_caroQ)+ "&lsHijoUnico="+escape(lsHijoUnico)+ "&lsJEfeHogar="+escape(lsJEfeHogar)+ "&lsLEnguaMAt="+escape(lsLEnguaMAt)+ "&lsCurso="+escape(lsCurso)+ "&lsfec_Icap="+escape(lsfec_Icap)+ "&lsfec_Fcap="+escape(lsfec_Fcap)+ "&lsHorasLectivas="+escape(lsHorasLectivas)+ "&lsFecDatoCom="+escape(lsFecDatoCom)+ "&txtNum_reg_grado="+escape(txtNum_reg_grado)+ "&txtlugar_capacitacion="+escape(txtlugar_capacitacion)+ "&txtExpAplicacion="+escape(txtExpAplicacion)+ "&txtNombreAplicacion="+escape(txtNombreAplicacion)+ "&txtTiempoAplicacion="+escape(txtTiempoAplicacion)+ "&txtExpFormacion="+escape(txtExpFormacion)+ "&txtNombreFormacion="+escape(txtNombreFormacion)+ "&txtTiempoFormacion="+escape(txtTiempoFormacion)+ "&txtCargo1="+escape(txtCargo1)+ "&txtEmpCargo1="+escape(txtEmpCargo1)+ "&txttiempoCargo1="+escape(txttiempoCargo1)+ "&txtCargo2="+escape(txtCargo2)+ "&txtEmpCargo2="+escape(txtEmpCargo2)+ "&txttiempoCargo2="+escape(txttiempoCargo2)+ "&cmbIdiomaC="+escape(cmbIdiomaC)+ "&cmbNivelIdioma="+escape(cmbNivelIdioma)+ "&cmbDomIdioma="+escape(cmbDomIdioma)+ "&especialidad_ednom="+escape(especialidad_ednom)+ "&mod_edu_1="+escape(mod_edu_1)+ "&mod_edu_2="+escape(mod_edu_2)+ "&mod_edu_3="+escape(mod_edu_3)+ "&mod_edu_4="+escape(mod_edu_4)+ "&mod_edu_5="+escape(mod_edu_5)+ "&mod_edu_6="+escape(mod_edu_6)+ "&mod_cod_1="+escape(mod_cod_1)+ "&mod_cod_2="+escape(mod_cod_2)+ "&mod_cod_3="+escape(mod_cod_3)+ "&mod_cod_4="+escape(mod_cod_4)+ "&mod_cod_desc="+escape(mod_cod_desc)+ "&disp_varios="+escape(disp_varios)+ "&otro_inst="+escape(otro_inst)+ "&prof_ednom="+escape(prof_ednom);
					
				if (operacion==1){	
					url="pd_confirmacion_archivo.asp";  }
				else {
					url="pd_confirmacionAct.asp";
					}
				
				ajax.open ('POST', url, true);
				ajax.onreadystatechange = function() {
					 if (ajax.readyState==1) {
					 }
					 else if (ajax.readyState==4){
						
						if(ajax.status==200){		

							if (ajax.responseText==3 ){
								var lsDNI = document.frmMiForm.txtDNI.value;
								var meta=document.frmMiForm.meta.value;
								var id_proyecto=document.frmMiForm.id_proyecto.value;
								var lsIdConvCargo=document.frmMiForm.id_cc.value;
								var lsCargo = document.frmMiForm.cmbCargo.value;
								var testP = document.frmMiForm.testP.value;
								var testC = document.frmMiForm.testC.value;
								var MomentoP = document.frmMiForm.MomentoP.value;
								var MomentoC = document.frmMiForm.MomentoC.value;
								
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
	
	
function finalizar(){
	var fin=document.getElementById("finalizado").value;
	var a1=document.getElementById("a1").value;
	var a2=document.getElementById("a2").value;
	var a3=document.getElementById("a3").value;
	

	if (fin==0){
		alert('Guarde los datos de la ficha');
		return false;
	}
	
	if (a1==0){
		alert('Adjunte hoja de vida');
		return false;
	}
	
	if (a2==0){
		alert('Adjunte imagen de su DNI');
		return false;
	}
	
	if (a3==0){
		alert('Adjunte \xfaltima certificaci\xf3n de nivel acad\xe9mico alcanzado');
		return false;
	} 

	var dni = document.getElementById("txtDNI").value;
	var meta=document.getElementById("meta").value;
	var testP= document.getElementById("testP").value;
	var id_cc= document.getElementById("id_cc").value;
	var lsCargo= document.getElementById("cmbCargoI").value;
	var testC= document.getElementById("testC").value;
	var MomentoP= document.getElementById("MomentoP").value;
	var MomentoC= document.getElementById("MomentoC").value;
	var lsIdConvCargo=document.getElementById("id_cc").value;
	
	if (MomentoC==1) {
		var w= window.open("TestInformatico.asp?nocache="+Math.random()+"&hdni="+escape(dni)+"&hcodProyecto="+meta+"&periodo="+lsCargo+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
	} else {
		if (MomentoP==1){
			if (testP==1){
				var w= window.open("principal.asp?nocache="+Math.random()+"&hdni="+escape(dni)+"&hcodProyecto="+meta+"&hid_puesto="+lsCargo+"&hperiodo="+lsIdConvCargo+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
			}
			if (testP==2){
				var w= window.open("examen2.asp?nocache="+Math.random()+"&hdni="+escape(dni)+"&hcodProyecto="+meta+"&hid_puesto="+lsCargo+"&hperiodo="+lsIdConvCargo+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
			}
		} else
			var w= window.open("pd_confirmacion_test.asp?nocache="+Math.random()+"&dni="+escape(dni)+"","_self","width=1490,height=900,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
		}
}


function calcular_edad(fecha){ 
    hoy=new Date() 
    var array_fecha = fecha.split("/") 
    if (array_fecha.length!=3) 
       return false 
    var ano 
    ano = parseInt(array_fecha[2]); 
    if (isNaN(ano)) 
       return false 

    var mes 
    mes = parseInt(array_fecha[1]); 
    if (isNaN(mes)) 
       return false 

    var dia 
    dia = parseInt(array_fecha[0]); 
    if (isNaN(dia)) 
       return false 
    if (ano<=99) 
       ano +=1900 
    edad=hoy.getYear()- ano - 1; //-1 porque no se si ha cumplido años ya este año 
    if (hoy.getMonth() + 1 - mes < 0) //+ 1 porque los meses empiezan en 0 
       return edad 
    if (hoy.getMonth() + 1 - mes > 0) 
       return edad+1 
    if (hoy.getUTCDate() - dia >= 0) 
       return edad + 1 


    return edad 
}





function imprimir()
{
if (window.print)
	window.print()
else
	alert("Su navegador no soporta esta opci\xf3n.");
}
function enviarDatosMod(operacion) {
	if (operacion =="1") {
		if (document.frmMiForm.txtApePaternoM.value == "") {
			alert("Ingrese Apellido Paterno");
			document.frmMiForm.txtApePaternoM.focus();
			return false;
		}
		if (document.frmMiForm.txtApePaternoM.value.length < 2) {
			alert("Ingrese Apellido Paterno v\xe1lido");
			document.frmMiForm.txtApePaternoM.focus();
			return false;
		}
		if (document.frmMiForm.txtApeMaternoM.value == "") {
			alert("Ingrese Apellido Materno");
			document.frmMiForm.txtApeMaternoM.focus();
			return false;
		}
		if (document.frmMiForm.txtApeMaternoM.value.length < 2) {
			alert("Ingrese Apellido Materno v\xe1lido");
			document.frmMiForm.txtApeMaternoM.focus();
			return false;
		}
		if (document.frmMiForm.txtNombreM.value == "") {
			alert("Ingrese Nombre");
			document.frmMiForm.txtNombreM.focus();
			return false;
		}
		if (document.frmMiForm.txtNombreM.value.length < 2) {
			alert("Ingrese Nombre v\xe1lido");
			document.frmMiForm.txtNombreM.focus();
			return false;
		}
		if (document.frmMiForm.txtDNIM.value == "" || document.frmMiForm.txtDNIM.value.length < 8) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			document.frmMiForm.txtDNIM.focus();
			return false;
		}
		if (!validarNumero(document.frmMiForm.txtDNIM.value)) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			document.frmMiForm.txtDNIM.focus();
			return false;
		}	
		document.getElementById("txtOper2").value=operacion;
	}
	document.frmMiForm.submit();
}



function enviarFichaActualiza(operacion) {
	
if (confirm("¿Esta seguro(a) que desea registrar sus datos?")) {
	if (operacion =="1" || operacion =="2") {
		
		/*var lsIdConvCargo=document.frmMiForm.id_cc.value;
			
		if (document.frmMiForm.txtDpto1.value == "") {
			alert("Seleccione la sede operativa donde desea postular");
			document.frmMiForm.txtSedeop.focus();
			return false;
		}
		
		if (document.frmMiForm.txtProv1.value == "" ) {
			alert("Seleccione la Provincia de inscripci\xf3n");
			document.frmMiForm.txtProv1.focus();
			return false;
		}
		
			
		var ccddo1 = document.frmMiForm.txtDpto1.value;
		var ccdd1 = ccddo1.substring(0,2);
		
		var ccppo1 = document.frmMiForm.txtProv1.value;
		var ccpp1 = ccppo1.substring(2,4);

		var ccdio1 = document.frmMiForm.txtDist1.value;
		var ccdi1 = ccdio1.substring(4,2);
		

		if (document.frmMiForm.txtDist1.value == "") {
			alert("Seleccione el Distrito de inscripci\xf3n");
			document.frmMiForm.txtDist1.focus();
			return false;
		}
		
		if (document.frmMiForm.txtApePaterno.value.length < 2) {
			alert("Ingrese Apellido Paterno v\xe1lido");
			document.frmMiForm.txtApePaterno.focus();
			return false;
		}
		if (document.frmMiForm.txtApeMaterno.value == "") {
			alert("Ingrese Apellido Materno");
			document.frmMiForm.txtApeMaterno.focus();
			return false;
		}
		if (document.frmMiForm.txtApeMaterno.value.length < 2) {
			alert("Ingrese Apellido Materno v\xe1lido");
			document.frmMiForm.txtApeMaterno.focus();
			return false;
		}
		if (document.frmMiForm.txtNombre1.value == "") {
			alert("Ingrese Nombre");
			document.frmMiForm.txtNombre1.focus();
			return false;
		}
		if (document.frmMiForm.txtNombre1.value.length < 2) {
			alert("Ingrese Nombre v\xe1lido");
			document.frmMiForm.txtNombre1.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbSexo.value == "") {
			alert("Seleccione su sexo");
			document.frmMiForm.cmbSexo.focus();
			return false;
		}	
		
		oDia = document.getElementById("txtDia");
		oMes = document.getElementById("txtMes");
		oAnio = document.getElementById("txtAnio");
		
		if (oDia.value.length < 2) {
			alert("Ingrese Dia de nacimiento v\xe1lido");
			oDia.focus();
			return false;
		}
		if (oMes.value.length < 2) {
			alert("Ingrese Mes de nacimiento v\xe1lido");
			oMes.focus();
			return false;
		}
		if (oMes.value == "00" || oMes.value > "12") {
			alert("Ingrese Mes de nacimiento v\xe1lido");
			oMes.focus();
			return false;
		}
		if (parseInt(oMes.value) == 1 || parseInt(oMes.value) == 3 || parseInt(oMes.value) == 5 || parseInt(oMes.value) == 7 || parseInt(oMes.value) == 8 || parseInt(oMes.value) == 10 || parseInt(oMes.value) == 12) {
			if (parseInt(oDia.value) > 31) {
				alert("Ingrese Dia de nacimiento v\xe1lido");
				oDia.focus();
				return false;
			}
		}
		if (parseInt(oMes.value) == 4 || parseInt(oMes.value) == 6 || parseInt(oMes.value) == 9 || parseInt(oMes.value) == 11) {
			if (parseInt(oDia.value) > 30) {
				alert("Ingrese Dia de nacimiento v\xe1lido");
				oDia.focus();
				return false;
			}
		}
		if (oAnio.value.length < 4) {
			alert("Ingrese A\xf1o de nacimiento v\xe1lido");
			oAnio.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (anioA - parseInt(oAnio.value) <18) {
			alert("El a\xf1o no corresponde a un mayor de edad");
			oAnio.focus();
			return false;
		}
		if (anioA - parseInt(oAnio.value)>90) {
			alert("Ingrese A&ntilde;o de nacimiento v\xe1lido");
			oAnio.focus();
			return false;
		}
		
		if (parseInt(oMes.value) == 2) {
			if (parseInt(oAnio.value) % 4 == 0) {
				if (parseInt(oDia.value) > 29) {
					alert("Ingrese Dia de nacimiento v\xe1lido");
					oDia.focus();
					return false;
				}
			} else {
				if (parseInt(oDia.value) > 28) {
					alert("Ingrese Dia de nacimiento v\xe1lido");
					oDia.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(oDia.value)) {
			alert("Ingrese Dia de nacimiento v\xe1lido");
			oDia.focus();
			return false;
		}
		if (!validarNumero(oMes.value)) {
			alert("Ingrese Mes de nacimiento v\xe1lido");
			oMes.focus();
			return false;
		}
		if (!validarNumero(oAnio.value)) {
			alert("Ingrese A\xf1o de nacimiento v\xe1lido");
			oAnio.focus();
			return false;
		}	

			
		
		if (document.frmMiForm.cmbpais.value == "0") {
			alert("Seleccione el pais de Nacimiento");
			document.frmMiForm.cmbpais.focus();
			return false;
		}	
		
		
		if (document.frmMiForm.cmbpais.value == "4028") {
			
			if(document.frmMiForm.txtDpto3.value=="0")
			{
				alert("Seleccione el departamento de Nacimiento");
				document.frmMiForm.txtDpto3.focus();
				return false;
				
				}
			if(document.frmMiForm.txtProv3.value=="0")
			{
				alert("Seleccione el provincia de Nacimiento");
				document.frmMiForm.txtProv3.focus();
				return false;
				
				}
				if(document.frmMiForm.txtDist4.value=="0")
			{
				alert("Seleccione el distrito de Nacimiento");
				document.frmMiForm.txtDist4.focus();
				return false;
				
				}
		}	
		
		if (document.frmMiForm.txtDNI.value == "" || document.frmMiForm.txtDNI.value.length < 8) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			document.frmMiForm.txtDNI.focus();
			return false;
		}
		if (!validarNumero(document.frmMiForm.txtDNI.value)) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			document.frmMiForm.txtDNI.focus();
			return false;
		}
		var dni1 = document.getElementById('txtDNI').value;   
   		var dni2 = document.getElementById('txtDNI2').value;  
		if(dni1 != dni2 )
		{
		   alert("Los DNIs no coniciden");	   
		   document.frmMiForm.txtDNI.focus();
			return false;	  
		}   
   		
		if (document.frmMiForm.txtECivil.value == "0") {
			alert("Seleccione estado civil");
			document.frmMiForm.txtECivil.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbLeng.value == "")
			{
			alert("Seleccione Lengua originaria");
			document.frmMiForm.cmbLeng.focus();
			return false;
			}
			
		if (document.frmMiForm.cmbHijoUnico.value == "") {
			
			alert("Seleccione informaci\xf3n sobre si es hijo \xfanico");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (document.frmMiForm.cmbJefeHogar.value == "") {
			alert("Seleccione informaci\xf3n sobre si es jefe de hogar");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (document.frmMiForm.cmbLengMat.value == "") {
			alert("Seleccione informaci\xf3n sobre su cual es la lengua materna que eprendi\xf3 en su ni\xdaez");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}

		if (document.frmMiForm.cmbIdiomaC.value !=0 && document.frmMiForm.cmbNivelIdioma.value =="" ) {
			alert("Seleccione nivel de conocimiento de otro idioma ");
			document.frmMiForm.cmbIdiomaC.focus();
			return false;
		}

		if (document.frmMiForm.cmbIdiomaC.value !=0 && document.frmMiForm.cmbDomIdioma.value =="" ) {
			alert("Seleccione dominio de conocimiento de otro idioma");
			document.frmMiForm.cmbIdiomaC.focus();
			return false;
		}
				
				
				var txtSiDescuento="1"; 
				var txtSIPension="1";

			
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
		
		}

		if (document.frmMiForm.cmbTipovia.value == "") {
			alert("Seleccione tipo de v\xeda");
			document.frmMiForm.cmbTipovia.focus();
			return false;
		}
		if (document.frmMiForm.txtNomVia.value == "") {
			alert("Ingrese el nombre de la v\xeda donde reside");
			document.frmMiForm.txtNomVia.focus();
			return false;
		}	
		
   if (document.frmMiForm.cmbZona.value == "0") {
			alert("Seleccione la Zona de la residencia");
			document.frmMiForm.cmbZona.focus();
			return false;
		}
		
		
		if (document.frmMiForm.txtNomZona.value == "") {
			alert("Ingrese el nombre de la Zona");
			document.frmMiForm.txtNomZona.focus();
			return false;
		}


					var lsNumPuerta = document.frmMiForm.txtNumPuerta.value;
					var lsNumKilometro = document.frmMiForm.txtNumKilometro.value;
					var lsNumManzana = document.frmMiForm.txtNumManzana.value;
					var lsNumInterior = document.frmMiForm.txtNumInterior.value;
					var lsDepa = document.frmMiForm.txtdepa.value;
					var lsNumPiso = document.frmMiForm.txtNumPiso.value;
					var lsNumLote = document.frmMiForm.txtNumLote.value;
					
			if (lsNumPuerta=="" && lsNumKilometro=="" && lsNumManzana=="" && lsNumInterior=="" && lsDepa=="" && lsNumPiso==""  && lsNumLote=="" ){
				
				alert ("Registre datos de residencia (Nro de puerta, kilometro, manzana, interior, lote, etc)")
				document.frmMiForm.txtNumPuerta.focus();
				return false; 
				
				}		

			if (document.frmMiForm.txtDpto2.value == "0") {
				alert("Seleccione departamento de residencia");
				document.frmMiForm.txtDpto2.focus();
				return false;
		}		
		if (document.frmMiForm.txtProv2.value == "" ) {
			alert("Seleccione provincia de residencia");
			document.frmMiForm.txtProv2.focus();
			return false;
		}
		if (document.frmMiForm.txtDist2.value == "0" ) {
			alert("Seleccione distrito de residencia");
			document.frmMiForm.txtDist2.focus();
			return false;
		}		
				
		
		if (parseInt(document.frmMiForm.cmbNivelInstr.value) == 0  ) {
			alert("Seleccione Nivel de Instrucci\xf3n");
			document.frmMiForm.cmbNivelInstr.focus();
			return false;
		}
		
		
			if ((document.frmMiForm.cmbNivelInstr.value=='04' || document.frmMiForm.cmbNivelInstr.value=='05'  ) && document.frmMiForm.txtperioalc.value=='' ) {
			alert("Ingrese el Periodo");
			document.frmMiForm.txtperioalc.focus();
			return false;
		}
		if ((document.frmMiForm.cmbNivelInstr.value=='04' || document.frmMiForm.cmbNivelInstr.value=='05'  ) && document.frmMiForm.cmbPeriodo.value=='0' ) {
			alert("Seleccione el tipo de Periodo");
			document.frmMiForm.cmbPeriodo.focus();
			return false;
		}
		
		
		if (parseInt(document.frmMiForm.cmbNivelInstr.value)>3 && document.frmMiForm.cmbGrado.value=='0' ) {
		alert("Seleccione el Grado Alcanzado");
		document.frmMiForm.cmbGrado.focus();
		return false;
		}
		
		if ((parseInt(document.frmMiForm.cmbGrado.value) >=3 && parseInt(document.frmMiForm.cmbGrado.value) <=6 ) && (document.getElementById("txtNum_reg_grado").value=='') ) {
			alert("Ingrese el registor de Expedici\xf3n del grado");
			document.frmMiForm.txtNum_reg_grado.focus();
			return false;
		}
		
		if ((parseInt(document.frmMiForm.cmbGrado.value) >=3 && parseInt(document.frmMiForm.cmbGrado.value) <=6) && (document.getElementById("txtMes2").value=='' ||  document.getElementById("txtAnio2").value=='') ) {
			alert("Ingresa la fecha de expedici\xf3n del grado alcanzado");
			document.frmMiForm.txtLugEstudios.focus();
			return false;
		}
		
		if (parseInt(document.frmMiForm.cmbGrado.value) >=3 && parseInt(document.frmMiForm.cmbGrado.value) <=6) {
		
		o2Dia = document.getElementById("txtDia2");
		o2Mes = document.getElementById("txtMes2");
		o2Anio = document.getElementById("txtAnio2");
		
		if (o2Dia.value.length < 2) {
			alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
			o2Dia.focus();
			return false;
		}
		if (o2Mes.value.length < 2) {
			alert("Ingrese Mes de expedici\xf3n de grado v\xe1lido");
			o2Mes.focus();
			return false;
		}
		if (o2Mes.value == "00" || o2Mes.value > "12") {
			alert("Ingrese Mes de expedici\xf3n de grado v\xe1lido");
			o2Mes.focus();
			return false;
		}
		if (parseInt(o2Mes.value) == 1 || parseInt(o2Mes.value) == 3 || parseInt(o2Mes.value) == 5 || parseInt(o2Mes.value) == 7 || parseInt(o2Mes.value) == 8 || parseInt(o2Mes.value) == 10 || parseInt(o2Mes.value) == 12) {
			if (parseInt(o2Dia.value) > 31) {
				alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
				o2Dia.focus();
				return false;
			}
		}
		if (parseInt(o2Mes.value) == 4 || parseInt(o2Mes.value) == 6 || parseInt(o2Mes.value) == 9 || parseInt(o2Mes.value) == 11) {
			if (parseInt(o2Dia.value) > 30) {
				alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
				o2Dia.focus();
				return false;
			}
		}
		if (o2Anio.value.length < 4) {
			alert("Ingrese A\xf1o de expedici\xf3n de grado v\xe1lido");
			o2Anio.focus();
			return false;
		}
		
			
		if (parseInt(o2Mes.value) == 2) {
			if (parseInt(o2Anio.value) % 4 == 0) {
				if (parseInt(o2Dia.value) > 29) {
					alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
					o2Dia.focus();
					return false;
				}
			} else {
				if (parseInt(o2Dia.value) > 28) {
					alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
					o2Dia.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(o2Dia.value)) {
			alert("Ingrese Dia de expedici\xf3n de grado v\xe1lido");
			o2Dia.focus();
			return false;
		}
		if (!validarNumero(o2Mes.value)) {
			alert("Ingrese Mes de expedici\xf3n de grado v\xe1lido");
			o2Mes.focus();
			return false;
		}
		if (!validarNumero(o2Anio.value)) {
			alert("Ingrese A\xf1o de expedici\xf3n de grado v\xe1lido");
			o2Anio.focus();
			return false;
		}	
		}
	var id_proyecto=document.frmMiForm.id_proyecto.value;
		if (id_proyecto==42 && (lsIdConvCargo==773 || lsIdConvCargo==774)){
		
			if ( document.getElementById("prof_ednom").value=="0"){
				
				alert ("Seleccione la carrera y/o Profesi\xf3n");
				document.getElementById("prof_ednom").focus();
				return false;
			} else {
				
				if (document.frmMiForm.cmbProfesion.value == "0" && document.getElementById("prof_ednom").value=="3"){
					alert ("Seleccione la otra ocupaci\xf3n y/o Profesi\xf3n");
					document.getElementById("cmbProfesion").focus();
					return false;
				}
				if (document.getElementById("especialidad_ednom").value== "" && document.getElementById("prof_ednom").value=="1"){
					alert ("Anote su especialidad como educador");
					document.getElementById("especialidad_ednom").focus();
					return false;
				}
			}
		} else{
			if (document.frmMiForm.cmbProfesion.value == "0" ) {
				alert("Seleccione la Profesi\xf3n");
				document.frmMiForm.cmbProfesion.focus();
				return false;
			}
		}
		
		if (document.frmMiForm.cmbUniversidad.value == "0" && document.frmMiForm.txtLugEst.value == "" ) {
			alert("Ingrese \xf2 Seleccione la Universidad \xf2 el Centro de Estudios");
			document.frmMiForm.txtLugEst.focus();
			return false;
		}
		
	
		var proyectoVal=document.getElementById("id_proyecto").value;
		
		if (proyectoVal==42 && (lsIdConvCargo==785 || lsIdConvCargo==786)){
		
		if (document.frmMiForm.txtExpAplicacion.value == "" ) {
			alert("Ingrese descripci\xf2n de experiencia en operativo de aplicaci\xf2n");
			document.frmMiForm.txtExpAplicacion.focus();
			return false;
		}
		
		if (document.frmMiForm.txtCargo1.value == "" ) {
			alert("Ingrese descripci\xf2n del \xfaltimo cargo desempe\xf1ado ");
			document.frmMiForm.txtCargo1.focus();
			return false;
		}
		
		
		if (document.frmMiForm.txtEmpCargo1.value == "" ) {
			alert("Ingrese nombre de la empresa/instituci\xf2 de su \xfaltimo cargo desempe\xf1ado");
			document.frmMiForm.txtEmpCargo1.focus();
			return false;
		}
		
		
		if (document.frmMiForm.txttiempoCargo1.value == "" ) {
			alert("Ingrese cantidad en meses de su \xfaltimo cargo desempe\xf1ado");
			document.frmMiForm.txttiempoCargo1.focus();
			return false;
		}
	}
		var lsid_caroQ = document.frmMiForm.id_caroQ.value;
		if 	(document.frmMiForm.txtCurso.value == "" && lsid_caroQ==494){
			alert("Registre \xd3ltima capacitaci\xf3n Profesional")
			return false;
			}
		
		DIcurso= document.getElementById("DIcurso");
		MIcurso = document.getElementById("MIcurso");
		AIcurso = document.getElementById("AIcurso");
		
		DFcurso= document.getElementById("DFcurso");
		MFcurso = document.getElementById("MFcurso");
		AFcurso = document.getElementById("AFcurso");
		
		if ( (DIcurso.value!="" || MIcurso.value!=""  || AIcurso.value!="" || DFcurso.value!=""  || MFcurso.value!=""  || AFcurso.value!="")  && document.frmMiForm.txtCurso.value == ""  ){
			alert("Ingrese correctamente los datos sobre el curso de capacitaci\xf3n ");
			document.getElementById("txtCurso").focus();
			return false;
			}
		
		if ( (DIcurso.value!="" || MIcurso.value!=""  || AIcurso.value!="" || DFcurso.value!=""  || MFcurso.value!=""  || AFcurso.value!="")  && document.frmMiForm.txtlugar_capacitacion.value == ""  ){
			alert("Ingrese correctamente el lugar donde realiz\xf3 su capacitaci\xf3n ");
			document.getElementById("txtlugar_capacitacion").focus();
			return false;
			}	
		
		if (document.frmMiForm.txtCurso.value == "" ) {
		} else {

		DIcurso= document.getElementById("DIcurso");
		MIcurso = document.getElementById("MIcurso");
		AIcurso = document.getElementById("AIcurso");
		
		DFcurso= document.getElementById("DFcurso");
		MFcurso = document.getElementById("MFcurso");
		AFcurso = document.getElementById("AFcurso");
		
		if (DIcurso.value.length < 2) {
			alert("Ingrese Dia de inicio de curso v\xe1lido");
			DIcurso.focus();
			return false;
		}
		if (MIcurso.value.length < 2) {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (MIcurso.value == "00" || MIcurso.value > "12") {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (parseInt(MIcurso.value) == 1 || parseInt(MIcurso.value) == 3 || parseInt(MIcurso.value) == 5 || parseInt(MIcurso.value) == 7 || parseInt(MIcurso.value) == 8 || parseInt(MIcurso.value) == 10 || parseInt(MIcurso.value) == 12) {
			if (parseInt(DIcurso.value) > 31) {
				alert("Ingrese Dia de inicio de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (parseInt(MIcurso.value) == 4 || parseInt(MIcurso.value) == 6 || parseInt(MIcurso.value) == 9 || parseInt(MIcurso.value) == 11) {
			if (parseInt(DIcurso.value) > 30) {
				alert("Ingrese Dia de inicio de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (AIcurso.value.length < 4) {
			alert("Ingrese A\xf1o de inicio de curso v\xe1lido");
			AIcurso.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (parseInt(MIcurso.value) == 2) {
			if (parseInt(AIcurso.value) % 4 == 0) {
				if (parseInt(DIcurso.value) > 29) {
					alert("Ingrese Dia de inicio de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			} else {
				if (parseInt(DIcurso.value) > 28) {
					alert("Ingrese Dia de inicio de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DIcurso.value)) {
			alert("Ingrese Dia de inicio de curso v\xe1lido");
			DIcurso.focus();
			return false;
		}
		if (!validarNumero(MIcurso.value)) {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (!validarNumero(AIcurso.value)) {
			alert("Ingrese A\xf1o de inicio de curso v\xe1lido");
			AIcurso.focus();
			return false;
		}	
		
		if (DFcurso.value.length < 2) {
			alert("Ingrese dia de fin de curso v\xe1lido");
			DFcurso.focus();
			return false;
		}
		if (MFcurso.value.length < 2) {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (MFcurso.value == "00" || MFcurso.value > "12") {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (parseInt(MFcurso.value) == 1 || parseInt(MFcurso.value) == 3 || parseInt(MFcurso.value) == 5 || parseInt(MFcurso.value) == 7 || parseInt(MFcurso.value) == 8 || parseInt(MFcurso.value) == 10 || parseInt(MFcurso.value) == 12) {
			if (parseInt(DFcurso.value) > 31) {
				alert("Ingrese dia de fin de curso v\xe1lido");
				DFcurso.focus();
				return false;
			}
		}
		if (parseInt(MFcurso.value) == 4 || parseInt(MFcurso.value) == 6 || parseInt(MFcurso.value) == 9 || parseInt(MFcurso.value) == 11) {
			if (parseInt(DFcurso.value) > 30) {
				alert("Ingrese Dia de fin de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (AFcurso.value.length < 4) {
			alert("Ingrese A\xf1o de fin de curso v\xe1lido");
			AFcurso.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(MFcurso.value) == 2) {
			if (parseInt(AFcurso.value) % 4 == 0) {
				if (parseInt(DFcurso.value) > 29) {
					alert("Ingrese Dia de fin de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			} else {
				if (parseInt(DFcurso.value) > 28) {
					alert("Ingrese Dia de fin de curso v\xe1lido");
					DFcurso.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DFcurso.value)) {
			alert("Ingrese Dia de fin de curso v\xe1lido");
			DFcurso.focus();
			return false;
		}
		if (!validarNumero(MFcurso.value)) {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (!validarNumero(AFcurso.value)) {
			alert("Ingrese A\xf1o de fin de curso v\xe1lido");
			AFcurso.focus();
			return false;
		}
		
		if (document.frmMiForm.txtHorasLectivas.value == "") {
			alert("Registre horas lectivas del curso");
			document.frmMiForm.txtHorasLectivas.focus();
			return false;
		}
		
	}

	if (document.frmMiForm.txtCursoOf.value == "" ){
		alert('Registre curso de Office realizado')
		document.frmMiForm.txtCursoOf.focus();
		return false;
		}

	if (document.frmMiForm.txtCursoOf.value == "" ) {
		} else {

		DIcurso= document.getElementById("DIcursoOf");
		MIcurso = document.getElementById("MIcursoOf");
		AIcurso = document.getElementById("AIcursoOf");
		
		DFcurso= document.getElementById("DFcursoOf");
		MFcurso = document.getElementById("MFcursoOf");
		AFcurso = document.getElementById("AFcursoOf");
		
		if (DIcurso.value.length < 2) {
			alert("Ingrese Dia de inicio de curso v\xe1lido");
			DIcurso.focus();
			return false;
		}
		if (MIcurso.value.length < 2) {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (MIcurso.value == "00" || MIcurso.value > "12") {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (parseInt(MIcurso.value) == 1 || parseInt(MIcurso.value) == 3 || parseInt(MIcurso.value) == 5 || parseInt(MIcurso.value) == 7 || parseInt(MIcurso.value) == 8 || parseInt(MIcurso.value) == 10 || parseInt(MIcurso.value) == 12) {
			if (parseInt(DIcurso.value) > 31) {
				alert("Ingrese Dia de inicio de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (parseInt(MIcurso.value) == 4 || parseInt(MIcurso.value) == 6 || parseInt(MIcurso.value) == 9 || parseInt(MIcurso.value) == 11) {
			if (parseInt(DIcurso.value) > 30) {
				alert("Ingrese Dia de inicio de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (AIcurso.value.length < 4) {
			alert("Ingrese A\xf1o de inicio de curso v\xe1lido");
			AIcurso.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 
		
		if (parseInt(MIcurso.value) == 2) {
			if (parseInt(AIcurso.value) % 4 == 0) {
				if (parseInt(DIcurso.value) > 29) {
					alert("Ingrese Dia de inicio de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			} else {
				if (parseInt(DIcurso.value) > 28) {
					alert("Ingrese Dia de inicio de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DIcurso.value)) {
			alert("Ingrese Dia de inicio de curso v\xe1lido");
			DIcurso.focus();
			return false;
		}
		if (!validarNumero(MIcurso.value)) {
			alert("Ingrese Mes de inicio de curso v\xe1lido");
			MIcurso.focus();
			return false;
		}
		if (!validarNumero(AIcurso.value)) {
			alert("Ingrese A\xf1o de inicio de curso v\xe1lido");
			AIcurso.focus();
			return false;
		}	
		
		if (DFcurso.value.length < 2) {
			alert("Ingrese dia de fin de curso v\xe1lido");
			DFcurso.focus();
			return false;
		}
		if (MFcurso.value.length < 2) {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (MFcurso.value == "00" || MFcurso.value > "12") {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (parseInt(MFcurso.value) == 1 || parseInt(MFcurso.value) == 3 || parseInt(MFcurso.value) == 5 || parseInt(MFcurso.value) == 7 || parseInt(MFcurso.value) == 8 || parseInt(MFcurso.value) == 10 || parseInt(MFcurso.value) == 12) {
			if (parseInt(DFcurso.value) > 31) {
				alert("Ingrese dia de fin de curso v\xe1lido");
				DFcurso.focus();
				return false;
			}
		}
		if (parseInt(MFcurso.value) == 4 || parseInt(MFcurso.value) == 6 || parseInt(MFcurso.value) == 9 || parseInt(MFcurso.value) == 11) {
			if (parseInt(DFcurso.value) > 30) {
				alert("Ingrese Dia de fin de curso v\xe1lido");
				DIcurso.focus();
				return false;
			}
		}
		if (AFcurso.value.length < 4) {
			alert("Ingrese A\xf1o de fin de curso v\xe1lido");
			AFcurso.focus();
			return false;
		}
		
		var fecha_actual = new Date();   
		var anioA = fecha_actual.getFullYear(); 

		
		if (parseInt(MFcurso.value) == 2) {
			if (parseInt(AFcurso.value) % 4 == 0) {
				if (parseInt(DFcurso.value) > 29) {
					alert("Ingrese Dia de fin de curso v\xe1lido");
					DIcurso.focus();
					return false;
				}
			} else {
				if (parseInt(DFcurso.value) > 28) {
					alert("Ingrese Dia de fin de curso v\xe1lido");
					DFcurso.focus();
					return false;
				}
			}
		}
		
		if (!validarNumero(DFcurso.value)) {
			alert("Ingrese Dia de fin de curso v\xe1lido");
			DFcurso.focus();
			return false;
		}
		if (!validarNumero(MFcurso.value)) {
			alert("Ingrese Mes de fin de curso v\xe1lido");
			MFcurso.focus();
			return false;
		}
		if (!validarNumero(AFcurso.value)) {
			alert("Ingrese A\xf1o de fin de curso v\xe1lido");
			AFcurso.focus();
			return false;
		}
		
		if (document.frmMiForm.txtHorasLectivasOf.value == "") {
			alert("Registre horas lectivas del curso");
			document.frmMiForm.txtHorasLectivasOf.focus();
			return false;
		}
		
	}
	

		if (document.frmMiForm.cmbdisposicion.value == "") {
			alert("Seleccione veracidad de datos");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}if (document.frmMiForm.cmbdisposicion.value == 2) {
			alert("Debe contar con disponibilidad a tiempo completo");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}
		
		
		if (document.frmMiForm.cmbdisposicion.value == "0") {
			alert("Seleccione la Disposici\xf3n de tiempo");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}
		if (document.frmMiForm.cmbVeracidad.value == "2") {
			alert("Seleccione SI en veracidad de datos");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		
		if (document.frmMiForm.cmbVeracidad.value == "") {
			alert("Seleccione veracidad de datos");
			document.frmMiForm.cmbVeracidad.focus();
			return false;
		}	
		

*/
		document.getElementById("txtOper").value=operacion;
		
	}
	
					var lsIdConvCargo=document.frmMiForm.id_cc.value;
					var lsIdProyecto=document.frmMiForm.id_proyecto.value;
					var ccddo1 = document.frmMiForm.txtDpto1.value;
					var ccdd1 = ccddo1.substring(0,2);
					var ccppo1 = document.frmMiForm.txtProv1.value;
					var ccpp1 = ccppo1.substring(2,4);
					var ccdio1 = document.frmMiForm.txtDist1.value;
					var ccdi1 = ccdio1.substring(4);
					var lsApePaterno=document.frmMiForm.txtApePaterno.value;
					var lsApeMaterno=document.frmMiForm.txtApeMaterno.value;
					var lsNombre1=document.frmMiForm.txtNombre1.value;
					var lsNombre2=document.frmMiForm.txtNombre2.value;
					var lsSexo=document.frmMiForm.cmbSexo.value;
					var oDia = document.getElementById("txtDia").value;
					var oMes = document.getElementById("txtMes").value;
					var oAnio = document.getElementById("txtAnio").value;
					var fecha_actual = new Date();   
					var anioA = fecha_actual.getFullYear(); 
					var lsFecNac = oDia +'/'+ oMes+'/'+oAnio;
					var lsEdad = anioA -oAnio;
					var lspais=document.frmMiForm.cmbpais.value;
					var lsDptoNc =document.frmMiForm.txtDpto3.value;
					var lsProvNc =document.frmMiForm.txtProv3.value;
					var lsDistNc = document.getElementById("txtDist4").value;
					var lsDNI = document.frmMiForm.txtDNI.value;
					var lsRUC = document.frmMiForm.txtRUC.value;	
					var lsECivil = document.frmMiForm.txtECivil.value;
					var lsCmbLen = 	document.frmMiForm.cmbLeng.value;
					var lsTelefono = document.frmMiForm.txtTelefono.value;
					var lsCelular = document.frmMiForm.txtCelular.value;
					var lsOperCel =	document.frmMiForm.cmbOperTel.value;
					var lsEmail = document.frmMiForm.txtEmail.value;
					var lsTipoVia = document.frmMiForm.cmbTipovia.value;
					var lsNomVia = document.frmMiForm.txtNomVia.value;
					var lsNumPuerta = document.frmMiForm.txtNumPuerta.value;
					var lsNumKilometro = document.frmMiForm.txtNumKilometro.value;
					var lsNumManzana = document.frmMiForm.txtNumManzana.value;
					var lsNumInterior = document.frmMiForm.txtNumInterior.value;
					var lsDepa = document.frmMiForm.txtdepa.value;
					var lsNumPiso = document.frmMiForm.txtNumPiso.value;
					var lsNumLote = document.frmMiForm.txtNumLote.value;
					var lsTipoZona = document.frmMiForm.cmbZona.value;
					var lsNomZona = document.frmMiForm.txtNomZona.value;
					var lsDptoR = document.frmMiForm.txtDpto2.value;
					var lsProvR = document.frmMiForm.txtProv2.value;
					var lsDistR = document.frmMiForm.txtDist2.value;
					var lsNivInst = document.frmMiForm.cmbNivelInstr.value;
					var lsTipEst = document.frmMiForm.cmbTipoEstudios.value;
					var lsGrado = document.frmMiForm.cmbGrado.value;
					var oDia2 = document.getElementById("txtDia2").value;
					var oMes2 = document.getElementById("txtMes2").value;
					var oAnio2 = document.getElementById("txtAnio2").value;
					if (oAnio2!='' &&  oMes2!='' && oDia2!='') 
						var lsfec_exp= oDia2 +'/'+ oMes2 +'/'+ oAnio2
					 else 
						var lsfec_exp='';
					var lsperioAlc = document.frmMiForm.txtperioalc.value;
					var lsTiPerAlc = document.frmMiForm.cmbPeriodo.value;
					var lsprofesion = document.frmMiForm.cmbProfesion.value;
					var lsUniv = document.frmMiForm.cmbUniversidad.value;
					var lsLugEst = document.frmMiForm.txtLugEst.value;
					var lsExpGen_anio = document.frmMiForm.txtExpGenAnio.value;
					var lsExpGen_meses = document.frmMiForm.txtExpGenMeses.value;
					var lsExpCampoanio = document.frmMiForm.txtExpCampoAnio.value;
					var lsExpCampomeses = document.frmMiForm.txtExpCampoMeses.value;
					var lsExpGrupoanio = document.frmMiForm.txtExpGrupoAnio.value;
					var lsExpGrupomeses = document.frmMiForm.txtExpGrupoMeses.value;
					var lsCapsanio = document.frmMiForm.txtCapaAnio.value;
					var lsCapameses = document.frmMiForm.txtCapaMeses.value;
					var lsDocanio = document.frmMiForm.txtDocAnio2.value;
					var lsDocmeses = document.frmMiForm.txtCapaAnio2.value;
					var lsIneiProc = document.frmMiForm.txtIneiProc.value;
					var lsProyecto = document.frmMiForm.txtProyecto.value;
					var lsIneiAnio = document.frmMiForm.txtIneiAnio.value;
					var lsCargoInei = document.frmMiForm.txtCargoInei.value;
					var lsDisposicion = document.frmMiForm.cmbdisposicion.value
					var lsVeracidad = document.frmMiForm.cmbVeracidad.value;
					var lsCargo = document.frmMiForm.cmbCargo.value;
					var lsmeta = document.frmMiForm.meta.value;
					var lsIdiomaQ = document.frmMiForm.cmbIdiomaQ.value;
					var lsdispoSabDom = document.frmMiForm.cmbdispoSabDom.value;
					var lsCompromiso = document.frmMiForm.cmbdCompromiso.value;
					var lsid_caroQ = document.frmMiForm.id_caroQ.value;
					var lsHijoUnico= document.frmMiForm.cmbHijoUnico.value; 
					var lsJEfeHogar = document.frmMiForm.cmbJefeHogar.value;
					var lsLEnguaMAt= document.frmMiForm.cmbLengMat.value;
					
					var lsCurso= document.frmMiForm.txtCurso.value;
					
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
					
					var txtSiDescuento=0;/*document.getElementById("txtSiDescuento").value;*/
					
					var txtSIPension=0;///*document.getElementById("txtSIPension").value;*/
					
						var txtSiDescuento=0;///document.getElementById("txtSiDescuento").value;
						var txtTipoPension=0;///document.getElementById("txtTipoPension").value;
						var txtAFP=0;///document.getElementById("txtAFP").value;
						var txtFCUSSP=0;///document.getElementById("txtFCUSSP").value;
						var txtPo_TipoPension=0;///document.getElementById("txtPo_TipoPension").value;
						var txtFecAfiliacion='';//document.getElementById("txtFecAfiliacion").value;
						var txtComision=0;///document.getElementById("txtComision").value;
						if (txtPo_TipoPension=="AFP") {
							var txtPo_AFP="10";
							} else {
								var txtPo_AFP="";
								}
					
					var txtExpCampoInst ='';//document.getElementById("txtExpCampoInst").value;
					var txtExpCampoFef ='';//document.getElementById("txtExpCampoFef").value;
					var txtExpGrupoInst ='';//document.getElementById("txtExpGrupoInst").value;
					var txtExpGrupoFec ='';//document.getElementById("txtExpGrupoFec").value;
					var txtExpGenInst ='';//document.getElementById("txtExpGenInst").value;
					var txtExpGenFec ='';//document.getElementById("txtExpGenFec").value;
					var txtExpProcesos ='';//document.getElementById("txtExpProcesos").value;
					var txtCargoAplicacion ='';//document.getElementById("txtCargoAplicacion").value;
					var txtNombreProcesos ='';//document.getElementById("txtNombreProcesos").value;
					var txtCargoProcesos ='';//document.getElementById("txtCargoProcesos").value;
					var txtCargoFormacion ='';//document.getElementById("txtCargoFormacion").value;
					var txtTiempoProcesos ='';//document.getElementById("txtTiempoProcesos").value;
					var txtTiempoApli ='';//document.getElementById("txtTiempoApli").value;
					var txtCargoProc ='';//document.getElementById("txtCargoProc").value;
					var txtTiempoFor ='';//document.getElementById("txtTiempoFor").value;
					var txtCursoOf ='';//document.getElementById("txtCursoOf").value;
					var txtlugar_capacitacionOf ='';//document.getElementById("txtlugar_capacitacionOf").value;
					var DIcursoOf = '';//document.getElementById("DIcursoOf").value;
					var MIcursoOf = '';//document.getElementById("MIcursoOf").value;
					var AIcursoOf = '';//document.getElementById("AIcursoOf").value;
					if (AIcursoOf!='' &&  MIcursoOf!='' && DIcursoOf!='') 
						var lsfec_IOf= DIcursoOf +'/'+ MIcursoOf +'/'+ AIcursoOf
					 else 
						var lsfec_IOf='';
					var DFcursoOf = '';//document.getElementById("DFcursoOf").value;
					var MFcursoOf = '';//document.getElementById("MFcursoOf").value;
					var AIcursoOf = '';//document.getElementById("AIcursoOf").value;
					if (DFcursoOf!='' &&  MFcursoOf!='' && AIcursoOf!='') 
						var lsfec_FOf= DFcursoOf +'/'+ MFcursoOf +'/'+ AIcursoOf
					 else 
						var lsfec_FOf='';
					var txtHorasLectivasOf ='';//document.getElementById("txtHorasLectivasOf").value;
					var txtTiempoHL ='';//document.getElementById("txtTiempoHL").value;
					var txtTiempoOf ='';//document.getElementById("txtTiempoOf").value;
					var preg1 ='';//document.getElementById("preg1").value;
					var preg2 ='';//document.getElementById("preg2").value;
					var preg3 ='';//document.getElementById("preg3").value;
					var preg4='';//document.getElementById("preg4").value;
					var preg5='';//document.getElementById("preg5").value;
					var preg6 ='';//document.getElementById("preg6").value;
					var preg7 ='';//document.getElementById("preg7").value;
					var preg8 ='';//document.getElementById("preg8").value;
					var preg9 ='';//document.getElementById("preg9").value;
					var preg10='';//document.getElementById("preg10").value;
					var preg11 ='';//document.getElementById("preg11").value;
					var preg12 ='';//document.getElementById("preg12").value;
					var preg13 ='';//document.getElementById("preg13").value;
					
var flag_rnp= '0';
if  ( document.getElementById("txtRnP").checked  ) 
{
	flag_rnp = '1';
	}
						//var flag_rnp = document.getElementById("txtRnP").value;
							var fechainirnp = document.getElementById("txtfechainirnp").value;
								var fechafinrnp = document.getElementById("txtfechafinrnp").value;
								
					/*if (lsid_caroQ==491 || lsid_caroQ==495 || lsid_caroQ==493 ||lsid_caroQ==494 || lsid_caroQ==489|| lsid_caroQ==492|| lsid_caroQ==490) {
						if (txtCargo1==""){
							alert("Registre el \xfaltimo cargo desempeñado");
							document.getElementById("txtCargo1").focus();
							return false;
							}
						if (txtEmpCargo1==""){
							alert("Registre el nombre de la empresa del \xfaltimo cargo desempeñado");
							document.getElementById("txtEmpCargo1").focus();
							return false;
							}
						if (txttiempoCargo1==""){
							alert("Registre el tiempo de desempeño en el \xfaltimo cargo");
							document.getElementById("txttiempoCargo1").focus();
							return false;
							}
					}
					if (lsid_caroQ==491 || lsid_caroQ==495 || lsid_caroQ==493 || lsid_caroQ==489|| lsid_caroQ==492|| lsid_caroQ==490) {	
						if (txtCargo2==""){
							alert("Registre el penultimo cargo desempeñado");
							document.getElementById("txtCargo2").focus();
							return false;
							}
						if (txtEmpCargo2==""){
							alert("Registre el nombre de la empresa del penultimo cargo desempeñado");
							document.getElementById("txtEmpCargo2").focus();
							return false;
							}
						if (txttiempoCargo2==""){
							alert("Registre el tiempo de desempeño en el penultimo cargo");
							document.getElementById("txttiempoCargo2").focus();
							return false;
							}
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
					
					
					if (lsid_caroQ==491 || lsid_caroQ==495 || lsid_caroQ==493 || lsid_caroQ==494) {
						if (txtExpAplicacion==""){
							alert("Registre el Nombre de la \xfaltima Experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo");
							document.getElementById("txtExpAplicacion").focus();
							return false;
							}
						if (txtNombreAplicacion==""){
							alert("Registre el nombre de la Instituci\xf3n de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo");
							document.getElementById("txtNombreAplicacion").focus();
							return false;
							}
						if (txtCargoAplicacion==""){
							alert("Registre el cargo de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo");
							document.getElementById("txtCargoAplicacion").focus();
							return false;
							}
						if (txtTiempoAplicacion==""){
							alert("Registre el tiempo de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo");
							document.getElementById("txtTiempoAplicacion").focus();
							return false;
							}
						if (txtTiempoApli==""){
							alert("Seleccione la descripci\xf3n del tiempo de la experiencia en operativo de Aplicaci\xf3n de Instrumentos en campo");
							document.getElementById("txtTiempoApli").focus();
							return false;
							}
							
						if (txtExpProcesos==""){
							alert("Registre el Nombre de la \xfaltima Experiencia en procesos de operaciones de aplicaci\xf3nn de instrumentos en campo");
							document.getElementById("txtExpProcesos").focus();
							return false;
							}
						if (txtNombreProcesos==""){
							alert("Registre el nombre de la Instituci\xf3n de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo");
							document.getElementById("txtNombreProcesos").focus();
							return false;
							}
						if (txtCargoProcesos==""){
							alert("Registre el cargo de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo");
							document.getElementById("txtCargoProcesos").focus();
							return false;
							}
						if (txtTiempoProcesos==""){
							alert("Registre el tiempo de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo");
							document.getElementById("txtTiempoProcesos").focus();
							return false;
							}
						if (txtCargoProc==""){
							alert("Seleccione la descripci\xf3n del tiempo de la experiencia en procesos de operaciones de Aplicaci\xf3n de Instrumentos en campo");
							document.getElementById("txtCargoProc").focus();
							return false;
							}	
					}
					
					if (lsid_caroQ==999 || lsid_caroQ==999) { //aplicador y orientador (falta IDs)
						if (txtExpFormacion==""){
							alert("Registre el Nombre de la \xfaltima experiencia en aula o proyectos de Formaci\xf3n");
							document.getElementById("txtExpFormacion").focus();
							return false;
							}
						if (txtNombreFormacion==""){
							alert("Registre el nombre de la Instituci\xf3n de la experiencia en aula o proyectos de Formaci\xf3n");
							document.getElementById("txtNombreFormacion").focus();
							return false;
							}
						if (txtCargoFormacion==""){
							alert("Registre el cargo de la experiencia en aula o proyectos de Formaci\xf3n");
							document.getElementById("txtCargoFormacion").focus();
							return false;
							}
						if (txtTiempoFormacion==""){
							alert("Registre el tiempo de la experiencia en aula o proyectos de Formaci\xf3n");
							document.getElementById("txtTiempoFormacion").focus();
							return false;
							}
						if (txtTiempoFor==""){
							alert("Seleccione la descripci\xf3n del tiempo de la experiencia en aula o proyectos de Formaci\xf3n");
							document.getElementById("txtTiempoFor").focus();
							return false;
							}
					}
					
					
					if (preg1==0){
						alert("Registre si tiene impedimento de contratar con el estado")
						document.getElementById("preg1").focus();
						return false;
						}
					if (preg2==0){
						alert("Registre si tiene antecedentes sobre sanci\xf3n por falta administrativa")
						document.getElementById("preg2").focus();
						return false;
						}
					if (preg3==0){
						alert("Registre si tiene familiares hasta el 4to grado de consanguinidad 2do de afinidad con facultad de nombrar, designar en nuestra instituci\xf3n")
						document.getElementById("preg3").focus();
						return false;
						}
					if (preg4==0){
						alert("Registre si acepta solo postular en esta convocatoria")
						document.getElementById("preg4").focus();
						return false;
						}
							
					if (preg10==0 && (lsid_caroQ!=496 && lsid_caroQ!=492 && lsid_caroQ!=490)){
						alert("Registre si es docente con aula a cargo en IE estatales")
						document.getElementById("preg10").focus();
						return false;
						}
					if (preg11==0){
						alert("Registre si tiene disposici\xf3n exclusiva y a tiempo completo durante las fases del Operativo de campo")
						document.getElementById("preg11").focus();
						return false;
						}
					if (preg12==0){
						alert("Registre si acepta la obligatoriedad de asistir a las sesiones de capacitaci\xf3n")
						document.getElementById("preg12").focus();
						return false;
						}
					if (preg13==0){
						alert("Registre si es residente en la sede que le corresponde (Est\xe1 postulando)")
						document.getElementById("preg13").focus();
						return false;
						}*/
											
			guardar_Inscripcion_edAct (2,lsIdConvCargo,ccdd1,ccpp1,ccdi1,lsApePaterno,lsApeMaterno,lsNombre1,lsNombre2,lsSexo,lsFecNac,lsEdad ,lspais,lsDptoNc ,lsProvNc ,lsDistNc ,lsDNI ,lsRUC,lsECivil,lsCmbLen,lsTelefono,lsCelular,lsOperCel,lsEmail,lsTipoVia ,lsNomVia,lsNumPuerta ,lsNumKilometro,lsNumManzana,lsNumInterior,lsDepa ,lsNumPiso  ,lsNumLote ,lsTipoZona,lsNomZona ,lsDptoR, lsProvR ,lsDistR ,lsNivInst,lsTipEst,lsGrado ,lsfec_exp,lsperioAlc,lsTiPerAlc, lsprofesion,lsUniv, lsLugEst,lsExpGen_anio,lsExpGen_meses,lsExpCampoanio,lsExpCampomeses,lsExpGrupoanio,lsExpGrupomeses,lsCapsanio,lsCapameses ,lsDocanio ,lsDocmeses,lsIneiProc,lsProyecto,lsIneiAnio  ,lsCargoInei ,lsDisposicion ,lsVeracidad ,lsCargo ,lsmeta,lsIdProyecto,lsid_caroQ,lsHijoUnico,lsJEfeHogar,lsLEnguaMAt,lsCurso,lsfec_Icap,lsfec_Fcap, lsHorasLectivas,lsFecDatoCom, operacion, txtNum_reg_grado,txtlugar_capacitacion,txtExpAplicacion,txtNombreAplicacion,txtTiempoAplicacion,txtExpFormacion,txtNombreFormacion,txtTiempoFormacion,txtCargo1,txtEmpCargo1,txttiempoCargo1,txtCargo2,txtEmpCargo2,txttiempoCargo2, cmbIdiomaC,cmbNivelIdioma,cmbDomIdioma,txtSiDescuento,txtSIPension,txtTipoPension,txtAFP,txtFCUSSP,txtPo_AFP,txtPo_TipoPension, txtFecAfiliacion, txtComision,txtExpCampoInst,txtExpCampoFef,txtExpGrupoInst,txtExpGrupoFec,txtExpGenInst,txtExpGenFec,txtExpProcesos,txtCargoAplicacion,txtNombreProcesos,txtCargoProcesos,txtCargoFormacion,txtTiempoProcesos,txtTiempoApli,txtCargoProc,txtTiempoFor,txtCursoOf ,txtlugar_capacitacionOf ,lsfec_IOf,lsfec_FOf ,txtHorasLectivasOf ,txtTiempoHL ,txtTiempoOf ,preg1 ,preg2 ,preg3 ,preg4,preg5,preg6 ,preg7 ,preg8 ,preg9 ,preg10,preg11 ,preg12 ,preg13,flag_rnp , fechainirnp , fechafinrnp  ); 
   		} 
	
}


	function guardar_Inscripcion_edAct (valor,lsIdConvCargo,ccdd1,ccpp1,ccdi1,lsApePaterno,lsApeMaterno,lsNombre1,lsNombre2,lsSexo,lsFecNac,lsEdad ,lspais,lsDptoNc ,lsProvNc ,lsDistNc ,lsDNI ,lsRUC,lsECivil,lsCmbLen,lsTelefono,lsCelular,lsOperCel,lsEmail,lsTipoVia ,lsNomVia,lsNumPuerta ,lsNumKilometro,lsNumManzana,lsNumInterior,lsDepa ,lsNumPiso  ,lsNumLote ,lsTipoZona,lsNomZona ,lsDptoR, lsProvR ,lsDistR ,lsNivInst,lsTipEst,lsGrado ,lsfec_exp,lsperioAlc,lsTiPerAlc, lsprofesion,lsUniv, lsLugEst,lsExpGen_anio,lsExpGen_meses,lsExpCampoanio,lsExpCampomeses,lsExpGrupoanio,lsExpGrupomeses,lsCapsanio,lsCapameses ,lsDocanio ,lsDocmeses,lsIneiProc,lsProyecto,lsIneiAnio  ,lsCargoInei ,lsDisposicion ,lsVeracidad ,lsCargo ,lsmeta,lsIdProyecto,lsid_caroQ,lsHijoUnico,lsJEfeHogar,lsLEnguaMAt,lsCurso,lsfec_Icap,lsfec_Fcap, lsHorasLectivas, lsFecDatoCom,operacion,txtNum_reg_grado,txtlugar_capacitacion,txtExpAplicacion,txtNombreAplicacion,txtTiempoAplicacion,txtExpFormacion,txtNombreFormacion,txtTiempoFormacion,txtCargo1,txtEmpCargo1,txttiempoCargo1,txtCargo2,txtEmpCargo2,txttiempoCargo2,cmbIdiomaC,cmbNivelIdioma,cmbDomIdioma,txtSiDescuento,txtSIPension,txtTipoPension,txtAFP,txtFCUSSP,txtPo_AFP,txtPo_TipoPension, txtFecAfiliacion, txtComision,txtExpCampoInst,txtExpCampoFef,txtExpGrupoInst,txtExpGrupoFec,txtExpGenInst,txtExpGenFec,txtExpProcesos,txtCargoAplicacion,txtNombreProcesos,txtCargoProcesos,txtCargoFormacion,txtTiempoProcesos,txtTiempoApli,txtCargoProc,txtTiempoFor,txtCursoOf ,txtlugar_capacitacionOf ,lsfec_IOf,lsfec_FOf ,txtHorasLectivasOf ,txtTiempoHL ,txtTiempoOf ,preg1 ,preg2 ,preg3 ,preg4,preg5,preg6 ,preg7 ,preg8 ,preg9 ,preg10,preg11 ,preg12 ,preg13,flag_rnp , fechainirnp , fechafinrnp ){
	
					ajax=http_request();
					var valores;	
					valores= "lsIdConvCargo="+escape(lsIdConvCargo)+ "&ccdd1="+escape(ccdd1)+ "&ccpp1="+escape(ccpp1)+ "&ccdi1="+escape(ccdi1)+ "&lsApePaterno="+escape(lsApePaterno)+ "&lsApeMaterno="+escape(lsApeMaterno)+ "&lsNombre1="+escape(lsNombre1)+ "&lsNombre2="+escape(lsNombre2)+ "&lsSexo="+escape(lsSexo)+ "&lsFecNac ="+escape(lsFecNac)+ "&lsEdad ="+escape(lsEdad)+ "&lspais="+escape(lspais)+ "&lsDptoNc ="+escape(lsDptoNc)+ "&lsProvNc ="+escape(lsProvNc)+ "&lsDistNc ="+escape(lsDistNc)+ "&lsDNI ="+escape(lsDNI)+ "&lsRUC="+escape(lsRUC)+ "&lsECivil="+escape(lsECivil)+ "&lsCmbLen="+escape(lsCmbLen)+ "&lsTelefono="+escape(lsTelefono)+ "&lsCelular="+escape(lsCelular)+ "&lsOperCel="+escape(lsOperCel)+ "&lsEmail="+escape(lsEmail)+ "&lsTipoVia ="+escape(lsTipoVia)+ "&lsNomVia="+escape(lsNomVia)+ "&lsNumPuerta ="+escape(lsNumPuerta)+ "&lsNumKilometro="+escape(lsNumKilometro)+ "&lsNumManzana="+escape(lsNumManzana)+ "&lsNumInterior="+escape(lsNumInterior)+ "&lsDepa ="+escape(lsDepa)+ "&lsNumPiso ="+escape(lsNumPiso)+ "&lsNumLote ="+escape(lsNumLote)+ "&lsTipoZona="+escape(lsTipoZona)+ "&lsNomZona ="+escape(lsNomZona)+ "&lsDptoR ="+escape(lsDptoR)+ "&lsProvR ="+escape(lsProvR)+ "&lsDistR ="+escape(lsDistR)+ "&lsNivInst="+escape(lsNivInst)+ "&lsTipEst="+escape(lsTipEst)+ "&lsGrado ="+escape(lsGrado)+ "&lsfec_exp="+escape(lsfec_exp)+ "&lsperioAlc ="+escape(lsperioAlc)+ "&lsTiPerAlc="+escape(lsTiPerAlc)+ "&lsprofesion="+escape(lsprofesion)+ "&lsUniv="+escape(lsUniv)+"&lsLugEst="+escape(lsLugEst)+"&lsExpGen_anio="+escape(lsExpGen_anio)+"&lsExpGen_meses="+escape(lsExpGen_meses)+"&lsExpCampoanio="+escape(lsExpCampoanio)+ "&lsExpCampomeses="+escape(lsExpCampomeses)+ "&lsExpGrupoanio="+escape(lsExpGrupoanio)+ "&lsExpGrupomeses="+escape(lsExpGrupomeses)+ "&lsCapsanio="+escape(lsCapsanio)+ "&lsCapameses ="+escape(lsCapameses)+ "&lsDocanio ="+escape(lsDocanio)+ "&lsDocmeses="+escape(lsDocmeses)+ "&lsIneiProc="+escape(lsIneiProc)+ "&lsProyecto="+escape(lsProyecto)+ "&lsIneiAnio ="+escape(lsIneiAnio)+ "&lsCargoInei="+escape(lsCargoInei)+ "&lsDisposicion="+escape(lsDisposicion)+ "&lsVeracidad="+escape(lsVeracidad)+ "&lsCargo="+escape(lsCargo)+ "&lsmeta="+escape(lsmeta)+ "&lsIdProyecto="+escape(lsIdProyecto)+ "&lsid_caroQ="+escape(lsid_caroQ)+ "&lsHijoUnico="+escape(lsHijoUnico)+ "&lsJEfeHogar="+escape(lsJEfeHogar)+ "&lsLEnguaMAt="+escape(lsLEnguaMAt)+ "&lsCurso="+escape(lsCurso)+ "&lsfec_Icap="+escape(lsfec_Icap)+ "&lsfec_Fcap="+escape(lsfec_Fcap)+ "&lsHorasLectivas="+escape(lsHorasLectivas)+ "&lsFecDatoCom="+escape(lsFecDatoCom)+ "&txtNum_reg_grado="+escape(txtNum_reg_grado)+ "&txtlugar_capacitacion="+escape(txtlugar_capacitacion)+ "&txtExpAplicacion="+escape(txtExpAplicacion)+ "&txtNombreAplicacion="+escape(txtNombreAplicacion)+ "&txtTiempoAplicacion="+escape(txtTiempoAplicacion)+ "&txtExpFormacion="+escape(txtExpFormacion)+ "&txtNombreFormacion="+escape(txtNombreFormacion)+ "&txtTiempoFormacion="+escape(txtTiempoFormacion)+ "&txtCargo1="+escape(txtCargo1)+ "&txtEmpCargo1="+escape(txtEmpCargo1)+ "&txttiempoCargo1="+escape(txttiempoCargo1)+ "&txtCargo2="+escape(txtCargo2)+ "&txtEmpCargo2="+escape(txtEmpCargo2)+ "&txttiempoCargo2="+escape(txttiempoCargo2)+ "&cmbIdiomaC="+escape(cmbIdiomaC)+ "&cmbNivelIdioma="+escape(cmbNivelIdioma)+ "&cmbDomIdioma="+escape(cmbDomIdioma)+ "&txtSiDescuento="+escape(txtSiDescuento)+ "&txtSIPension="+escape(txtSIPension)+ "&txtTipoPension="+escape(txtTipoPension)+ "&txtAFP="+escape(txtAFP)+ "&txtFCUSSP="+escape(txtFCUSSP)+ "&txtPo_AFP="+escape(txtPo_AFP)+ "&txtPo_TipoPension="+escape(txtPo_TipoPension) + "&txtFecAfiliacion="+escape(txtFecAfiliacion)+ "&txtComision="+escape(txtComision)+ "&txtExpCampoInst="+escape(txtExpCampoInst)+ "&txtExpCampoFef="+escape(txtExpCampoFef)+ "&txtExpGrupoInst="+escape(txtExpGrupoInst)+ "&txtExpGrupoFec="+escape(txtExpGrupoFec)+ "&txtExpGenInst="+escape(txtExpGenInst)+ "&txtExpGenFec="+escape(txtExpGenFec)+ "&txtExpProcesos="+escape(txtExpProcesos)+ "&txtCargoAplicacion="+escape(txtCargoAplicacion)+ "&txtNombreProcesos="+escape(txtNombreProcesos)+ "&txtCargoProcesos="+escape(txtCargoProcesos)+ "&txtCargoFormacion="+escape(txtCargoFormacion)+ "&txtTiempoProcesos="+escape(txtTiempoProcesos)+ "&txtTiempoApli="+escape(txtTiempoApli)+ "&txtCargoProc="+escape(txtCargoProc)+ "&txtTiempoFo ="+escape(txtTiempoFor)+ "&txtCursoOf ="+escape(txtCursoOf)+ "&txtlugar_capacitacionOf="+escape(txtlugar_capacitacionOf)+ "&lsfec_IOf ="+escape(lsfec_IOf)+ "&lsfec_FOf ="+escape(lsfec_FOf)+ "&txtHorasLectivasOf ="+escape(txtHorasLectivasOf)+ "&txtTiempoHL  ="+escape(txtTiempoHL)+ "&txtTiempoOf ="+escape(txtTiempoOf)+ "&preg1  ="+escape(preg1)+ "&preg2  ="+escape(preg2)+ "&preg3  ="+escape(preg3)+ "&preg4  ="+escape(preg4)+ "&preg5  ="+escape(preg5)+ "&preg6  ="+escape(preg6)+ "&preg7  ="+escape(preg7)+ "&preg8  ="+escape(preg8)+ "&preg9  ="+escape(preg9)+ "&preg10 ="+escape(preg10)+ "&preg11  ="+escape(preg11)+ "&preg12  ="+escape(preg12)+ "&preg13  ="+escape(preg13)+ "&flag_rnp  ="+escape(flag_rnp)+ "&fechainirnp  ="+escape(fechainirnp)+ "&fechafinrnp  ="+escape(fechafinrnp);
					
					
					
				if (operacion==1){	
					url="pd_confirmacion_archivoEd.asp";  }
				else {
					url="pd_confirmacionActEdUsuario.asp";
					}
				
				ajax.open ('POST', url, true);
				ajax.onreadystatechange = function() {
					 if (ajax.readyState==1) {
					 }
					 else if (ajax.readyState==4){
						
						if(ajax.status==200){		

							if (ajax.responseText==3 ){
								alert('Los datos se guardaron correctamente, veriricar la ficha');
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

function enviarConsultaAct (operacion) {
	if (operacion =="1") {
		
		if (document.form1.txtApePaterno.value == "") {
			alert("Ingrese Apellido Paterno");
			document.form1.txtApePaterno.focus();
			return false;
		}
		if (document.form1.txtApePaterno.length < 3) {
			alert("Ingrese Apellido Paterno de por lo menos 3 letras");
			document.form1.txtApePaterno.focus();
			return false;
		}
		
				
		if (document.form1.txtApeMaterno.value == "") {
			alert("Ingrese Apellido Materno");
			document.form1.txtApeMaterno.focus();
			return false;
		}
		if (document.form1.txtApeMaterno.length < 3) {
			alert("Ingrese Apellido Materno de por lo menos 3 letras");
			document.form1.txtApeMaterno.focus();
			return false;
		}		
		
		
		if (document.form1.txtNombre.value == "") {
			alert("Ingrese Nombre");
			document.form1.txtNombre.focus();
			return false;
		}
		if (document.form1.txtNombre.length < 2) {
			alert("Ingrese Nombre de por lo menos 2 letras");
			document.form1.txtNombre.focus();
			return false;
		}
		

		
	}
	if (operacion =="2") {
		if (document.form1.txtDNI.value == "" || document.form1.txtDNI.value.length < 8) {
			alert("Ingrese n\xfamero de DNI v\xe1lido");
			 document.form1.txtDNI.value='';
			document.form1.txtDNI.focus();
			return false;
		}

	}
	if (operacion =="3") {
		
		if (document.form1.txtCODIGO.value == "" || document.form1.txtCODIGO.value.length < 12) {
			alert("Ingrese n\xfamero de CODIGO v\xe1lido");
			document.form1.txtCODIGO.focus();
			return false;
		}
	}
		
	document.getElementById("txtOpcion").value=operacion;
	document.getElementById("txtOper").value="1";
	document.form1.submit();
}	