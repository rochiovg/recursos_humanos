<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valor=mid(valor,1,2)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getprov2 '"&valor&"' ")
	
	response.Write "<select class=""form-control"" id=""txtProv3"" name=""txtProv3"" onchange=""verdis4(); "">"
	Response.Write " <option  value=""0"">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1)&" "&Rs(2)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>