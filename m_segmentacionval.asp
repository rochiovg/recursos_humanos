<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

id_Proyecto=Session("id_proyecto")

SQL1 = "exec dbo.pa_segmentacion_listar '"&id_Proyecto&"' "	
	
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
		
		If Not RSCuad.BOF And Not RSCuad.EOF Then

%>


    
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
<tr>
<td colspan="50">Gastos Operativos <img src="images/excell1.gif" onclick="verSegmentacion()"  width="32" height="29" /> </td>
</tr>
    <tr style="font-size:11px; color:#333; font-weight:bold ">
    <td bgcolor="#DAE8F3"  width="125">ID_PRESUPUESTO</td>
    <td bgcolor="#E9DBD1" width="115">SEDE</td>
    <td bgcolor="#E9DBD1" width="115">CCDD</td>
    <td bgcolor="#E9DBD1" width="65">CCPP</td>
    <td bgcolor="#E9DBD1" width="108">CCDI</td>
    <td bgcolor="#CCFFFF" width="132">OBSERVACI&Oacute;N</td>
    <td bgcolor="#CBFED7" width="77">RUTA</td>
    <td bgcolor="#CBFED7" width="124">TECNICO_CENSAL</td>
    <td bgcolor="#CBFED7" width="88">REVISOR</td>
    <td bgcolor="#CBFED7" width="119">EMPADRONADOR</td>
    <td bgcolor="#CBFED7" width="88">DIFUSOR</td>
    <td bgcolor="#CBFED7" width="104">JEFE_BRIGADA</td>
    <td bgcolor="#CBFED7" width="92">JEFE_GRUPO</td>
    <td bgcolor="#CBFED7" width="97">ANALISTA_CC</td>
    <td bgcolor="#CBFED7" width="85">COOR_ZONAL</td>
    <td bgcolor="#CBFED7" width="84">COOR_SEDE</td>
    <td bgcolor="#CBFED7" width="147">COOR_SUBDISTRITAL</td>
    <td bgcolor="#CBFED7" width="88">COOR_DIST</td>
    <td bgcolor="#CBFED7" width="110">COOR_PROV</td>
    <td bgcolor="#CBFED7" width="87">COOR_DEP</td>
    <td bgcolor="#CBFED7" width="108">SUP_NACIONAL</td>
    <td bgcolor="#66CC66" width="77">TOTALDIAS</td>
    <td bgcolor="#66CC66" width="118">TOT_MOV_LOCAL</td>
    <td bgcolor="#66CC66" width="98">TOT_PASAJES</td>
    <td bgcolor="#66CC66" width="154">TOT_PASAJES_COBRO</td>
    <td bgcolor="#66CC66" width="100">TOT_INTERNET</td>
    <td bgcolor="#66CC66" width="103">TOT_TARJETAS</td>
    <td bgcolor="#66CC66" width="108">TOT_GAST_OPE</td>
    <td bgcolor="#66CC66" width="112">TOT_MEDICINAS</td>
    <td bgcolor="#66CC66" width="88">TOT_FOTOCOPIAS</td>
    <td bgcolor="#66CC66" width="47">TOTAL</td>
    <td bgcolor="#FFFFCC" width="62">PE_DIAS</td>
    <td bgcolor="#FFFFCC" width="111">PE_MOV_LOCAL</td>
    <td bgcolor="#FFFFCC" width="92">PE_PASAJES</td>
    <td bgcolor="#FFFFCC" width="147">PE_PASAJES_COBRO</td>
    <td bgcolor="#FFFFCC" width="94">PE_INTERNET</td>
    <td bgcolor="#FFFFCC" width="97">PE_TARJETAS</td>
    <td bgcolor="#FFFFCC" width="95">PE_GAS_OPE</td>
    <td bgcolor="#FFFFCC" width="87">pe_medicinas</td>
    <td bgcolor="#FFFFCC" width="87">pe_fotocopias</td>
    <td bgcolor="#FFFFCC" width="72">PE_TOTAL</td>
    <td bgcolor="#CCFFFF" width="43">SE_DIAS</td>
    <td bgcolor="#CCFFFF" width="43">SE_MOV_LOCAL</td>
    <td bgcolor="#CCFFFF" width="43">SE_PASAJES</td>
    <td bgcolor="#CCFFFF" width="43">SE_PASAJES_COBRO</td>
    <td bgcolor="#CCFFFF" width="43">SE_INTERNET</td>
    <td bgcolor="#CCFFFF" width="43">SE_TARJETAS</td>
    <td bgcolor="#CCFFFF" width="43">SE_GAST_OPE</td>
    <td bgcolor="#CCFFFF" width="87">se_medicinas</td>
    <td bgcolor="#CCFFFF" width="87">se_fotocopias</td>
    <td bgcolor="#CCFFFF" width="72">SE_TOTAL</td>
    <td bgcolor="#FFFFCC" width="60">TE_DIAS</td>
    <td bgcolor="#FFFFCC" width="109">TE_MOV_LOCAL</td>
    <td bgcolor="#FFFFCC" width="90">TE_PASAJES</td>
    <td bgcolor="#FFFFCC" width="145">TE_PASAJES_COBRO</td>
    <td bgcolor="#FFFFCC" width="92">TE_INTERNET</td>
    <td bgcolor="#FFFFCC" width="95">TE_TARJETAS</td>
    <td bgcolor="#FFFFCC" width="100">TE_GAST_OPE</td>
    <td bgcolor="#FFFFCC" width="84">te_medicinas</td>
    <td bgcolor="#FFFFCC" width="84">te_fotocopias</td>
    <td bgcolor="#CCFFFF" width="70">TE_TOTAL</td>
    <td bgcolor="#CCFFFF" width="43">CE_DIAS</td>
    <td bgcolor="#CCFFFF" width="43">CE_MOV_LOCAL</td>
    <td bgcolor="#CCFFFF" width="43">CE_PASAJES</td>
    <td bgcolor="#CCFFFF" width="43">CE_PASAJES_COBRO</td>
    <td bgcolor="#CCFFFF" width="43">CE_INTERNET</td>
    <td bgcolor="#CCFFFF" width="43">CE_TARJETAS</td>
    <td bgcolor="#CCFFFF" width="43">CE_GAST_OPE</td>
    <td bgcolor="#CCFFFF" width="87">ce_medicinas</td>
    <td bgcolor="#CCFFFF" width="87">ce_fotocopias</td>
    <td bgcolor="#CCFFFF" width="43">CE_TOTAL</td>
    <td bgcolor="#FFFFCC" width="63">QE_DIAS</td>
    <td bgcolor="#FFFFCC" width="43">QE_MOV_LOCAL</td>
    <td bgcolor="#FFFFCC" width="43">QE_PASAJES</td>
    <td bgcolor="#FFFFCC" width="43">QE_PASAJES_COBRO</td>
    <td bgcolor="#FFFFCC" width="43">QE_INTERNET</td>
    <td bgcolor="#FFFFCC" width="43">QE_TARJETAS</td>
    <td bgcolor="#FFFFCC" width="43">QE_GAST_OPE</td>
    <td bgcolor="#FFFFCC" width="87">qe_medicinas</td>
    <td bgcolor="#FFFFCC" width="87">qe_fotocopias</td>
    <td bgcolor="#FFFFCC" width="43">QE_TOTAL</td>
    <td bgcolor="#CCFFFF" width="43">SEX_DIAS</td>
    <td bgcolor="#CCFFFF" width="43">SEX_MOV_LOCAL</td>
    <td bgcolor="#CCFFFF" width="43">SEX_PASAJES</td>
    <td bgcolor="#CCFFFF" width="43">SEX_PASAJES_COBRO</td>
    <td bgcolor="#CCFFFF" width="43">SEX_INTERNET</td>
    <td bgcolor="#CCFFFF" width="43">SEX_TARJETAS</td>
    <td bgcolor="#CCFFFF" width="43">SEX_GAST_OPE</td>
    <td bgcolor="#CCFFFF" width="94">sex_medicinas</td>
    <td bgcolor="#CCFFFF" width="94">sex_fotocopias</td>
    <td bgcolor="#CCFFFF" width="43">SEX_TOTAL</td>
    <td bgcolor="#FFFFCC" width="43">SEP_DIAS</td>
    <td bgcolor="#FFFFCC" width="43">SEP_MOV_LOCAL</td>
    <td bgcolor="#FFFFCC" width="43">SEP_PASAJES</td>
    <td bgcolor="#FFFFCC" width="43">SEP_PASAJES_COBRO</td>
    <td bgcolor="#FFFFCC" width="43">SEP_INTERNET</td>
    <td bgcolor="#FFFFCC"width="43">SEP_TARJETAS</td>
    <td bgcolor="#FFFFCC" width="111">SEP_GAST_OPE</td>
    <td bgcolor="#FFFFCC" width="94">sep_medicinas</td>
    <td bgcolor="#FFFFCC" width="94">sep_fotocopias</td>
    <td bgcolor="#FFFFCC" width="81">SEP_TOTAL</td>
    <td bgcolor="#CCFFFF" width="43">OE_DIAS</td>
    <td bgcolor="#CCFFFF" width="43">OE_MOV_LOCAL</td>
    <td bgcolor="#CCFFFF" width="43">OE_PASAJES</td>
    <td bgcolor="#CCFFFF" width="43">OE_PASAJES_COBRO</td>
    <td bgcolor="#CCFFFF" width="43">OE_INTERNET</td>
    <td bgcolor="#CCFFFF" width="43">OE_TARJETAS</td>
    <td bgcolor="#CCFFFF" width="43">OE_GAST_OPE</td>
    <td bgcolor="#CCFFFF" width="87">oe_medicinas</td>
    <td bgcolor="#CCFFFF" width="87">oe_fotocopias</td>
    <td bgcolor="#CCFFFF" width="73">OE_TOTAL</td>
    <td bgcolor="#FFFFCC" width="43">NE_DIAS</td>
    <td bgcolor="#FFFFCC" width="43">NE_MOV_LOCAL</td>
    <td bgcolor="#FFFFCC" width="43">NE_PASAJES</td>
    <td bgcolor="#FFFFCC" width="43">NE_PASAJES_COBRO</td>
    <td bgcolor="#FFFFCC" width="94">NE_INTERNET</td>
    <td bgcolor="#FFFFCC" width="97">NE_TARJETAS</td>
    <td bgcolor="#FFFFCC" width="102">NE_GAST_OPE</td>
    <td bgcolor="#FFFFCC" width="87">ne_medicinas</td>
    <td bgcolor="#FFFFCC" width="103">ne_fotocopias</td>
    <td bgcolor="#FFFFCC" width="72">NE_TOTAL</td>
    <td bgcolor="#CCFFFF" width="132">ETAPA</td>
    
  </tr>
  <%Do While Not RSCuad.EOF
			response.Flush()
 %>
  
  <tr>
    <td><%=RSCuad.Fields("ID_PRESUPUESTO")%></td>
    <td><%=RSCuad.Fields("sede")%></td>
    <td><%=RSCuad.Fields("ccdd")%></td>
    <td><%=RSCuad.Fields("ccpp")%></td>
    <td><%=RSCuad.Fields("ccdi")%></td>
    <td><%=RSCuad.Fields("observacion")%></td>
    <td><%=RSCuad.Fields("ruta")%></td>
    <td><%=RSCuad.Fields("TECNICO_CENSAL")%></td>
    <td><%=RSCuad.Fields("REVISOR")%></td>
    <td><%=RSCuad.Fields("EMPADRONADOR")%></td>
    <td><%=RSCuad.Fields("DIFUSOR")%></td>
    <td><%=RSCuad.Fields("brigada")%></td>
    <td><%=RSCuad.Fields("JEFE_GRUPO")%></td>
    <td><%=RSCuad.Fields("ANALISTA_CC")%></td>
    <td><%=RSCuad.Fields("COOR_ZONAL")%></td>
    <td><%=RSCuad.Fields("COOR_SEDE")%></td>
    <td><%=RSCuad.Fields("COOR_SUBDISTRITAL")%></td>
    <td><%=RSCuad.Fields("COOR_DIST")%></td>
    <td><%=RSCuad.Fields("COOR_PROV")%></td>
    <td><%=RSCuad.Fields("COOR_DEP")%></td>
    <td><%=RSCuad.Fields("sup_nacional")%></td>
    <td><%=RSCuad.Fields("totaldias")%></td>
    <td><%=RSCuad.Fields("tot_mov_local")%></td>
    <td><%=RSCuad.Fields("tot_pasajes")%></td>
    <td><%=RSCuad.Fields("tot_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("tot_internet")%></td>
    <td><%=RSCuad.Fields("tot_tarjetas")%></td>
    <td><%=RSCuad.Fields("tot_gast_ope")%></td>
    <td><%=RSCuad.Fields("tot_medicinas")%></td>
    <td><%=RSCuad.Fields("tot_fotocopias")%></td>
    <td><%=RSCuad.Fields("total")%></td>
    <td><%=RSCuad.Fields("pe_dias")%></td>
    <td><%=RSCuad.Fields("pe_mov_local")%></td>
    <td><%=RSCuad.Fields("pe_pasajes")%></td>
    <td><%=RSCuad.Fields("pe_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("pe_internet")%></td>
    <td><%=RSCuad.Fields("pe_tarjetas")%></td>
    <td><%=RSCuad.Fields("pe_gas_ope")%></td>
    <td><%=RSCuad.Fields("pe_medicinas")%></td>
    <td><%=RSCuad.Fields("pe_fotocopias")%></td>
    <td><%=RSCuad.Fields("pe_total")%></td>
     <td><%=RSCuad.Fields("se_dias")%></td>
    <td><%=RSCuad.Fields("se_mov_local")%></td>
    <td><%=RSCuad.Fields("se_pasajes")%></td>
    <td><%=RSCuad.Fields("se_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("se_internet")%></td>
    <td><%=RSCuad.Fields("se_tarjetas")%></td>
    <td><%=RSCuad.Fields("se_gast_ope")%></td>
    <td><%=RSCuad.Fields("se_medicinas")%></td>
    <td><%=RSCuad.Fields("se_fotocopias")%></td>
    <td><%=RSCuad.Fields("se_total")%></td>
    <td><%=RSCuad.Fields("te_dias")%></td>
    <td><%=RSCuad.Fields("te_mov_local")%></td>
    <td><%=RSCuad.Fields("te_pasajes")%></td>
    <td><%=RSCuad.Fields("te_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("te_internet")%></td>
    <td><%=RSCuad.Fields("te_tarjetas")%></td>
    <td><%=RSCuad.Fields("te_gast_ope")%></td>
    <td><%=RSCuad.Fields("te_medicinas")%></td>
    <td><%=RSCuad.Fields("te_fotocopias")%></td>
    <td><%=RSCuad.Fields("te_total")%></td>
    <td><%=RSCuad.Fields("ce_dias")%></td>
    <td><%=RSCuad.Fields("ce_mov_local")%></td>
    <td><%=RSCuad.Fields("ce_pasajes")%></td>
    <td><%=RSCuad.Fields("ce_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("ce_internet")%></td>
    <td><%=RSCuad.Fields("ce_tarjetas")%></td>
    <td><%=RSCuad.Fields("ce_gast_ope")%></td>
    <td><%=RSCuad.Fields("ce_medicinas")%></td>
    <td><%=RSCuad.Fields("ce_fotocopias")%></td>
    <td><%=RSCuad.Fields("ce_total")%></td>
   <td><%=RSCuad.Fields("qe_dias")%></td>
    <td><%=RSCuad.Fields("qe_mov_local")%></td>
    <td><%=RSCuad.Fields("qe_pasajes")%></td>
    <td><%=RSCuad.Fields("qe_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("qe_internet")%></td>
    <td><%=RSCuad.Fields("qe_tarjetas")%></td>
    <td><%=RSCuad.Fields("qe_gast_ope")%></td>
    <td><%=RSCuad.Fields("qe_medicinas")%></td>
    <td><%=RSCuad.Fields("qe_fotocopias")%></td>
    <td><%=RSCuad.Fields("qe_total")%></td>
    <td><%=RSCuad.Fields("sex_dias")%></td>
    <td><%=RSCuad.Fields("sex_mov_local")%></td>
    <td><%=RSCuad.Fields("sex_pasajes")%></td>
    <td><%=RSCuad.Fields("sex_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("sex_internet")%></td>
    <td><%=RSCuad.Fields("sex_tarjetas")%></td>
    <td><%=RSCuad.Fields("sex_gast_ope")%></td>
    <td><%=RSCuad.Fields("sex_medicinas")%></td>
    <td><%=RSCuad.Fields("sex_fotocopias")%></td>
    <td><%=RSCuad.Fields("sex_total")%></td>
    <td><%=RSCuad.Fields("sep_dias")%></td>
    <td><%=RSCuad.Fields("sep_mov_local")%></td>
    <td><%=RSCuad.Fields("sep_pasajes")%></td>
    <td><%=RSCuad.Fields("sep_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("sep_internet")%></td>
    <td><%=RSCuad.Fields("sep_tarjetas")%></td>
    <td><%=RSCuad.Fields("sep_gast_ope")%></td>
    <td><%=RSCuad.Fields("sep_medicinas")%></td>
    <td><%=RSCuad.Fields("sep_fotocopias")%></td>
    <td><%=RSCuad.Fields("sep_total")%></td>
    <td><%=RSCuad.Fields("oe_dias")%></td>
    <td><%=RSCuad.Fields("oe_mov_local")%></td>
    <td><%=RSCuad.Fields("oe_pasajes")%></td>
    <td><%=RSCuad.Fields("oe_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("oe_internet")%></td>
    <td><%=RSCuad.Fields("oe_tarjetas")%></td>
    <td><%=RSCuad.Fields("oe_gast_ope")%></td>
    <td><%=RSCuad.Fields("oe_medicinas")%></td>
    <td><%=RSCuad.Fields("oe_fotocopias")%></td>
    <td><%=RSCuad.Fields("oe_total")%></td>
    <td><%=RSCuad.Fields("ne_dias")%></td>
    <td><%=RSCuad.Fields("ne_mov_local")%></td>
    <td><%=RSCuad.Fields("ne_pasajes")%></td>
    <td><%=RSCuad.Fields("ne_pasajes_cobro")%></td>
    <td><%=RSCuad.Fields("ne_internet")%></td>
    <td><%=RSCuad.Fields("ne_tarjetas")%></td>
    <td><%=RSCuad.Fields("ne_gast_ope")%></td>
    <td><%=RSCuad.Fields("ne_medicinas")%></td>
    <td><%=RSCuad.Fields("ne_fotocopias")%></td>
    <td><%=RSCuad.Fields("ne_total")%></td>
    <td><%=RSCuad.Fields("region")%></td>

  </tr>
  <%
			registro = registro + 1
			RSCuad.MoveNext

			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
 %>
</table>
<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
          <%end if%>


