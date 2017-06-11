<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario = Request.Form("lsUsuario")


'lsTipoOfic = Request("lsTipoOfic")
lsidOficio = Request("lsidOficio")
lsresolucion		= Request("lsresolucion")
lsfecha_Resolucion	= Request("lsfecha_Resolucion")
lsfechaInicio		= Request("lsfechaInicio")
lsfechaFin			= Request("lsfechaFin")
lscargoF			= Request("lscargoF")

idProyecto=Session("id_proyecto")


'Response.Write("lsTipoOfic="&lsTipoOfic)

'Response.Write("lsidOficio="&lsidOficio)
'Response.Write("lsidOlsresolucionficio="&lsresolucion)
'Response.Write("lsfecha_Resolucion="&lsfecha_Resolucion)
'Response.Write("lsfechaInicio="&lsfechaInicio)
'Response.Write("lsfechaFin="&lsfechaFin)

'Select case lsTipoOfic
'case 1
	'----- PEA Contratada  con Oficio Normal ----- 
	WTitulo		= "PEA CONTRATADA SEGUN " 
'case 2
	'----- PEA Contratada  con Oficio de Altas y Bajas ----- 
'	WTitulo		= "PEA CONTRATADA POR ALTAS Y BAJAS SEGUN " 
'End select 

	'SQL1 = "execute uspGet_OfPEAContratadaDirectorio '"&lsidOficio &"','" &lsTipoOfic&"'" 

	SQL1 = "execute uspGet_OfPEAContratadaDirectorio '"&lsidOficio &"' , '"&idProyecto &"'"
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

<form Id="frmMANTE_Proc" name="frmMANTE_Proc" method="post" action="pd_conOfcConttratados.asp"> 
  <input type="hidden" name="lsidOficio" Id="lstipoCons" value="<%=lsidOficio%>"> 

  <input type="hidden" name="lsresolucion" Id="lsresolucion" value="<%=lsresolucion%>"> 
  <input type="hidden" name="lsfecha_Resolucion" Id="lsfecha_Resolucion" value="<%=lsfecha_Resolucion%>"> 
  <input type="hidden" name="lsfechaInicio" Id="lsfechaInicio" value="<%=lsfechaInicio%>"> 
  <input type="hidden" name="lsfechaFin" Id="lsfechaFin" value="<%=lsfechaFin%>"> 
  <input type="hidden" name="lscargoF" Id="lscargoF" value="<%=lscargoF%>"> 

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


<table width='95%' align=CENTER border="1" cellpadding="1" cellspacing="2"  bordercolor="#DAE8F3"  >
<tr><td colspan="13" align=CENTER><span class="titulo1" ><strong><%=WTitulo%>&nbsp; 
		<strong><%=lsresolucion%></strong>&nbsp;&nbsp;del &nbsp;<strong><%=lsfecha_Resolucion%></strong></span><BR>
		<span class="titulo" ><strong>(Fecha Inicio Contrato&nbsp;:&nbsp;</strong><%=lsfechaInicio%>&nbsp;&nbsp;
		<strong>Fecha Fin Contrato&nbsp;:&nbsp;</strong><%=lsfechaFin%></span>)<BR><BR></td></tr>

<tr><td colspan=10>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0"> 
	<tr>
		<td Class="e_td_string1" >
		<strong>Cargo Funcional&nbsp;:&nbsp;</strong><%=lscargoF%>&nbsp;&nbsp;<br>
	
		
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


	<th width="05%" bgcolor="#DAE8F3" class="dato3">Fecha Ini.</th>
	<th width="05%" bgcolor="#DAE8F3" class="dato3">Fecha Fin Labor.</th>
	<th width="17%"  bgcolor="#DAE8F3" class="dato3" >Estado Contrato</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Departamento</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Provincia</th> 
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >Distrito</th> 
	</tr> 

	<%If  Not RS3.BOF And Not RS3.EOF Then %> 
			<%
			
			registro = (cint(Pag) * num_registros) -  num_registros
			registros_mostrados = 0 
			Do While  (Not RS3.eof And registros_mostrados < num_registros)
		   registros_mostrados = registros_mostrados +1
			
			
            registro = registro + 1 	
            %>

	<tr style=" font-size:11px" > 
	<td height="30" class='e_td_string1' align=center><%response.Write(registro)%>&nbsp;</td> 
	<td class='e_td_string1'><%=RS3.Fields("DNI")%></td>  
	<td class='e_td_string1'><%=trim(RS3.Fields("ape_paterno"))%>&nbsp;<%=trim(RS3.Fields("ape_materno"))%></td> 
	<td class='e_td_string1'><%=trim(RS3.Fields("nombre"))%>&nbsp;<%=trim(RS3.Fields("nombre2"))%></td> 
	
	<td class='e_td_string1'><%=RS3.Fields("fechaInicio")%></td> 
	<td class='e_td_string1'><%=RS3.Fields("fecha_FinLabor")%></td>

	<td class='e_td_string1'>
	<%If RS3.Fields("ActivoC") <> "1" Then 
			Response.Write("<strong>")
			Response.Write(RS3.Fields("Desc_ActivoC"))
			Response.Write("</strong>")
	else
			Response.Write(RS3.Fields("Desc_ActivoC"))
	end if%> 
	</td>
	
	<td class='e_td_string1'><%=RS3.Fields("DptoTrab")%></td>
	<td class='e_td_string1'><%=RS3.Fields("ProvTrab")%></td>
	<td class='e_td_string1'><%=RS3.Fields("DistTrab")%></td>
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

