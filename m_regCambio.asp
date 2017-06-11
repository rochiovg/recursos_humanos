<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 


id_per=  Request.Form("id_per")
valor=  Request.Form("valor")
lsusuario=session("id_usuario") 
lsIndic= Request.Form("indic")

idProyecto=Session("id_proyecto")

	set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.pa_ficha_Actualizamod '"&id_per&"','"&valor&"','"&lsusuario&"','"&lsIndic&"', '"&idProyecto&"' "
		
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
			
		
Set RS2=Nothing
Micone.close
set Micone=nothing
	
	

%>