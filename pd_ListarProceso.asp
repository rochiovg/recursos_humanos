<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"       --> 

<%
 id_usuario=  Session("id_usuario")

Response.ContentType="text/html; charset=iso-8859-1"
registro=0
	set wRsDptoapli = Micone.execute(" exec PA_PROCESOCAS_LISTAR  ")

	response.Write " <table align=""center"" width=""90%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
 actividad =""
While not wRsDptoapli.EOF

 response.Write" <tr class=""dato3"" >"
 response.Write "<td width=""5%"">" & wRsDptoapli("NUMERO_PROCESO")& "</td>"
 response.Write "<td width=""20%"">" & wRsDptoapli("DESC_META") & "</td>"
 response.Write "<td width=""20%"">" & wRsDptoapli("DESC_CARGO") & "</td>"
  response.Write "<td width=""20%"" align=""center"">&nbsp;" & wRsDptoapli("TEST_PSICOLOGICO") & "</td>"
 response.Write "<td width=""10%"" align=""center""><img alt=""Agregar PEA"" border=""0"" height=16 width=16 src=""images/edita.PNG""   onClick=""javascript:agregar_PEACAS('"&wRsDptoapli("ID_PROCESOCAS")&"')"" >"&"</td>"
  response.Write "<td width=""5%"" align=""center"">"&wRsDptoapli("pea")&"&nbsp;&nbsp;<img alt=""Ver PEA Inscrita"" border=""0"" height=16 width=16 src=""images/PEA1.ico""   onClick=""javascript:ver_PEAInscrita('"&wRsDptoapli("NUMERO_PROCESO")&"')"" >"&"</td>"
 response.Write "<td width=""7%"" align=""right"">" & wRsDptoapli("PEA_NC") & "</td>"
 response.Write "</tr>"


wRsDptoapli.MoveNext
registro = registro + 1

	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing



%>




