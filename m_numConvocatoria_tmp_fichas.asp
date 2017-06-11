<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 


valor = Request.Form("datos")
if valor="undefined" then
response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtConvocartoria"" name=""txtConvocartoria"" >"
	Response.Write " <option id=""valor_defecto"" value=""""></option> "
	response.Write "</select>"
	response.Write "<span class=""alerta5""></span>"
	response.End()
else
valor=mid(valor,2)
end if


	Response.ContentType="text/html; charset=iso-8859-1"
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	
	lsql=" exec dbo.getNumConvocatoria '"&valor&"'  "
	
	                                
                 Rs.CursorLocation=3
                Rs.Open lsql, Micone,3,3

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtConvocartoria"" name=""txtConvocartoria"" OnChange=""act_convocatoria(this.value);"" >"
	Response.Write " <option id=""valor_defecto"" value=""""></option> "
	

	While Not Rs.EOF
		response.Write "<option title=""CCP: " & Rs(2) & """  value=""" & Rs(0) & """> "& Rs(1)&"</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	response.Write "<span class=""alerta5""></span>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	

%>