<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsTipo = Request.Form("lsTipo")

 id_usuario=  Session("id_usuario")
 ipVisitante = Request.ServerVariables("REMOTE_ADDR")

IF lsTipo="62" then 
Response.ContentType="text/html; charset=iso-8859-1"
id_per=Request.Form("id_per")
periodoPla=Request.Form("periodoPla")
id_Contratos=Request.Form("id_Contratos")
Observ=Request.Form("Observ")
flag=Request.Form("flag")

id_proyecto=session("id_proyecto")


set Rs5 = Server.Createobject("ADODB.Recordset")
	

sql5 = " Exec dbo.uspGet_PlanillaActObs '" & id_per & "','" & periodoPla & "','" & id_Contratos & "','" & trim(observ) & "','" & trim(id_usuario) & "','" & ipVisitante & "', '"&id_proyecto&"';"
	
Rs5.cursorlocation=3
Rs5.Open sql5, MiCone,3,3
	
Set RS5=Nothing



END IF

	
set Micone=nothing




%>