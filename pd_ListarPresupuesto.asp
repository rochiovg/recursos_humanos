<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"       --> 

<%
 id_usuario=  Session("id_usuario")
 id_proy=Session("id_proyecto")
 id_rolUsuario=Session("txtTipoUsuarioValido")

Response.ContentType="text/html; charset=iso-8859-1"
registro=0
	set wRsDptoapli = Micone.execute(" exec uspGet_presupuestoPEA '"&id_proy&"' ")

	response.Write " <table align=""center"" width=""90%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
 actividad =""
 fuente = ""
While not wRsDptoapli.EOF
 
IF(ISNULL(wRsDptoapli("total")) )THEN
VALOR =0
ELSE
VALOR =wRsDptoapli("total")
END IF


if (wRsDptoapli("desc_CargoFuncional")="TOTAL") or (wRsDptoapli("desc_CargoFuncional")="TOTAL FFTO") then 
response.Write" <tr class=""dato3"">"
 response.Write "<td align=""right"" colspan=""6"" bgcolor=""#FFFFE6"">" & wRsDptoapli("desc_CargoFuncional") & "</td>"
   response.Write "<td  align=""right"" bgcolor=""#FFFFE6"">&nbsp;" &FormatNumber(VALOR,2) & "</td>"
 response.Write "</tr>"
 
 else 
 
 if (fuente<>wRsDptoapli("codi_FuenteFto")  ) then 
  response.Write" <tr class=""dato3"">"
 response.Write "<td align=""left"" colspan=""8"" bgcolor=""#00FFFF"">" & wRsDptoapli("FFto") & "</td>"
 response.Write "</tr>"
	 if (actividad<>wRsDptoapli("id_Actividad")  ) then 
		response.Write" <tr class=""dato3"">"
		response.Write "<td align=""left"" colspan=""8"" bgcolor=""#DFDFFF"">" & wRsDptoapli("dactividad") & "</td>"
		response.Write "</tr>"
		 response.Write" <tr class=""dato3"" >"
		response.Write "<td width=""2%"">" & registro& "</td>"
		response.Write "<td width=""35%"">" & wRsDptoapli("desc_CargoFuncional") & "</td>"
		response.Write "<td width=""38%"">" & wRsDptoapli("DESC_CARG") & "</td>"
		response.Write "<td width=""5%"" align=""center"">&nbsp;" & wRsDptoapli("SUEL_CARG") & "</td>"
		response.Write "<td width=""5%"" align=""center"">&nbsp" & wRsDptoapli("totalPEA_P") & "</td>"
		response.Write "<td  width=""10%"" align=""right"">&nbsp;" & FormatNumber(VALOR,2)  & "</td>"
		 response.Write "<td width=""7%"" align=""center""><a href=""#"" onclick=""javascript:VerDet_pres('" & wRsDptoapli("id_presupuesto") & "')"">(DET)</a>&nbsp;</td>"
		 
		  IF id_rolUsuario=1 or id_rolUsuario=7 THEN
		   response.Write "<td width=""7%"" align=""center""><img src='images/eliminar.png' style='CURSOR:HAND' onclick=""javascript:EliminarReg('" & wRsDptoapli("id_presupuesto") & "')""></img>&nbsp;</td>"
		  END IF
		   


			 
		response.Write "</tr>"

	else 
 
		response.Write" <tr class=""dato3"" >"
		response.Write "<td width=""2%"">" & registro& "</td>"
		response.Write "<td width=""35%"">" & wRsDptoapli("desc_CargoFuncional") & "</td>"
		response.Write "<td width=""38%"">" & wRsDptoapli("DESC_CARG") & "</td>"
		 response.Write "<td width=""5%"" align=""center"">&nbsp;" & wRsDptoapli("SUEL_CARG") & "</td>"
		response.Write "<td width=""5%"" align=""center"">&nbsp"&wRsDptoapli("totalPEA_P")&"</td>"
		response.Write "<td width=""10%"" align=""right"">&nbsp;" & FormatNumber(VALOR,2)  & "</td>"
		response.Write "<td width=""7%"" align=""center""><a href=""#"" onclick=""javascript:VerDet_pres('" & wRsDptoapli("id_presupuesto") & "')"">(DET)</a>&nbsp</td>"
		
		  IF id_rolUsuario=1 or id_rolUsuario=7 THEN
		 response.Write "<td width=""7%"" align=""center""><img src='images/eliminar.png' style='CURSOR:HAND' onclick=""javascript:EliminarReg('" & wRsDptoapli("id_presupuesto") & "')""></img>&nbsp;</td>"
			   END IF
			 


		response.Write "</tr>"
	end if 
 else
	if (actividad<>wRsDptoapli("id_Actividad")  ) then 
	response.Write" <tr class=""dato3"">"
	response.Write "<td align=""left"" colspan=""8"" bgcolor=""#DFDFFF"">" & wRsDptoapli("dactividad") & "</td>"
	response.Write "</tr>"
	 response.Write" <tr class=""dato3"" >"
	response.Write "<td width=""2%"">" & registro& "</td>"
	response.Write "<td width=""35%"">" & wRsDptoapli("desc_CargoFuncional") & "</td>"
	response.Write "<td width=""38%"">" & wRsDptoapli("DESC_CARG") & "</td>"
	response.Write "<td width=""5%"" align=""center"">&nbsp;" & wRsDptoapli("SUEL_CARG") & "</td>"
	response.Write "<td width=""5%"" align=""center"">&nbsp" & wRsDptoapli("totalPEA_P") & "</td>"
	response.Write "<td  width=""10%"" align=""right"">&nbsp;" & FormatNumber(VALOR,2)  & "</td>"
	 response.Write "<td width=""7%"" align=""center""><a href=""#"" onclick=""javascript:VerDet_pres('" & wRsDptoapli("id_presupuesto") & "')"">(DET)</a>&nbsp;</td>"
	 
	   IF id_rolUsuario=1 or id_rolUsuario=7 THEN
 	 response.Write "<td width=""7%"" align=""center""><img src='images/eliminar.png' style='CURSOR:HAND' onclick=""javascript:EliminarReg('" & wRsDptoapli("id_presupuesto") & "')""></img>&nbsp;</td>"
	 
	    END IF
	 


	response.Write "</tr>"

	else 
 
	response.Write" <tr class=""dato3"" >"
	response.Write "<td width=""2%"">" & registro& "</td>"
	response.Write "<td width=""35%"">" & wRsDptoapli("desc_CargoFuncional") & "</td>"
	response.Write "<td width=""38%"">" & wRsDptoapli("DESC_CARG") & "</td>"
	 response.Write "<td width=""5%"" align=""center"">&nbsp;" & wRsDptoapli("SUEL_CARG") & "</td>"
	response.Write "<td width=""5%"" align=""center"">&nbsp"&wRsDptoapli("totalPEA_P")&"</td>"
	response.Write "<td width=""10%"" align=""right"">&nbsp;" & FormatNumber(VALOR,2)  & "</td>"
	response.Write "<td width=""7%"" align=""center""><a href=""#"" onclick=""javascript:VerDet_pres('" & wRsDptoapli("id_presupuesto") & "')"">(DET)</a>&nbsp</td>"
	
	 IF id_rolUsuario=1 or id_rolUsuario=7 THEN
    response.Write "<td width=""7%"" align=""center""><img src='images/eliminar.png' style='CURSOR:HAND' onclick=""javascript:EliminarReg('" & wRsDptoapli("id_presupuesto") & "')""></img>&nbsp;</td>"
	   END IF
	

	response.Write "</tr>"
	end if 
 end if


 end if
   actividad =wRsDptoapli("id_Actividad")
   fuente = wRsDptoapli("codi_FuenteFto")
   

wRsDptoapli.MoveNext
registro = registro + 1

	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing



%>




