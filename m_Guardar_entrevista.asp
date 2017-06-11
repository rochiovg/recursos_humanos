<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 



dni=request.form("dni")
id_proyecto=request.form("id_proyecto")
id_usuario=Session("id_usuario")

	set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.pa_ficha_actNoEntrevista '"&dni&"','"&id_proyecto&"','"&id_usuario&"' "
	
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
			
		
Set RS2=Nothing
Micone.close
set Micone=nothing
	
	

%>