<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

response.ContentType="text/html; charset=iso-8859-1"

id_Proyecto=Session("id_proyecto")
indicador = Request.Form("indicador")
id_convocatoriacargo = Request.Form("id_convocatoriacargo")
id_usuario = Session("id_usuario")
ipVisitante = Request.ServerVariables("REMOTE_ADDR")


   set Rs2 = Server.Createobject("ADODB.Recordset")

		sql="exec dbo.pa_ETMP_fichas_modificar '"&id_Proyecto&"', '"& indicador&"' , "&id_convocatoriacargo&" , "&id_usuario&" , '"&ipVisitante&"'"
		
	
		
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
			
			response.Write("Los datos se procesaron correctamente")
			
Set RS2=Nothing
Micone.close
set Micone=nothing
%>
