<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 
<%

lsUsuario =  Session("id_usuario")

sub generaProfesion()

Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_profesion_Algoritmo ")
	
	
	if wRsDptoapli(2)=0 then
	flgT="checked"
	valT=0
	else
	flgT=""
	valT=1
	end if
	
	
	Response.Write "<input type=""checkbox"" value="&valT&" "&flgT&" onclick="" guardarCargo(this.value,this.id,0)""  name=""todosD"" id=""todosD""  >TODOS DEPARTAMENTOS <br/>"
	
	While not wRsDptoapli.EOF
	if wRsDptoapli(2)=1 then
	flg="checked"
	val=0
	else
	flg=""
	val=1
	end if
	
		Response.Write "<input type=""checkbox"" class=""checkDep"" onclick="" guardarCargo(this.value,this.id,1)"" value="&val&" "&flg&" name=""" & wRsDptoapli(0) & """ id=""" & wRsDptoapli(0) & """ >" &wRsDptoapli(1) & "<br/> "
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
end  sub






%>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>..:: Conseccuci&oacute;n de Recursos Humanos ::.. </title>
	
    <link rel="stylesheet" type="text/css" href="Styles/inei.css">
<script type="text/javascript" src="js/jquery.js"></script> 
<script type="text/javascript" src="js/jquery.min.js"></script>

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


function guardarCargo(valor, codigo, indicador){
	
	var valores="codigo="+escape(codigo)+"&valor="+escape(valor)+"&indicador="+escape(indicador)+"&lsTipo=103";

	var peticion=$.ajax(
		{
	     url:'m_ingreso.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
		 success:function (respuesta) { 
		 document.getElementById("txtProfesion").value=1;
		  } ,
         error:function (){  alert('Se a producido un Error'); }
  		} );		
}



function verProfesion(){
	
ajax=http_request();
	var valores;	
	valores= "";  // parametros a enviar al servidor	
	
	url="m_VerProfesion.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divVistaProfesion").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divVistaProfesion").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divVistaProfesion").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divVistaProfesion").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
    
    
}

function Grabar(){

	if (document.getElementById("txtProfesion").value=''){
		alert("Agregue Profesiones");
		return false;	
	} else{
	opener.document.getElementById("txtprofesionesTot").value='1';
	window.close() 
	}
}

function limpiar(){
	
	$('input[class=checkDep]').attr('checked', false);
	$('input[name=todosD]').attr('checked', false);
	
	document.getElementById("txtProfesion").value='';
	
	var valores="lsTipo=104";

	var peticion=$.ajax(
		{
	     url:'m_ingreso.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#divVistaProfesion").html("Cargando...");
								
							  },
		success:function (respuesta) {
			$("#divVistaProfesion").html(respuesta);
               document.frmMiForm.reset();
	          
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#divVistaProfesion").html("");
			 
      }
  }
  );
	

}



</script>
	
</head>
<body>
<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_ConvocatoriaCargo.asp">
<div id="divNavegacion" align="center"><span class="subtitulo">Registro: Cargos paar Convocatoria</span></div>
<table width="648" border="0" align="center" cellpadding="2" bordercolor="#DAE8F3" cellspacing="2" >
 							<tr>
 							  <td height="24" colspan="2" align="center" class='etiqueta'><input type="hidden" name="txtProfesion" id="txtProfesion" /></td>
					  </tr>
 							<tr bgcolor="#DAE8F3"  >
 							  <td align="center" class="aplicacion" >Ubigeos a Seleccionar</td>
 							  <td align="center" class="aplicacion" >Ubigeos Seleccionados</td>
  </tr>
 							<tr>
 							  <td border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" width="355" class='etiqueta'><table width="311" height="88" border="0" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
 							    <tr>
 							      <td width="350" height="23">
 							        
 							        <div id="divCargos" style="height: 200px; overflow:auto; font-size:12px; font-family:Verdana, Geneva, sans-serif; "><%generaProfesion()%></div>
                                    
                                    </td>
                                    
						        </tr>
						      </table></td>
 							  <td width="355" class='etiqueta'><table width="315" height="150" >
 							  							    <tr>
 							      <td width="350"> 
 							      <div id="divVistaProfesion" style="height: 200px; overflow:auto; font-size:12px; font-family:Verdana, Geneva, sans-serif;"> 
 							      </div>
 							      
 							      </td>
						        </tr>
						      </table></td>
							</tr>
 							<tr>
 							  <td align="center" ><input type="button"  name="btnAgregar" class="boton" id="btnAgregar"  onclick="javascript:verProfesion();" value="Agregar" /></td>
 							  <td align="center"><input type="button"  name="btnLimpiar" class="boton" id="btnLimpiar" style="font-family:Arial; font-size:8pt;" value="Remover" onclick="javascript:limpiar()" /></td>
							</tr>
 							<tr>
 							  <td  align="center" colspan=2 >
 							  <input type="button" name="btnGrabar" class="boton" id="btnGrabar" onClick="javascript:Grabar()" value="Grabar" />
 							  </td>
						   </tr>
				  </table>

</form>
</body>
</html>