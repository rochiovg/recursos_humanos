
<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsvalor=Request.Form("lsvalor")
lsidper=Request.Form("lsidper")
periodoPla=Request.Form("periodoPla")
id_Contratos=Request.Form("id_Contratos")

id_usuario=  Session("id_usuario")
ipVisitante = Request.ServerVariables("REMOTE_ADDR")
id_proyecto=session("id_proyecto")

set Rs1 = Server.Createobject("ADODB.Recordset")
	
sql1 = " Exec dbo.uspGet_PlanillaListEstPer '" & periodoPla & "', '"&id_proyecto&"';"	
			
Rs1.cursorlocation=3
Rs1.Open sql1, MiCone,3,3

    if Rs1.RecordCount>0 then
    estadoPla=Rs1("estadoPla")
		
	else
    estadoPla =""	
	
    end if	
	
Set RS1=Nothing


IF (estadoPla=2)THEN

set Rs2 = Server.Createobject("ADODB.Recordset")
	

sql2 = " Exec dbo.uspGet_PlanillaActconfDetalle '" & lsidper & "','" & periodoPla & "','" & id_Contratos & "','" & lsvalor & "','" & id_usuario & "','" & ipVisitante & "' , '"&id_proyecto&"';"	
	
Rs2.cursorlocation=3
Rs2.Open sql2, MiCone,3,3
	
Set RS2=Nothing
ELSE
Response.write "2"
END IF



	
set Micone=nothing




%>