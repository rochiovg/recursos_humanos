<%@ Language=VBScript%>

<!-- #include file="Conexion.asp"  --> 
<style> 
 .t {mso-number-format:"\@";}
H1.SaltoDePagina { PAGE-BREAK-AFTER: always} 
</style>
<%
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_ListaContratos.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 

idProyecto=Session("id_proyecto")

lsDPTO = Request.QueryString("lsDPTO")
lsPROV = Request.QueryString("lsPROV")
lsDIST = Request.QueryString("lsDIST")
lsZona = Request.QueryString("lsZona")
lsSeccion = Request.QueryString("lsSeccion")
lsCargo = Request.QueryString("lsCargo")
lsEstado = Request.QueryString("lsEstado")

cantvarccddTot=len(lsDPTO)
cantvarccppTot=len(lsPROV)
cantvarccdiTot=len(lsDIST)


if(cantvarccddTot>1) then
nomccdd = Mid(lsDPTO,3,cantvarccddTot-2)
varccdd = Mid(lsDPTO,1,2)
lsDPTO2=" and lc.CODI_DEPA_DEP=" & varccdd & ""
else
lsDPTO2=""
end if

if(cantvarccppTot>4) then
nomccpp = Mid(lsPROV,5,cantvarccppTot-4)
varccpp = Mid(lsPROV,3,2)
lsPROV2=" and lc.CODI_PROV_TPR=" & varccpp & ""
else
lsPROV2=""
end if

if(cantvarccdiTot>6) then
nomccdi = Mid(lsDIST,7,cantvarccdiTot-6)
varccdi = Mid(lsDIST,5,2)
lsDIST2=" and lc.CODI_DIST_TDI=" & varccdi & ""
else
lsDIST2=""
end if

if(lsEstado="9999") then
txtEstado2=""
end if

if(lsEstado="1") then
txtEstado2="and FLAG_IMPRESION=1"
end if

if(lsEstado="2") then
txtEstado2="and FLAG_IMPRESION IS NULL"
end if

if(lsCargo="900") then
lsCargo2=""
else
lsCargo2=" and lc.COD_CAR_PROY=" & lsCargo & ""
end if

'response.write(txtEstado2)
'consulta1 = "EXEC dbo.uspGet_DatosConocimientos'" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & tipocargo & "', '" & idProyecto & "','"&lsConvocaroria&"'" 
'if(lsCargo="900") then
'Server.ScriptTimeout = 700
'consulta1 = "SELECT lc.codi_empl_per as dni, Convert(Varchar(10),lc.fech_reso_cnt,103) as fcontrato, Convert(Varchar(10),lc.fech_inic_cnt,103) as finicio, lc.nro_contrato, lc.marca, ds.ape_pat_per as apater, ds.ape_mat_per as amater, ds.nom_emp_per as nombres, Convert(date,lc.FECH_INIC_CNT,103) as FECH_INIC_CNT, Convert(date,lc.FECH_RESO_CNT,103) as FECH_RESO_CNT FROM SIGA..INEI.CONTRATOS as lc left join DIRECTORIO_SIGA as ds on lc.codi_empl_per=ds.codi_empl_per where lc.MARCA=1 " & txtEstado2 & lsDPTO2 & lsPROV2 & lsDIST2 & " and lc.ID_PROYECTO='" & idProyecto & "'"

'consulta1 = "SELECT lc.codi_empl_per as dni, Convert(Varchar(10),lc.fech_reso_cnt,103) as fcontrato, Convert(Varchar(10),lc.fech_inic_cnt,103) as finicio, lc.nro_contrato, lc.id_per, lc.marca, ds.ape_pat_per as apater, ds.ape_mat_per as amater, ds.nom_emp_per as nombres, Convert(date,lc.FECH_INIC_CNT,103) as FECH_INIC_CNT, Convert(date,lc.FECH_RESO_CNT,103) as FECH_RESO_CNT FROM SIGA..INEI.V_LISTA_CONTRATOS_IMPRESION as lc left join DIRECTORIO_SIGA as ds on lc.codi_empl_per=ds.codi_empl_per where lc.MARCA=1 and lc.ID_PROYECTO='" & idProyecto & "'"
'where substring(NRO_CONTRATO,1,3)='LOC' and RIGHT(NRO_CONTRATO,2)='17'
Server.ScriptTimeout = 700
consulta1 = "SELECT lc.codi_empl_per as dni, Convert(Varchar(10),lc.fech_reso_cnt,103) as fcontrato, Convert(Varchar(10),lc.fech_inic_cnt,103) as finicio, lc.nro_contrato, lc.marca, ds.ape_pat_per as apater, ds.ape_mat_per as amater, ds.nom_emp_per as nombres, Convert(date,lc.FECH_INIC_CNT,103) as FECH_INIC_CNT, Convert(date,lc.FECH_RESO_CNT,103) as FECH_RESO_CNT FROM SIGA..INEI.CONTRATOS as lc left join DIRECTORIO_SIGA as ds on lc.codi_empl_per=ds.codi_empl_per where lc.MARCA=1 " & lsDPTO2 & lsPROV2 & lsDIST2 & lsCargo2 & " and lc.FLAG_IMPRESION=1 and lc.ID_PROYECTO='" & idProyecto & "'"

consulta2 = "SELECT lc.codi_empl_per as dni, Convert(Varchar(10),lc.fech_reso_cnt,103) as fcontrato, Convert(Varchar(10),lc.fech_inic_cnt,103) as finicio, lc.nro_contrato, lc.marca, ds.ape_pat_per as apater, ds.ape_mat_per as amater, ds.nom_emp_per as nombres, Convert(date,lc.FECH_INIC_CNT,103) as FECH_INIC_CNT, Convert(date,lc.FECH_RESO_CNT,103) as FECH_RESO_CNT FROM SIGA..INEI.CONTRATOS as lc left join DIRECTORIO_SIGA as ds on lc.codi_empl_per=ds.codi_empl_per where lc.MARCA=1 " & lsDPTO2 & lsPROV2 & lsDIST2 & lsCargo2 & " and FLAG_IMPRESION IS NULL and lc.ID_PROYECTO='" & idProyecto & "'"

consulta3 = "SELECT lc.codi_empl_per as dni, Convert(Varchar(10),lc.fech_reso_cnt,103) as fcontrato, Convert(Varchar(10),lc.fech_inic_cnt,103) as finicio, lc.nro_contrato, lc.marca, ds.ape_pat_per as apater, ds.ape_mat_per as amater, ds.nom_emp_per as nombres, Convert(date,lc.FECH_INIC_CNT,103) as FECH_INIC_CNT, Convert(date,lc.FECH_RESO_CNT,103) as FECH_RESO_CNT, lc.FLAG_IMPRESION, cf.desc_cargofuncional, dp.nombre as ndep, pr.nombre as npro, di.nombre as ndis FROM SIGA..INEI.CONTRATOS as lc left join DIRECTORIO_SIGA as ds on lc.codi_empl_per=ds.codi_empl_per left join CargoFuncional as cf on lc.COD_CAR_PROY=cf.id_cargofuncional left join Dpto as dp on lc.CODI_DEPA_DEP=dp.CCDD left join PROV as pr on lc.CODI_DEPA_DEP=pr.CCDD and lc.CODI_PROV_TPR=pr.CCPP left join Dist as di on lc.CODI_DEPA_DEP=di.CCDD and lc.CODI_PROV_TPR=di.CCPP and lc.CODI_DIST_TDI=di.CCDI where lc.MARCA=1 " & txtEstado2 & lsDPTO2 & lsPROV2 & lsDIST2 & lsCargo2 & " and lc.ID_PROYECTO='" & idProyecto & "'"

Set RsP = Server.CreateObject("ADODB.Recordset")
RsP.cursorlocation=3
RsP.Open consulta3, MiCone, 3,3

Set RsP2 = Server.CreateObject("ADODB.Recordset")
RsP2.cursorlocation=3
RsP2.Open consulta2, MiCone, 3,3

Set RsP3 = Server.CreateObject("ADODB.Recordset")
RsP3.cursorlocation=3
RsP3.Open consulta1, MiCone, 3,3
%>
<br/>
    <table width="98%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="93%"><table width="18%" border="1" cellspacing="2" cellpadding="2" bordercolor="#DAE8F3">
          <tr>
            <th width="13%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" align="left">FIRMADOS</th>
            <td width="5%" bordercolor="#DAE8F3" class="dato" style="font-size:10px" align="center"><%  response.write(RsP3.RecordCount) %>
              </th></td>
          </tr>
          <tr>
            <th width="13%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" align="left">NO FIRMADOS</th>
            <td width="5%" bordercolor="#DAE8F3" class="dato" style="font-size:10px" align="center"><% response.write(RsP2.RecordCount) %>
              </th></td>
          </tr>
          <tr>
            <th width="13%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" align="left">TOTALES</th>
            <td width="5%" bordercolor="#DAE8F3" class="dato" style="font-size:10px" align="center"><% response.write(RsP3.RecordCount + RsP2.RecordCount) %>
              </th></td>
          </tr>
        </table></td>
        <td width="7%">&nbsp;</td>
      </tr>
    </table>
<br/>
<table width='98%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
<%
'if(lsEstado="2") then
'cnn.CommandTimeout = 700
	  If  Not RsP.BOF And Not RsP.EOF Then
%>
    <tr style="font-size:9px">
      <th width="3%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>
      <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg; DE CONTRATO</th>
      <th width="6%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
     <th width="23%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato3">DATOS PERSONALES</span></th>
     <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato3">CARGO</span></th>
     <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato3">DEPARTAMENTO</span></th>
     <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato3">PROVINCIA</span></th>
     <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato3">DISTRITO</span></th>
 <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato3">FECHA DE CONTRATACION</span></th>
  <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px">FECHA DE INICIO</span></th>
    
    
     <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FIRMADO</th> 
    </tr>
  <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
		'if not null(RsP.Fields("marca")) then
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 	%>
  <tr class='<%=clase%>'>
    <td height="34" class='e_td_string1'><%response.Write(cont)%>    &nbsp;</td>
    <td class='e_td_string1' align="center">&nbsp;<%=RsP.Fields("nro_contrato")%></td>
    <td class='e_td_string1'>&nbsp;<%=RsP.Fields("dni")%></td>	
    <td class='e_td_string1'>&nbsp;<%=RsP.Fields("nombres") + " "+ RsP.Fields("apater") + " "+ RsP.Fields("amater")%></td> 
    <td class='e_td_string1' align="center"><%=RsP.Fields("desc_cargofuncional")%></td>
    <td class='e_td_string1' align="center"><%=RsP.Fields("ndep")%></td>
    <td class='e_td_string1' align="center"><%=RsP.Fields("npro")%></td>
    <td class='e_td_string1' align="center"><%=RsP.Fields("ndis")%></td>
    <td class='e_td_string1' align="center"><%=RsP.Fields("fcontrato")%></td>
     <td bordercolor="#DAE8F3" class='e_td_string1' align="center"><%=RsP.Fields("finicio")%></td>
    <td bordercolor="#DAE8F3" id="divTotal"  class='e_td_string1' align="center"><% if(RsP.Fields("FLAG_IMPRESION")="1") then %>Si<% else %><a onclick="estado_firmado('<%=RsP.Fields("dni")%>', '<%=RsP.Fields("finicio")%>', '<%=RsP.Fields("fcontrato")%>')">Por Firmar&nbsp;</a><a onclick="estado_firmado('<%=RsP.Fields("dni")%>', '<%=RsP.Fields("finicio")%>', '<%=RsP.Fields("fcontrato")%>')"><img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"></img></a><% end if%></td>
	<% 
	'lsNivel= RsP.Fields("nivel")
		registro = registro + 1
		dato2 = dato2+1 
		'End If
		RsP.MoveNext
		Loop	
		RsP.close %>
  </tr>
		<% else %>
        <tr>
        <td>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles</td>
                  </tr>
</table>
		</td>
        </tr>
		<% end If %>
</table>