<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"


dato1= Request("tabla")
dato2= Request("idper")
idCapa= Request("idCapa")
dato3= Request("valor")
nivel=Request("nivelRRHH")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")

				
		if  lsidProyecto<>"" Then

			

			sql1="exec dbo.pa_FichaCapaGrabarNota '"&trim(dato1)&"','"&trim(dato2)&"','"&trim(idCapa)&"','"&trim(dato3)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"','"&trim(nivel)&"'"	
				
			

				Call getRS(RS, sql1)

			sql2="exec dbo.pa_FichaCapaMostrarNota'"&trim(idCapa)&"'"
			

				Call getRS(RS1, sql2)
			
					response.write RS1("notacap")&"|"
					response.write RS1("p1")&"|"
					response.write RS1("p8")

			
		Else
			Response.Redirect("default.asp")
		End If
 
%>
