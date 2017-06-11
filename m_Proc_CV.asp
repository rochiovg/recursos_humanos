<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

response.ContentType="text/html; charset=iso-8859-1"

ID_PER= Request.Form("ID_PER")
valor= Request.Form("VALOR")
usuario= Session("id_usuario")
id_proy=Request.Form("id_proy")
obs=Request.Form("obs")

   set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.usp_Ins_VeriCVRO '"&ID_PER&"','"&valor&"' ,'"&usuario&"','"&id_proy&"','"&obs&"'"
	
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
Set RS2=Nothing
Micone.close
set Micone=nothing
%>
