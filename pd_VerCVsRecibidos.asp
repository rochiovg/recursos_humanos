<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!-- #include file="Conexion.asp"       --> 

<%

 lsUsuario =  Session("txtNombreValido")
 txtDpto1=Request("txtDpto1") 
 txtProv1=Request("txtProv1") 
 txtDist1=Request("txtDist1") 
 txtConvocartoria=Request("txtConvocartoria") 
 cmbCargo=Request("cmbCargo")
 txtnumcvs=Request("txtnumcvs")
 
  id_proyecto=  Session("id_proyecto")
 
 
 txtConvocartoria=Request("txtConvocartoria") 
 
Response.ContentType="text/html; charset=iso-8859-1"

	
set wRsDptoapli = Micone.execute(" exec dbo.VerCVSRecibidos '"&txtDpto1&"','"&txtProv1&"','"&txtDist1&"',"&txtConvocartoria&","&txtnumcvs&","&id_proyecto&", '"&lsUsuario&"';")
	
	
While not wRsDptoapli.EOF
  ls_nro_cvs = wRsDptoapli("nro_cvs") 
	wRsDptoapli.MoveNext
Wend
	
wRsDptoapli.Close
Set wRsDptoapli = Nothing

%>

<%=ls_nro_cvs%>
