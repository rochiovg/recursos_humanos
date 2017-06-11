<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

nivel = Request.Form("nivel")
id_cc = Request.Form("id_cc")


	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getGradoFicha '"&nivel&"', '"&id_cc&"' ")
	response.Write "<select class=""form-control"" id=""cmbGrado"" name=""cmbGrado"" >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" &Rs(1)& "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"

	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>