<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

dist = Request.Form("dist")

	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.pa_zonas_cpv '"&dist&"' ")

	
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtZona"" name=""txtZona"" onchange=""ver_seccion_CPV()""  >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(1) & """>" & Rs(1)& "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing 
	Micone.Close
	Set Micone = Nothing

%>