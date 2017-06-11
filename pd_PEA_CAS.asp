<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 

<%
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

num_proceso= Request("ID_PROCESO")

	WTitulo	= "PEA REGISTRADA PARA TEST PSICOL&Oacute;GICO - PROCESO CAS" 


	SQL1 = "execute PA_FICHA_1_LISTAR '"&num_proceso&"' "
		
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

function enviarcard(dni)
{		
	 			
 pagina = "contacto.asp?lsdni=" + dni ;
	win = window.open(pagina,'','width=600,height=250,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

</script> 



</head> 
<body leftmargin="5" topMargin="1"> 

<form Id="frmMANTE_Proc" name="frmMANTE_Proc" method="post" action="pd_PEA_Inscrita.asp">
  <input type="hidden" name="num_proceso" Id="num_proceso" value="<%=num_proceso%>">
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
		<strong>Proceso CAS :&nbsp;</strong><%=cargomostrar%>&nbsp;&nbsp;<br>
		
		
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
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >ODEI</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Test</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Resultado test</th> 
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
	<td class='e_td_string1'  <%=aa%>><a href="#" class="titulo3" onClick="javascript:enviarcard('<%=RS3.Fields("DNI")%>')"><%=RS3.Fields("DNI")%></a></td> 
	<td class='e_td_string1' <%=aa%>><%=trim(RS3.Fields("apellidos"))%></td> 
	<td class='e_td_string1' <%=aa%>><%=trim(RS3.Fields("nombre"))%></td> 
	<td class='e_td_string1' <%=aa%>><%=RS3.Fields("ODEI")%></td>
	<td class='e_td_string1' <%=aa%>><%=RS3.Fields("test")%></td>
	<td class='e_td_string1' <%=aa%>><%=RS3.Fields("RESULTADO")%></td>
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



