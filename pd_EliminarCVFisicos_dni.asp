<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

'Usuario= Session("usuario")

response.ContentType="text/html; charset=iso-8859-1"

id_per= Request("id_per")
id_proyecto= Request("id_proyecto")
id_convocatoriacargo= Request("id_convocatoriacargo")



   
set Rs2 = Server.Createobject("ADODB.Recordset")
	
sql= " Exec dbo.spu_EliminarCVFisicos_dni "&id_per&","& id_proyecto&","& id_convocatoriacargo & "; "

response.write(sql)

	
Rs2.cursorlocation=3
Rs2.Open sql, MiCone,3,3

Set RS2=Nothing

Response.write "2"




	
set Micone=nothing

%>
