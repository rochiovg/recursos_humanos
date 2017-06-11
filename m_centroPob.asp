<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

ubigeo = Request.Form("ubigeo")

	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute("exec pa_listar_centroPoblado  '"&ubigeo&"' ")

	response.Write "<select  class=""form-control"" id=""txtCentroPob"" name=""txtCentroPob""  >"

	
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs("ccppp") &  """>" & Server.HtmlEncode(Rs("ccppp")&" "&Rs("nomccpp")) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>