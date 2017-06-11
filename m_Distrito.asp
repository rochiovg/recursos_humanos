<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valor1=mid(valor,1,2)
valor2=mid(valor,3,2)


	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec uspGet_CCDI_CONVO  '"&valor1&"' ,'"&valor2&"' ")

	response.Write "<select  class=""form-control"" id=""txtDist1"" name=""txtDist1"" onchange=""verificadist()"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs("ccdd")&Rs("ccpp")&Rs("ccdi") & """>" & Server.HtmlEncode(Rs("ccdi")&" "&Rs("nombre")) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>