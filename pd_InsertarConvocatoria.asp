<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 
<%

 
 txtNumConv=Request("txtNumConv") 
 txtDesConv=Request("txtDesConv") 
 txtfechIniConv=Request("txtfechIniConv") 
 txtfechFinConv=Request("txtfechFinConv") 
 txtestado=Request("txtestado")
 txtHoraInicio=Request("txtHoraInicio")
 txtHoraFin=Request("txtHoraFin")
 
  id_proyecto=  Session("id_proyecto")
  
	response.ContentType="text/html; charset=iso-8859-1"




	set Rs2 = Server.Createobject("ADODB.Recordset")
	

	sql= " Exec dbo.InsertConvocatoria '"&txtNumConv&"','"&txtDesConv&"','"&txtfechIniConv&"','"&txtfechFinConv&"','"&txtestado&"','"&id_proyecto&"','"&txtHoraInicio&"','"&txtHoraFin&"';"
   
   
		
	Rs2.cursorlocation=3
	Rs2.Open sql, MiCone,3,3
	
    Set Rs2= Nothing
	
	
set Micone=nothing


%>

