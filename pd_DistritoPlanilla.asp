<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")

valor3 = Request.Form("lsUbiDist")
valor1=mid(valor,1,2)
valor2=mid(valor,3,2)
filtro = mid(valor,1,4)
lsrolusu = Request.Form("lsrolusu")


IF (  lsrolusu ="7" OR lsrolusu="1") THEN
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getdist2 '"&valor1&"' ,'"&valor2&"','"&valor3&"' ")
	
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDist1"" name=""txtDist1""  >"

	Response.Write " <option  value=""999998"">Todos</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(2)&" "&Rs(3)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"

	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

ELSE
   Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getdist2 '"&valor1&"' ,'"&valor2&"','"&valor3&"' ")
	
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDist1"" name=""txtDist1""  >"
	Response.Write " <option  value=""999998"">Seleccione...</option> "
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

END IF 	

%>