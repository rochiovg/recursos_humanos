<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"


campo= Request("campo")
id_per= Request("id_per")
valor= Request("valor")
id=Request("id")
id_proy=Request("id_proy")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")

nav = Request.ServerVariables("HTTP_USER_AGENT") 
ip= Request.ServerVariables("REMOTE_ADDR")


		if  lsidProyecto<>"" Then

			sql1="exec dbo.pa_evaluacion_per_Grabar '"&trim(campo)&"','"&trim(id_per)&"','"&trim(valor)&"','"&trim(id)&"', '"&trim(lsidProyecto)&"','"&trim(lsUsuarioID)&"','"&trim(nav)&"','"&trim(ip)&"' "
		
		
				Call getRS(RS, sql1)


		Else
			Response.Redirect("default.asp")
		End If
 
%>
