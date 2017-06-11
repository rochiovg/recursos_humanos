<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"


dato1= Request("tabla")
dato2= Request("idper")
dato3= Request("valor")
nivel=Request("nivelRRHH")
id_cc=Request("id_cc")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")

				
		if  lsidProyecto<>"" Then


			
			sql1="exec dbo.pa_FichaCapa_GrabarNota_mon '"&trim(dato1)&"','"&trim(dato2)&"','"&trim(idCapa)&"','"&trim(dato3)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"','"&trim(nivel)&"','"&trim(id_cc)&"' "	
'response.Write(sql1)		
			if  lsidProyecto = 155 then
						sql1="exec dbo.pa_FichaCapa_GrabarNota_mon_ece16 '"&trim(dato1)&"','"&trim(dato2)&"','"&trim(idCapa)&"','"&trim(dato3)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"','"&trim(nivel)&"','"&trim(id_cc)&"' "	
			end if
			
			
			
			'response.Write(sql1)
			'response.End()
			
			
				Call getRS(RS, sql1)

			sql2="exec dbo.pa_FichaCapaMostrarNotaMon '"&trim(dato2)&"','"&trim(lsidProyecto)&"' "

			Set RS1 = Server.CreateObject("ADODB.Recordset")
			RS1.cursorlocation=3
			RS1.Open sql2, MiCone, 3,3
			
			If  Not RS1.BOF And Not RS1.EOF Then
			

				IF  (id_cc =6744  OR id_cc=6745 ) THEN
				RESPONSE.Write(RS1.Fields("notacap")&"|"&RS1.Fields("ESTADO")&"|"&RS1.Fields("RC4"))
				ELSE
				
				RESPONSE.Write(RS1.Fields("notacap")&"|"&RS1.Fields("ESTADO"))
				END IF

			end if
			
			
		Else
			Response.Redirect("default.asp")
		End If
 
%>
