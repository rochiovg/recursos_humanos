<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

response.ContentType="text/html; charset=iso-8859-1"

id_Proyecto=Session("id_proyecto")
indicador = Request.Form("indicador")

   set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.pa_ETMP_modificar '"&id_Proyecto&"', '"& indicador&"' "
		
		
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
			
			response.Write("Los datos se procesaron correctamente")
			
Set RS2=Nothing
Micone.close
set Micone=nothing
%>
