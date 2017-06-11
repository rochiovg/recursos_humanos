<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valor=mid(valor,1,2)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getprov '"&valor&"' ")
	
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtProv2"" name=""txtProv2"" onchange=""verdis2(); "">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1)&" "&Rs(2)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>