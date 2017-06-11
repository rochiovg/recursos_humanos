<%@ Language=VBScript %>
<%session.lcid=2057%>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 .t1 {mso-number-format:"\@";}
 </style>
<%


Server.ScriptTimeout = 230400  

Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0'
Response.Buffer = True 
Response.Flush 
	
fin = request("fin") 


lsperiodo2 = request("lsperiodo2")
varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
lsnivel = Request("lsnivel")

id_proyecto=session("id_proyecto")
cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
if cantvarccdiTot <> 0 then
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)
end if


fechayhora= Now()
varfin=request("lsfin") '7






	
	SQL2 = "EXEC dbo.uspGet_PlanillaDetalleTotal '"&lsperiodo2&"','" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsnivel& "', '" & id_proyecto& "'" 


	Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
	   
		


	%> 

<div id="div1" border="0" style="height:60px;overflow:auto; width:90%;VISIBILITY:visible; align=LEFT">
 <table id="tbl2"   colspan="12" style="border-collapse:collapse;border:0;align=LEFT;width:100%;height:30%;"  >

  <tr width="50%" align="right" colspan="12" border="0">
  <td width="25%" align=right  style="font-size:11px;border:0;"><span class="e_td_string1">PEA Total:&nbsp;&nbsp;<Strong><%=Ucase(trim(RSCuad2.Fields("TotPEA")))%></Strong></span></td>
  <td  width="30%" align="right" colspan="3" style="font-size:11px;border:0;"><span class="e_td_string1">Monto Total:&nbsp;&nbsp;<Strong> <%=FormatNumber(RSCuad2.Fields("MontoPago"),2)%></Strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>


 </table>
</div>
<%

Set RSCuad2= Nothing

%>






	 