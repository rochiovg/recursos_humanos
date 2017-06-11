<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%
Anio=Session("anio")
usuario= Session("usuario")
	
	Response.ContentType="text/html; charset=iso-8859-1"

	set rs = Server.Createobject("ADODB.Recordset")
	sql5=" exec dbo.CantConvocatorias  "

	
   
	rs.CursorLocation=3
	rs.Open sql5, Micone,3,3
	
	if rs.RecordCount>0 then

	cantreg=rs("cantreg")+1
	
	else
	cantreg=""

	
	end if
	
	rs.Close
	
	Set rs=nothing
	
	
	response.Write ""&cantreg&""

%>



