<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!-- #include file="Conexion.asp"       --> 

<%

 id_usuario=  Session("id_usuario")
 id_proy=  request.form("id_proy")
 
  Ubigeo=  Session("Ubigeo")
   Ubigeoapli=  Session("Ubigeoapli")
    UbigeoDist=  Session("UbigeoDist")
	  zona=  Session("zona")
	    seccion_i=  Session("seccion_i")
		
	 
 
lsRol = CStr(Session("txtTipoUsuarioValido"))
 
Response.ContentType="text/html; charset=iso-8859-1"


	set wRsDptoapli = Micone.execute(" exec dbo.pa_listar_ContContratos_links_censo '"&id_proy&"' , "&lsRol&" ")

	response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
registro = 0	
While not wRsDptoapli.EOF
cont = registro+1 



 response.Write" <tr class=""dato3"">"
 response.Write "<td width=""3%"" >" &cont& "</td>"
 response.Write "<td width=""30%"" >" & wRsDptoapli("cargo") & "</td>"
 'response.Write "<td width=""37%""  align=""center""><a href='http://desarrollo/rrhh/censo/convoca/default.asp?id="& wRsDptoapli("id_Convocatoriacargo")&"&md=1&ub="&UbigeoDist&"&zo="&zona&"&se="&seccion_i&"' target='_blank'>http://consecucion.inei.gob.pe/convoca/default.asp?id="& wRsDptoapli("id_Convocatoriacargo")&"&md=1&ub="&UbigeoDist&"&zo="&zona&"&se="&seccion_i&"</td>"
 
 response.Write "<td width=""37%""  align=""center""><a href='http://desarrollo/rrhh/censo/convoca/default.asp?id="& wRsDptoapli("id_Convocatoriacargo")&"&md=1&u="&UbigeoDist&"&zo="&zona&"&seccion="&seccion_i&"' target='_blank'>http://desarrollo/rrhh/censo/convoca/default.asp?id="& wRsDptoapli("id_Convocatoriacargo")&"&md=1&ub="&UbigeoDist&"&zo="&zona&"&se="&seccion_i&"</td>"
 
 response.Write "</tr>"

registro = registro + 1
wRsDptoapli.MoveNext
	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

%>




