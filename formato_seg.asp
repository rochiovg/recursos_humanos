<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_F2.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 


%>
    
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr style="font-size:11px; color:#333; font-weight:bold ">
    <td bgcolor="#DAE8F3"  width="125">ID_PRESUPUESTO</td>
    <td bgcolor="#E9DBD1" width="115">SEDE</td>
    <td bgcolor="#E9DBD1" width="115">CCDD</td>
    <td bgcolor="#E9DBD1" width="65">CCPP</td>
    <td bgcolor="#E9DBD1" width="108">CCDI</td>
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
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


