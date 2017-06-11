<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 
<% 

Response.ContentType="text/html; charset=iso-8859-1"
Server.ScriptTimeout = 30000 


lsTipo = Request.Form("lsTipo")

'----------------------------------------------------------------------

if lsTipo="1" then 


fase=Request.Form("fase")
periodo=Request.Form("periodo") 


sql1 = "EXEC dbo.pa_verifica_reporte_gastosFuncionarios '"&fase&"','"&periodo&"' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		num	=RsP("total")

		Set RsP = Nothing
		
		response.Write(num)

end if



%>








