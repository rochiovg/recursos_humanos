<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

ubigeo = Request.Form("ubigeo")

	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute("exec pa_listar_tambo  '"&ubigeo&"' ")

	response.Write "<select  class=""form-control"" id=""txtTambo"" name=""txtTambo""  >"

	
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs("cod_tambo") &  """>" & Server.HtmlEncode(Rs("cod_tambo")&" "&Rs("tambo")) & "</option>"
		Rs.MoveNext
	Wend
	Response.Write " <option value=""9999"">Sin Preferencia</option> "
	response.Write "</select>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>