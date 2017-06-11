<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

periodo = Request("periodo")
idProyecto=Session("id_proyecto")

set Rs6 = Server.Createobject("ADODB.Recordset")

sql6 = " Exec dbo.uspGet_validaPeriodo  '" & periodo & "','" & idProyecto & "';"	


Rs6.cursorlocation=3
Rs6.Open sql6, MiCone,3,3


If Rs6.RecordCount > 0 Then 
		periodo	=Rs6(0)
	else
		periodo	="x*x"
End if

response.Write(periodo)
Set RS6=Nothing
set Micone=nothing





%>

