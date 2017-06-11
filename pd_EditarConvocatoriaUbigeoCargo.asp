<%@ Language=VBScript %>
<%session.lcid=2057%>
<!-- #include file="Conexion.asp"  -->
<%  		 	 
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 

Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario = Session("id_usuario")
Id_ConvocatoriaCargo=Request("lsIdConvocatoriaCargo")


sub generaDpto2()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_dpto_cerresidencia   ")
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto2"" name=""txtDpto2""   onChange=""generaprov2()"" >"
	Response.Write " <option id="""" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

	
End sub


sub generaNivel()
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getNivel ")
		
	While not wRsDptoapli.EOF
		Response.Write "<input class=""checkbox1"" type=""checkbox"" name="""& wRsDptoapli(0) &""" id=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "<br/>"
		wRsDptoapli.MoveNext
	Wend
		
	Response.Write "</select>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaGrado()
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getGrado ")
		
	While not wRsDptoapli.EOF
		Response.Write "<input type=""checkbox""  class=""checkbox2""  name="""& wRsDptoapli(0) &""" id=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "<br/>"
		wRsDptoapli.MoveNext
	Wend
		
	Response.Write "</select>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

%>
<html>
<head>
<title>..:: SISTEMA DE CONSECUCI&OACUTE,N DE RECURSOS HUMANOS ::..</title>
<link rel="stylesheet" type="text/css" href="Styles/inei.css">
<style>
p {
	white-space: pre-line;
}
</style>
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


function mod_pres(id_cc,valor,campo)
{
	
	//valor=valor.replace(/<li\s*\/*><br><li>/g,"\n");
	valor=valor.replace(/<br>/g,"\n");
	ajax=http_request();
	var valores;	
	valores= "lsid_cc=" + escape(id_cc)+"&lsvalor="+escape(valor)+"&lsCampo="+campo+"&lsTipo=68";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("p"+campo).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
				document.getElementById("p"+campo).innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                document.getElementById("p"+campo).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("p"+campo).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	


}
function grabar_ModPres(lsid, valor_nuevo,campo)
{
	ajax=http_request();
	
	valor_nuevo=valor_nuevo.replace(new RegExp("\\n","g"),'<br>');	
	var valores;	

	
	valores= "lsId_cc=" + escape(lsid)+"&lsvalor="+escape(valor_nuevo)+"&lsCampo="+escape(campo)+"&lsTipo=69";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("p"+campo).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            						
					objetivo=ajax.responseText.replace(new RegExp("---","g"),'<br>');								
					document.getElementById("p"+campo).innerHTML =objetivo;
					
            }
            else if(ajax.status==404){
                     document.getElementById("p"+campo).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     objetivo=ajax.responseText.replace(new RegExp("\\n","g"),'<br>');								
					document.getElementById("p"+campo).innerHTML =objetivo;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function guardar(div,id,valor){
	
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&valor=" + escape(valor)+"&div=" + escape(div)+"&lsTipo=105";  // parametros a enviar al servidor	
		

		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById(div).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById(''+div+'').innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                      document.getElementById(''+div+'').innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById(''+div+'').innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function EliminarUbigeocargo(id, ccdd,ccpp, ccdi, tipo){
 	if (confirm("Esta seguro(a) de modificar este registro?")) {
		
		pea=0
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&ccdd=" + escape(ccdd)+"&ccpp=" + escape(ccpp)+"&ccdi=" + escape(ccdi)+"&pea=" + escape(pea)+"&tipo=" + escape(tipo)+"&lsTipo=107";  // parametros a enviar al servidor	
		

		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divLug").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				alert("El cambio se realizo correctamente")
            		location.reload(true);
            }
            else if(ajax.status==404){
                      document.getElementById("divLug").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divLug").innerHTML = ajax.responseText;	
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



function AddUbigeocargo(id,tipo){
 	if (confirm("Esta seguro(a) de agregar el registro?")) {
		
	var ccdd =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
	if (ccdd==""){
		alert("Seleccione un Departamento");
		return false
		}
	
	var ccpp =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
	if (ccpp==""){
		alert("Seleccione una Provincia");
		return false
		}
		
		
		
		
	var ccdi =document.getElementById("txtDist2").options[document.getElementById("txtDist2").selectedIndex].value;
	if (ccdi==""){
		alert("Seleccione un Distrito");
		return false
		}
		
		
	var pea=document.getElementById("peaNue").value;
	if (pea==""){
		alert("Seleccione la cantidad ed Personal que se requiere");
		return false
		}
		
		
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&ccdd=" + escape(ccdd)+"&ccpp=" + escape(ccpp)+"&ccdi=" + escape(ccdi)+"&pea=" + escape(pea)+"&tipo=" + escape(tipo)+"&lsTipo=107";  // parametros a enviar al servidor	
		

		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divLug").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            		alert("Se agrego el ubigeo correctamente")
					location.reload(true);
				//	document.getElementById("divLug").innerHTML = ajax.responseText;
            }
            else if(ajax.status==404){
                      document.getElementById("divLug").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divLug").innerHTML = ajax.responseText;	
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



function generaprov2(){
     
    var varDpto =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
    
	ajax=http_request();
	var valores;	
	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	

	
	url="m6_Provincia2.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov2").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov2").innerHTML =ajax.responseText;
					verdis3();
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

function verdis2(){

    
    var varProv =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
 

	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m6_Distrito3.asp";  
	
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

function grabarNG(){

	var nivel='';
	var grado='';
					
	$('.checkbox1').each(function(){ 
	var checkbox1 = $(this); 
					//alert('El checkbox ' + checkbox1.attr('name') + ' está checkeado? ' + checkbox1.is(':checked') ); 
	if (checkbox1.is(':checked')==true)
		nivel=nivel+checkbox1.attr('name')+',';
	});
					
	$('.checkbox2').each(function(){ 
	var checkbox2 = $(this); 
					//alert('El checkbox ' + checkbox1.attr('name') + ' está checkeado? ' + checkbox1.is(':checked') ); 
	if (checkbox2.is(':checked')==true)
		grado=grado+checkbox2.attr('name')+',';
	});
	
	if (nivel==''){
		alert('Seleccione Nivel Académico');
		return false;
	}
		
	if (grado==''){
			alert('Seleccione Grado Académico');
			return false;
	}
	
}


</script>
<style type="text/css">
<!--
.style4 {
	font-weight: normal;
	font-size: 11px;
	font-family: verdana, arial, sans-serif;
	text-align: left;
	padding: 2px;
}
.style5 {
	font-weight: normal;
	font-size: 10px;
	font-family: verdana, arial, sans-serif;
	text-align: left;
	padding: 2px;
}
-->
</style>
<style>
<!--
A:link {
	text-decoration: none
}
A:visited {
	text-decoration: none
}
-->
</style>
</head>
<%

consulta = "EXEC dbo.get_publicacion '"&Id_ConvocatoriaCargo&"'" 


	Set RsP1	= Server.CreateObject("ADODB.Recordset") 
	RsP1.cursorlocation=3
	RsP1.Open consulta, MiCone, 3,3

consulta1 = "EXEC dbo.get_Convocatoriacargo '"& Id_ConvocatoriaCargo & "'" 
  	

	Set RsP	= Server.CreateObject("ADODB.Recordset") 
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3

	     
	If  Not RsP.BOF And Not RsP.EOF Then  %>

<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
  <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3">
    <tr>
      <td  align="center" bgcolor="#DAE8F3" class="subtitulo">Ubigeo</td>
    </tr>
    <tr>
      <td><div id="CollapsiblePanel1" >
        <div >
            <% SQL5 = "exec dbo.pa_ubigeocaro_listarPea_Editar '"&Id_ConvocatoriaCargo&"' "	
		

		Set RSCuad5	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad5.cursorlocation=3
		RSCuad5.Open SQL5, MiCone, 3,3
		
If Not RSCuad5.BOF And Not RSCuad5.EOF Then %>
            <table class="tabla2"  border="1" cellpadding="2" cellspacing="2" id= bordercolor="#DAE8F3"  align="center" >
              <tr>
                <th colspan="5" class="etiqueta2"><div align="center"><strong>Personal Convocado por ODEI</strong></div></th>
              </tr>
              <tr>
                <th  bordercolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>DEP</strong></div></th>
                <th  bordercolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>PROV</strong></div></th>
                <th  bordercolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>DIST</strong></div></th>
                <th align="center"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="etiqueta2"><div align="center"><strong>Personal Requerido</strong></div></th>
                <th align="center"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="etiqueta2"><div align="center"><strong>Editar </strong></div></th>
              </tr>
              <%  		
							
			Do While Not RSCuad5.EOF %>
              <tr class='<%=clase%>'>
                <td class='etiqueta'>&nbsp;<%=RSCuad5.Fields("DPTO")%></td>
                <td class='etiqueta'>&nbsp;<%=RSCuad5.Fields("PROV")%></td>
                <td class='etiqueta'>&nbsp;<%=RSCuad5.Fields("DIST")%></td>
                <td class='etiqueta' id="co<%=RSCuad5.Fields("codigo")%>"><input name="<%=RSCuad5.Fields("codigo")%>" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="<%=RSCuad5.Fields("codigo")%>" value="<%=RSCuad5.Fields("pea")%>"  onblur="guardar('co<%=RSCuad5.Fields("codigo")%>',this.id,this.value)" size="5" maxlength="5" /></td>
                <td class='etiqueta'><%if RSCuad5.Fields("estado")=1 then%>
                  <img src="images/eliminar.png" title="Deshabiliatr ubigeo" style="CURSOR:HAND"  onclick="EliminarUbigeocargo('<%=Id_ConvocatoriaCargo%>','<%=RSCuad5.Fields("id_ccdd")%>','<%=RSCuad5.Fields("id_ccpp")%>','<%=RSCuad5.Fields("id_ccdi")%>', '1')" ></img>
                  <%else%>
                  <img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="EliminarUbigeocargo('<%=Id_ConvocatoriaCargo%>','<%=RSCuad5.Fields("id_ccdd")%>','<%=RSCuad5.Fields("id_ccpp")%>','<%=RSCuad5.Fields("id_ccdi")%>', '2')" ></img>
                  <%end if%>
                  <div id="divLug"></div></td>
              </tr>
              <%
			RSCuad5.MoveNext
			Loop	
			RSCuad5.close
			set RSCuad5=nothing 
 %>
              <tr class='<%=clase%>'>
                <td class='etiqueta'><% generaDpto2()%></td>
                <td class='etiqueta' id="prov2"><select name="txtProv2" id="txtProv2"   class='e_combo' style="width:200px;" >
                    <option title="Todos" value=""  selected>Seleccione... </option>
                  </select></td>
                <td class='etiqueta' id="distcon"><select name="txtDist2" id="txtDist2"  class='e_combo' style="width:200px;">
                    <option title="Todos" value="" selected>Seleccione...</option>
                  </select></td>
                <td class='etiqueta' ><input name="peaNue" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="peaNue" value=""  size="5" maxlength="5" /></td>
                <td class='etiqueta'><img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="AddUbigeocargo('<%=Id_ConvocatoriaCargo%>','3')" ></img>
                  <div id="divLug"></div></td>
              </tr>
            </table>
            <%end if %>
            <p class="etiqueta2">&nbsp;</p>
          </div>
        </div>
        <br></td>
    </tr>
  </table>
  <% else %>
  <table width='95%' align='center'>
    <tr>
      <td class='subtitulo' colspan='4'>&nbsp;</td>
    </tr>
  </table>
</form>
<% end If %>
</body></html>