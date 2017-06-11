<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 
<% 

Response.ContentType="text/html; charset=iso-8859-1"
Server.ScriptTimeout = 30000 

id_usuario=Session("id_usuario")
lsTipo = Request.Form("lsTipo")

'----------------------------------------------------------------------

if lsTipo="1" then ' Verifica, muestra datos de algoritmo de nivel y grado 

id_cc=Request("id_cc")

' ------------------------------- NIVEL 2 --------------EDNOM 2016
sql1 = "EXEC dbo.pa_algoritmo_nivel_verificar '"&id_cc&"' "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3
		existe= RsP(0)
		Set RsP = Nothing
		
		response.write (existe)
		
end if


if lsTipo="2" then ' Inserta algoritmo _nivel_grado

id_cc=Request("id_cc")

' ------------------------------- NIVEL 2 --------------EDNOM 2016
sql1 = "EXEC dbo.pa_algoritmo_insertar '"&id_cc&"' , '" &id_usuario& "' "


		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing
end if


if lsTipo="3" then ' Inserta puntaje en algoritmo_nivel 

tabla=Request("tabla")
columna=Request("columna")
id_bd=Request("id_bd")
valor=Request("valor")

sql1 = "EXEC dbo.pa_algoritmo_nivel_puntaje_guardar '"&tabla&"' ,'"&columna&"' , '" &id_bd& "', '" &valor& "', '" &id_usuario& "' "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3


		Set RsP = Nothing
end if


if lsTipo="4" then ' Inserta puntaje en algoritmo_experiencia o algoritmo_capacitacion

id_cc=Request("id_cc")
id_algoritmo=Request("id_algoritmo")
valor=Request("valor")
flag=Request("flag")

sql1 = "EXEC dbo.pa_algoritmo_detalle_insertar '"&id_cc&"' ,'"&id_algoritmo&"' , '" &valor& "', '" &flag& "', '" &id_usuario& "' "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3


		Set RsP = Nothing
end if


if lsTipo="5" then ' Inserta puntaje en algoritmo_experiencia o algoritmo_capacitacion

id=Request("id")
valor=Request("valor")
id_per=Request("id_per")
nota_min=Request("nota_min")
id_usuario=Session("id_usuario")
id_proyecto=Session("id_proyecto")

sql1 = "EXEC dbo.pa_guardar_nota_cv '"&id&"' ,'"&valor&"' , '" &id_per& "', '" &id_usuario& "' , '"& id_proyecto &"', '"& nota_min &"' "

response.Write(sql1)
response.End()

		
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing
		
		
		sql2 = "EXEC dbo.pa_guardar_nota_cv_ver '" &id_per& "', '"& id_proyecto &"' "

		
			Set RsP2 = Server.CreateObject("ADODB.Recordset")
			RsP2.cursorlocation=3
			RsP2.Open sql2, MiCone, 3,3
			
			bandaprob=RsP2.Fields("bandaprob")
			evalcv=RsP2.Fields("evalcv")
			if bandaprob=1 then 
				texto="APROBADO"
			else 
				texto="DESAPROBADO"
			END IF
			dato=texto&"*"&evalcv
			
			
			Set RsP2 = Nothing
		
		response.Write(dato)
		
end if


if lsTipo="6" then ' Inserta puntaje en algoritmo_experiencia o algoritmo_capacitacion

id_per=Request("id_per")
obs=Request("obs")
id_usuario=Session("id_usuario")
id_proyecto=Session("id_proyecto")

sql1 = "EXEC dbo.pa_detalle_cv_actualizar '"&id_per&"' ,'"&obs&"' , '" &id_usuario& "', '" &id_proyecto& "'  "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3


		Set RsP = Nothing
end if

if lsTipo="7" then ' Inserta puntaje en algoritmo_experiencia o algoritmo_capacitacion

id_cc=Request("id_cc")
etapa=Request("etapa")
campo=Session("campo")
dato=Session("dato")

sql1 = "EXEC dbo.pa_pub_resultados_actualizar '"&id_cc&"' ,'"&etapa&"' , '" &campo& "', '" &dato& "'  "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3


		Set RsP = Nothing
end if

if lsTipo="8" then ' Eliminar registro de algoritmo de formación academica

id =Request("id")

sql1 = "EXEC dbo.pa_algoritmo_fa_eliminar '"& id &"' "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3


		Set RsP = Nothing
end if


if lsTipo="9" then ' Insertar nuevo registro de algoritmo de formación academica

id_cc =Request("id_cc")
nivel_grado_id =Request("nivel_grado_id")
valor =Request("valor")
id_usuario=Session("id_usuario")

sql1 = "EXEC dbo.pa_algoritmo_fa_insertar '"& id_cc &"', '"& nivel_grado_id &"', '"& valor &"', '"& id_usuario &"' "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3


		Set RsP = Nothing
end if

if lsTipo="10" then ' Insertar nuevo registro de algoritmo de formación academica

nivel =Request("nivel")
grado =Request("grado")
id_cc =Request("id_cc")
id_usuario=Session("id_usuario")

sql1 = "EXEC dbo.pa_convocatoriacargo_actualizar_ng'"& nivel &"', '"& grado &"', '"& id_cc &"', '"& id_usuario &"' "


		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3


		Set RsP = Nothing
end if


%>








