<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 

<%
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

idProyecto=Session("id_proyecto")
lsIdConvocatoriaCargo= Request("lsIdConvocatoriaCargo")



	WTitulo		= "PEA REGISTRADA PARA CONTRATACI&Oacute;N DIRECTA O CONTINUIDAD DE CONTRATO" 


	SQL1 = "execute PA_FICHA_REGISTRO_CONDIRECTA '"&lsidConvocatoriaCargo&"','"&idProyecto&"' "
		
	Set RS3 = Server.CreateObject("ADODB.recordset") 
	RS3.cursorlocation=3 
	RS3.Open SQL1, MiCone, 3,3 


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
If lsUbigeo <> "" then


%>
<html>
<head>
<title>PEA a Contratar</title> 
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="Styles/inei.css">

<script src="js/valida_fecha.js"></script>
<script language="javascript"> 



function CambioPag()
{		
	document.frmMANTE_Proc.submit(); 
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


	
function bloqueo_contrato(id,valor)
{
if (document.getElementById(''+id+'').checked==false)
val=0
else 
val=valor

ajax=http_request();

var id_per=id.substring(1);

	var valores;	
	valores= "lsidper=" +id_per+"&lsvalor="+escape(val)+"&lsTipo=114";  // parametros a enviar al servidor	
	
url="m_ingreso.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("a"+id_per).innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("a"+id_per).innerHTML =ajax.responseText;
					alert('Se bloquear\xe1 contrataci\xf3n de la persona')
            }
            else if(ajax.status==404){
                     document.getElementById("a"+id_per).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("a"+id_per).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 	
	}

function enviarcard(dni)
{		
	 			
 pagina = "contacto.asp?lsdni=" + dni ;
	win = window.open(pagina,'','width=600,height=250,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

</script> 



</head> 
<body leftmargin="5" topMargin="1"> 

<form Id="frmMANTE_Proc" name="frmMANTE_Proc" method="post" action="pd_PEA_Inscrita.asp">
  <input type="hidden" name="lsIdConvocatoriaCargo" Id="lsIdConvocatoriaCargo" value="<%=lsIdConvocatoriaCargo%>">
<%
	'actualizamos numero de pagina
	If Request.Form("pag")<>"" Then 
		Pag=Request.Form("pag")
	Else
		Pag=1
	End If

	num_registros = 30 
	'Dimensionamos las paginas y determinamos la pagina actual
	If RS3.RecordCount > 0 Then 
		RS3.PageSize=num_registros
		RS3.AbsolutePage=Pag
	End If 
	
	If RS3.RecordCount > 0 Then 
		cargomostrar=RS3.Fields("cargo")
	else
		cargomostrar=""
	End If 
	
	%>

	<table border="0" width="95%" align="center" cellpadding="0" cellspacing="0"> 
		<tr ><td align="right" Class="e_td_string1" width="100%">
             Página:&nbsp; 
			<select name="pag" onChange="CambioPag()" style="width:40;">
			<%i=0 
			While i<RS3.PageCount 
				i=i+1%>
				<option value="<%=i%>" <%If cint(Pag) = cint(i) Then%>Selected<%End If%>><%=i%></option>
			<%Wend%> 
		    </select>&nbsp;/&nbsp;<b><%=RS3.PageCount%></b>&nbsp;<br>&nbsp;    
			    Total Registros:&nbsp;<b><%=RS3.RecordCount%></b>&nbsp;(<%=RS3.PageSize%>&nbsp;Reg. por Página)
          </td> 
		</tr> 
	</table> 


<table width='95%' align=CENTER border="1" cellpadding="1" cellspacing="2"  bordercolor="#DAE8F3"  >

<tr><td colspan="13" align=CENTER><span class="titulo1" ><strong><%=WTitulo%></strong></span><BR><BR><BR></td></tr>

<tr><td colspan=10>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0"> 
	<tr>
		<td Class="e_td_string1" >
		<strong>Cargo :&nbsp;</strong><%=cargomostrar%>&nbsp;&nbsp;<br>
		
		
		</td> 
	</tr>
	</table> 
	</td>
</tr>

<%'----- Oficios de Contratación ----- %> 

	<tr><td colspan="13"><span class="TxtGrilla" style="font-size:11px">

	</td></tr>
                
	<tr style="font-size:11px">
	<th width="5%"  bgcolor="#DAE8F3" class="dato3">Nº</th>

	<th width="07%" bgcolor="#DAE8F3" class="dato3">DNI</th>
	<th width="20%" bgcolor="#DAE8F3" class="dato3">Apellidos</th>
	<th width="15%" bgcolor="#DAE8F3" class="dato3">Nombres</th>
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Departamento</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Provincia</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Distrito</th> 
    <th width="10%"  bgcolor="#DAE8F3" class="dato3" >Fecha<br>Inscripci&oacute;n</th> 
    <th width="10%"  bgcolor="#DAE8F3" class="dato3" >Quitar check para no ser contratado</th> 
	</tr> 

	<%If  Not RS3.BOF And Not RS3.EOF Then %> 
			<tr class='CabeGrilla' style=" font-size:10px">
			<%  
			
			registro = (cint(Pag) * num_registros) -  num_registros
			

			registros_mostrados = 0 
			Do While  (Not RS3.eof And registros_mostrados < num_registros)
		   registros_mostrados = registros_mostrados +1
			
			
            registro = registro + 1 
			aa=""
			if RS3.Fields("pase")="1" then
			aa= "bgcolor=""#FF8000"""
			end if
				
            %>

	<tr style=" font-size:11px" > 
	<td height="30" class='e_td_string1' align=center><%response.Write(registro)%>&nbsp;</td> 
	<td class='e_td_string1'  <%=aa%>> <a href="#" class="titulo3" onClick="javascript:enviarcard('<%=RS3.Fields("DNI")%>')"><%=RS3.Fields("DNI")%></a></td> 
	<td class='e_td_string1' <%=aa%>><%=trim(RS3.Fields("apellidos"))%></td> 
	<td class='e_td_string1' <%=aa%>><%=trim(RS3.Fields("nombres"))%></td> 
	<td class='e_td_string1' <%=aa%>><%=RS3.Fields("departamento")%></td>
	<td class='e_td_string1' <%=aa%>><%=RS3.Fields("provincia")%></td>
	<td class='e_td_string1' <%=aa%>><%=RS3.Fields("distrito")%></td>
    <td class='e_td_string1' <%=aa%>><%=RS3.Fields("fec_reg")%></td>
    <td align="center" class='e_td_string1'>&nbsp;<input name="<%="S"&RS3.Fields("id_per")%>" type="checkbox" id="<%="S"&RS3.Fields("id_per")%>" value="5" <% if RS3.Fields("sw_titu") ="1" or RS3.Fields("sw_titu") ="5"   then response.Write("checked=""checked""") end if %> onClick="bloqueo_contrato(this.id,this.value)" /><div style="display:none" id="<%="a"&RS3.Fields("id_per")%>"></div> </td>
   </tr>
           
            <%
			
			RS3.MoveNext
            Loop	
            RS3.close 
            Set RS3 = Nothing 
            %>

	</table>
	<% else %>
    <table width='95%' align='center'>
         <tr><td class='subtitulo' colspan='4'><br><br>No Existe Información Registrada</td></tr>
    </table>
	<% end If%>

 
<%Micone.Close%> 
	<table border="0" width="95%" align="center">
		<tr style="font-size:11px"><td height="27"  Class="e_td_string1" BgColor="White"  align=right colspan="10" ><strong>Fecha&nbsp;:</strong>&nbsp;&nbsp;<%=day(date())&"/"&month(date())&"/"&year(date())%>
		&nbsp;&nbsp;&nbsp;&nbsp;<strong>Hora&nbsp;:</strong>&nbsp;&nbsp;<%=time()%>
		</td></tr>
	</table> 
	<br>

</form>
</body>
</html>

<%Else
Response.Redirect("default.asp") 
End If%>



