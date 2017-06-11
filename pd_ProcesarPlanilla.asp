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

set Rs5 = Server.Createobject("ADODB.Recordset")
sql5 = " Exec dbo.uspGet_PlanillaInsertCopia '" & lsperiodo & "','" & txtusuario & "','" & txtipusuario & "','" & id_proyecto & "';"	
 
Rs5.cursorlocation=3
Rs5.Open sql5, MiCone,3,3


Set RS5=Nothing


Response.write "1"

set Micone=nothing


%>

