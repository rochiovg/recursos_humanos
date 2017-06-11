<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 

lsUbiProv =  Request.Form("lsubiprov") 
valor = Request.Form("datos")
ls_proyecto = session("id_proyecto") 
 

	
	Response.ContentType="text/html; charset=iso-8859-1"
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	

	lsql=" exec dbo.pa_sedes_prov '"&valor&"','"&lsUbiProv&"' "
	
	if ls_proyecto = 139 then
			lsql=" exec dbo.pa_sedes_prov_ednom '"&valor&"','"&lsUbiProv&"' "
	end if
			
			        
                 Rs.CursorLocation=3
                Rs.Open lsql, Micone,3,3

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtProv1"" name=""txtProv1"" onchange=""verdis();"">"
	Response.Write " <option id=""valor_defecto"" value=""9999"">Seleccione...</option> "
	

	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1))& "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	

%>