<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"

idper= Request("idper")
valor= Request("valor")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")

if  lsidProyecto<>"" Then

	sql1="exec dbo.pa_ficha_update_capacita '"&trim(idper)&"','"&trim(valor)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"' "	
	Call getRS(RS, sql1)


Else

	Response.Redirect("default.asp")
	
End If
 
%>
