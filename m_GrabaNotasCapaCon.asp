<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"


dato1= Request("tabla")
dato2= Request("idper")
dato3= Request("valor")
vidcapa= Request("vidcapa")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")

				
		
		sql1="exec dbo.pa_FichaGrabarNotaCapa'"&trim(dato1)&"','"&trim(dato2)&"','"&trim(dato3)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"','"&trim(vidcapa)&"'"


			Call getRS(RS, sql1)

			sql2 ="exec dbo.pa_FichaMostrarNotaCapa '"&trim(vidcapa)&"','"&trim(lsidProyecto)&"'"
		Call getRS(OBJ, sql2)
		 If Not OBJ.BOF And Not OBJ.EOF Then 

		 response.write OBJ("notacap")
 			
 		END If
 			
%>
