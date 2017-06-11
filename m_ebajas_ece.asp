<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsccdd=MID(request.Form("lsDPTO"),1,2)
lsprov=MID(request.Form("lsprov"),3,2)
lsdist=MID(request.Form("lsDist"),5,2)

id_proyecto=session("id_proyecto") 

call mosbajas_ece(""&lsccdd&"",""&lsprov&"",""&lsdist&"",""&id_proyecto&"")


%>