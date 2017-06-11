<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valUbigeo = Request.Form("valUbigeo")
val_sede = Request.Form("val_sede")

valor=mid(valor,1,2)

	
	Response.ContentType="text/html; charset=iso-8859-1"
	if valUbigeo=4 then 
		set Rs = Micone.execute(" exec dbo.getprov_e '"&valor&"', '" & val_sede & "' ")
	else 
		set Rs = Micone.execute(" exec dbo.getprov '"&valor&"' ")
	end if
	response.Write "<select class=""form-control"" id=""txtProv2"" name=""txtProv2"" onchange=""verdis2(),validaProv(); "">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1)&" "&Rs(2)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>