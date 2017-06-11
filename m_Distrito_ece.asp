<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

valor = Request.Form("datos")

valor3 = session("sedeDist")  


ls_proyecto = session("id_proyecto") 

lsUbiDist = Request.Form("lsUbiDist") 


	
	Response.ContentType="text/html; charset=iso-8859-1"
	
	
	
	if ls_proyecto = 139 then
	valor1=mid(valor,1,2)
	valor2=mid(valor,3,2)
		if lsUbiDist <> ""  then
		
			valor3=lsUbiDist 
		end if
	
			set Rs = Micone.execute(" exec dbo.pa_distrito_ednom '"&valor1&"' ,'"&valor2&"','"&valor3&"' ")
			
						
			
	else
	
	valor1=mid(valor,1,3)
	valor2=mid(valor,4,2)

		set Rs = Micone.execute(" exec dbo.pa_distrito_ece '"&valor1&"' ,'"&valor2&"','"&valor3&"' ")
		
		
	end if
			
	
	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDist1"" name=""txtDist1""  >"
	Response.Write " <option id=""valor_defecto"" value=""9999999"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(1) & """>" & Server.HtmlEncode(Rs(2)&" "&Rs(3)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing 
	Micone.Close
	Set Micone = Nothing

%>