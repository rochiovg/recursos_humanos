<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
Response.Buffer = False


varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lscargo = Request.Form("lscargo")
lsUsuario = Request.Form("lsUsuario")

idProyecto=Session("id_proyecto")


cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)


cantvarCargoTot=len(lscargo)
nomcargo = Mid(lscargo,3,cantvarCargoTot-2)
cargo = Mid(lscargo,2)



		consulta1 = "exec dbo.uspGet_AsignacionReporte  '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' , '"&cargo&"', '"&idProyecto&"' "	

	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3

		
	  If  Not RsP.BOF And Not RsP.EOF Then 
            
        If lscargo<>"0"    then  %>
<style type="text/css">
.titulo {
	text-align: right;
}
</style>
 
                <table id="Exportar_a_Excel" width='100%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
                <tr>
                
                <td colspan="23" align="center" class="titulo"><img src="images/excell1.gif" onclick="envioReporte()"  width="32" height="29" /> RUTAS ASIGNADAS</td>
                </tr>
                <tr>
                
                <td colspan="23" align="center"><span class="titulo"><span class="titulo">RUTAS ASIGNADAS - <%=ncargo%> - <%=nomccdd%>/ <%=nomccpp%>/<%=nomccdi%> </span></span></td>
                </tr>
                 <tr>
                
                <td colspan="23" align="center">&nbsp;</td>
                </tr>
                
    <tr style="font-size:11px">
      <th width="3%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">N&deg;</th>
      <th width="3%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">UBIGEO</th>
      <th width="3%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DEPARTAMENTO</th>
      <th width="3%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">PROVINCIA</th>
      <th width="3%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DISTRITO</th>
      <th width="3%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">CARGO</th>
      <th width="3%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Nombre</th>
    <th width="21%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >DNI</th>
    <th width="21%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Estado de Contrataci&oacute;n</th>
    <th width="3%" rowspan="2" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato">Ruta</th>
    <th width="3%" rowspan="2" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato">Nro. de Brigada</th>
    <th width="5%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Nro. de Empadronador</th>
    <th width="10%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Tipo</th>
    
    <th width="10%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total D&iacute;as Rural<br></th>
    <th width="10%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total D&iacute;as <br> Urbano</th>
    <th width="10%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">D&iacute;as <br> 
      Empadron.</th>
    <th width="10%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">D&iacute;as <br> Recuperaci&oacute;n</th>
    <th width="10%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">D&iacute;as <br> Gavinete</th>
    <th width="10%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total<br>D&iacute;as </th>
    
    
    
    <th height="19" colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Primer Desembolso (1)</th>
    <th height="19" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Primer Desembolso (2)</th>
    <th colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Segundo Desembolso (1)</th>
    <th bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Segundo Desembolso (2)</th>
    <th colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Tercer Desembolso (1)</th>
    <th bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Tercer Desembolso (2)</th>
    <th colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Cuarto Desembolso (1)</th>
    <th bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Cuarto Desembolso (2)</th>
    <th width="24%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato"><p>Total General S/.</p></th>
    <th width="24%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato"><p>Modo de pago primer Desembolso</p></th>
    <th width="24%" rowspan="2" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato"><p>Modo de pago Segundo Desembolso</p></th>
    </tr>
     <tr style="font-size:11px">
      
      <th width="18%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Movilidad Local S/.</th>
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Gastos Operativos S/.</th>    
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Pasajes S/.</th>
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Internet S/.</th>
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Tarjetas S/.</th>
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total (1) S/.</th>
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total (2) S/.</th>
       
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Movilidad Local S/.</th>      
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Gastos Operativos S/.</th>      
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Pasajes S/.</th>      
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Internet S/.</th>   
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Tarjetas S/.</th>  
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total (1) S/.</th>
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total (2) S/.</th>
    
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Movilidad Local S/.</th>      
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Gastos Operativos S/.</th>      
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Pasajes S/.</th>      
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Internet S/.</th>   
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Tarjetas S/.</th>  
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total (1) S/.</th>
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total (2) S/.</th>
    
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Movilidad Local S/.</th>      
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Gastos Operativos S/.</th>      
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Pasajes S/.</th>      
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Internet S/.</th>   
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Tarjetas S/.</th>  
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total (1) S/.</th>
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total (2) S/.</th>
    
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
     <td class='e_td_string1'><%=RsP.Fields("ubigeo")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("dpto")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("prov")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("dist")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("CARGO")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("nombre")%>&nbsp;</td>
    <td class='e_td_string1' align="left">&nbsp;<%=RsP.Fields("dni")%></td>
    <td class='e_td_string1' align="left">&nbsp;<%=RsP.Fields("estado")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("ruta_asig")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("brigada")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("empadronador")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("tipo")%>&nbsp;</td>
    
    
    <td align="center" class='e_td_string1'><%=RsP.Fields("TOTAL_DIAS_RU")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("TOTAL_DIAS_UR")%>&nbsp;</td>
      <td align="center" class='e_td_string1'><%=RsP.Fields("empadronamiento")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("recuperacion")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("DIAS_GABINETE")%>&nbsp;</td>

    <td align="center" class='e_td_string1'><%=RsP.Fields("TOTALDIAS")%>&nbsp;</td>
    
    
    <td align="center" class='e_td_string1'><%=RsP.Fields("pe_mov_local")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("pe_gas_ope")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("pe_pasajes")%>.00&nbsp;</td>
     <td align="center" class='e_td_string1'><%=RsP.Fields("pe_internet")%>.00&nbsp;</td>
     <td align="center" class='e_td_string1'><%=RsP.Fields("pe_tarjetas")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("pe_total")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("pe_total_seg")%>.00&nbsp;</td>
    
    
    <td align="center" class='e_td_string1'><%=RsP.Fields("se_mov_local")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("se_gast_ope")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("se_pasajes")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("se_internet")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("se_tarjetas")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("se_total")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("se_total_seg")%>.00&nbsp;</td>
    
    
    <td align="center" class='e_td_string1'><%=RsP.Fields("te_mov_local")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("te_gast_ope")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("te_pasajes")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("te_internet")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("te_tarjetas")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("te_total")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("te_total_seg")%>.00&nbsp;</td>
    
    
    <td align="center" class='e_td_string1'><%=RsP.Fields("ce_mov_local")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("ce_gast_ope")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("ce_pasajes")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("ce_internet")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("ce_tarjetas")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("ce_total")%>.00&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("ce_total_seg")%>.00&nbsp;</td>
    
    <td align="center" class='e_td_string1'><%=RsP.Fields("total")%>.00&nbsp;</td>
    <% if RsP.Fields("asignado") =1 then
		texto="Deposito con Contrase&ntilde;a"
		elseif RsP.Fields("asignado") =2 then
		texto="De baja"
		elseif RsP.Fields("asignado") =3 then
		texto="Giro al Coord. Distrital"
		end if
	%>
    <td align="center" class='e_td_string1'><%=texto%>&nbsp;</td>
    <% if RsP.Fields("se_asignado") =1 then
		texto1="Deposito con Contrase&ntilde;a"
		elseif RsP.Fields("se_asignado") =2 then
		texto1="De baja"
		elseif RsP.Fields("se_asignado") =3 then
		texto1="Giro al Coord. Distrital"
		end if
	%>
    <td align="center" class='e_td_string1'><%=texto1%>&nbsp;</td>
	
    <% 
		registro = registro + 1
		 %>
    <%		RsP.MoveNext
		Loop	
		RsP.close 
		Set RsP = Nothing
		%>
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
          

