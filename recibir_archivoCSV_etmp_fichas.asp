 <%@ Language=VBScript %>
 <%session.lcid=2057%>
<!--#include file="conexion.asp"--> 
<!--#include file="utilidades/clsUpload.asp"-->

<%
id_usuario = Session("id_usuario")
id_proyecto=session("id_proyecto") 

'Session("tmp_id_convocatoriacargo") 


'id_convocatoriacargo= 6577 


Dim Upload
set Upload = New clsUpload 

nav = Request.ServerVariables("HTTP_USER_AGENT") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")

'Ruta = "\\192.168.201.225\imagenes\CCRRHH\csv\archivo_"&id_proyecto&".csv" 
'Ruta = "\\localhost\csv\archivoSeg_"&id_proyecto&".csv" 
'Ruta = "\\economicas.inei.gob.pe\convocatorias\2014\recluta\csv\archivoSeg_"&id_proyecto&".csv" 



Ruta = "C:\inetpub\wwwroot\recluta\csv\archivoEtmp_"&id_proyecto&".csv" 



'Ruta = "D:\Inetpub\rrhh\censo\recluta\csv\archivoEtmp_"&id_proyecto&".csv" 

Upload("file").SaveAs Ruta
'response.write( Upload("file").Fields(7) )

'id_convocatoriacargo = objUpload.Fields(7) 



id_convocatoriacargo=session("tmp_id_convocatoriacargo") 
	
response.redirect("carga_archivosCSV_etmp_fichas.asp?valor=1&id_convocatoriacargo="&id_convocatoriacargo)
%>
