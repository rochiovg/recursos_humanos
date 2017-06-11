<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")

valor=mid(valor,1,2)
lsUbiProv = Request.Form("lsUbiProv")
lsrolusu = Request.Form("lsrolusu")

IF (  lsrolusu ="7" OR lsrolusu="1") THEN
	
	Response.ContentType="text/html; charset=iso-8859-1"
	lsql=" exec dbo.getprov1 '"&valor&"','"&lsUbiProv&"' "

	
	set Rs = Micone.execute(lsql)
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtProv1"" name=""txtProv1"" onchange=""verdis();"">"
	Response.Write " <option id=""valor_defecto"" value=""9999"">Todos</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1)&" "&Rs(2)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"

	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing
	
	
ELSE

Response.ContentType="text/html; charset=iso-8859-1"
	lsql=" exec dbo.getprov1 '"&valor&"','"&lsUbiProv&"' "

	
	set Rs = Micone.execute(lsql)
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtProv1"" name=""txtProv1"" onchange=""verdis();"">"
	Response.Write " <option id=""valor_defecto"" value=""9999"">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1)&" "&Rs(2)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing


END IF 	

%>