<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")
valUbigeo = Request.Form("valUbigeo")
val_sede = Request.Form("val_sede")
valor1=mid(valor,1,2)
valor2=mid(valor,3,2)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	if valUbigeo=4 then 
		set Rs = Micone.execute(" exec dbo.getdist_e '"&valor1&"' ,'"&valor2&"', '" & val_sede & "' ")
	else 
		set Rs = Micone.execute(" exec dbo.getdist '"&valor1&"' ,'"&valor2&"' ")
	end if 
	response.Write "<select class=""form-control"" id=""txtDist2"" name=""txtDist2"" onChange=""validaDist();"">"
	Response.Write " <option  value=""0"">Seleccione...</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(2)&" "&Rs(3)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing

%>