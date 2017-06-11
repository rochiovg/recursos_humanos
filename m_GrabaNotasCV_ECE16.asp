<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"


campo= Request("campo")
idper= Request("idper")
valor= Request("valor")
convocatoriacargo= Request("idconvocatoriacargo")

response.Write(valor)

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")

if  lsidProyecto<>"" Then

'	sql1="exec dbo.pa_ficha_update_NotaCV_ece '"&trim(campo)&"','"&trim(idper)&"','"&trim(valor)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"' "	

	sql1="exec dbo.pa_ficha_update_NotaCV_ece '"&trim(campo)&"','"&trim(idper)&"','"&trim(valor)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"','"&trim(convocatoriacargo)&"' "	
	
'	response.Write(sql1)
	
	Call getRS(RS, sql1)

set RS=Nothing

'MODIFICAR PARA TOTALES Y CAMBIO DE ESTADO
'	sql2="exec dbo.pa_Ficha_mostrar_notaCV '"&(idper)&"','"&(lsidProyecto)&"' "
			
'	Call getRS(RS1, sql2)
	
'	response.write RS1("p_total")&"*"&RS1("estado")

	'response.write "0"&"*"&" "

	
'	set RS1=Nothing

Else

	Response.Redirect("default.asp")
	
End If
 
%>
