 <%@ Language=VBScript %>
 <%session.lcid=2057%>
<!--#include file="conexion.asp"--> 
<!--#include file="utilidades/clsUpload.asp"-->

<%
id_usuario = Session("id_usuario")
id_proyecto=session("id_proyecto") 

Dim Upload
set Upload = New clsUpload

nav = Request.ServerVariables("HTTP_USER_AGENT") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")


Ruta = "E:\wwwroot\convocatorias\2014\recluta\csv\archivoObs_"&id_proyecto&".csv" 

'Ruta = "D:\Inetpub\rrhh\convoca\produccion\recluta\csv\archivoObs_"&id_proyecto&".csv"

Upload("file").SaveAs Ruta
	
response.redirect("carga_observadosCSV.asp?valor=1")
%>
