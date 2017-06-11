<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

response.ContentType="text/html; charset=iso-8859-1"
id_per= Request.Form("id_per")
valor= Request.Form("valor")
usuario= Session("id_usuario")
id_proyecto= Session("id_proyecto")

            set Rs2 = Server.Createobject("ADODB.Recordset")
													
		sql1="exec dbo.usp_actualizarfichaSelec1 '"&id_per&"','"&valor&"','"&usuario&"','"&id_proyecto&"' "
		

            Rs2.cursorlocation=3
            Rs2.Open sql1, MiCone,3,3
Set RS2=Nothing

Micone.close
set Micone=nothing
%>
