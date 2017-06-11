<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valor1=mid(valor,1,2)
valor2=mid(valor,3,2)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getdist '"&valor1&"' ,'"&valor2&"' ")

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDist4"" name=""txtDist4""     >"
	Response.Write " <option value=""0"">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(2)&" "&Rs(3)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5""><font class='alerta5'>(*)</font></span>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>