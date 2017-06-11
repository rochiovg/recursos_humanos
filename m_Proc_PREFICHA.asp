<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

response.ContentType="text/html; charset=iso-8859-1"

ID_PER= Request.Form("ID_PER")
valor= Request.Form("VALOR")
usuario= Session("id_usuario")
id_proy=SESSION("id_proyecto")

   set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.PA_FICHA_UPDATE_PREFICHA '"&ID_PER&"','"&valor&"' ,'"&usuario&"','"&id_proy&"' "
	
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
Set RS2=Nothing
Micone.close
set Micone=nothing
%>
