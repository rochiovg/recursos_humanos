<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
Response.ContentType="text/html; charset=iso-8859-1"	

	 	 
id_proyecto=session("id_proyecto") 


varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsCargo1=Request.Form("lsCargo1")
cc1=Request.Form("cc1")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

		consulta1 = "EXEC dbo.pa_actualizarCambio '" & plsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsCargo1&"' , '"&cc1&"'" 
	

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta1, MiCone, 3,3
	

	Set RsP=Nothing
	Micone.close
	set Micone=nothing

%>
	        