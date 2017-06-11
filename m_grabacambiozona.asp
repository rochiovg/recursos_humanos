<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 
<!--#include file="Include/pd_Funcion.asp"-->


<%
Response.ContentType="text/html; charset=iso-8859-1"	

Server.ScriptTimeout = 1800 
	 	 
id_proyecto=session("id_proyecto") 
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lsUsuario=Request.Form("lsUsuario")

id_rol=Session("txtTipoUsuarioValido")
lszona=request("txtzona")	'1501LIMA
lsseccion=request("txtseccion")	'150101LIMA


txtDNI=request("txtDNI")	'150101LIMA


varccdd = Mid(varccddTot,1,2)


varccpp = Mid(varccppTot,3,2)

varccdi = Mid(varccdiTot,5,2)



lsvarzona=lszona '1501LIMA
lsvarseccion=lsseccion	'150101LIMA
	
	

	SQLContCapac = "EXEC dbo.usp_grabacambiozona '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & txtDNI & "', '"&id_proyecto&"', '"&lsvarzona&"', '"&lsvarseccion&"' " 



	
				Call getRS(RS, SQLContCapac)
				
			response.write("*")
	

	
	
	%>
	
	

	
