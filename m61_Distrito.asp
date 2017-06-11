<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valor1=mid(valor,1,2)
valor2=mid(valor,3,2)


	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getdist '"&valor1&"' ,'"&valor2&"' ")

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDist1"" name=""txtDist1"" "& di &" >"
	Response.Write " <option  value=""999998TODOS"">Todos</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(2)&" "&Rs(3)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>