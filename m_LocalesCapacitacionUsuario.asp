<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<% 

idProyecto = session("id_proyecto")  
AulasCapa=Session("aulas") 


valora = Request.Form("datos")
valora2 = Request.Form("prov")
valora3 = Request.Form("dist")

valor1=mid(valora,1,2)

valor2=mid(valora2,3,2)

valor3=mid(valora3,5,2)




'if valor1=22 then
'valor=mid(valora,1,3)
'else
valor=mid(valora,1,2)
'end if

	
	Response.ContentType="text/html; charset=iso-8859-1"
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	
	lsql=" exec dbo.sp_getLocales '"&valor&"','"&idProyecto&"' "
	
	'if (idProyecto = 139) or (idProyecto = 156) then
	'	lsql=" exec dbo.sp_getLocales_ednom '"&valor&"','"&idProyecto&"' ,'"&aulasCapa&"' "
	'end if
	
	IF  (idProyecto = 156)  THEN
		lsql=" exec dbo.sp_getLocales_ednom_dist '"&valor&"','"&valor2&"','"&valor3&"','"&idProyecto&"' ,'"&aulasCapa&"' "
	END IF
	
	
	
	
    Rs.CursorLocation=3
    Rs.Open lsql, Micone,3,3

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtProv11"" name=""txtProv11"" onchange=""verAulas();"">"
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