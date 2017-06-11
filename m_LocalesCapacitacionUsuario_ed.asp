<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 

idProyecto = session("id_proyecto")  
valora = Request.Form("datos")
cap = Request.Form("cap")

valor1=mid(valora,1,2)

if valor1=22 then
valor=mid(valora,1,3)
else
valor=mid(valora,1,2)
end if

	
	Response.ContentType="text/html; charset=iso-8859-1"
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	
	lsql=" exec dbo.sp_getLocales_cap '"&valor&"','"&idProyecto&"', '"&cap&"' "
		        
                 Rs.CursorLocation=3
                Rs.Open lsql, Micone,3,3

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtProv1"" name=""txtProv1"" onchange=""verAulas();"">"
	Response.Write " <option id=""valor_defecto"" value=""9999"">Seleccione...</option> "
	

	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	

%>