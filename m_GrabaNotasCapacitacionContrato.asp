<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"


dato1= Request("tabla")
dato2= Request("idper")
dato3= Request("valor")
nivel=Request("nivelRRHH")
id_cc=Request("id_cc")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")

				
		if  lsidProyecto<>"" Then

			sql1="exec dbo.pa_FichaCapa_GrabarNota_contrato '"&trim(dato1)&"','"&trim(dato2)&"','"&trim(idCapa)&"','"&trim(dato3)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"','"&trim(nivel)&"','"&trim(id_cc)&"' "
		
				Call getRS(RS, sql1)

			sql2="exec dbo.pa_FichaCapaMostrarNotaContrato '"&trim(dato2)&"','"&trim(lsidProyecto)&"' "
			
			
				Call getRS(RS1, sql2)
			
					response.write RS1("notacap")&"|"
					response.write RS1("ESTADO")

			
		Else
			Response.Redirect("default.asp")
		End If
 
%>
