<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="conexion.asp"--> 
<!-- #include file="Include/pd_funcion.asp"-->

<%
Response.ContentType="text/html; charset=iso-8859-1"

Response.Expires = 0
Response.Buffer = true 


dnic = Request.Form("dni")
ape_pat = replace(Request.Form("ape_pat"),"'","''")
ape_mat = replace(Request.Form("ape_mat"),"'","''")
nombres = replace(Request.Form("nombres"),"'","''")
id_cc =Request.Form("id_cc")
id_proy =Request.Form("id_proy")

nav = Request.ServerVariables("HTTP_USER_AGENT") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")




flag=9



'verificar si se encuentra en el directorio (Contratos del SIGA)
lsSQL6 = "EXEC dbo.PA_DIRECTORIO_Verifica_rec  '" & dnic & "', '" & ape_pat & "', '" & ape_mat & "', '" & nombres & "'"	



Set RS6 = Server.CreateObject("ADODB.Recordset")
RS6.Open lsSQL6, Micone

	If Not RS6.BOF And Not RS6.EOF Then 
		if RS6("flag")=1 then
			dnirR="6*<br>El Apellido paterno es incorrecto, no corresponde al DNI digitado"
		elseif RS6("flag")=2 then
			dnirR="6*<br>El Apellido Materno es incorrecto, no corresponde al DNI digitado"
		elseif RS6("flag")=3 then
			dnirR="6*<br>El/Los nombre/s es/son incorrecto/s, no corresponde al DNI digitado"
		elseif RS6("flag")=4 then
			dnirR="6*<br>El DNI no corresponde a los apellidos y nombres digitados"
		elseif RS6("flag")=0 then
			flag=0
		end if
	else	
		flag=0
	END IF	
	

	RS6.Close
	Set RS6 = Nothing
	
	
IF flag=0 THEN

	lsSQL7 = "EXEC dbo.PA_DIRECTORIO_VERIFICA_CONTRATO '" & dnic & "', '" & id_cc & "' "
	
		Set RS7 = Server.CreateObject("ADODB.Recordset")
		RS7.Open lsSQL7, Micone
		
	
		If Not RS7.BOF And Not RS7.EOF Then 
			dnirR="6*<br>Usted tiene contrato Activo en el proyecto<br>"&RS7("desc_larga_meta")&"<br>hasta el dia "&RS7("fecha_fincontrato")
		else
' verifica si existe en la ficha del proyecto en la misma convocaroria			
			lsSQL10 = "EXEC dbo.PA_ficha_verifica_ins '" & dnic & "', '" & id_cc & "', '" & id_proy & "' "
		
			
		

			Set RS10 = Server.CreateObject("ADODB.Recordset")
			RS10.Open lsSQL10, Micone
		
		If Not RS10.BOF And Not RS10.EOF Then 
			dnirR="10*111"
		
		else		
				' verifica si se encuentra en algun proceso de seleccion
	
					lsSQL2 = "pa_v_ficha_verificaSeleccion_web'" & dnic & "', '" & id_cc & "' "
					
					Set RS2 = Server.CreateObject("ADODB.Recordset")
					RS2.Open lsSQL2, Micone	
									
					If Not RS2.BOF And Not RS2.EOF Then
						dnirR="6*<br>Usted esta participando de un proceso de selecci&oacute;n: Cargo: "&RS2("desc_cargofuncional")&"<br> Proyecto: "&RS2("desc_proyecto")
						
					else
						' verificar si ya tiene datos
						lsSQL3 = "EXEC dbo.pa_v_ficha_verificaDatos '" & dnic & "', '"&id_proy&"'"	
						
						Set RS3 = Server.CreateObject("ADODB.Recordset")
						RS3.Open lsSQL3, Micone	
						  
							If Not RS3.BOF And Not RS3.EOF Then 
								dnirR="2*"&RS3("id_proyecto")
							else
								dnirR="1*5"
							end if 
							
							RS3.Close
							Set RS3 = Nothing
						
					end if
					
					RS2.Close
					Set RS2 = Nothing
					
		end if 
		RS10.Close
		Set RS10 = Nothing
		
		end if
		
		RS7.Close
		Set RS7 = Nothing

ELSE

END IF 

lsSQL11 = " EXEC dbo.PA_logInscripciones_insert '" & dnic & "', '" & id_cc & "', '" & id_proy & "','" & ipVisitante & "' ,'" & nav & "' ,'" & dnirR & "' "
		
		
	Set RS11 = Server.CreateObject("ADODB.Recordset")
	RS11.Open lsSQL11, Micone	


response.Write(dnirR)

'RS11.Close
Set RS11 = Nothing

 %>

