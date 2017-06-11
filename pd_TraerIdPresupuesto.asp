<!-- #include file="Conexion.asp"  --> 

<%

Response.ContentType="text/html; charset=iso-8859-1"

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 




cmbCargo=Request.Form("cmbCargo")

Set wRsSup = Server.CreateObject("ADODB.Recordset")


	 sql=" exec dbo.usp_TraerIdPresupuesto '"&cmbCargo&"';"
			
	 wRsSup.CursorLocation=3
	 wRsSup.Open sql, Micone,3,3
	 
if wRsSup.RecordCount>0 then
	Id_CCPresupuestario=wRsSup("Id_CCPresupuestario")
	Id_Presupuesto=wRsSup("Id_Presupuesto")

else
	Id_CCPresupuestario=""
	Id_Presupuesto=""
end if


response.Write Id_CCPresupuestario&","&Id_Presupuesto
Set wRsSup = Nothing

%>