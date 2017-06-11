<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 

id_proyecto=session("id_proyecto") 
valor = Request.Form("valor")


Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '"&valor&"','"&id_proyecto&"' ")
	
	Response.Write "<select class=""e_combo"" style=""width:180px""  id=""cmbCargo1"" name=""cmbCargo1"" OnChange=""generaConvocatoria(this.value);"" >"
	Response.Write " <option value="""&valor&"00"">Todos</option>"
	
	While not wRsDptoapli.EOF
		Response.Write "<option title='"&wRsDptoapli(4)&" - Actividad: "&wRsDptoapli(5)&"'   value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(3) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing


%>