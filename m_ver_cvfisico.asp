<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%
	
	id_proyecto=session("id_proyecto") 
	varccddTot = Request.Form("lsDPTO")
	varccppTot = Request.Form("lsPROV")
	varccdiTot = Request.Form("lsDIST")
	plsCargo = Request.Form("lsCargo")
	lsUsuario=Request.Form("lsUsuario")
	lsConvCar=Request.Form("lsConvCar")
	VALOR=Request.Form("VALOR")
	
	id_rol=Session("txtTipoUsuarioValido")
	
	
	cantvarccddTot=len(varccddTot)
	nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
	varccdd = Mid(varccddTot,1,2)
	
	cantvarccppTot=len(varccppTot)
	nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
	varccpp = Mid(varccppTot,3,2)
	
	cantvarccdiTot=len(varccdiTot)
	nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
	varccdi = Mid(varccdiTot,5,2)
	
	cargo = Mid(plsCargo,2)
	

	if id_rol = 34 then

		SQLContCapac1 = "EXEC dbo.uspGet_ver_pend_fisico '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsConvCar & "'" 
		
		Set wRsDataCapc1	= Server.CreateObject("ADODB.Recordset") 
		wRsDataCapc1.cursorlocation=3
		wRsDataCapc1.Open SQLContCapac1, MiCone, 3,3
		contadorPre1	="0"
		If wRsDataCapc1.RecordCount > 0 Then 
			contadorPre1	=wRsDataCapc1(0)
		End if

		' SI NO TIENE LA CANTIDAD ES MENOR A LA CANTIDAD E POSTULANTES
		if CInt( contadorPre1 ) <0 then
			response.write("Por favor actualice la cantidad de CVs recepcionados en f&iacute;sico, que actualmente es menor a la cantidad de postulantes que intenta evaluar.")
			response.end()
		end if

	end if
	
	response.write("ok")
	
%>
