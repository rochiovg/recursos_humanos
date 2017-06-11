<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"--> 

<%

id_usuario= Session("id_usuario")

departamentos=request.form("Dep")
provincias=request.form("Prov")
distritos=request.form("Dist")

Response.ContentType="text/html; charset=iso-8859-1"
	
	if departamentos<>"" then
	
		SQL2="exec dbo.uspGet_UbigeosLista  '"&departamentos&"','1' " 
		

		Set RsP	= Server.CreateObject("ADODB.Recordset") 
		RsP.cursorlocation=3
		RsP.Open SQL2, MiCone, 3,3
		
		 If Not RsP.BOF And Not RsP.EOF Then 
		 	Response.Write "<u>Seleccion a Nivel Departamental</u> <br>"
		      Response.Write("<table>")
				 Do While Not RsP.EOF
				 Response.Write("<tr>")
				 Response.Write("<td>")
				 Response.Write RsP("dpto")&"-"&RsP("prov")&"-"&RsP("dist")
				 Response.Write("</td>")
				 Response.Write("</tr>")

				 RsP.MoveNext
				 Loop	
				 RsP.close
				 Response.Write("</table>")
		else
				response.write " "
		 END IF 
	end if
	
	if provincias<>"" then
	
		SQL2="exec dbo.uspGet_UbigeosLista  '"&provincias&"','2' " 

		Set RsP	= Server.CreateObject("ADODB.Recordset") 
		RsP.cursorlocation=3
		RsP.Open SQL2, MiCone, 3,3
		
		 If Not RsP.BOF And Not RsP.EOF Then 
		 	Response.Write "<br><u>Seleccion a Nivel Provincial </u><br>"
		      Response.Write("<table>")
				 Do While Not RsP.EOF
				 Response.Write("<tr>")
				 Response.Write("<td>")
				 Response.Write RsP("dpto")&"-"&RsP("prov")&"-"&RsP("dist")
				 Response.Write("</td>")
				 Response.Write("</tr>")

				 RsP.MoveNext
				 Loop	
				 RsP.close
				 Response.Write("</table>")
		else
				response.write " "
		 END IF 
	end if
	
	if distritos<>"" then
	
		SQL2="exec dbo.uspGet_UbigeosLista  '"&distritos&"','3' " 

		Set RsP	= Server.CreateObject("ADODB.Recordset") 
		RsP.cursorlocation=3
		RsP.Open SQL2, MiCone, 3,3
		
		 If Not RsP.BOF And Not RsP.EOF Then 
		 	Response.Write "<br><u>Seleccion a Nivel Distrital </u><br>"
		      Response.Write("<table>")
				 Do While Not RsP.EOF
				 Response.Write("<tr>")
				 Response.Write("<td>")
				 Response.Write RsP("dpto")&"-"&RsP("prov")&"-"&RsP("dist")
				 Response.Write("</td>")
				 Response.Write("</tr>")

				 RsP.MoveNext
				 Loop	
				 RsP.close
				 Response.Write("</table>")
		else
				response.write " "
		 END IF 
	end if
	
	
	if distritos="p" and provincias="p" and departamentos="p" then
				response.write "  "
	end if
	
	
%>
