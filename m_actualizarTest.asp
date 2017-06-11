<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 



id_per=request.form("id_per")
valor=request.form("valor")
proyecto=request.form("proyecto")

	set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.pa_ficha_actCompetencia '"&id_per&"','"&valor&"','"&proyecto&"' "
	
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
			
		
Set RS2=Nothing
Micone.close
set Micone=nothing
	
	

%>