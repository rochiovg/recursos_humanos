<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario = Request.Form("lsUsuario")

lstipoReport = Request("lstipoReport")
lstipoCons = Request("lstipoCons")
ls_fuente = Request("ls_fuente")

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

function CambioRep()
{

	document.frmConsulta.submit();
}

</script> 


</head> 
<body leftmargin="5" topMargin="1"> 
<form Id="frmConsulta" name="frmConsulta" method="post" action="pd_conPresupuesto.asp"> 	  

	<!--#include file="cabecera.html"--> 
    <!--#include file="pd_menu.asp"-->


	<div id="formulario">
   		<div id="divNavegacion" align="center"><span class="subtitulo">Consultas: Consultas ADMINISTRATIVAS</span></div>

    <table border="0" width="100%" cellpadding="0" cellspacing="1"  >
		<tr>
          <td Class="e_td_string1" colspan=3 width="45%" align=center><br>
			<%If  lstipoReport="1" then x="checked" else x="" end If%> 
            <input name="lstipoReport" type="radio" <%=x%> value="1" onClick="CambioRep()">Cargos Presupuestados&nbsp;&nbsp;&nbsp; 

			<%If  lstipoReport="2" then x="checked" else x="" end If%> 
            <input name="lstipoReport" type="radio" <%=x%> value="2" onClick="CambioRep()" >Certificación Presupuestaria&nbsp;&nbsp;&nbsp; 

			<%If  lstipoReport="3" then x="checked" else x="" end If%> 
            <input name="lstipoReport" type="radio" <%=x%> value="3" onClick="CambioRep()" >Cargos Convocados&nbsp;&nbsp;&nbsp; 

			<%If  lstipoReport="4" then x="checked" else x="" end If%> 
            <input name="lstipoReport" type="radio" <%=x%> value="4" onClick="CambioRep()" >Oficios de Contratación
			
			<br><br>
			
			F.Fto:&nbsp;&nbsp
			<%
					
				Set wRsDptoapli1 = Server.CreateObject("ADODB.Recordset")
				sql1 = "exec dbo.pa_fuentefto_listar"
				wRsDptoapli1.CursorLocation=3
				wRsDptoapli1.Open sql1, Micone,3,3
			
				Response.Write "<select class=""e_combo"" style=""width:200px"" id=""ls_fuente"" name=""ls_fuente"" onchange=""CambioRep()"" >"
				Response.Write "<OPTION value=""0"">(TODOS)</OPTION>"
				
				While not wRsDptoapli1.EOF	
					if  ls_fuente =  wRsDptoapli1(0)   then x = "selected" else x="" end if
				 	
					Response.Write "<option "&x&" title ="""&wRsDptoapli1(1) & """ value=""" & wRsDptoapli1(0) & """>"&wRsDptoapli1(2) & "</option>"
					wRsDptoapli1.MoveNext
				Wend
				Response.Write "</select>"
				response.Write "<span class=""alerta5""></span>"
				wRsDptoapli1.Close
				Set wRsDptoapli1 = Nothing	
	
			%>
			
            
  	      </td> 
		</tr>
       
      
  <input type="hidden" name="lstipoCons" Id="lstipoCons" value="<%=lstipoCons%>"> 

  	<tr><td Class="e_td_string1" colspan=3 width="65%" align=center>
		<table border="0" width="89%"  align="center" cellspacing="1" bgcolor="silver" > 
	  	<tr>
          <td  colspan=2 width="90%" Class="TxtGeneral" bgcolor=white>
		<iframe name="IFrameGrillas" src="pd_conAdministrativaDetalle.asp?lstipoReport=<%=lstipoReport%>&amp;lstipoCons=<%=lstipoCons%>&amp;ls_fuente=<%=ls_fuente%>"  width="100%"  height="370"></iframe> 
			</td>
		</tr>
       </table>
  	      </td> 
		</tr>
  
    </table>
       

</body>
</html>

<%Else
Response.Redirect("default.asp")
End If%>

