<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<%

response.ContentType="text/html; charset=iso-8859-1"
dato1= Request("datos1")
dato2= Request("datos2")
lsUsuarioID = Session("id_usuario")
				

            set Rs2 = Server.Createobject("ADODB.Recordset")
													
		'sql1="exec dbo.pa_PreSele_actu_result_final '"&trim(dato1)&"','"&trim(dato2)&"' "
		sql1="exec dbo.pa_PreSele_actu_result_final '"&trim(dato1)&"','"&trim(dato2)&"', '"&trim(lsUsuarioID)&"'"
		
		response.write(sql1)

            Rs2.cursorlocation=3
            Rs2.Open sql1, MiCone,3,3
Set RS2=Nothing

Micone.close
set Micone=nothing
%>
