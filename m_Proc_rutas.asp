<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

response.ContentType="text/html; charset=iso-8859-1"

ccdd= Request.Form("ccdd")
ccpp= Request.Form("ccpp")
ccdi= Request.Form("ccdi")
valor= Request.Form("valor")
id_pre= Request.Form("id_pre")
id_per= Request.Form("id_per")
usuario= Request.Form("usuario")
id_contratos= Request.Form("id_contratos")


idProyecto=Session("id_proyecto")

   set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.uspUpd_ruta '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&valor&"', '"&id_pre&"','"&id_per&"','"&usuario&"' ,'"&id_contratos&"'   "

            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
Set RS2=Nothing
Micone.close
set Micone=nothing
%>
