 <%@ Language=VBScript %>
 <%session.lcid=2057%>
<!--#include file="conexion.asp"--> 
<!--#include file="utilidades/clsUpload.asp"-->

<%


Dim Upload
set Upload = New clsUpload

nav = Request.ServerVariables("HTTP_USER_AGENT") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")


		texto=Upload.Fields("txtDNIA").Value
		id_proyecto=Upload.Fields("id_proyectoA").Value
		num=Upload.Fields("NumA").Value
		
		NomArchivo=Upload.Fields("NomArchivo").Value
		id_cc=Upload.Fields("id_convocatoria").Value
		archivActual=Upload.Fields("archivActual").Value
		
		
SQL1 = "exec dbo.PA_logArchivo_insert '" & texto & "', '" & id_cc & "', '" & id_proyecto & "','" & ipVisitante & "' ,'" & nav & "' ,'" & archivActual & "','" & NomArchivo & "'   "	

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
		


Ruta = "\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&texto&"_"&num&".pdf" 



if num=1 then 
Upload("file1").SaveAs Ruta
	response.redirect("cargar_archivos.asp?dni="&texto&"&id_proyecto="&id_proyecto&"")
elseif num=2 then 
Upload("file2").SaveAs Ruta
	response.redirect("cargar_archivos.asp?dni="&texto&"&id_proyecto="&id_proyecto&"")
elseif num=3 then
Upload("file3").SaveAs Ruta

	response.redirect("cargar_archivos.asp?dni="&texto&"&id_proyecto="&id_proyecto&"")
end if

RSCuad=Nothing
RSCuad.Close

%>
