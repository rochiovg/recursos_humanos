<%@ Language=VBScript %>
<!-- #include file="Conexion.asp" --> 

<%
 id_usuario=  Session("id_usuario")
 id_proyecto=Session("id_proyecto")

Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_Ccargo '','"&id_proyecto&"' ")

	response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"

 While not wRsDptoapli.EOF
oficio=""

if (oficion<>wRsDptoapli("Documento_CCP"))then 

response.Write" <tr  class=""dato3"" bgcolor=""#ECF5FF"">"
  response.Write "<td colspan=""9"">fecha :" & wRsDptoapli("fec_ccp") & " &nbsp;N&deg; " & wRsDptoapli("Documento_CCP") & "</td>"
	  response.Write"</tr>"
response.Write" <tr  class=""dato3"">"
  response.Write "<td width=""3%"" >&nbsp;" & wRsDptoapli("ftto") & "</td>"
 response.Write "<td width=""15%"">" & wRsDptoapli("funcional") & "</td>"
 response.Write "<td width=""15%"">" & wRsDptoapli("contratacion") & "</td>"
 response.Write "<td width=""25%"">&nbsp;" & wRsDptoapli("depen") & "</td>"
 response.Write "<td width=""5%"">&nbsp;" & wRsDptoapli("CTP") & "</td>"
 response.Write "<td width=""5%"">&nbsp;" & wRsDptoapli("CTCCP") & "</td>"
 response.Write "<td  width=""5%"" align=""right"">&nbsp;" & FormatNumber(wRsDptoapli("sueldo"),2)  &"</td>"
   response.Write "<td width=""5%"">&nbsp;" & wRsDptoapli("codigo") & "</td>"

   if wRsDptoapli("estado")="INACTIVO" THEN 
   
	  response.Write" <td width=""6%""> &nbsp; <input name=""checkbox"" type=""checkbox"" id=""checkbox"" value="""& wRsDptoapli("id_CCPresupuestario")&""">	  </td>"

ELSE 
      response.Write "<td width=""6%"">&nbsp;" & wRsDptoapli("estado") & "</td>"
end if
'Response.Write "<td width=""6%"" align=""center"" class=""alt1""  ><img src=""images/peru.png"" width=""16"" height=""16""  style=""CURSOR:HAND"" alt=""Ampliar"" onclick=""registrar_UbigeoCCP('"&wRsDptoapli("id_CCPresupuestario")&"','"&id_usuario&"')"" > </img></td>"
response.Write "<td width=""6%"" align=""center""><a href=""#"" onclick=""javascript:VerDet_CCP('" & wRsDptoapli("id_CCPresupuestario") & "')"">(DET)</a>&nbsp</td>"
 response.Write "</tr>"


else 
response.Write" <tr class=""dato3"">"
  response.Write "<td width=""3%"">&nbsp;" & wRsDptoapli("ftto") & "</td>"
 response.Write "<td width=""15%"">" & wRsDptoapli("funcional") & "</td>"
 response.Write "<td width=""15%"">" & wRsDptoapli("contratacion") & "</td>"
 response.Write "<td width=""25%"">&nbsp;" & wRsDptoapli("depen") & "</td>"
 response.Write "<td width=""5%"">&nbsp;" & wRsDptoapli("CTP") & "</td>"
 response.Write "<td width=""5%"">&nbsp;" & wRsDptoapli("CTCCP") & "</td>"
 response.Write "<td width=""5%"" align=""right"">&nbsp;" & FormatNumber(wRsDptoapli("sueldo"),2)  &  "</td>"
   response.Write "<td width=""5%"">&nbsp;" & wRsDptoapli("codigo") & "</td>"
   if wRsDptoapli("estado")="INACTIVO" THEN 
	  response.Write" <td width=""6%"">&nbsp; <input name=""checkbox"" type=""checkbox"" id=""checkbox"" value="""& wRsDptoapli("id_CCPresupuestario")&""">	"& "<img src=""images/eliminar.png"" style=""CURSOR:HAND"" alt=""Eliminar"" onclick=""EliminarRegCCPres('"&wRsDptoapli("id_CCPresupuestario")&"')"" ></img>" &"  </td>"
	  

	  
	ELSE 
      response.Write "<td width=""6%"">&nbsp;" & wRsDptoapli("estado") & "</td>"
	end if
'Response.Write "<td width=""6%"" align=""center"" class=""alt1""  ><img src=""images/peru.png"" width=""16"" height=""16""  style=""CURSOR:HAND"" alt=""Ampliar"" onclick=""registrar_UbigeoCCP('"&wRsDptoapli("id_CCPresupuestario")&"','"&id_usuario&"')"" > </img></td>"
 response.Write "<td width=""6%"" align=""center""><a href=""#"" onclick=""javascript:VerDet_CCP('" & wRsDptoapli("id_CCPresupuestario") & "')"">(DET)</a>&nbsp</td>"
 response.Write "</tr>"
 
 end if 
 oficion=wRsDptoapli("Documento_CCP")
wRsDptoapli.MoveNext
	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

%>




