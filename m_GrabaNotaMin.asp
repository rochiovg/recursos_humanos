<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"


periodo= Request("periodo")
valor= Request("valor")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")
		
		sql1="exec dbo.pa_FichaCapaMostrarNotaMin'"&trim(periodo)&"','"&trim(valor)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"' "
			Call getRS(RS, sql1)
 			
%>
