<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}

 H1.SaltoDePagina
 {
     PAGE-BREAK-AFTER: always
 }

</style> 

 
 <html>

<%


id_proyecto=Session("id_proyecto")
lsRol = Session("txtTipoUsuarioValido")

varccdd= Request("lsDPTO")
varccpp = Request("lsPROV")
varccdi = Request("lsDIST")
cargo = Request("lscargo") 
nivel = Request("lsnivel")
tipo = Request("tipo")


varccpp = Mid(varccpp,4,2)
varccdi = Mid(varccdi,6,2)


SQL1 = "exec dbo.usp_mostrar_GastoOpera '"&id&"'"	


		
Set RSCuad1	= Server.CreateObject("ADODB.Recordset") 	
RSCuad1.cursorlocation=3
RSCuad1.Open SQL1, MiCone, 3,3




SQL1 = "exec dbo.usp_mostrar_GastoOpera '"&id&"'"	


		
Set RSCuad1	= Server.CreateObject("ADODB.Recordset") 	
RSCuad1.cursorlocation=3
RSCuad1.Open SQL1, MiCone, 3,3

actividad=RSCuad1.Fields("Actividad")
mes=RSCuad1.Fields("mes")
periodo=RSCuad1.Fields("periodo")
fecha_pago=RSCuad1.Fields("fecha_pago")
'dias=RSCuad1.Fields("dias")
'totalD=RSCuad1.Fields("totalD")


if id=3 or id=6 or id=11 or id=14 or id=20 or id=34 or id=60 or id=68 then
SQL2 = "exec dbo.uspget_GAOperativosDet '"&id&"'  "	
ELSEIF id=71 or id=72 THEN 
SQL2 = "exec dbo.uspget_GAOperativosDet3 '"&id&"'  "	

else 
SQL2 = "exec dbo.uspget_GAOperativosDet2 '"&id&"'  "	
end if


		Set RSC	= Server.CreateObject("ADODB.Recordset") 
		RSC.cursorlocation=3
		RSC.Open SQL2, MiCone, 3,3
		
		
		If Not RSC.BOF And Not RSC.EOF Then		
		%>
        
            <% sub cabecera() %>
<head>


<script language="javascript">

function imprimir()
{
if (window.print)
	window.print()
else
	alert("Su navegador no soporta esta opción.");
}

</script>
</head>
<body onLoad="imprimir()">
    <table width="90%" style="page-break-before: always;" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">

      </table>
    <table width="90%" cellpadding="0" cellspacing="0">
    <tr > 
      
        <td colspan="7" align="LEFT" valign="middle" ><img src="images/cab1.png" width="100" height="50" alt="" border="0" style="CURSOR: hand"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:18px;valign=center"><strong >FORMATO B</strong></span></td>
      </tr>
      <tr bordercolor="#FFFFFF">
        <td colspan="7" align="center"  style="font-size:14px;" ><strong>GASTOS  - ACTIVIDADES PROYECTO: EVALUACIÓN CENSAL DE ESTUDIANTES</strong></td>
  </tr>
      <tr>
        <td colspan="2" align="left" style="font-size:10px;">&nbsp;</td>
        <td colspan="2" align="left" >&nbsp;</td>
        <td width="90" colspan="-4"  align="right" style="font-size:10px;"><strong>SEDE REGIONAL:</strong></td>
          <td colspan="-3"  align="left" style="font-size:10px;"><%=prov%></td>
  </tr>
      <tr>
        <td colspan="2" align="left" style="font-size:10px;"><strong>ACTIVIDAD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Planiamiento y organizaci&oacute;n</strong></td>
        <td colspan="2"  align="center" style="font-size:10px; text-align: left;">&nbsp;</td>
        <td colspan="-4"  align="right" style="font-size:10px;"><strong>SEDE PRONINCIAL / DISTRITAL:</strong></td>
        <td colspan="-3"  align="left" style="font-size:10px;"><%=dist%> <%=zonad%></td>
      </tr>
      <tr>
        <td colspan="2" align="left" style="font-size:10px;"><strong>RESPONSABLE DEL PAGO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&lt;&gt;</strong></td>
        <td colspan="2"  align="center" style="font-size:10px; text-align: left;">&nbsp;</td>
        <td colspan="-4"  align="right" style="font-size:10px;"><strong>MES:</strong></td>
        <td colspan="-3"  align="left" style="font-size:10px;"><%=mes%></td>
      </tr>
      <tr>
        <td colspan="2" align="left" style="font-size:10px;"><strong>CARGO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></td>
        <td colspan="2"  align="center" style="font-size:10px; text-align: left;">&nbsp;</td>
        <td colspan="-4"  align="right" style="font-size:10px;"><strong>FECHA DE PAGO:</strong></td>
        <td colspan="-3"  align="left" style="font-size:10px;"><%=fecha_pago%></td>
      </tr>
      <tr>
        <td colspan="2" align="left" style="font-size:10px;"><strong>DEPARTAMENTO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong><%=dpto%></td>
        <td colspan="2"   style="font-size:10px;" align="left">&nbsp;</td>
        <td colspan="-4"  align="right" style="font-size:10px;"><strong>PERIODO DE PAGO:</strong></td>
        <td colspan="-3"  align="right" style="font-size:12px; text-align: left;"><%=periodo%></td>
      </tr>
    </table>
     
     
     
<table width="90%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">  
     
      <tr>
        <td width="12"  rowspan="2" align="center" bgcolor="#CCCCCC" style="font-size:10px;"><span style="font-size:10px;">N&deg;</span></td>
        <td colspan="3" bgcolor="#CCCCCC"  align="center" style="font-size:10px;">FUNCIONARIOS RED ADMINISTRATIVA</td>
        <td colspan="5" bgcolor="#CCCCCC" style="font-size:10px;" align="center">CONCEPTO DE GASTOS</td>
        <td width="67"  rowspan="2"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">TOTAL <br />
RECIBIDO S/.</td>
        <td width="150"  rowspan="2"  align="center" valign="middle" bgcolor="#CCCCCC" style="font-size:10px;">&nbsp;&nbsp;&nbsp;&nbsp;FIRMAS&nbsp;&nbsp;&nbsp;</td>
        <td width="89"  rowspan="2"  align="center" valign="middle" bgcolor="#CCCCCC" style="font-size:10px;">OBSERVACIONES</td>
  </tr>
      <tr>
        <td width="100"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">NOMBRES Y APELLIDOS</td>
        <td width="41"  align="center" bgcolor="#CCCCCC"  style="font-size:10px;">CARGO (*)</td>
        <td width="27"  align="center" bgcolor="#CCCCCC"  style="font-size:10px;">DNI</td>
        <td width="77"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">&nbsp;&nbsp;&nbsp;&nbsp;FECHA&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td width="40"  align="center" bgcolor="#CCCCCC"  style="font-size:10px;">N&deg; D&Iacute;AS</td>
        <td width="86"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">GASTOS <br />
        OPERATIVOS S/.</td>
        <td width="77"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">MOVILIDAD LOCAL S/.</td>
        
        <td width="62"  align="center" bgcolor="#CCCCCC"  style="font-size:10px;">OTROS S/.</td>
      </tr>
      
      <% end sub %>
      
    <% sub piepagina() %>
    
    <tr>
        <td colspan="9" align="right" style="font-size:10px;" bgcolor="#CCCCCC">TOTAL</td>

        <td><%=FormatNumber(tot,2)%></td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
      </tr>

</table>

<table width="90%" border="0">
  <tr>
    <td width="90"><span style="font-size:10px;">(*) CARGO</span></td>
    <td width="79">&nbsp;</td>
    <td width="104" >&nbsp;</td>
    <td width="102" >&nbsp;</td>
    <td width="105" >&nbsp;</td>
    <td width="120" >&nbsp;</td>
  </tr>
  <tr>
    <td><p style="font-size:8px;">(01) COORDINADOR DEPARTAMENTAL<BR/>(02) COORDINADOR PROVINCIAL<BR/>(03) COORDINADOR DISTRITAL<BR />
      (04) JEFE DE BRIGADA<BR/>(05) JEFE DE GRUPO</p></td>
    <td><p style="font-size:8px;">(06) EMPADRONADORES<br />(07) REVISOR<br />(08) DIFUSOR<br />(09) ANALISTA DE CONTROL DE CALIDAD<br />(10) OTROS<br /></p></td>
    <td align="center" valign="bottom">_____________</td>
    <td align="center" valign="bottom">____________</td>
    <td align="center" valign="bottom">_____________</td>
    <td align="center" valign="bottom">______________</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td valign="top"><p style=" text-align:center;font-size:8px;">DIRECTOR DEPARTAMENTAL</p></td>
    <td valign="top"><P style=" text-align:center;font-size:8px;">COORDINADOR REGIONAL&nbsp;&nbsp;&nbsp;</P></td>
    <td valign="top"><P style=" text-align:center;font-size:8px;">&nbsp;&nbsp;&nbsp;JEFE &nbsp;&nbsp;&nbsp; </P></td>
    <td valign="top"><P style="text-align:center;font-size:8px;">FIRMA DEL RESPONSABLE DE LA ENTREGA DE FONDOS<br />
      DNI:. </td>
  </tr>
   <tr>
    <td colspan="6">&nbsp;</td>
  </tr>
</table>
<% end sub%>
        
        
   <%   function codigocargo(cargo)
		if (cargo="COORDINADOR DEPARTAMENTAL") then
			codigocargo="01"
		elseIF (cargo="COORDINADOR PROVINCIAL") then
			codigocargo="02"
		elseIF (cargo="COORDINADOR DISTRITAL") then
			codigocargo="03"
		elseIF (cargo="JEFE DE BRIGADA") then
			codigocargo="04"
		elseIF (cargo="JEFE DE GRUPO") then
			codigocargo="05"
		elseIF (cargo="EMPADRONADOR") then
			codigocargo="06"
		elseIF (cargo="REVISOR") then
			codigocargo="07"
		elseIF (cargo="DIFUSOR") then
			codigocargo="08"
		elseIF (cargo="ANALISTA DE CONTROL DE CALIDAD") then
			codigocargo="09"
		else 
			codigocargo="10"
		end if
    end function%>     
        
        
<%
		DO WHILE NOT RSC.EOF
		
		ccdd=RSC.Fields("ccdd")
		ccpp=RSC.Fields("ccpp")
		ccdi=RSC.Fields("ccdi")
		dpto=RSC.Fields("dpto")
		if id=71  or id=72 THEN 
		 prov=RSC.Fields("NOMBRE_SEDE")
		 ELSE 
		prov=RSC.Fields("prov")
		END IF
		dist=RSC.Fields("dist")
		
		
		if id=3  or id=6 or id=11 or id=14 or id=20 or id=34 or id=60 or id=68then 
		zona=RSC.Fields("zona")
		zonad="- "&RSC.Fields("zona")
		SEDE=""
		NIMSEDE=""
		ELSEIF  id=71 or id=72 THEN 
		zonad=""
		SEDE=RSC.Fields("SEDE")
		NIMSEDE=RSC.Fields("NOMBRE_SEDE")
		else
		zonad=""
		SEDE=""
		NIMSEDE=""
		end if
		
		if id=3  or id=6 or id=11 or id=14 or id=20 or id=34 or id=60 or id=68 then 
		SQL1 = "exec dbo.uspget_GAreporteFB1 '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&zona&"','"&id&"' "
		
		ELSEIF id=71  or id=72 THEN
			SQL1 = "exec dbo.uspget_GAreporteFB3 '"&SEDE&"','"&id&"', '"&ccdd&"','"&ccpp&"','"&ccdi&"' "
		else
		SQL1 = "exec dbo.uspget_GAreporteFB2 '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&id&"' "
		end if
	
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		valor=0
		pag=1
		If Not RSCuad.BOF And Not RSCuad.EOF Then
		cargo=RSCuad.Fields("cargo")
   

tot=0
	   cabecera()
	   registro = 0	
	   
			Do While Not RSCuad.EOF
			response.Flush()

			if registro>0 and registro mod 10=0 then
				piepagina() 
				cabecera()
				tot=0
		
				valor=valor+1
			end if

				cont = registro+1 
				registro = registro + 1
			if cont mod 10 = 0 then
				pag=pag + 1
			end if
				%>
<tr height="36px" style="font-size:12px">
        <td><%response.Write(cont)%></td>
        <td width="400"><%=trim(RSCuad.Fields("nombres"))%></td>
        <td class="t"><%=codigocargo(RSCuad.Fields("cargo"))%></td>
        <td class="t"><%=RSCuad.Fields("dni")%></td>
        <td style="font-size:10px"><%=RSCuad.Fields("totald")%></td>
        <td align="center" style="font-size:10px"><%=RSCuad.Fields("dias")%></td>
        <td><%=FormatNumber(RSCuad.Fields("gastosOperativos"),2)%></td>
        <td align="center"><%=FormatNumber(RSCuad.Fields("mov_local"),2)%></td>
        <td >&nbsp;</td>
        <td align="center"><%=FormatNumber(RSCuad.Fields("TOTALt"),2)%></td>
        <td>&nbsp;</td>
        <td class="t">&nbsp;</td>
    </tr>
<%			
			tot=tot+RSCuad.Fields("TOTALt")
			RSCuad.MoveNext	
			Loop	
			'RSCuad.close
			'set RSCuad=nothing 
			'MiCone.close 
			'set MiCone=nothing
			
			piepagina()
 %>


  <%else%>

<table width='90%' align='center'>
<tr>
				<td class='subtitulo' colspan='4'> </td>
				</tr>
				</table>

	<%end iF
	
	RSC.MoveNext	
			Loop	
			RSC.close
			set RSC=nothing 
			MiCone.close 
			set MiCone=nothing
		
	else
	response.Write("No hay registros")
	end if
	%>
    
                </body>
