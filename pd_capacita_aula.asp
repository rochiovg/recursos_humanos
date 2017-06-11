<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0

Function CalcularEdad(fechaN)
If IsNull(fechaN) then wEdad = 0: Exit Function
wEdad = DateDiff("yyyy", fechaN, Now)
If Date <> DateSerial(Year(Now), Month(fechaN), Day(fechaN)) Then
wEdad = wEdad - 1
End If
wEdad = CInt(wEdad)
Response.Write(wEdad)
End Function


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUsuarioID = Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 


id_proyecto=session("id_proyecto") 

AulasCapa=Session("aulas") 

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	
	
	if  id_proyecto = 139 AND lsRol= 54 THEN
	
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO_ednom_rol_54 '9','"&id_proyecto&"' ")
	
	else
	
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '9','"&id_proyecto&"' ")
	
	end if
	
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" OnChange=""generaConvocatoria(this.value);"" >"
	
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
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
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




sub generaCapac()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.pa_capacitacion_listar '"&id_proyecto&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtCap"" name=""txtCap"" >"
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
   <link rel="shortcut icon" href="images/favicon.ico" />

<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/main.js"></script> 
        <link rel="stylesheet" href="Styles/main.css" type="text/css" />
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="Styles/inei.css">

<script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript"  src="js/envio_ajax.js"></script>
<script type="text/javascript"  src="js/valida.js"></script>


<script language="javascript">
$(document).ready(function() {
	$(".botonExcel").click(function(event) {
		$("#datos_a_enviar").val( $("<div>").append( $("#Exportar_a_Excel").eq(0).clone()).html());
		$("#FormularioExportacion").submit();
});
});
</script>
<script>
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




function generaprov(){
     
      var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m711_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("reg2").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("reg2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("reg2").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function verdis(){

 var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
 var lsUbiDist =document.getElementById("lsubidist").value;
	ajax=http_request();
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&lsUbiDist="+escape(lsUbiDist);  // parametros a enviar al servidor	
	
	url="m71_Distrito_preaulas.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dis2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dis2").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("dis2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dis2").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function generaLocales(){


      var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	   var varProv=document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
	    var varDis=document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value;
		
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&prov=" + escape(varProv)+"&dist=" + escape(varDis);  // parametros a enviar al servidor	
	
	url="m_LocalesCapacitacionUsuario_cap.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg21").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("reg21").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("reg21").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("reg21").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}



function verAulas(){

 var varProv =document.getElementById("txtProv11").options[document.getElementById("txtProv11").selectedIndex].value;
 var AulasCapa =document.getElementById("lsAulas").value;

	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&Aulas="+escape(AulasCapa);  // parametros a enviar al servidor	
	
	url="m_AulasCapacitacionUsuariodist.asp";  

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dis21").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dis21").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("dis21").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dis21").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}




	var vcombo1=0;
	var idcombo;

function valorinicial (valor,id)
{
	idcombo=id;
	vcombo1=valor;
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

function ProcesarCap(ID_PER,VALOR,USUARIO){
	ajax=http_request();
	var valores;	
	valores= "ID_PER=" + escape(ID_PER) + "&VALOR=" + escape(VALOR)+ "&USUARIO=" + escape(USUARIO);  // parametros a enviar al servidor	


	url="m2_Proc_fechaCapa.asp";   // nombre de url a invocar
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 
         }
         else if (ajax.readyState==4){
		
            if(ajax.status==200){
					alert('Los Datos Han Sido Correctamente Grabados');
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


function generaConvocatoria(valor){     
	 var varcargo =valor;   
	ajax=http_request();
	
	var valores;	
	valores= "datos=" + escape(varcargo);  // parametros a enviar al servidor	
	
	
	url="m_numConvocatoria.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("conv").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("conv").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("conv").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("conv").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function cargosPorNivel(valor){
	document.getElementById("cargo1").style.display="none";
	document.getElementById("cargo2").style.display="";
	
	ajax=http_request();
	
	var valores;	
	valores= "valor=" + escape(valor);  // parametros a enviar al servidor	
	
	
	url="m_cargoPorNivel.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("cargo2N").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("cargo2N").innerHTML =ajax.responseText;
					generaConvocatoria()
					
            }
            else if(ajax.status==404){
                     document.getElementById("cargo2N").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("cargo2N").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function guardarCAP(vidper,vvalor){

   
   if (vvalor!='' ) {
    
      ajax=http_request();
      var valores;  
      valores= "idper=" + escape(vidper)+ "&valor=" + escape(vvalor);   
	  

  
      url="m_GrabarCapacitacion.asp";   // nombre de url a invocar
      ajax.open ('POST', url, true);
      ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         
         else if (ajax.readyState==4){
          if(ajax.status==200){
			 alert('Se guardo correctamente')
          }
          else if(ajax.status==404){
                 document.getElementById(divProceso).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
          }
          else{
              document.getElementById(divTotal).innerHTML = ajax.responseText;           
          }
        }
      }
      ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
      ajax.send(valores);
       return;  

   }else 
   {alert("Debe de Ingresar una Nota")}
  }
  


function guardarCAPA(vtabla,vidper,vvalor, id, id_cc){
	//alert(vtabla)			alert(vidper)			alert(vvalor)			alert(id)			alert(id_cc)
	
	var valuenivelRRHH=2;
	
   if (vvalor!='') {	    
			
	   if (id==1 ){
		  if (id_cc==1831 || id_cc==1832 || id_cc==1841 || id_cc==2698 || id_cc==2697) {
			if (vvalor>10){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 10');
				document.getElementById("txtp1"+vidper).value="";
				document.getElementById("txtp1"+vidper).focus();
				return false;
			 } 
		   } else {			  
//			 if (id_cc==6447) { 

			 if (id_cc==6447 || id_cc==6553) {			 
			   if (vvalor>8){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 8');
				document.getElementById("txtp1"+vidper).value="";
				document.getElementById("txtp1"+vidper).focus();
				return false;
			   } 
			 } else { 	
  			  if (vvalor>5){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 5');
				document.getElementById("txtp1"+vidper).value="";
				document.getElementById("txtp1"+vidper).focus();
				return false;
			  }			 			 
			}
		  }
	   }
	   
	   if (id==2){
		if (id_cc==1831 || id_cc==1832 || id_cc==1841 || id_cc==2698 || id_cc==2697) {
			if (vvalor>20){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
				document.getElementById("txtp2"+vidper).value="";
				document.getElementById("txtp2"+vidper).focus();
				return false;
				}  
		} else {
//		    if (id_cc==6447) { 	
    		if (id_cc==6447 || id_cc==6553) {					
				if (vvalor>12){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 12');
					document.getElementById("txtp2"+vidper).value="";
					document.getElementById("txtp2"+vidper).focus();
					return false;
					}
			 } else { 
				if (vvalor>10){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 10');
					document.getElementById("txtp2"+vidper).value="";
					document.getElementById("txtp2"+vidper).focus();
					return false;
					}							  		 			 
			}					
					
		}
	   }
	   
	    if (id==3){
//			if (id_cc==6447) {
			if (id_cc==6447 || id_cc==6553) {				 				
				if (vvalor>20){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
					document.getElementById("txtp3"+vidper).value="";
					document.getElementById("txtp3"+vidper).focus();
					return false;
					}
			 } else { 						
				if (vvalor>10){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 10');
					document.getElementById("txtp3"+vidper).value="";
					document.getElementById("txtp3"+vidper).focus();
					return false;
					}					
			 }		
					
	   }
	    if (id==4){
			if (vvalor>15){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 15');
				document.getElementById("txtp4"+vidper).value="";
				document.getElementById("txtp4"+vidper).focus();
				return false;
				}
	   }
	   
	    if (id==5){
			//informatico de local ednom 2016
		   if (id_cc==5103) {
			if (vvalor>30){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 30');
				document.getElementById("txtp1"+vidper).value="";
				document.getElementById("txtp1"+vidper).focus();
				return false;
			 } 
		   } else {
				if (vvalor>20){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
					document.getElementById("txtp5"+vidper).value="";
					document.getElementById("txtp5"+vidper).focus();
					return false;
				 } 
		     }
	   }
	  
	  if (document.getElementById("id_proy").value==155)
	  {  if (id==1){
		
			if (vvalor>15){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 15');
					document.getElementById("txtc1"+vidper).value="";
					document.getElementById("txtc1"+vidper).focus();
					return false;
					}		
					  
	  }
	  
	   if (id==2){
		
			if (vvalor>15){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 15');
					document.getElementById("txtc2"+vidper).value="";
					document.getElementById("txtc2"+vidper).focus();
					return false;
					}		
					  
	  }
	  
	    if (id==3){
		
			if (vvalor>20){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
					document.getElementById("txte1"+vidper).value="";
					document.getElementById("txte1"+vidper).focus();
					return false;
					}		
					  
	  }
	  
	    if (id==4){
		
			if (vvalor>20){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
					document.getElementById("txte2"+vidper).value="";
					document.getElementById("txte2"+vidper).focus();
					return false;
					}		
					  
	  }
	  
	     if (id==5){
		
			if (vvalor>20){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
					document.getElementById("txte3"+vidper).value="";
					document.getElementById("txte3"+vidper).focus();
					return false;
					}		
					  
	  }
	  
	  
	  
	  
		  }

    
      ajax=http_request();
      var valores;  
      valores= "tabla=" + escape(vtabla) + "&idper=" + escape(vidper)+ "&valor=" + escape(vvalor)+ "&nivelRRHH=" + escape(valuenivelRRHH)+ "&id_cc=" + escape(id_cc);   

      divProm="txtprom"+vidper;
      divAprob="txtaprob"+vidper;
  
	  if (vtabla!='ActitudCapac'  ){  
	     if (vtabla!='ObsCapac'  ){ 
	  
///alert("no -- vtabla-ActitudCapac")				
      url="m_GrabaNotasCapacitacionMon.asp";   // nombre de url a invocar
	    } 
	   }		  
	   	  
	  if (vtabla=='ActitudCapac' ){
//alert("vtabla-ActitudCapac")				
	  url="m_GrabaNotasCapacitacionMon_Adic.asp";   // nombre de url a invocar
	   }		  
	  if (vtabla=='ObsCapac'){
///alert("vtabla-ObsCapac")				
	  url="m_GrabaNotasCapacitacionMon_Adic.asp";   // nombre de url a invocar
	   }		  
	  
	  
      ajax.open ('POST', url, true);
      ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         
         else if (ajax.readyState==4){
          if(ajax.status==200){
			 result  = ajax.responseText;
			 result = result.split("|");
		              
                document.getElementById(divProm).innerHTML =result[0] ;
                document.getElementById(divAprob).innerHTML =result[1] ;
          }
          else if(ajax.status==404){
                 document.getElementById(divProm).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
          }
          else{
              document.getElementById(divProm).innerHTML = ajax.responseText;           
          }
        }
      }
      ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
      ajax.send(valores);
       return;  

   }else { 
    if (id=='1' || id=='2' || id=='3'){
   		alert("Debe de Ingresar una Nota") }
	}
}


  
  
</script>
    </head>
    <body>
        <div id="top">
      <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso : Capacitaci&oacute;n de la RO</span></div>
<div id="lateral">

 <form name="frmMiForm" id="frmMiForm" METHOD="POST" >
            <table width='100%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios<span class="criterio">
                  <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                  <input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
                  <input name="id_proy" type="hidden" id="id_proy" value="<%=id_proyecto%>" />
                  <input name="lsRol" type="hidden" id="lsRol" value="<%=lsRol%>" />
                  <input name="lsAulas" type="hidden" id="lsAulas" value="<%=AulasCapa%>" />
                <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
                
                </span></td>
              </tr>
 
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9"><fieldset>
          <legend class="criterio">&nbsp;&nbsp; Seleccione Nivel de RRHH :</legend><br>
          <input type="radio" name="nivelRRHH" id="TD" value="9" checked="checked" onclick="cargosPorNivel(this.value)" />
          <label for="9" class="etiqueta" >TODOS</label>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="nivelRRHH" id="RA" value="1" onclick="cargosPorNivel(this.value)" />
          <label for="1" class="etiqueta">RAO</label>
          &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="nivelRRHH" id="RO" value="2"   onclick="cargosPorNivel(this.value)"/>
          <label for="2" class="etiqueta" >RO</label>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="nivelRRHH" id="RO" value="3"  onclick="cargosPorNivel(this.value)"/><label for="3" class="etiqueta" >RTA</label>
        </fieldset></td>
		      </tr> 
              
                <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Capacitaci&oacute;n:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaCapac()%></td>
              </tr>
              
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Departamento:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaDpto()%></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Provincia:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                  <option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
                </select></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                  <option id="txtDist1" 	title="Todos" value="999999" >Todos </option>
                </select></td>
              </tr>
              <tr id="cargo1">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Cargo:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaCargo()%>
                  <span class="alerta5">(*)</span></td>
              </tr>
              <tr id="cargo2" style="display:none">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Cargo:</span></td>
                <td bgcolor="#F7F8F9" id="cargo2N" class='criterio'><select class='e_combo' name="cmbCargo1" id="cmbCargo1"  style="width:200px;" >
                  <option id="9" 	title="Todos" value="900" >Todos </option>
                </select></td>
              </tr>
               <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Convocatoria:</span></td>
                <td bgcolor="#F7F8F9" class='criterio' id="conv">
                  <select class='e_combo' name="txtConvocartoria" id="txtConvocartoria"  style="width:200px;" >
                  <option id="txtconv" 	title="Todos" value="0" >Todos </option>
                </select></td>
              </tr>
              
              
              <tr>
                <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Locales Capa.:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="reg21"><select class='e_combo' name="txtProv11" id="txtProv11"  style="width:200px">
                  <option id="txtProv11" 	title="Todos" value="9999" > Todos </option>
                </select></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Aula:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis21"><select class='e_combo' name="txtDist11" id="txtDist11"  style="width:200px;" >
                  <option id="txtDist11" 	title="Todos" value="9999" >Todos </option>
                </select></td>
              </tr>
              
              
              <tr height=22>
                <td colspan="2" align="left" bgcolor="#F7F8F9">
                
                <fieldset id="reportes" style="display:none">
          <legend class="criterio">&nbsp;Estado&nbsp;</legend><br>
          <input type="radio" name="treportes" id="T" value="9" checked="checked" />
          <label for="9" class="etiqueta" >Todos</label>
          &nbsp;&nbsp;
          <input type="radio" name="treportes" id="TD" value="1" />
          <label for="1" class="etiqueta" >Aprobados</label>
          &nbsp;&nbsp;
          <input type="radio" name="treportes" id="RA" value="2" />
          <label for="2" class="etiqueta">Desaprobados</label>
          &nbsp;&nbsp;
                </fieldset>
                
                <fieldset id="inscripciones"  style="display:none">
          <legend class="criterio">&nbsp;Estado&nbsp;</legend>
          <input type="radio" name="treportes1" id="T1" value="9" checked="checked" />
          <label for="9" class="etiqueta" >Todos</label><br>
          <input type="radio" name="treportes1" id="TD1" value="1"/>
          <label for="1" class="etiqueta" >Inscripciones Completas</label><br>
          <input type="radio" name="treportes1" id="RA1" value="2"  />
          <label for="2" class="etiqueta">Inscripciones Incompletas</label>
          &nbsp;&nbsp;&nbsp;&nbsp;
                </fieldset>
                
                </td>
              </tr>
              
	          <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onclick="javascript:preseleccionar(10)" 
                        value='Aceptar'></td>
              </tr> 
              
              <% if lsRol=31 then %>
              <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><br><input 
                        name='button1'  type='button' class="botonR" 				
                        id='button1' 
                        onclick="javascript:calcular_rankinNac(1)" 
                        value='RANKING NACIONAL'><br></td>
              </tr>
              
              <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><br><div id="cargando"></div><br></td>
              </tr>
              
              
               <tr height=22 bgcolor="#DFEEFD">
                <td colspan="2" align="left" >
                <fieldset>
          <legend class="criterio">&nbsp;&nbsp; Proceso de Cierre: &nbsp;&nbsp; </legend><br>
                <span class="criterio">Tipo Cierre:</span>&nbsp;
                <select class='e_combo' name="txtCierre" id="txtCierre"  style="width:150px">
                <option id="txtProv1" title="Todos" selected value="0" >Seleccione... </option>
                  <option id="txtProv1" title="Todos" value="1" > Cerrar Nacional </option>
                  <option id="txtProv1" title="Todos" value="2" > Abrir Nacional </option>
                  <option id="txtProv1" title="Todos" value="3" > Cerrar en Ubigeo Actual </option>
                  <option id="txtProv1" title="Todos" value="4" > Abrir en Ubigeo Actual </option>
                </select><br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onclick="javascript:procesarCierre(3)" 
                        value='Procesar'>
                        
                 </fieldset>       </td>
              </tr> 
              <%end if %>
              
              
            </table>
           
          </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" align="center"></div>
		  <div id="mensaje"></div>
            <iframe id="iframe" width="100%" height="100%" src="" frameborder="0"></iframe>
            </div>
        </div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>

        <!-- scripts -->
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>