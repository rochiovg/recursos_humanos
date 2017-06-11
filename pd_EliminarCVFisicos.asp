<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

'Usuario= Session("usuario")

response.ContentType="text/html; charset=iso-8859-1"

id= Request("id")



   
set Rs2 = Server.Createobject("ADODB.Recordset")
	
sql= " Exec dbo.spu_EliminarCVFisicos '"&id&"'; "

	
Rs2.cursorlocation=3
Rs2.Open sql, MiCone,3,3

Set RS2=Nothing

Response.write "2"




	
set Micone=nothing

%>
