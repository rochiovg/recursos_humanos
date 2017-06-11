<!-- #include file="Conexion.asp"  --> 

<%

Response.ContentType="text/html; charset=iso-8859-1"

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 




num_Convocatoria=Request("num_Convocatoria")

Set wRsSup = Server.CreateObject("ADODB.Recordset")


	 sql=" exec dbo.getFechaIniConv '"&num_Convocatoria&"';"
			
	 wRsSup.CursorLocation=3
	 wRsSup.Open sql, Micone,3,3
	 
if wRsSup.RecordCount>0 then

	num_Convocatoria=wRsSup("num_Convocatoria")
	Desc_Convocatoria=wRsSup("Desc_Convocatoria")
	fechaInicio=wRsSup("fechaInicio")
	fechaFin=wRsSup("fechaFin")
	estado=wRsSup("estado")
	
	resp=num_Convocatoria&","&Desc_Convocatoria&","&fechaInicio&","&fechaFin&","&estado
	response.write(resp)
	
else


	num_Convocatoria=""
    Desc_Convocatoria=""
	fechaInicio=""
	fechaFin=""
	estado=""
end if


Set wRsSup = Nothing

%>

