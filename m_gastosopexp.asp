<%@ Language=VBScript 
%>
<%Response.Buffer = true%>
<!-- #include file="Conexion.asp"  --> 


 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%

Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_GO.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 


TipoGasto = Request("TipoGasto")
desembolso = Request("desembolso")
envio = Request("envio")
id_Proyecto=Session("id_proyecto")

	
		consulta1 = "exec uspGet_gastosOperativos '"&TipoGasto&"', '"&desembolso&"','"&envio&"','1', '"&id_Proyecto&"' "	
	
	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
			
			
		SQL0 = "EXEC uspGet_gastosOperativos '"&TipoGasto&"', '"&desembolso&"','"&envio&"','0', '"&id_Proyecto&"'" 
		

		Set RSCuad0	= Server.CreateObject("ADODB.Recordset") 
		RSCuad0.cursorlocation=3
		RSCuad0.Open SQL0, MiCone, 3,3 
		
	    if RSCuad0.RecordCount>0 then	
		end if	

		
	  If  Not RsP.BOF And Not RsP.EOF Then 
            
        If lscargo<>"0"    then  %>
<style type="text/css">
.titulo {
	text-align: right;
}
</style>
 
                <table id="Exportar_a_Excel" width='100%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
                 <tr>
                
                <td colspan="11" align="center">&nbsp;</td>
                </tr>
                
    <tr style="font-size:11px">
      <th width="3%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">N&deg;</th>
      <th  width="3%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DNI</th>
    <th width="21%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >CODIGO</th>

    <th width="3%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato">APELLIDOS Y NOMBRES</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">SERIE</th>

    <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CORRELATIVO</th>

    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">FEC. EMIS.</th>
   
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">FEC. CANC.</th>       

    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CARGO</th>
  
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">MONTO A PAGAR S/.</th>

    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">OBSERVACIONES</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">ODEI</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CCDD</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DEPARTAMENTO</th>
        <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CCPP</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">PROVINCIA</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CCDI</th>
        <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DISTRITO</th>
        <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">ZONA</th>
        <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">BRIGADA</th>
        <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">RUTA</th>
        <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CARGO FUNCIONAL</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CARGO CONTRATACION</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">RUTA</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">MOVILIDAD LOCAL</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">PASAJES</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">PASAJES COBRO</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">INTERNET</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">TARJETAS</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">GASTOS OPERATIVOS</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">MEDICINAS</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">FOTOCOPIA</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Num Convocatoria</th>
    

    </tr>
     <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
		response.Flush()
			cont = registro+1 	%>
  <tr class='<%=clase%>'>
    <td height="34" class='e_td_string1'><%response.Write(cont)%>    &nbsp;</td>
    <td class='t'><%=RsP.Fields("dni")%></td>
    <td class='e_td_string1' align="left">&nbsp;</td>

    <td align="left" class='e_td_string1'><%=RsP.Fields("Nombres")%>&nbsp;</td>
    <td align="center" class='e_td_string1'>&nbsp;</td>

    <td align="center" class='e_td_string1'>&nbsp;</td>
 
     <td align="center" class='e_td_string1'>&nbsp;</td>
 
     <td align="center" class='e_td_string1'>&nbsp;</td>

    <td align="center" class='e_td_string1'>&nbsp;</td>

     <td align="center" class='e_td_string1'><%=RsP.Fields("TOTAL")%>.00</td>
 
     <td align="center" class='e_td_string1'>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("odei")%></td>
    <td align="center" class="t"><%=RsP.Fields("ccdd")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("departamaneto")%></td>
    <td align="center" class="t"><%=RsP.Fields("ccpp")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("provincia")%></td>
    <td align="center" class="t"><%=RsP.Fields("ccdi")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("distrito")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("zona")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("brigada")%></td>
    <td align="center" class="t"><%=RsP.Fields("rutaS")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("cargoFuncional")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("cargoSIGA")%></td>
    <td align="center" class="t"><%=RsP.Fields("rutaS")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("MOV_LOCAL")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("PASAJES")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("PASAJES_COBRO")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("INTERNET")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("TARJETAS")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("gastosOperativos")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("MEDICINA")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("FOTOCOPIA")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("num_convocatoria")%></td>

	
    <% 
		registro = registro + 1
		 %>
    <%		RsP.MoveNext
			Loop
			
		RsP.close 
		Set RsP = Nothing
		%>
  </tr>
  <tr  >
  <% Do While Not RSCuad0.EOF%> 
   <td height="34" colspan="9" bgcolor="#D7F2FF" ><div class="proyecto">TOTAL </div></td>
  <td bgcolor="#D7F2FF" class='e_td_string1' ><%=FormatNumber(RSCuad0.Fields("total"),2)%></td>
  <%RSCuad0.MoveNext
			Loop	
	 		RSCuad0.close
			set RSCuad0=nothing %>
  </tr>
      
            </table>
<%end if
		 
else %>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles</td>
                  </tr>
                </table>
		<% end If %>
                