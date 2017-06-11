<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
Response.ContentType="text/html; charset=iso-8859-1"	


id_proyecto = Request.Form("id_proyecto")
id_usuario = Request.Form("id_usuario")
tipo_seleccion= Request.Form("tipo_seleccion")
id_cc= Request.Form("id_cc")
id= Request.Form("id")
txtSedeop= Request.Form("txtSedeop")



		consulta1 = "EXEC dbo.pa_seleccion_general_actualizar '" & id_proyecto & "', '" & id_usuario & "', '" & tipo_seleccion & "', '" & id_cc & "', '" & id & "', '" & txtSedeop & "'  " 
	

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta1, MiCone, 3,3
	

	Set RsP=Nothing
	Micone.close
	set Micone=nothing


%>
	        