<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

Response.ContentType="text/html; charset=iso-8859-1"

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 


cadena=Request("cadena")

Set wRsSup = Server.CreateObject("ADODB.Recordset")


	 sql=" exec dbo.usp_TraerPreConvoCarg '"&cadena&"';"
			
	 wRsSup.CursorLocation=3
	 wRsSup.Open sql, Micone,3,3
	 
if wRsSup.RecordCount>0 then
	Id_ConvocatoriaCargoAC=wRsSup("Id_ConvocatoriaCargo")
	Id_PresupuestoAC=wRsSup("Id_Presupuesto")

else
	Id_ConvocatoriaCargoAC=""
	Id_PresupuestoAC=""
end if



Set wRsSup = Nothing

%>


<div>
	
<INPUT type="hidden" id=txtId_ConvocatoriaCargoAC maxlength="10" name=txtId_ConvocatoriaCargoAC align="right" style="width: 100px;border:1;font-color:#0000FF;text-align:left;font-weight:bold;font-size:9px;" value='<%=Id_ConvocatoriaCargoAC%>' ReadOnly="true">

<INPUT type="hidden" id=txtId_PresupuestoAC maxlength="10" name=txtId_PresupuestoAC align="right" style="width: 100px;border:1;font-color:#0000FF;text-align:left;font-weight:bold;font-size:9px;" value='<%=Id_PresupuestoAC%>' ReadOnly="true">
</div>




