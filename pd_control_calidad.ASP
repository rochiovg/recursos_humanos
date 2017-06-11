<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%
	Response.Expires = 0
	Response.ContentType="text/html; charset=iso-8859-1"
	
	lsRol = CStr(Session("txtTipoUsuarioValido"))
	lsUsuario =  Session("txtNombreValido")
	
	lsUbigeo = Session("Ubigeo") 
	lsUbigeoapli = Session("Ubigeoapli") 
	lsUbigeoDist = Session("UbigeoDist")
	
	lsUsuario1=Session("id_usuario")
	id_proyecto=session("id_proyecto") 
	
	ipVisitante = Request.ServerVariables("REMOTE_ADDR")
	
	sub generaDpto()
		Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")	
		sql1 = " exec dbo.getCCDD_UBI '"&lsUbigeo&"' "
		wRsDptoapli.CursorLocation=3
		wRsDptoapli.Open sql1, Micone,3,3
		  
		Response.Write "<select class=""e_combo"" style=""width:180px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
		Response.Write " <option  value=""99"">Seleccione</option>"
		While not wRsDptoapli.EOF
			Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
			wRsDptoapli.MoveNext
		Wend
		Response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"
		
		wRsDptoapli.Close
		Set wRsDptoapli = Nothing
	End sub

	sub generaCargo()

		set gencar = Micone.execute(" exec getCargo_continuidad_contrato '"&id_proyecto&"' ")

		Response.Write "<select class=""e_combo"" style=""width:180px"" id=""cmbCargo"" name=""cmbCargo"" OnChange=""generaConvocatoria(this.value); "">"
		Response.Write " <option value=""900"">Todos</option>"
		While not gencar.EOF
			Response.Write "<option title='"&gencar(4)&" - Actividad: "&gencar(5)&"'   value="""& gencar(0) & """>" &gencar(3) & "</option>"
			gencar.MoveNext
		Wend
		Response.Write "</select>"
		gencar.Close
		Set gencar = Nothing
	End sub
	

If lsUbigeo <> "" Then

%>

<html>
<head>
    

	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
    <link rel="stylesheet" href="./assets/css/main2.css" />

	<title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
	<!--bootstrap -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<!------------------------ -->
	<style media="screen" type="text/css">
	#div1 
	{
		width:1500px;
		height:1200px;
		z-index:5;
		top: 0px; 
	}
	#div2 
	{
		width:1500px;
		height:650px;
		z-index:4;
		top: 0px;
	}
	#div3 
	{
		width:1500px;
		height:560px;
		z-index:3;
		top: 0px;
	}
	#div4 
	{
		width:1500px;
		height:560px;
		z-index:2;
		top: 0px;
	}
	#div5 
	{
		width:1500px;
		height:800px;
		z-index:1;
		top: 0px;
	}
	#div6 
	{
		width:1500px;
		height:100px;
		z-index:1;
		top: 0px;
	}
  	</style>	
	<script src="http://gsgd.co.uk/sandbox/jquery/jquery-1.2.1.js" type="text/javascript"></script>
	<script>
		function desaparecer(objeto, caida)
		{
                $(objeto).animate({
                    opacity: 0.0,
                    marginTop: caida,
                }, 500 ).hide("slow");
		}   
		function desaparecer2(objeto1, objeto2, objeto3, objeto4, objeto5, caida)
		{
                $(objeto1).animate({
                    opacity: 0.0,
                    marginTop: caida,
                }, 500 ).hide("slow");
                $(objeto2).animate({
                    opacity: 0.0,
                    marginTop: caida,
                }, 500 ).hide("slow");
                $(objeto3).animate({
                    opacity: 0.0,
                    marginTop: caida,
                }, 500 ).hide("slow");
                $(objeto4).animate({
                    opacity: 0.0,
                    marginTop: caida,
                }, 500 ).hide("slow");
				$(objeto5).animate({
                    opacity: 0.0,
                    marginTop: caida,
                }, 500 ).hide("slow");
		}   
        function aparecer(objeto, caida)
		{
			$(objeto).animate(
			{
				opacity: '0.0',
                marginTop: "-"+caida,
			}, 10 ).show()
                .animate(
			{
				opacity: '1.0',
				marginTop: "0",
			}, 500 );
		}
		function aparecer2(objeto1, objeto2, objeto3, objeto4, objeto5, caida)
		{
	<!--objeto 1 -->
			$(objeto1).animate(
			{
				opacity: '0.0',
                marginTop: "-"+caida,
			}, 10 ).show()
                .animate(
			{
				opacity: '1.0',
				marginTop: "0",
			}, 500 );
	<!--objeto 2 -->
			$(objeto2).animate(
			{
				opacity: '0.0',
                marginTop: "-"+caida,
			}, 10 ).show()
                .animate(
			{
				opacity: '1.0',
				marginTop: "0",
			}, 500 );
	<!--objeto 3 -->
			$(objeto3).animate(
			{
				opacity: '0.0',
                marginTop: "-"+caida,
			}, 10 ).show()
                .animate(
			{
				opacity: '1.0',
				marginTop: "0",
			}, 500 );
	<!--objeto 4 -->	
			$(objeto4).animate(
			{
				opacity: '0.0',
                marginTop: "-"+caida,
			}, 10 ).show()
                .animate(
			{
				opacity: '1.0',
				marginTop: "0",
			}, 500 );
	<!--objeto 5 -->
			$(objeto5).animate(
			{
				opacity: '0.0',
                marginTop: "-"+caida,
			}, 10 ).show()
                .animate(
			{
				opacity: '1.0',
				marginTop: "0",
			}, 500 );
		}
	</script>
	<script type="text/javascript" src="js/cliente.js"></script>

	<script type="text/javascript" src="js/valida.js"></script>
	<script type="text/javascript" src="js/main.js"></script> 

	
<script>
	$(document).ready(function() 
	{
		$(".botonExcel").click(function(event) 
		{
			$("#datos_a_enviar").val( $("<div>").append( $("#Exportar_a_Excel").eq(0).clone()).html());
			$("#FormularioExportacion").submit();
		});
	});
	

	function http_request() 
	{
		try 
		{
		  xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e) 
		{
			try 
			{
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		  	} 
			catch (E) 
			{
				xmlhttp = false;
		  	}
		}
		if (!xmlhttp && typeof XMLHttpRequest!='undefined') 
		{
			xmlhttp = new XMLHttpRequest();
		}
		return xmlhttp;
	}
	
	var mostrarValor = function(x)
	{
		document.getElementById('text1').value=x;
	}
	
	var campocargo = function()
	{
		var varcargo =document.getElementById("cmbCargo").options[document.getElementById("cmbCargo").selectedIndex].value;
		varcargo=varcargo.substring(1);
		return varcargo;
	}
	function enviar()
	{
		var varcargo =document.getElementById("cmbCargo").options[document.getElementById("cmbCargo").selectedIndex].value;
		varcargo=varcargo.substring(1);
		window.location="pd_notacv4.asp?opc"+varcargo;
	}
	function verprueba()
	{
		var varcargo =document.getElementById("cmbCargo").options[document.getElementById("cmbCargo").selectedIndex].value;
		var varconvo =document.getElementById("txtConvocartoria").options[document.getElementById("txtConvocartoria").selectedIndex].value;
		var vardpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
		var varprov =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
		varcargo=varcargo.substring(1);
		vardpto=vardpto.substring(0,2);
		varprov=varprov.substring(2,4);
		<!--document.getElementById('text1').value=varcargo+" "+varconvo+" "+vardpto+" "+varprov -->
		document.getElementById('text1').value=varconvo
	}
	
		function generadpto()
	{     			
		document.frmMiForm.txtProv1.value=9999
		document.frmMiForm.txtDist1.value=999999 
		<!--reinicio de los combos prov y dist -->
		var varcargo =document.getElementById("cmbCargo").options[document.getElementById("cmbCargo").selectedIndex].value;
		var varconvo =document.getElementById("txtConvocartoria").options[document.getElementById("txtConvocartoria").selectedIndex].value;
		varcargo=varcargo.substring(1, 10); 
		ajax=http_request();
		var valores;	
		valores= "convo=" + escape(varconvo)+"&cargo="+escape(varcargo);  

		url="m_Dpto.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() 
		{
			if (ajax.readyState==1) 
			{
				document.getElementById("depa").innerHTML ="Cargando......";
			}
			else if (ajax.readyState==4)
			{
				if(ajax.status==200)
				{
					document.getElementById("depa").innerHTML =ajax.responseText;
				}
				else if(ajax.status==404)
				{
					document.getElementById("depa").innerHTML = "El Departamento no existe o no esta disponible temporalmente";
				}
				else
				{
					document.getElementById("depa").innerHTML = ajax.responseText;	
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		return;	
	}
			
	<!------------------------------------------------------ PROVINCIA ------------------------------------------------------------->
	function generaprov()
	{
		var varcargo =document.getElementById("cmbCargo").options[document.getElementById("cmbCargo").selectedIndex].value;
		var varconvo =document.getElementById("txtConvocartoria").options[document.getElementById("txtConvocartoria").selectedIndex].value;
		var vardpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
		varcargo=varcargo.substring(1); 
		vardpto=vardpto.substring(0,2);
		ajax=http_request();
		var valores;	
		valores= "convo=" + escape(varconvo)+"&cargo="+escape(varcargo)+"&dpto="+escape(vardpto) ;  	
		url="m_Prov.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() 
		{
			if (ajax.readyState==1) 
			{
            	document.getElementById("prov").innerHTML ="Cargando......"; // envia al combo provincia
         	}
         	else if (ajax.readyState==4)
			{
            	if(ajax.status==200)
				{
					document.getElementById("prov").innerHTML =ajax.responseText;
				}
				else if(ajax.status==404)
				{
					document.getElementById("prov").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            	}
				else
				{
					document.getElementById("prov").innerHTML = ajax.responseText;	
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		return;	
	}
	<!------------------------------------------------------ DISTRITO ------------------------------------------------------------->
	function verdis()
	{
		var varcargo =document.getElementById("cmbCargo").options[document.getElementById("cmbCargo").selectedIndex].value;
		var varconvo =document.getElementById("txtConvocartoria").options[document.getElementById("txtConvocartoria").selectedIndex].value;
		var vardpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
		var varprov =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
		varcargo=varcargo.substring(1); 
		vardpto=vardpto.substring(0,2);
		varprov=varprov.substring(2,4);
		ajax=http_request();
		var valores;	
		valores= "convo=" + escape(varconvo)+"&cargo="+escape(varcargo)+"&dpto="+escape(vardpto)+"&prov="+escape(varprov) ;  	  // parametros a enviar al servidor	
		url="m_Dist.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() 
		{
			if (ajax.readyState==1) 
			{
				document.getElementById("dist").innerHTML ="Cargando......";
			}
			else if (ajax.readyState==4)
			{
				if(ajax.status==200)
				{										
					document.getElementById("dist").innerHTML =ajax.responseText;
				}
				else if(ajax.status==404)
				{
					document.getElementById("dist").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else
				{
					document.getElementById("dist").innerHTML = ajax.responseText;					 
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		return;	
	}
	<!------------------------------------------------------ CONVOCATORIA ------------------------------------------------------------->
	function generaConvocatoria(valor)
	{     

		var varcargo =valor;   
		ajax=http_request();
		var valores;	
		valores= "datos=" + escape(varcargo);  // parametros a enviar al servidor	
		url="m_numConvocatoria_calidad.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() 
		{
			if (ajax.readyState==1) 
			{
				document.getElementById("conv").innerHTML ="Cargando......";
			}
			else if (ajax.readyState==4)
			{
				if(ajax.status==200)
				{
					document.getElementById("conv").innerHTML =ajax.responseText;
				}
				else if(ajax.status==404)
				{
					document.getElementById("conv").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else
				{
					document.getElementById("conv").innerHTML = ajax.responseText;	
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		return;	
	}
	
	
	<!------------------------------------------------------ CARGO X NIVEL ------------------------------------------------------------->
	function cargosPorNivel(valor)
	{
		document.getElementById("cargo1").style.display="none";
		document.getElementById("cargo2").style.display="";
		ajax=http_request();
		var valores;	
		valores= "valor=" + escape(valor);  // parametros a enviar al servidor	
		url="m_cargoPorNivel.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() 
		{
			if (ajax.readyState==1) 
			{
				document.getElementById("cargo2N").innerHTML ="Cargando......";
			}
			 else if (ajax.readyState==4)
			 {
				if(ajax.status==200)
				{
					document.getElementById("cargo2N").innerHTML =ajax.responseText;
					generaConvocatoria()
				}
				else if(ajax.status==404)
				{
					document.getElementById("cargo2N").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else
				{
					document.getElementById("cargo2N").innerHTML = ajax.responseText;	
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		return;	
	} 
	<!------------------------------------------------------ CALIFICAR CV ------------------------------------------------------------>
	
	function calificar2CV(VALOR)
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
		valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvCar="+escape(lsConvCar) +"&VALOR="+VALOR; 

		url="m_Genera_lista_calidad.asp";  
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
	
	
	<!------------------------------------------------------ CONOCIMIENTOS CV ------------------------------------------------------------>
	function ver_Continuidad()
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
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		if(lsCargo1=='900')
		{
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;

		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;


		ajax=http_request();
		var valores;	
		valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsConvocaroria="+escape(lsConvocaroria);  // parametros a enviar al servidor	
		
		url="m_control_calidad.asp";
		
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() 
		{
			 if (ajax.readyState==1) 
			 {
					 document.getElementById("divDetallem").innerHTML ="<span class=etiqueta>Cargando......</span>";
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200)
				{
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
				}
				else if(ajax.status==404)
				{
					document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else
				{
					document.getElementById("divDetallem").innerHTML = ajax.responseText;	
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
	   return;	 
	}
	
	<!--------------------------------------Necesario para que la lista de convocados tengan el acceso ------------------------------->
	function grabar_continuidad(dni,id)
	{
    	var agree=confirm("Esta seguro de grabar este dato?");
		if(agree)
		{
				
				
				var estado=0;
				var vardni=dni;
				if ($('#'+id).prop('checked') ) {
					estado=1;
				}
				
				ajax=http_request();
				var valores;  
				valores= "vardni=" + escape(vardni)+"&estado="+escape(estado); 
				url="m_grabar_inscripcion_censo.asp";  
				ajax.open ('POST', url, true);
				  ajax.onreadystatechange = function()
				  {
					   if (ajax.readyState==1) 
					   {
							   document.getElementById("divDetallem").innerHTML ="Cargando......";
					   }
					   else if (ajax.readyState==4)
					   {
						  if(ajax.status==200)
						  {
							alert('Los datos se guardaron Correctamente');	
							ver_Continuidad()			  
							<!--document.getElementById("divDetallem").innerHTML =ajax.responseText; -->
						  }
						  else if(ajax.status==404)
						  {
								   document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
						  }
						  else
						  {
								   document.getElementById("divDetallem").innerHTML = ajax.responseText;          
						  }
					  }
				  }
				  ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				  ajax.send(valores);
				 return;  
			
		}
		else
			return false;
	}
	
	<!--------------------------------------Necesario para que la lista de convocados tengan el acceso ------------------------------->
	function verificar_cv(dni)
	{
		var fdni=document.getElementById("fdni").value;
		if (fdni==0 || fdni=="")
		{
			document.getElementById("TR"+dni).style.background="#EAEE35";
			document.getElementById("fdni").value=dni;
		} else if ( fdni!=dni)
		{
			document.getElementById("TR"+dni).style.background="#EAEE35";
			/*cuando ya fue seleccionado recupere el fondo q tenia*/
			document.getElementById("TR"+fdni).style.background="#CCCCCC";
		} else if ( fdni==dni)
		{
			document.getElementById("TR"+dni).style.background="#EAEE35";
		}
		else 
		{
			document.getElementById("TR"+dni).style.background="#EAEE35";		
			/*cuando ya fue seleccionado recupere el fondo q tenia*/
			document.getElementById("TR"+fdni).style.background="#CCCCCC";
		}
		document.getElementById("fdni").value=dni;
		ajax=http_request();
		var valores;  
		valores= "dni=" + escape(dni);  // parametros a enviar al servidor  
		url="m_vistaCV_3.asp";  
		ajax.open ('POST', url, true);
		  ajax.onreadystatechange = function() {
			   if (ajax.readyState==1) {
					   document.getElementById("divResultado").innerHTML ="Cargando......";
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
	<!----Estas funcionan cuando ya han cargado la lista de convocados es la parte que permite que las opciones de Certificados, DNI se muestren ------>
	function ver_cv(id)
	{
		vista=document.getElementById("num_vista").value;
		document.getElementById("foto"+vista).style.display="none";
		document.getElementById("foto"+id).style.display="";
		document.getElementById("num_vista").value=id;
	}
	<!----Contador de CV  ------>
	function f_contador_cv(idc,id,ID_PER,valor, usuario)
	{			
		var combo=idc;
		var valor=valor;
		var dni=dni;
		var obs=document.getElementById('txtobs'+ID_PER).value;
		if(!confirm("Estas seguro de hacer este cambio a \n "+id))
		{
			document.getElementById(idc).value=vcombo1;
			vcombo1=0;
			idcombo;
		}
		else 
		{	
			var contador=parseInt(document.getElementById('txtCapacitacion').value);
			if(valor==1){
			 contador= contador+1;
			}
			else
			{
			
			}
			ProcesarCV(ID_PER,valor,usuario, obs);
		}
		
	}
	function f_contador_evalcon_cv(idc,id,ID_PER,valor, usuario)
	{
		var combo=idc;
		var valor=valor;
		var dni=dni;
		var obs=document.getElementById('txtobs'+ID_PER).value;
		var obs1=document.getElementById('cmbObservacion').value;
		
		obs=obs1+' '+obs;
		if(!confirm("Estas seguro de hacer este cambio a \n "+id))
		{
			document.getElementById(idc).value=vcombo1;
			vcombo1=0;
			idcombo;
		}else 
		{	
			ProcesarCV(ID_PER,valor,usuario, obs);
		}
	}
		
	<!----Estas Parte del proceso ------>
	function ProcesarCV(ID_PER,VALOR,USUARIO, obs)
	{
		id_proy=document.getElementById("id_proy").value;
		ajax=http_request();
		var valores;	
		valores= "ID_PER=" + escape(ID_PER) + "&VALOR=" + escape(VALOR)+ "&USUARIO=" + escape(USUARIO)+ "&id_proy=" + escape(id_proy)+ "&obs=" + escape(obs);  // parametros a enviar al	 		servidor
		url="m_Proc_CV.asp";   // nombre de url a invocar
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() 
		{
			if (ajax.readyState==1) 
			{
					 
			}
			 else if (ajax.readyState==4)
			 {
				if(ajax.status==200)
				{
						alert('Los Datos Han Sido Correctamente Grabados');
				}
				else if(ajax.status==404)
				{
					document.getElementById("divResultado").innerHTML = ajax.responseText;
				}
				else
				{
					document.getElementById("divResultado").innerHTML = ajax.responseText;
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		return ;	
	}
	
	function MostrarBoton()
	{
		var rep =document.getElementById("cboReporte").options[document.getElementById("cboReporte").selectedIndex].value; 
		if (rep==7)
		{
			document.getElementById("button3").style.display='block';
		}
		else
		{
			document.getElementById("button3").style.display='none';
			}
		if (rep==5){
			document.getElementById("button5").style.display='block';
			}
			else{
				document.getElementById("button5").style.display='none';
				}
	}
	
	<!----Estas Funciones pertencen a la evaluacion de conocimientos ------>
	
	function verFields(valor)
	{
		if (valor==1) 
		{
			document.getElementById("reportes").style.display="none";
			document.getElementById("inscripciones").style.display="";
		}
		else if (valor==21 || valor==23 || valor==24 || valor==25)
		{
			document.getElementById("reportes").style.display="";
			document.getElementById("inscripciones").style.display="none";
		}
		else
		{
			document.getElementById("reportes").style.display="none";
			document.getElementById("inscripciones").style.display="none";
		}
	}
	
	
	function confirma_Proceso()
	{
		var id_cc=document.getElementById("txtConvocartoria").value;
		if (id_cc==0)
		{
			alert('Seleccione el n\xfamero de Convocatoria')
			document.getElementById("txtConvocartoria").focus();
			return false;
		}
		var agree=confirm("Esta seguro de registrar que no hubo evaluaci\xf3n de conocimientos para este cargo?");
		if (agree)
			guardarNota('','','2') ;
		else
			return false ;
	}

	function guardarNota(id_per,valor, indic)
	{
		var id_cc=document.getElementById("txtConvocartoria").value;
		if (indic==2 && id_cc==0)
		{
			alert('Seleccione el n\xfamero de Convocatoria')
			document.getElementById("txtConvocartoria").focus();
			return false;
		}
		else
		{
			if (indic==1 && (valor>'20' || valor<'0' || valor=='.'))
			{
				alert('Nota Incorrecta, se deben ingresar valores entre 0 y 20')
				return false;
			}
			if (valor=='' && indic==1 ) 
			{
				alert("Debe de Ingresar una Nota")
				return false;
			}
			ajax=http_request();
			var valores;  
			valores= "idper=" + escape(id_per)+ "&valor=" + escape(valor)+ "&indic=" + escape(indic)+ "&id_cc=" + escape(id_cc);   
			divProceso="tr"+id_per;
			url="m_GrabaNotaConocimiento.asp";   // nombre de url a invocar
			ajax.open ('POST', url, true);
			ajax.onreadystatechange = function() 
			{
				if (ajax.readyState==1) 
				{
				
				}
				else if (ajax.readyState==4)
				{
					if(ajax.status==200)
					{
						result  = ajax.responseText;
						if (result==5)
						{
							alert('Cuidado, existen personas a quienes ya se les registr\xf3 una nota. No se puede realizar este proceso ')
							return false;
						}
						else if (result==3)
						{
							alert('Se actualiz\xf3 el registro')
							ver_Continuidad();
						}
						else
						{
							alert('Se procedi\xf3 a actualizar todos los registros');
							document.getElementById(divProceso).innerHTML =result;
						}	
					}
					else if(ajax.status==404)
					{
						document.getElementById(divDetallem).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					}
					else
					{
						document.getElementById(divDetallem).innerHTML = ajax.responseText;           
					}
				}
			}
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.send(valores);
			return;  
		}
	}
  
	<!-- estas Funciones pertenecen al guardado de la entrevista -->
	function valorinicial (valor,id)
	{
		idcombo=id;
		vcombo1=valor;
	}
	function valordni(valordni)
	{
		var dni=valordni;
		document.getElementById("txtDNI").value=dni;
	}

</script>
<style type="text/css">
<!--
.Estilo1 {color: #000000; font-family: Verdana, Arial, Helvetica, sans-serif; font-size:14px; font-weight:bold;}

.Estilo2 {color: #000000; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; }
.Estilo3 {color:#000000; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:9px; font-weight:bold;  }

.Estilo4 { color:#000000; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px; font-weight:bold; }

.Estilo5 { color:#000000; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:normal;}
.Estilo6 { color:#000000; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8px; font-weight:normal;}
.Estilo7 {color:#FFFFFF; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; }
<!-- estilos2 y 3 usados por m_GeneraEntrevista.asp y GeneraNotaCV.asp -->
<!-- estilo4 usado por m_vistaEntrevista_3.asp -->
<!-- estilo5 usado por m_vistaCV_3.asp -->
-->
</style>
</head>
<body>
<div class="alerta" id="top">
<!--#include file="cabecera.html"-->
<!--#include file="pd_menu.asp"-->
</div>
<div class="navbar main" id="navbar-main">
	<div id="sidebar-main-trigger" class="icon float-left">
		<img src="images/icon-menu-24px-x2.png" width="24px" alt="Menu Icon" />
	</div>
	<div style="font-size:14px; color:#FFFFFF; vertical-align:middle" >
		<input name="txtmeta" type="hidden" id="txtmeta" style="vertical-align:middle;" value="<%=Session("cmeta")%>" />
				<%=Session("cmeta")&"-"&Session("nmeta")%>
		<input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />		
	</div><!--ajax helper-->
	<div style="display:none">
		<p></p><p></p>
		<div align="center" style="vertical-align:middle">
			<button type="button" class="btn btn-primary btn-md" id='button222' style="width:200px;" onClick="javascript:ver_Continuidad(); ">Eval. Conocimientos</button>
		</div>
		<p></p><p></p>
		<div align="center" style="vertical-align:middle">
		</div>
		<p></p><p></p>
		<div align="center" style="vertical-align:middle">
		  
		</div>
	</div>
</div>

<div class="sidebar main left" id="sidebar-main">
      <div class="wrapper">
        <nav>
			<div class="panel panel-info" style="width:362px;">
				<div class="panel-heading" style="font-size:16px; font-weight:bolder; width:360px;" align="center">Consultar</div>
				<div class="panel-footer" style="width:360px; background:#FFFFFF">
			<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_continuidad_contrato.asp">
			<table width="360" height="auto" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="2" colspan="2" style="color:#FFFFFF; display:none">
<!--					</div>
					<div align="center" class="alert alert-info" style="height:30px;">
						<strong style="vertical-align:middle">Consultar</strong></div>
					<P></P>	 -->				
				</td>
			</tr>
			<tr>
				<td height="19" colspan="2" style="color:#FFFFFF">
					<span class="Estilo1">(*)Datos Obligatorios	</span><span class="criterio Estilo1">
						<input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
						<input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
						<input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
						<input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
						<input name="id_proy" type="hidden" id="id_proy" value="<%=id_proyecto%>" />
						<input name="lsRol" type="hidden" id="lsRol" value="<%=lsRol%>" />
												
						<!-- campos para la entrevista -->
						<input type="hidden" name="id_proyecto" id="id_proyecto" value="<%=id_proyecto%>" />
						<input type="hidden" name="id_usuario" id="id_usuario" value="<%=lsUsuario1%>" />
						<input name="ipVisitante" type="hidden" id="ipVisitante" value="<%=ipVisitante%>" />
					</span> 
					<p></p>					
				</td>
			 </tr>
			 <tr style="display:none">
				<td height="19" colspan="2">
					<div class="well well-sm" style="width:330px; background:#FFFFFF">
						<legend class="criterio"><samp class="Estilo2">Seleccione Nivel de RRHH :</samp></legend>
							<input type="radio" name="nivelRRHH" id="TD" value="9" checked="checked" onClick="cargosPorNivel(this.value)" />
							<label for="9" class="etiqueta"><samp class="Estilo2">TODOS</samp></label>
							<input type="radio" name="nivelRRHH" id="RA" value="1" onClick="cargosPorNivel(this.value)"/>
							<label for="1" class="etiqueta"><samp class="Estilo2">RAO</samp></label>
							<input type="radio" name="nivelRRHH" id="RO" value="2"   onclick="cargosPorNivel(this.value)"/>
							<label for="2" class="etiqueta"><samp class="Estilo2">RO</samp></label>
							<input type="radio" name="nivelRRHH" id="RO" value="3"  onclick="cargosPorNivel(this.value)"/>
							<label for="3" class="etiqueta"><samp class="Estilo2">RTA</samp></label>
					</div>
					<p></p>				
				</td>
			 </tr>
			 <tr id="cargo1">
				<td width="140" height="19"><span class="Estilo2"><strong>Cargo:</strong></span></td>
				<td width="220" id="cargo1"><span class="criterio"><%generaCargo()%></span></td>
			 </tr>
			 <tr id="cargo2" style="display:none" >
				<td height="19"><span class="Estilo2">Cargo:</span></td>
				<td id="cargo2N"><span class="criterio"><select class='e_combo' name="cmbCargo1" id="cmbCargo1"  style="width:180px;">
					    <option id="9" 	title="Todos" value="900">Todos </option>
				    </select>
					</span>
				</td>
			 </tr>
			 <tr>
				<td height="19"><span class="Estilo2">Convocatoria:</span></td>
				<td>
					<span class="criterio" id="conv"><select class='e_combo' name="txtConvocartoria" id="txtConvocartoria"  style="width:180px;" >
					    <option id="txtconv"  title="Todos" value="0" >Todos </option>
				    </select>
				    </span></td>
			 </tr>
			<tr>
				<td height="18">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr id="opcion" style="display:none">
				<td height="19" colspan="2">
				<div align="center"><span class="Estilo9">
				</span></div>
				</td>
			</tr>
			  <tr>
				<td height="19" colspan="2"><div align="center"><span class="Estilo9" style="display:none">
			    <br>
				  <button type="button" class="btn btn-warning btn-xs" style="width:200px;" onClick="javascript:aparecer2('#tr_dpto', '#tr_prov', '#tr_dist', '#tr_espacio','50%');javascript:generadpto();" onKeyPress="javascript:desaparecer2('#tr_dpto', '#tr_prov', '#tr_dist', '#tr_espacio','50%'); return false; ">Busqueda Avanzada...</button>
				  </span></div>
				</td>
			  </tr>
			<tr style="display:none" id="tr_espacio">
				<td>&nbsp;</td>
				<td></td>
			</tr>
			  <tr style="display:none" id="tr_dpto">
				<td height="19"><span class="Estilo2"><strong>Departamento:</strong></span></td>
				<td>
					<span class="criterio" id="depa">
						<select class='e_combo' name="txtDpto1" id="txtDpto1"  style="width:180px">
                    <option id="txtDpto1"   title="Todos" value="99" > Todos </option>
                  </select>
					</span>
				</td>
			</tr>
			<tr style="display:none" id="tr_prov">
				<td height="19"><span class="Estilo2"><strong>Provincia:</strong></span></td>
				<td><span class="criterio" id="prov">
				  <select class='e_combo' name="txtProv1" id="txtProv1"  style="width:180px">
                    <option id="txtProv1"   title="Todos" value="9999" > Todos </option>
                  </select>
				</span></td>
			</tr>
			<tr style="display:none" id="tr_dist">
				<td height="18"><span class="Estilo2"><strong>Distrito:</strong></span></td>
				<td><span class="criterio" id="dist">
				  <select class='e_combo' name="txtDist1" id="txtDist1"  style="width:180px;" >
                    <option id="txtDist1" 	title="Todos" value="999999" >Todos </option>
                  </select>
				</span>
				</td>
			</tr>
			  <tr id="eva_conocimiento">
			  	<td height="19" colspan="2" align="center">
				<br>
				<button type="button" class="btn btn-primary btn-xs" id='button122' style="width:200px;" onClick="javascript:ver_Continuidad(); javascript:aparecer('#div3', '10%'); javascript:desaparecer('#div6','10%')" >Mostrar</button>
				</td>
			  </tr>
			  <tr style="display:none" id="publicaciones">
			  <td height="19" colspan="2" align="center">
			  <br>	  				
			  
<!--			 <button type="button" class="btn btn-danger btn-xs" id='button126' style="width:200px;" onClick="javascript:verprueba();" >Pruebas</button>
			    <input id="text1" type="text" name="text1" value="">   -->
			  </td>
			  </tr>
			</table>
			</form>
			</div></div>
        </nav>

       
      </div>
</div>

<!--la primera division de la web  -->


<div align="center">

	<div id="div3" style="display:none" align="center">
		<!--  Modulo de Evaluacion de Conocimiento-->
		<div id="divDetallem" style="width:100%; height:500px; overflow-y: scroll;" align="center"> </div> 
	</div>
	<div id="div6" align="center">
	<center>
		<h2>BIENVENIDO!</h2>
			<samp class="Estilo5">Este es el Modulo de continuidad de contratos </samp>
	</center>	
	</div>
</div>


<div class="footer main" id="footer-main">
	<div align="right" style="font-size:12px"><span class="Estilo7">Usuario: <%=lsUsuario%></span></div>  
</div><!--.footer.main-->
	
<script src="./assets/js/jquery-1.12.4.js"></script>
<script src="./assets/js/jquery-ui.js"></script>
<script src="./assets/js/jquery.simpler-sidebar.min.js"></script>
<script src="./assets/js/main-sidebar-left-top.js"></script>		



</body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>