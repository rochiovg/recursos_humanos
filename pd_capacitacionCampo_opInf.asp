<%@ Language=VBScript %>

<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario1 =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist= Session("UbigeoDist")
lsUsuario=Session("id_usuario")

id_proyecto=session("id_proyecto")  

AulasCapa=Session("aulas") 

%>

<script type="text/javascript">
function exportarExcelCapa()
{
   var valuenivelRRHH=1;
  var idproyecto=<%=session("id_proyecto")%>
  if (valuenivelRRHH==8)
  {
      var lsDPTO = "";
      var lsPROV = "";
      var lsDIST = "";
      
      var lsCargo1 = "";
      var lsCargo = "";
      
    if (idproyecto==14)
    {
      var url="exportarCapacitacionExcel_14.asp";
    } else 
      var url="exportarCapacitacionExcel.asp";



  }
  else
  {   
     if (idproyecto==14)
    {
      var url="exportarCapacitacionN2Excel_14.asp";
    } else 
      var url="exportarCapacitacionN2Excel.asp";

   
      
     if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
     {
          alert("Selecciona el Departamento");
       document.frmMiForm.txtDpto1.focus();
       return false;
       
       }   
         if(document.frmMiForm.txtProv1.value == '' )
     {
       alert("Selecciona el Local del Capacitacion");
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
      
      var lsCargo1 = "00";
      var lsCargo = valuenivelRRHH;
      var capacitacion=document.getElementById("txtCap").value; 

    

    }
    var lsConvocaroria = "00";

    pagina = url+"?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&nivelRRHH="+escape(valuenivelRRHH)+"&lsConvocaroria="+escape(lsConvocaroria)+"&capacitacion="+escape(capacitacion);

    win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');



}

</script>


<%

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '9','"&id_proyecto&"' ")
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" OnChange=""generaConvocatoria(this.value);"" >"
	
	Response.Write " <option value=""200"">Todos</option>"
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
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaLocales();"">"
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
	sql1 = " exec dbo.pa_capacitacionpea_listar_OP '"&id_proyecto&"' "

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
      <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
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

function fs_numeros(e) {
	
        tecla = (document.all) ? e.keyCode : e.which; 

		if (tecla < 48 || tecla > 57) {
			return false;
			
		}
        if (tecla==8 || tecla!=13) return true;
}

function fs_numeros_dec(e) {
	
        tecla = (document.all) ? e.keyCode : e.which; 

		if ((tecla < 48 || tecla > 57)  && tecla!=46 ) {
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

function MostrarBoton(){
	
	
	var rep =document.getElementById("cboReporte").options[document.getElementById("cboReporte").selectedIndex].value; 
	if (rep==7){
		document.getElementById("button3").style.display='block';
		}
		else{
			document.getElementById("button3").style.display='none';
			}
	if (rep==5){
		document.getElementById("button5").style.display='block';
		}
		else{
			document.getElementById("button5").style.display='none';
			}
	
}





function guardarMin(periodo, valor){


   if (valor!='' ) {
	   
	   if (valor>=41){
		   alert ('La nota m\xednima tine que ser menor a 40')
		   document.getElementById("notMin").value="";
		   document.getElementById("notMin").focus();
		   return false;
		   }
    
      ajax=http_request();
      var valores;  
      valores= "periodo=" + escape(periodo) + "&valor=" + escape(valor);   
      url="m_GrabaNotaMin.asp";   // nombre de url a invocar
      ajax.open ('POST', url, true);
      ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         
         else if (ajax.readyState==4){
          if(ajax.status==200){
			  capacitacionCampo(<%=id_proyecto%>);
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
 }




function guardarCAPAED(vtabla,vidper,vidCapa,vvalor, id){
	
		valuenivelRRHH=2;
		cap=document.getElementById("txtCap").value;

   if (vvalor!='') {
	    
	   if (id==1){
		   
		if (cap==1 || cap==5)  { 
			if (vvalor>8){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 8');
				document.getElementById("txtp1"+vidper).value="";
				document.getElementById("txtp1"+vidper).focus();
				return false;
				}  
			}
			
			if (cap==2 || cap==4 || cap==16 || cap==17)  { 
			if (vvalor>10){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 10');
				document.getElementById("txtp1"+vidper).value="";
				document.getElementById("txtp1"+vidper).focus();
				return false;
				}  
			}
	   }
	   if (id==2){
		   if (cap==1 || cap==5)  { 
			if (vvalor>12){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 12');
				document.getElementById("txtp2"+vidper).value="";
				document.getElementById("txtp2"+vidper).focus();
				return false;
				}  
		   }
		    if (cap==2 || cap==4 || cap==16 || cap==17)  { 
			if (vvalor>20){
				alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
				document.getElementById("txtp2"+vidper).value="";
				document.getElementById("txtp2"+vidper).focus();
				return false;
				}  
		   }
	   }
	   
	    if (id==3){
			if (cap==1 || cap==5)  {
				if (vvalor>20){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
					document.getElementById("txtp3"+vidper).value="";
					document.getElementById("txtp3"+vidper).focus();
					return false;
					}
			}
			
			if (cap==2 || cap==4 || cap==16 || cap==17 )  {
				if (vvalor>20){
					alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
					document.getElementById("txtp3"+vidper).value="";
					document.getElementById("txtp3"+vidper).focus();
					return false;
					}
			}
	   }
	   
	   if (id==4){
		if (vvalor>20){
			alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 20');
			document.getElementById("txtp4"+vidper).value="";
			document.getElementById("txtp4"+vidper).focus();
			return false;
			}   
	   }
	   
	   if (id==5){
		if (vvalor>20){
			alert ('Error de registro, la puntuaci\xf3n para este criterio es de 0 a 30');
			document.getElementById("txtp5"+vidper).value="";
			document.getElementById("txtp5"+vidper).focus();
			return false;
			}   
	   }
	   
    
      ajax=http_request();
      var valores;  
      valores= "tabla=" + escape(vtabla) + "&idper=" + escape(vidper)+ "&idCapa=" + escape(vidCapa)+ "&valor=" + escape(vvalor)+ "&nivelRRHH=" + escape(valuenivelRRHH)+ "&cap=" + escape(cap);   
	  
	     
      divProm="txtprom"+vidper;
      divAprob="txtaprob"+vidper;
	   
      url="m_GrabaNotasCapacitacionED.asp";   // nombre de url a invocar
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







function generaLocales(){
     
      var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	  
	  var cap =document.getElementById("txtCap").value;
	  
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&cap="+cap;  // parametros a enviar al servidor	
	
	url="m_LocalesCapacitacionUsuario_ed.asp";  
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



function verAulas(){

 var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 var AulasCapa =document.getElementById("lsAulas").value;

	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&Aulas="+escape(AulasCapa);  // parametros a enviar al servidor	
	
	url="m_AulasCapacitacionUsuario.asp";  

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
  if (valor==8)
  {
    document.getElementById("txtDpto1").setAttribute("disabled", true);
    document.getElementById("txtProv1").setAttribute("disabled", true);
    document.getElementById("txtDist1").setAttribute("disabled", true);
    document.getElementById("cmbCargo").setAttribute("disabled", true);
    document.getElementById("txtConvocartoria").setAttribute("disabled", true);

  }
else
{
    document.getElementById("txtDpto1").removeAttribute("disabled");
    document.getElementById("txtProv1").removeAttribute("disabled");
    document.getElementById("txtDist1").removeAttribute("disabled");
    document.getElementById("cmbCargo").removeAttribute("disabled");
    document.getElementById("txtConvocartoria").removeAttribute("disabled");



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
}



function Seleccionar(id_per,valor){
	
		ajax=http_request();
		var valores;	
		valores= "id_per=" + escape(id_per) + "&valor=" + escape(valor);  
		
		url="m_registraTitularidad.asp";   // nombre de url a invocar
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
			 
			 }
			 
			 else if (ajax.readyState==4){
				if(ajax.status==200){
				alert('Los Datos Han Sido Correctamente Grabados');
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



</script>
    </head>
    <body>
        <div id="top">
          <!--#include file="cabecera.html"-->
          <!--#include file="pd_menu.asp"-->

       </div>
    <div id="divNavegacion" align="center"><span class="subtitulo"><input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
    <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" /></span></div>     
       
<div id="divNavegacion" align="center"><span class="subtitulo">Registro Notas  Campo</span></div>      
  <div id="lateral">
                 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_consultas.asp">
            <table width='100%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios<span class="criterio">
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                  <input name="lsAulas" type="hidden" id="lsAulas" value="<%=AulasCapa%>" />
                  <input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
                <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
                </span></td>
              </tr>
 
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9">
                <%if id_proyecto=1 then%>
                <fieldset>
          <legend class="criterio">&nbsp; Seleccione Nivel de Capa:</legend>
          <input type="radio" name="nivelRRHH" id="INS" value="8"  onClick="cargosPorNivel(this.value)" />
          <label for="9" class="etiqueta" >Nivel 1</label>
          <input type="radio" name="nivelRRHH" id="RA" value="1"  onClick="cargosPorNivel(this.value)" />
          <label for="1" class="etiqueta">Nivel 2</label>
          &nbsp;&nbsp;<input type="radio" name="nivelRRHH" checked="checked" id="RO" value="2"   onclick="cargosPorNivel(this.value)"/>
          <label for="2" class="etiqueta"  >Nivel 3</label>&nbsp;&nbsp;
         
        </fieldset>
        <%else%>
        
        <%end if%>
        </td>
		      </tr> 
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Proceso</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaCapac()%></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Departamento:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaDpto()%></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Locales Capa.:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                  <option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
                </select></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Aula:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                  <option id="txtDist1" 	title="Todos" value="9999" >Todos </option>
                </select></td>
              </tr>
              
              
	          <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onClick="javascript:capacitacionCampoOp(<%=id_proyecto%>)" 
                        value='Aceptar'></td>
              </tr>
	          <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9">&nbsp;</td>
                        
              </tr>
              
               <tr height=22 style="display:none">
	            <td colspan="2" align="left" bgcolor="#F7F8F9">&nbsp;</td>
                        
              </tr>
              
               <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button3' style="display:none"  type='button' class="botonR" 				
                        id='button3' 
                        onclick="javascript:exportarRA(2)" 
                        value='Exportar F2 Capacitaci&oacute;n Hist&oacute;tico' /></td>
                        
              </tr>
              
              
            <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button5' style="display:none"  type='button' class="botonR" 				
                        id='button5' 
                        onclick="javascript:exportarRA(2)" 
                        value='Exportar F2 Selecci&oacute;n Hist&oacute;tico' /></td>
                        
              </tr>
              
            </table>
          </form>
    </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
            <div id="mostar_detalle2" style="display:none"  >
                <table width="100%" border="0">
				  <tr>
				    <td align="center"><form action="reporte.asp" method="post" target="_blank" id="FormularioExportacion">
                      <div align="center" style="padding:5px,5px,5px,5px;"><img src="images/excell1.gif" alt="" class="botonExcel" title="EXPORTAR A EXCEL" /></div>
                      <input type="hidden" id="datos_a_enviar" name="datos_a_enviar" />
                    </form></td>
			      </tr>
				  <tr>
				    <td align="center"><span class="criterio">(Exportar Excel)</span></td>
			      </tr>
			    </table></div>
          <div id="divDetallem" style="width:100%; height:460px; overflow:auto; float: left ; position: inherit; vertical-align:top;"> </div>
              
               <div id="deta" style="width:100%; float:left; position:inherit;  vertical-align:top;"> </div>
            <div id="mensa" style="width:100%; float:left; position:inherit; vertical-align:top;"> </div>
            <iframe id="iframe" width="100%" height="100%" src="" frameborder="0"></iframe>
            </div>
        </div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario1%> </span>
        </div>

        <!-- scripts -->
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
