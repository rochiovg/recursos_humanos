<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 
 
sede = Request.Form("local_id")
 

	
	Response.ContentType="text/html; charset=iso-8859-1"
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	

	lsql=" exec dbo.USP_LISTA_LOCAL_EDNOM2016 '"&sede&"' "
  
	Rs.CursorLocation=3
	Rs.Open lsql, Micone,3,3

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""cboLocal"" name=""cboLocal"" >"
	'Response.Write " <option id=""valor_defecto"" value=""9999"">Seleccione...</option> "
	

	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1))& "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	'response.Write "<span class=""alerta5"">(*)</span>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	

%>