<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")

valor3 = session("sedeDist") 
valor1=mid(valor,1,3)
valor2=mid(valor,4,2)

	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.pa_distrito_ece '"&valor1&"' ,'"&valor2&"','"&valor3&"' ")
	
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDistSed"" name=""txtDistSed""  >"
	Response.Write " <option id=""valor_defecto"" value=""9999999"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(1) & """>" & Server.HtmlEncode(Rs(2)&" "&Rs(3)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing 
	Micone.Close
	Set Micone = Nothing

%>