<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario = Request.Form("lsUsuario")

lscenvdatos   = Request("cenvdatos")
lstipoProceso = Request("tipoProceso")
WTitulo		= "CONSULTA DE DATOS CARGADOS AL SIGA DE LA PEA QUE INGRESA COMO ALTA<br>" 
idProyecto=Session("id_proyecto")

	SQL1 = " execute uspGet_ContadorAltas_DatosSIGA '"&lscenvdatos &"','"&lstipoProceso & "' " 
	
	

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
<title>Consulta de Datos Cargados al SIGA</title> 
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="Styles/inei.css">


</head> 
<body leftmargin="5" topMargin="1"> 

<br>
<table width='90%' align=CENTER border="1" cellpadding="1" cellspacing="2" cellspacing="1" bordercolor="#DAE8F3"  >
<tr></tr>
<tr><td colspan="13" align=CENTER><span class="titulo" ><br><strong><%=WTitulo%></strong>&nbsp; 
		&nbsp;&nbsp;</span><BR></td>
</tr>
<tr><td colspan="13" ><span class="titulo" >CENVDATOS&nbsp;: &nbsp;&nbsp;<strong><%=lscenvdatos%><br>
    &nbsp;A&ntilde;o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;<strong> <%=RS3.Fields("ANNO_META")%></strong>&nbsp;</span></td></tr>

	<tr><td colspan="13"><span class="TxtGrilla" style="font-size:11px"></td></tr>
	<tr style="font-size:11px"> 
	    <th width="10%"  bgcolor="#DAE8F3" class="aplicacion" colspan=4>Datos en Tablas Temporales de Trabajo</th> 
	</tr> 
	<tr style="font-size:11px">
	    <th width="10%"  bgcolor="#DAE8F3" class="dato3" colspan=2>Ficha de Datos Personales</th> 
	    <th width="10%"  bgcolor="#DAE8F3" class="dato3" colspan=2>Ficha de Contratos</th> 
	</tr> 
	<tr style="font-size:11px">
	    <th width="10%" bgcolor="#DAE8F3" class="dato3">SISFOH</th>
	    <th width="10%" bgcolor="#DAE8F3" class="dato3">SIGA</th>

	    <th width="10%" bgcolor="#DAE8F3" class="dato3">SISFOH</th>
	    <th width="10%" bgcolor="#DAE8F3" class="dato3">SIGA</th>
	</tr> 

	<%If  Not RS3.BOF And Not RS3.EOF Then %> 
			<tr class='CabeGrilla' style=" font-size:10px">
			<%
			Do While  Not RS3.eof 
            %>

	<tr style=" font-size:11px" > 
	<!-- <td height="30" class='e_td_string1' align=center><%response.Write(registro)%>&nbsp;</td> --> 
    <td class='e_td_string1' align='center'><%=RS3.Fields("N_FE_SISFOH")%>&nbsp;</td>
	<td class='e_td_string1' align='center'><%=RS3.Fields("N_FE_SIGA")%>&nbsp;</td>
	<td class='e_td_string1' align='center'><%=RS3.Fields("N_CN_SISFOH")%>&nbsp;</td>
	<td class='e_td_string1' align='center'><%=RS3.Fields("N_CN_SIGA")%>&nbsp;</td>  
    </tr>
           
            <%RS3.MoveNext
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

</body>
</html>

<%Else
Response.Redirect("default.asp") 
End If%>

