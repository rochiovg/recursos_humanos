<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"


idper= Request("idper")
valor= Request("valor")
indic= Request("indic")
id_cc= Request("id_cc")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")

	if  indic<>"3" Then
		
		sql3="exec dbo.pa_verifica_conocimientos '"&lsidProyecto&"', '"&id_cc&"' "	
		Call getRS(RS3, sql3)
		
		if RS3("seleccionado")>=1 then 
			response.Write("5")
		else
			sql1="exec dbo.pa_Ficha_update_NotaCon '"&idper&"','"&valor&"', '"&lsUsuarioID&"', '"&lsidProyecto&"', '"&indic&"', '"&id_cc&"' "	
					Call getRS(RS, sql1)
					
				if indic=1 then	
	
				sql2="exec dbo.pa_Ficha_select_estadoConoc '"&idper&"','"&lsidProyecto&"' "
				
	
					Call getRS(RS1, sql2)
				
						response.write RS1("Aprobo_test")
				else
					response.Write("3")
				end if	
		end if	
		
		
	End If
	
	if indic="3" then
		sql5="exec dbo.pa_Ficha_update_NotaCon '"&idper&"','"&valor&"', '"&lsUsuarioID&"', '"&lsidProyecto&"', '"&indic&"', '"&id_cc&"' "
		Call getRS(RS5, sql5)
		
		sql6="exec dbo.pa_Ficha_select_estadoConoc '"&idper&"','"&lsidProyecto&"' "
		
				Call getRS(RS6, sql6)
				response.write RS6("Aprobo_test")
	end if 
 
%>
