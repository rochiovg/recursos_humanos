<%@ Language=VBScript %>
<!--#include file="conexion.asp"-->
<!--#include file="Include/pd_funcion.asp"-->
<%



lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
lsPuesto = Session("id_puesto")


If lsUbigeo <> "" then

If Request.Form <> "" Then
	lsOperacion = Request.Form("txtOper")
	lsOpcion = Request.Form("txtOpcion")
	lsNombre = Request.Form("txtNombre")
	lsApePaterno = Request.Form("txtApePaterno")
	lsApeMaterno = Request.Form("txtApeMaterno")
	lsDNI = Request.Form("txtDNI")
	lsCodigo = Request.Form("txtCODIGO")	
	
	If lsOperacion = "1" Then
		
		Set RS = Server.CreateObject("ADODB.Recordset")
		RS.CursorType = adOpenKeyset 

	End If
End If



sub generaCargo()

	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO_MIGRA '9','"&id_proyecto&"' ")
	
	
	

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
 
 
%>
<HTML>
<HEAD>
<title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
<link rel="stylesheet" type="text/css" href="Styles/inei.css">
<script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript" src="js/envio_ajax.js"></script>
<script>

function getHTTPObject() {
    var xmlhttp;
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
       try {
          xmlhttp = new XMLHttpRequest();
       } catch (e) { xmlhttp = false; }
    }
    return xmlhttp;
}

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



function generaConvocatoria(valor){     
	 var varcargo =valor;   
	ajax=http_request();
	
	var valores;	
	valores= "datos=" + escape(varcargo);  // parametros a enviar al servidor	
	
	
	url="m_numConvocatoria_tmp_fichas.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("conv").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("conv").innerHTML =ajax.responseText;
					//act_convocatoria("");
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("conv").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("conv").innerHTML = ajax.responseText;
					 //act_convocatoria("");	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function act_convocatoria(valor)
{
	 var eyeframe; 
            eyeframe = document.getElementById('Archivos_Subir'); 
                  
				  
            var eyeframedoc; 
            eyeframedoc = eyeframe.contentWindow ? eyeframe.contentWindow.document: eyeframe.contentDocument; 
         /*    
			 
			 
			 if ( valor  !="" ) {
	var valores;	
	valores= "datos=" + escape(valor);  // parametros a enviar al servidor	
	
	
	url="tmp_id_convocatoriacargo.asp";  
	ajax.open ('POST', url, true);
 ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje1").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            		document.getElementById("mensaje1").innerHTML =ajax.responseText;

            }
            else if(ajax.status==404){
                    document.getElementById("mensaje1").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

               document.getElementById("mensaje1").innerHTML = ajax.responseText;	

            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   }*/
   
   
   
            eyeframedoc.getElementById('id_convocatoriacargo').value=valor; 
	


	
	
   
	
	
	}



function VERFORMATO(valor)
{		
	 pagina = "formato_seg.asp";
	 win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
	 
	
	 

}


function verSegmentacion(valor)
{		
	 pagina = "m_segmentacionvalExp.asp";
	 win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}


function verCodigoseXP(valor)
{		
	 pagina = "m_cargosCampoeXP.asp";
	 win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function verCodigos(){

	ajax=http_request();
	var valores;	
	valores= "";  // parametros a enviar al servidor	
	url="m_cargosCampo.asp";  
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


function validar(){

	ajax=http_request();
	var valores;	
	valores= "";  // parametros a enviar al servidor	
	url="m_segmentacionval_ETMP_fichas.asp";  
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

function actualizar(indicador){

	ajax=http_request();
	var valores;	
	
	
	 id_convocatoriacargo = document.getElementById("txtConvocartoria").value;
	 
	 if ( id_convocatoriacargo  ==  "") 
	 {
		 alert("Debe de seleccionar la convocatoria");
		 return
		 }
		 
		 
	
	
	
	
	
	valores= "indicador="+indicador+"&id_convocatoriacargo="+id_convocatoriacargo;  // parametros a enviar al servidor	
	url="m_actualizarETMP_fichas.asp";  
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

</script>
</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
<!--#include file="cabecera.html"--> 
<!--#include file="pd_menu.asp"-->

<div id="divNavegacion" align="center"><span class="subtitulo">FICHAS MASIVAS</span></div>

<form name="form1" id="form1" METHOD="POST" ACTION="pd_eliminacion.asp">
  <table width="40%" border="1" align="center" bordercolor="#DAE8F3"cellpadding="2" cellspacing="2" >
  
  
     <tr style="width:35%">
      <th colspan="2" bgcolor="#DAE8F3" style="width:35%">
           <a href="csv/formato-fmasivo.xls" download="formato-fmasivo"> <input name="button1" type="button"  id="button1"   value="Descargar Formato"></a>
      </th>
     
    </tr>
  
     
  
    <tr style="width:35%">
      <th colspan="2" bgcolor="#DAE8F3" style="width:35%"><span class="aplicacion"> Subir Archivo
          <iframe width="100%" height="150px" id="Archivos_Subir" name="Archivos_Subir"  style="border:none;" src="carga_archivosCSV_ETMP_fichas.asp"></iframe>
      </span></th>
     
    </tr>
    
        <tr style="width:35%">
  <td  align="center" colspan="2">
  <input name="button2" type="button" class="boton" id="button2" onClick="javascript:validar('1')"   value="Verificar">
  
  </td>
     
    </tr>
    
    
     <tr style="width:35%">
      <th colspan="2" bgcolor="#DAE8F3" style="width:35%"><span class="aplicacion"> Actualizar Fichas
         </th>
     
    </tr>
    
    
    <tr id="cargo1">
      <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Cargo:</span></td>
      <td bgcolor="#F7F8F9" class='criterio'><%generaCargo()%>
        <span class="alerta5">(*)</span></td>
      
    </tr>
    <tr>
      <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Convocatoria:</span></td>
      <td bgcolor="#F7F8F9" class='criterio' id="conv"><select class='e_combo' name="txtConvocartoria" id="txtConvocartoria"  style="width:200px;" >
          <option id="txtconv" 	title="Todos" value="0" >Todos </option>
        </select></td>
    </tr>
    <tr>
      <td  align="center" colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input name="button1" type="button" class="boton" id="button1" onClick="javascript:actualizar('1')"   value="CARGAR ARCHIVO"></td>
     
    </tr>
  </table>
</form>
<div align="center">
  <div id="mensaje" style="width:80%; height:50%; overflow:scroll" class="aplicacion" align="center"> </div>
    <div id="mensaje1" style="width:80%; height:50%; overflow:scroll" class="aplicacion" align="center"> </div>
    
</div>
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
