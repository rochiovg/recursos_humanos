<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 

idProyecto=Session("id_proyecto")

vardni=Request.Form("vardni")
estado=Request.Form("estado")

		
		sql="exec grabar_inscripcion_censo '"&vardni&"','"&estado&"' "
		set Rs2 = Server.Createobject("ADODB.Recordset")
        Rs2.cursorlocation=3
        Rs2.Open sql, MiCone,3,3
			
		
Set RS2=Nothing
Micone.close
set Micone=nothing

%>