<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario = Request.Form("lsUsuario")

fec_reg = Request("fec_reg")
fec_exec = Request("fec_exec")
id_Proyecto=Session("id_proyecto")


	WTitulo		= "PEA QUE INGRESA COMO ALTA" 

	SQL1 = "execute uspGet_PEAAB '"&fec_reg &"','"&fec_exec &"', '"&id_Proyecto&"'"
	
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
<title>Consulta de Cargos Presupuestados / CCP</title> 
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="Styles/inei.css">

<script language="javascript"> 


function CambioPag()
{		
	document.frmMANTE_Proc.submit(); 
} 

</script> 



</head> 
<body leftmargin="5" topMargin="1"> 

<form Id="frmMANTE_Proc" name="frmMANTE_Proc" method="post" action="pd_peaAB.asp"> 

  <input type="hidden" name="fec_reg" Id="fec_reg" value="<%=fec_reg%>"> 
  <input type="hidden" name="fec_exec" Id="fec_exec" value="<%=fec_exec%>"> 
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


<table width='95%' align=CENTER border="1" cellpadding="1" cellspacing="2" cellspacing="1" bordercolor="#DAE8F3"  >
<tr></tr>
<tr><td colspan="13" align=CENTER><span class="titulo1" ><%=WTitulo%>&nbsp; 
		<strong><%=lsresolucion%></strong>&nbsp;&nbsp;</span><BR><BR></td></tr>

<tr><td colspan=10>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0"> 
	<tr>
		<td Class="e_td_string1" ><br>
	
		
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
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Departamento</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Provincia</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Distrito</th> 
	<th width="07%" bgcolor="#DAE8F3" class="dato3">DNI</th>
	<th width="20%" bgcolor="#DAE8F3" class="dato3">Apellidos</th>
	<th width="15%" bgcolor="#DAE8F3" class="dato3">Nombres</th>
    <th width="15%" bgcolor="#DAE8F3" class="dato3">Cargo</th>
	<th width="05%" bgcolor="#DAE8F3" class="dato3">Oficio</th>
    <th width="05%" bgcolor="#DAE8F3" class="dato3">Fecha Oficio</th>
	
	</tr> 

	<%If  Not RS3.BOF And Not RS3.EOF Then %> 
			<tr class='CabeGrilla' style=" font-size:10px">
			<%
			registro = (cint(Pag) * num_registros) -  num_registros
			registros_mostrados = 0 
			Do While  (Not RS3.eof And registros_mostrados < num_registros)
 		    registros_mostrados = registros_mostrados +1
            registro = registro + 1 	
            %>

	<tr style=" font-size:11px" > 
	<td height="30" class='e_td_string1' align=center><%response.Write(registro)%>&nbsp;</td> 
    <td class='e_td_string1'><%=RS3.Fields("Dpto")%>&nbsp;</td>
	<td class='e_td_string1'><%=RS3.Fields("Prov")%>&nbsp;</td>
	<td class='e_td_string1'><%=RS3.Fields("Dist")%>&nbsp;</td>
	<td class='e_td_string1'><%=RS3.Fields("dni")%>&nbsp;</td>  
	<td class='e_td_string1'><%=RS3.Fields("Apellidos")%>&nbsp;</td> 
	<td class='e_td_string1'><%=RS3.Fields("nombres")%>&nbsp;</td> 
    <td class='e_td_string1'><%=RS3.Fields("cargo")%>&nbsp;</td> 
	<td class='e_td_string1'><%=RS3.Fields("oficio")%>&nbsp;</td>
    <td class='e_td_string1'><%=RS3.Fields("fecha_oficio")%>&nbsp;</td>
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

