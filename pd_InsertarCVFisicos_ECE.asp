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
 txtdni=Request("txtdni")
 txtFOLIO=Request("txtFOLIO")
 txtNROREG=Request("txtNROREG")
 
  id_proyecto=  Session("id_proyecto")
  
	response.ContentType="text/html; charset=iso-8859-1"

	sql= " Exec dbo.VerCVSFisicos_DNI	 '"&txtDpto1&"','"&txtProv1&"','"&txtDist1&"',"&txtConvocartoria&",'"&txtdni&"',"&id_proyecto&", '"&lsUsuario&"';"
	'response.write(sql)
	
	set Rs2 = Micone.execute(sql)
	
	if Rs2.EOF then
		response.write("-1")
	else
		li_recepcionado = Rs2(0)
		
			
		if li_recepcionado  = 1 then
			response.write("1")
		else
		
		
			sql= " Exec dbo.InsertCVSFisicos_DNI	 '"&txtDpto1&"','"&txtProv1&"','"&txtDist1&"',"&txtConvocartoria&",'"&txtdni&"',"&id_proyecto&", '"&lsUsuario&"', "&txtFOLIO&", "&txtNROREG&";"		

			'response.write(sql)

			
			set Rs3 = Micone.execute(sql)
			response.write("0")
			
		end if			
			
	end if
		
	Set Rs2 = Nothing
	Set Rs3 = Nothing
	Set Micone = Nothing
			


%>
