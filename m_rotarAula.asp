<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 

dni = Request.Form("dni")
id_proyecto = Request.Form("id_proyecto")
local = Request.Form("local")

	Response.ContentType="text/html; charset=iso-8859-1"
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	
	lsql=" exec dbo.ficha_actLocal '"&dni&"' ,'"&id_proyecto&"', '"&local&"' "
	
	
                Rs.CursorLocation=3
                Rs.Open lsql, Micone,3,3

	response.Write "1"


%>