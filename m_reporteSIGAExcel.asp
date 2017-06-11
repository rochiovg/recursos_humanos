<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>

<%
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_F2.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true




varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lscargo = Request.Form("lscargo")
lsUsuario = Request.Form("lsUsuario")
lsnivel=Request("lsnivel")

idProyecto=Session("id_proyecto")

	if lsnivel=1 then
		texto="REPORTE PARA EL SIGA DE VI&Aacute;TICOS<BR> 1ER REPORTE - ENVIO 1"
	ELSEIF lsnivel=2 then
		texto="REPORTE PARA EL SIGA DE VI&Aacute;TICOS<BR> 1ER REPORTE ENVIO 2"
	ELSEIF lsnivel=3 then
		texto="REPORTE PARA EL SIGA DE VI&Aacute;TICOS<BR> 2DO REPORTE ENVIO 1"
	ELSEIF lsnivel=4 then
		texto="REPORTE PARA EL SIGA DE VI&Aacute;TICOS<BR> 2DO REPORTE ENVIO 2"
	END IF
		
		

		consulta1 = "exec uspGet_AsignacionRutas_SIGA1 '1','99','99','98','9','"&lsnivel&"', '"&idProyecto&"'"	

	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
			
			
		SQL0 = "EXEC uspGet_AsignacionRutas_SIGA1 '0','99','99','98','9','"&lsnivel&"', '"&idProyecto&"'" 
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
                 <td colspan="11" align="center"><span class="titulo"><span class="titulo"><%=texto%> </span></span></td>
                </tr>
               
    <tr style="font-size:11px">
      <th width="3%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">N&deg;</th>
      <th width="3%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DNI</th>
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
        <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CARGO FUNCIONAL</th>
        <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">TIPO RED</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CARGO CONTRATACION</th>
     <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">RUTA</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">MOVILIDAD LOCAL</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">PASAJES</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">PASAJES COBRO</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">INTERNET</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">GASTOS OPERATIVOS</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">TELEFONO</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CELULAR</th>

    </tr>
     <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 	%>
  <tr class='<%=clase%>'>
    <td height="34" class='e_td_string1'><%response.Write(cont)%>    &nbsp;</td>
    <td class='t'><%=RsP.Fields("DNI")%></td>
    <td class='e_td_string1' align="left">&nbsp;</td>

    <td align="left" class='e_td_string1'><%=RsP.Fields("nombre")%>&nbsp;</td>
    <td align="center" class='e_td_string1'>&nbsp;0</td>

    <td align="center" class='e_td_string1'>&nbsp;0</td>
 
     <td align="center" class='e_td_string1'>&nbsp;00/00/0000</td>
 
     <td align="center" class='e_td_string1'>00/00/0000</td>

    <td align="center" class='e_td_string1'>&nbsp;</td>

     <td align="center" class='e_td_string1'><%=FormatNumber(RsP.Fields("TotMon1"))%></td>
 
     <td align="center" class='e_td_string1'>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("detadepen")%></td>
    <td align="center" class='t'><%=RsP.Fields("CCDD_I")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("NOMDD")%></td>
    <td align="center" class='t'><%=RsP.Fields("CCPP_I")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("NOMPP")%></td>
    <td align="center" class='t'><%=RsP.Fields("CCDI_I")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("NOMDI")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("desc_cargoFuncional")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("Desctipo")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("desc_carg")%></td>
    
     <td align="center"  class='t'><%=RsP.Fields("RUTA")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("MOV_LOCAL")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("PASAJES")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("PASAJES_COBRO")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("INTERNET")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("GAS_OPE")%></td>
<td align="center" class='e_td_string1'><%=RsP.Fields("telefono")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("celular")%></td>
	
    <% 
		registro = registro + 1
		 %>
    <%		RsP.MoveNext
	response.Flush()
		Loop	
		RsP.close 
		Set RsP = Nothing
		%>
  </tr>
  <tr  >
  <% Do While Not RSCuad0.EOF%> 
   <td height="34" colspan="9" bgcolor="#D7F2FF" ><div class="proyecto">TOTAL </div></td>
  <td bgcolor="#D7F2FF" class='e_td_string1' ><%=FormatNumber(RSCuad0.Fields("TotMon1"),2)%></td>
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
          



