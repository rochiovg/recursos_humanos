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
	lsUbigeoDist= Session("UbigeoDist")
	
	lsUsuario1=Session("id_usuario")
	id_proyecto=session("id_proyecto") 

	sub generaCargo()
		IF lsRol=35 THEN 
		set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO_MIN '9','"&id_proyecto&"' ")
		ELSEIF lsRol=51 THEN 
		set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO_ESP '9','"&id_proyecto&"' ")
		ELSE
		set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '9','"&id_proyecto&"' ")
		END IF
		Response.Write "<select class=""e_combo"" style=""width:180px"" id=""cmbCargo"" name=""cmbCargo"" OnChange=""generaConvocatoria(this.value);"" >"
		Response.Write " <option value=""900"">Todos</option>"
		While not wRsDptoapli.EOF
			Response.Write "<option title='"&wRsDptoapli(4)&" - Actividad: "&wRsDptoapli(5)&"'   value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(3) & "</option>"
			wRsDptoapli.MoveNext
		Wend
		Response.Write "</select>"
		wRsDptoapli.Close
		Set wRsDptoapli = Nothing
	End sub

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


If lsUbigeo <> "" Then

%>

<html>
<head>
    
<!--	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
	<!--<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="HandheldFriendly" content="True"> -->
	<!--<link rel="stylesheet" href="./assets/css/normalize.css" /> -->
	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
    <link rel="stylesheet" href="./assets/css/main.css" />
		
	<!--<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" /> -->
	<title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
	
	<style media="screen" type="text/css">
	#div1 
	{
		width:1500px;
		height:1200px;
		z-index:2;
		top: 0px; 
		
	}
	
	#div2 
	{
		width:1500px;
		height:900px;
		z-index:1;
		top: 0px;
	}
	#div3 
	{
		width:1500px;
		height:550px;
		z-index:1;
		top: 0px;
	}
	#div4 
	{
		width:1500px;
		height:500px;
		z-index:1;
		top: 0px;
	}
	#div5 
	{
		width:1500px;
		height:100px;
		z-index:1;
		top: 0px;
	}
  	</style>	
	<script src="http://gsgd.co.uk/sandbox/jquery/jquery-1.2.1.js" type="text/javascript"></script>
	<script type="text/javascript">
		function desaparecer(objeto, caida)
		{
                $(objeto).animate({
                    opacity: 0.0,
                    marginTop: caida,
                }, 500 ).hide("slow");
		}   
		function desaparecer2(objeto1, objeto2, objeto3, objeto4, caida)
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

	</script>
	<script type="text/javascript"  src="js/cliente.js"></script>
	<script type="text/javascript" src="js/envio_ajax.js"></script>
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
	<!------------------------------------------------------ PROVINCIA ------------------------------------------------------------->
	function generaprov()
	{
		var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
		ajax=http_request();
		var valores;	
		valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor		
		url="m711_Provincia.asp";  
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
		var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
		var lsUbiDist =document.getElementById("lsubidist").value;
		ajax=http_request();
		var valores;	
		valores= "datos=" + escape(varProv)+"&lsUbiDist="+escape(lsUbiDist);  // parametros a enviar al servidor	
		url="m71_Distrito.asp";  
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
		url="m_numConvocatoria.asp";  
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
	} BOTO
	<!------------------------------------------------------ VERIFICAR CV ------------------------------------------------------------>
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
							ver_Conocimientos();
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
  
	function alerta_NoAsistio(id_per,id, flag)
	{
		var valor;
		if (id.checked == true)
			valor=3;
		else if (id.checked == false)
			valor=0;
		var nota=document.getElementById("txtp"+id_per).value;
		var estado=flag;
		if (nota>=1)
		{
			alert('Esta persona ha sido evaluado, no se puede registrar que no asiti\xf3')
			ver_Conocimientos();
			return false
		}
		if (estado=='No Aplica')
		{
			alert('Este proceso no incluy\xf3 evaluacion de conocimientos');
			ver_Conocimientos();
			return false;
		}
		guardarNota(id_per,valor, '3')
	}
	
	<!----Estas Funciones pertencen a la Seleccion de Personal ------>

	function Seleccionar(id_per,valor)
	{
		var ls_mensaje_confirmacion = "Esta seguro(a) de realizar el cambio de estado?";
		var aprobados1=0;
		if (confirm(ls_mensaje_confirmacion)) 
		{
			var meta=document.getElementById("MetaSeleccion").value;
			var aprobados=document.getElementById("txtSeleccionados").value;
			if (valor==1)
			{
				aprobados1=parseInt(aprobados)+1;
			}
			if (parseInt(aprobados1) > parseInt(meta) ) 
			{
				alert('La cantidad de personas seleccionadas sera mayor a la meta, verificar!!!')
			} 
			else 
			{
				if (valor==1)
				{
					document.getElementById("txtSeleccionados").value=parseInt(aprobados)+1;
				} 
				else 
				{
					document.getElementById("txtSeleccionados").value=parseInt(aprobados)-1;
				}
				ajax=http_request();
				var valores;	
				valores= "id_per=" + escape(id_per) + "&valor=" + escape(valor);  
				url="m_registraTitularidad.asp";   // nombre de url a invocar
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
		}
	}	
	
	
	<!----Estas Funciones pertencen a la Entrevista Personal ------>
	
	function verificar_cv2(valor)
	{
	   var dni= valor
	   <!--document.getElementById("txtDNI").value; -->
		if (dni=="")
		{
			alert('Ingrese el numero de DNI');
			return false;
		}
		ajax=http_request();
		var valores;	
		valores= "dni=" + escape(dni);  // parametros a enviar al servidor	
		url="m_vistaEntrevista_2.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
					 document.getElementById("divCriterio").innerHTML ="Cargando......";
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){
														
						document.getElementById("divCriterio").innerHTML =ajax.responseText;
				}
				else if(ajax.status==404){
						 document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else{
	
						 document.getElementById("divCriterio").innerHTML = ajax.responseText;					 
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
	   return;	
	}	
	
	
</script>
<style type="text/css">
<!--
.Estilo4 {font-family: Verdana, Arial, Helvetica, sans-serif}
-->
</style>
</head>
<body>
<div id="top">
<!--#include file="cabecera.html"-->
<!--#include file="pd_menu.asp"-->

</div>
<div class="navbar main" id="navbar-main">
	<div id="sidebar-main-trigger" class="icon float-left">
		<img src="images/icon-menu-24px-x2.png" width="24px" alt="Menu Icon" />
	</div>
	<div style="font-size:14px; color:#FFFFFF">
		<input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
				<%=Session("cmeta")&"-"&Session("nmeta")%>
		<input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />		
	</div><!--ajax helper-->
	<p></p><p></p>
	<div align="center" style="vertical-align:middle">
		<input name='button122'  type='button' class="botonR" id='button122' onClick="javascript:ver_Conocimientos(); javascript:aparecer('#div3', '10%'); return false;" onFocus="javascript:desaparecer2('#div1', '#div2', '#div4', '#div5', '10%'); return false;" value='Eval. Conocimientos'/>
	</div>
	<p></p><p></p>
	<div align="center" style="vertical-align:middle">
		  <input name='button125'  type='button' class="botonR" id='button125' onclick="javascript:SeleccionarDat2(); javascript:aparecer('#div4', '10%'); return false;" onFocus="javascript:desaparecer2('#div1', '#div2', '#div3', '#div5', '10%'); return false;" value='Seleccion' />
	</div>
	<p></p><p></p>
	<div align="center" style="vertical-align:middle">
	  <input name='button123'  type='button' class="botonR" id='button123' onClick="javascript:CEntrevista(1); javascript:aparecer('#div2', '10%'); return false;" onFocus="javascript:desaparecer2('#div1', '#div3', '#div4', '#div5','10%'); return false;" value="Entrevista Personal" />
	</div>
</div>

<div class="sidebar main left" id="sidebar-main">
      <div class="wrapper">
        <nav>
			<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_consultas.asp">
			<table width="360" height="350" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="19" colspan="2" style="color:#FFFFFF">
					<div align="center" class="Estilo1">
						<strong>Consultar </strong>
					</div>
					<P></P>
				</td>
			  </tr>
			<tr>
				<td height="19" colspan="2" style="color:#FFFFFF">
					<span class="Estilo1">(*)Datos Obligatorios		</span><span class="criterio Estilo1">
						<input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
						<input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
						<input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
						<input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
						<input name="id_proy" type="hidden" id="id_proy" value="<%=id_proyecto%>" />
						<input name="lsRol" type="hidden" id="lsRol" value="<%=lsRol%>" />
					</span> 
					<p></p>					</td>
			 </tr>
			 <tr>
				<td height="19" colspan="2">
					<fieldset>
						<legend class="criterio" style="color:#FFFFFF"><strong>Seleccione Nivel de RRHH :</strong></legend>
							<input type="radio" name="nivelRRHH" id="TD" value="9" checked="checked" onClick="cargosPorNivel(this.value)" />
							<label for="9" class="etiqueta" style="color:#FFFFFF" >TODOS</label>
							<input type="radio" name="nivelRRHH" id="RA" value="1" onClick="cargosPorNivel(this.value)"/>
							<label for="1" class="etiqueta" style="color:#FFFFFF" >RAO</label>
							<input type="radio" name="nivelRRHH" id="RO" value="2"   onclick="cargosPorNivel(this.value)"/>
							<label for="2" class="etiqueta" style="color:#FFFFFF" >RO</label>
							<input type="radio" name="nivelRRHH" id="RO" value="3"  onclick="cargosPorNivel(this.value)"/>
							<label for="3" class="etiqueta" style="color:#FFFFFF" >RTA</label>
					</fieldset>	
					<p></p>				</td>
			 </tr>
			 <tr id="cargo1">
				<td width="140" height="19" style="color:#FFFFFF"><span class="Estilo1"><strong>Cargo:</strong></span></td>
				<td width="220" id="cargo1"><span class="criterio">
					<%generaCargo()%>
				</td>
			 </tr>
			 <tr id="cargo2" style="display:none" >
				<td height="19"><span class="Estilo3" style="color:#FFFFFF"><strong>Cargo:</strong></span></td>
				<td id="cargo2N"><span class="criterio">
					<select class='e_combo' name="cmbCargo1" id="cmbCargo1"  style="width:180px;">
					    <option id="9" 	title="Todos" value="900">Todos </option>
				    </select>
					</span>
				</td>
			 </tr>
			 <tr>
				<td height="19"><span class="Estilo3"style="color:#FFFFFF"><strong>Convocatoria:</strong></span></td>
				<td>
					<span class="criterio" id="conv">
					  <select class='e_combo' name="txtConvocartoria" id="txtConvocartoria"  style="width:180px;" >
					    <option id="txtconv"  title="Todos" value="0" >Todos </option>
				    </select>
				    </span>
				</td>
			 </tr>
			 <tr>
				<td height="18">&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>
			  <tr>
				<td height="19" colspan="2">
					<center><input name='button1'  type='button' class="botonR" id='button1' onClick="javascript:calificarCV(1)" value='Ver Postulantes'/>
					</center>
				</td>
			  </tr>
			  <tr style="display:none">
				<td height="19">&nbsp;</td>
				<td>
					<span class="criterio">
						<%generaDpto()%>
					</span>
				</td>
			  </tr>
			  <tr style="display:none">
				<td height="19">&nbsp;</td>
				<td><span class="criterio" id="prov">
				  <select class='e_combo' name="txtProv1" id="txtProv1"  style="width:180px">
                    <option id="txtProv1"   title="Todos" value="9999" > Todos </option>
                  </select>
				</span></td>
			  </tr>
			  <tr style="display:none">
				<td>&nbsp;</td>
				<td><span class="criterio" id="dist">
				  <select class='e_combo' name="txtDist1" id="txtDist1"  style="width:180px;" >
                    <option id="txtDist1" 	title="Todos" value="999999" >Todos </option>
                  </select>
				</span></td>
			  </tr>
			  <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>

			</table>
			</form>
        </nav>

        <nav id="debug">
			<div id="contenido" style="height:500px; width:350px;" align="center"></div>
		</nav> 
      </div>
</div>

<!--la primera division de la web  -->


<div align="center">
	<div id="div1" style="display:none" align="center">
		<div id="divResultado" style="width:100%; height:1200px; vertical-align:top" align="center"></div>
	</div>
	<div id="div2" style="display:none" align="center">
		<div id="contenido2"  style="width:100%; height:200px; overflow-y: scroll;" align="center"></div>
		<div id="divCriterio" style="width:100%; height:700px; " ></div>
	</div>
	<div id="div3" style="display:none" align="center">
		<div id="divDetallem" style="width:100%; height:500px; overflow-y: scroll;" align="center"> </div>  
	</div>
	<div id="div4" style="display:none" align="center">
		<div id="divDetallem2" style="width:100%; height:360px; overflow:auto; float: left ; position: inherit; vertical-align:top;"> </div>  
	</div>
	
	<div id="div5" align="center">
		<p></p>
		<h2>BIENVENIDO!</h2>
		
		<strong>
			Este es el Modulo de Evaluaci&oacute;n Curricular ac&aacute; podr&aacute; realizar la b&uacute;squeda de los postulantes por convocatoria
		</strong>
	</div>
</div>


<div class="footer main" id="footer-main">
	<div align="right" style="font-size:12px"><span class="Estilo7 Estilo4"><strong>Usuario</strong></span><span class="Estilo4">:</span> <%=lsUsuario%> </div>  
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