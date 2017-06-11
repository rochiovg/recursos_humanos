<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")

	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec uspGet_CCPP_CONVO_RECLUTA '"&valor&"' ")
	
	response.Write "<select  class=""e_combo"" style=""width:200px"" id=""txtProv1"" name=""txtProv1"" onchange=""verdis();"">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" &(Rs("ccdd")&Rs("ccpp")&Rs("nombre")) & """>" & Server.HtmlEncode(Rs("ccpp")&" "&Rs("NOMBRE")) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing 

%>