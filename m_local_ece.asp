<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

datos = Request.Form("datos")


	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec pa_listar_sedes_ece  '"&datos&"' ")
	set Rs1 = Micone.execute(" exec pa_listar_sedes_ece  '"&datos&"' ")

	response.Write "<select  class=""form-control"" id=""txtSubDistrito"" name=""txtSubDistrito"" onChange=""verSede_ece(this.value);"" >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione...</option> "
	While Not Rs.EOF
		if Rs("cod_segmentacion") = Rs1("cod_segmentacion") then
		response.Write "<option selected value=""" & Rs("cod_segmentacion") & """>" & Server.HtmlEncode(Rs("local")) & "</option>"
		else
		response.Write "<option value=""" & Rs("cod_segmentacion") & """>" & Server.HtmlEncode(Rs("local")) & "</option>"
		end if
		Rs.MoveNext
	Wend
	response.Write "</select>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>