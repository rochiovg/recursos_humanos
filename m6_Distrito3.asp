<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valor1=mid(valor,1,2)
valor2=mid(valor,3,2)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute("exec uspGet_CCDI_CONVO_RECLUTA  '"&valor1&"' ,'"&valor2&"'")

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDist2"" name=""txtDist2"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs("ccdd")&Rs("ccpp")&Rs("ccdi") &  """>" & Server.HtmlEncode(Rs("ccdi")&" "&Rs("Nombre")) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5""><font class='alerta5'>(*)</font></span>"
	Rs.Close 
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>