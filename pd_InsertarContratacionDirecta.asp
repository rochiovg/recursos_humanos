<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 
<%

 txtNumConv=Request("txtNumConv")
 txtIdPresupuestario=Request("txtIdPresupuestario")
 txtIdPresupuesto=Request("txtIdPresupuesto") 
 txtDesConv=Request("txtDesConv") 
 txtfechIniConv=Request("txtfechIniConv") 
 txtTiempoCont=Request("txtTiempoCont")
 
  id_proyecto=  Session("id_proyecto")
  id_usuario=  Session("id_usuario")
  
	response.ContentType="text/html; charset=iso-8859-1"


  	set Rs1 = Server.Createobject("ADODB.Recordset")
	
	sql1= " Exec dbo.usp_ValidarConvocCargo '"&txtNumConv&"','"&txtIdPresupuestario&"','"&txtIdPresupuesto&"';"
	
	Rs1.cursorlocation=3
	Rs1.Open sql1, MiCone,3,3
	

	if Rs1.RecordCount>0 then
	contsuma = 1
	else
    contsuma =0	 
    end if
	
IF contsuma = 0 THEN 

	set Rs2 = Server.Createobject("ADODB.Recordset")
	

	sql= " Exec dbo.pa_InsertarContratacionDirecta '"&txtNumConv&"','"&txtIdPresupuestario&"','"&txtIdPresupuesto&"','"&txtDesConv&"','"&txtfechIniConv&"','"&txtTiempoCont&"','"&id_usuario&"';"
   
		
	Rs2.cursorlocation=3
	Rs2.Open sql, MiCone,3,3
	
    Set Rs2= Nothing
	
	ELSE
Response.write "1"

END IF
set Micone=nothing


%>
