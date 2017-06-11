<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 
<%

 
 lsUsuario =  Session("txtNombreValido")
 txtDpto1=Request("txtDpto1") 
 txtProv1=Request("txtProv1") 
 txtDist1=Request("txtDist1") 
 txtConvocartoria=Request("txtConvocartoria") 
 cmbCargo=Request("cmbCargo")
 txtnumcvs=Request("txtnumcvs")
 
  id_proyecto=  Session("id_proyecto")
  
	response.ContentType="text/html; charset=iso-8859-1"



	set Rs2 = Server.Createobject("ADODB.Recordset")
	

	sql= " Exec dbo.InsertCVSFisicos	 '"&txtDpto1&"','"&txtProv1&"','"&txtDist1&"',"&txtConvocartoria&","&txtnumcvs&","&id_proyecto&", '"&lsUsuario&"';"
   
'  response.write(sql)
  
		
	Rs2.cursorlocation=3
	Rs2.Open sql, MiCone,3,3
	
    Set Rs2= Nothing
	
	
set Micone=nothing


%>
