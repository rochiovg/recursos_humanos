<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

lsperiodo = Request("lsperiodo")
txtusuario = Request("txtusuario")
txtipusuario = Request("txtipusuario")

id_proyecto=session("id_proyecto")

Set wRsSup = Server.CreateObject("ADODB.Recordset")


	 sql=" exec dbo.uspGet_PlanillaPerEstado '"&lsperiodo&"','"&id_proyecto&"';"		
	 
	 	
	 wRsSup.CursorLocation=3
	 wRsSup.Open sql, Micone,3,3
	 
if wRsSup.RecordCount>0 then

	Response.write "1"
	
end if


Set wRsSup=Nothing

set Micone=nothing


%>

