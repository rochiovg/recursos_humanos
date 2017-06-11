<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%
Anio=Session("anio")
usuario= Session("usuario")

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 


lsvalor=Request.Form("lsvalor")
IF(lsvalor="1") THEN

txtDNI=Request.Form("txtDNI")
lsperiodo=Request.Form("lsperiodo")

 Response.ContentType="text/html; charset=iso-8859-1"
 
 
 set Rs1 = Server.Createobject("ADODB.Recordset")
	
	sql1= " Exec dbo.usp_Get_PlanillaVerificaConfDet '"&txtDNI&"','"&lsperiodo&"';"

	
	Rs1.cursorlocation=3
	Rs1.Open sql1, MiCone,3,3
 
    if Rs1.RecordCount>0 then
	cuenta=1
	else
	cuenta=0
	end if
	
	
  IF (cuenta=1) THEN
  Response.Write "2"
  ELSE
  Response.Write "1"
  END IF
	
	

END IF
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


set Micone=nothing

%>




