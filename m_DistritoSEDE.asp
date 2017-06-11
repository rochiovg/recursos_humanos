<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
id_proy = Request.Form("id_proy")

valor1=mid(valor,1,3)
valor2=mid(valor,4)


	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.pa_distSedes_listar '"&valor1&"' ,'"&valor2&"','"&id_proy&"' ")
	
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDistSed"" name=""txtDistSed""  >"
	Response.Write " <option id=""valor_defecto"" value=""999999"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(2)&" "&Rs(3)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>