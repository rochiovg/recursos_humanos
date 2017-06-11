<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

dist = Request.Form("dist")
zona = Request.Form("zona")

	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.pa_seccion_cpv '"&dist&"', '"&zona&"' ")
		
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtSeccion"" name=""txtSeccion"" >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(2) & """> Seccion: " & Rs(2)& "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing 
	Micone.Close
	Set Micone = Nothing

%>