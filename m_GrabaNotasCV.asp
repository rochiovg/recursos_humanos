<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"


campo= Request("campo")
idper= Request("idper")
valor= Request("valor")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")

if  lsidProyecto<>"" Then

	sql1="exec dbo.pa_ficha_update_NotaCV '"&trim(campo)&"','"&trim(idper)&"','"&trim(valor)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"' "	
	Call getRS(RS, sql1)

set RS=Nothing

	sql2="exec dbo.pa_Ficha_mostrar_notaCV '"&(idper)&"','"&(lsidProyecto)&"' "
			
	Call getRS(RS1, sql2)
	
	response.write RS1("p_total")&"*"&RS1("estado")
	
	set RS1=Nothing

Else

	Response.Redirect("default.asp")
	
End If
 
%>
