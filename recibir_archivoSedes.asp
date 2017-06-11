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

id=Upload.Fields("id").Value
num_c=Upload.Fields("num_c").Value
id_proyecto=Upload.Fields("id_proyecto").Value

		

Ruta = "\\srv-fileserver\imagenes\CCRRHH\pdf_general\local_op_"&id_proyecto&".pdf" 


Upload("file").SaveAs Ruta
	
response.redirect("carga_PDF_sEDESoP.asp?valor=1")

%>
