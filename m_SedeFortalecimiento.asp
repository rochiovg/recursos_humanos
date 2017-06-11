
<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("valor")
id = Request.Form("id")

	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec pa_sedecap_listar '"&valor&"' ")
	
	response.Write "<select  class=""e_combo"" id=""cmbSedeCap"&id&""" name=""cmbSedeCap"&id&""" "
	if id=2 then 
	response.Write " onchange=""verReporte_2()"" "
	else 
	response.Write " "
	end if
	response.Write ">"
	Response.Write " <option value=""0"">Todos...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" &Rs(0)& """>" & Rs(0)& "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>