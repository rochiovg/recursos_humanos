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
SIAF = Request("SIAF")



set Rs6 = Server.Createobject("ADODB.Recordset")
sql6 = " Exec dbo.uspGet_cierreDefinitivo  '" & lsperiodo & "','" & txtusuario & "','" & txtipusuario & "','" & id_proyecto & "','" & SIAF & "';"	

 
Rs6.cursorlocation=3
Rs6.Open sql6, MiCone,3,3


Set RS6=Nothing


Response.write "1"

set Micone=nothing


%>

