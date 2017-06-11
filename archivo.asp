<%@ Language=VBScript %>
 <%session.lcid=2057%>
<!--#include file="conexion.asp"--> 
<%

Response.buffer=true
Response.Expires = -1
Response.ExpiresAbsolute = Now() -1 
Response.AddHeader "pragma", "no-store"
Response.AddHeader "cache-control","no-store, no-cache, must-revalidate"

dni=request("dni")
id_proy=request("id_proy")
id=request("id")
nocahe=request("nocache")



Dim objFSO
Set objFSO = CreateObject("Scripting.FileSystemObject")

if objFSO.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proy&"\"&dni&"_"&id&".pdf" ) then 

Response.ContentType = "application/pdf"

' https://docs.google.com/viewerng/viewer?url=
origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proy & "/"& dni & "_"&id&".pdf"

response.Redirect(origen)

else 
	Response.ContentType="text/html; charset=iso-8859-1"	
	Response.write("No hay archivo pdf que mostrar") 
end if     
	   

%>

