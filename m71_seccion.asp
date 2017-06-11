<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")

valor3 = Request.Form("lsUbiDist")
valor1=mid(valor,1,2)
valor2=mid(valor,3,2)
valordist=mid(valor,5,2)
valorzona=mid(valor,7,5)



filtro = mid(valor,1,4)

	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getseccion2 '"&valor1&"' ,'"&valor2&"','"&valordist&"','"&valorzona&"','"&valor3&"' ")
	


	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtseccion1"" name=""txtseccion1""  >"
	Response.Write " <option id=""valor_defecto"" value=""999999"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(2)) & "</option>"
		'&" "&Rs(3)
		
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing 
	Micone.Close
	Set Micone = Nothing

%>