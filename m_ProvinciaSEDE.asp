<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 

lsUbiProv = Session("Ubigeoapli") 
sede = Request.Form("sede")
id_proyecto = Request.Form("id_proyecto")


	
	Response.ContentType="text/html; charset=iso-8859-1"
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	
	lsql=" exec dbo.pa_provSEDE_listar '"&sede&"','"&lsUbiProv&"', '"&id_proyecto&"' "
	
	
        Rs.CursorLocation=3
        Rs.Open lsql, Micone,3,3

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtProvSed"" name=""txtProvSed"" onchange=""verdisSede(this.value);"">"
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
	

%>