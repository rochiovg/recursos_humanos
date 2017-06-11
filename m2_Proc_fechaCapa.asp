<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

response.ContentType="text/html; charset=iso-8859-1"

id_proyecto=session("id_proyecto") 
ID_PER= Request.Form("ID_PER")
valor= Request.Form("VALOR")
usuario=Session("id_usuario")

   set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.usp_actualizarfichaCap '"&ID_PER&"','"&valor&"' ,'"&usuario&"', '"&id_proyecto&"'"
		
	
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
Set RS2=Nothing
Micone.close
set Micone=nothing
%>
