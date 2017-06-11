<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

datos = Request.Form("datos")


	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec pa_descripcion_sedes_ece  '"&datos&"' ")

	response.Write Rs("desc_sede")

	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>