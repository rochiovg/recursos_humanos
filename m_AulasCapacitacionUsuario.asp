<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 
idProyecto = session("id_proyecto")  
valor = Request.Form("datos")
aulasCapa = Request.Form("Aulas")

if idProyecto = 139 then
	aulasCapa = ""
end if



	Response.ContentType="text/html; charset=iso-8859-1"
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	
	lsql=" exec dbo.sp_getAulasCapa '"&valor&"' ,'"&aulasCapa&"' "


                 Rs.CursorLocation=3
                Rs.Open lsql, Micone,3,3

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDist1"" name=""txtDist1""  >"
	Response.Write " <option id=""valor_defecto"" value=""9999"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	

	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing
	

%>