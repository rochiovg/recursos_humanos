<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

response.ContentType="text/html; charset=iso-8859-1"

id_per= Request.Form("id_per")
valor= Request.Form("VALOR")
usuario= Session("id_usuario")
id_proy=Session("id_proyecto")


   set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.pa_ficha_actualiza_tipoAula '"&ID_PER&"','"&valor&"' ,'"&usuario&"','"&id_proy&"' "
	
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
Set RS2=Nothing
Micone.close
set Micone=nothing
%>
