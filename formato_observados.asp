<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%
Response.Addheader "Content-Disposition", "attachment; filename=formato_observados.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 


%>
    
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr style="font-size:11px; color:#333; font-weight:bold ">
    <td bgcolor="#DAE8F3"  width="125">APE_NOM</td>
    <td bgcolor="#DAE8F3" width="115">DNI</td>
    <td bgcolor="#E9DBD1" width="115">OBSERVACIONES</td>
    <td bgcolor="#E9DBD1" width="65">responsable_ob</td>
    <td bgcolor="#E9DBD1" width="108">desc_PROYECTO</td>
    <td bgcolor="#E9DBD1" width="77">annio</td>
  </tr>
  <tr>
    <td>TORRES TORRES ALAN FRANCISCO</td>
    <td>11111111</td>
    <td>NO ENTREGAR REPORTES SOLICITADOS</td>
    <td>MINEDU</td>
    <td>SISFOH</td>
    <td>2013</td>
  </tr>
</table>
