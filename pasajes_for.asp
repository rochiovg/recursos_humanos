<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%
Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_F2.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.Flush 
			
idProyecto=Session("id_proyecto")
codigoMeta=Session("codigoProyecto")
UbigeoDist=Session("UbigeoDist")
aulas=Session("aulas")


reporte=request("reporte") '7
gasto=request("gasto") '7
formato = Request("formato")

%>

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
                    <td width="3%" rowspan="3" style="text-align:center">&nbsp;</td>
                    <td width="97%" colspan="5" style="text-align:center"><strong>ACTIVIDAD: IMPLEMENTACION DEL FORTALECIMIENTO<br />
DE CAPACIDADES A NIVEL LOCAL</strong></td>
                </tr>
                
            <tr>
              <td  style="text-align:center" colspan="5"><strong>FUNCIONARIOS MUNICIPALES</strong></td>
            </tr>
            <tr>
              <td  style="text-align:center" colspan="5"><strong>PASAJES Y GASTOS DE TRANSPORTES (PARTIDA 232121)</strong></td>
            </tr>

          </table>

<%

		SQL1 = "exec dbo.pa_fort_listar_pasjes '"&reporte&"', '"&gasto&"', '"&formato&"', '"&UbigeoDist&"' , '"&aulas&"'  "
			
		
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
	%> 
	

<%If Not RSCuad.BOF And Not RSCuad.EOF Then 

	administrativo=RSCuad.Fields("administrativo")
	dni_administrativo=RSCuad.Fields("dni_administrativo")

%>

          
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">

            <tr bgcolor="#9FE0FF">
              <td rowspan="2" >N&deg;</td>
              <td rowspan="2"  align="center">NOMBRES Y APELLIDOS</td>
              <td  align="center">PASAJES DE    IDA</td>
              <td  align="center">PASAJES DE    VUELTA</td>
              <td rowspan="2"  align="center">TOTAL</td>
              <td rowspan="2"  align="center">OBSERVACION</td>
            </tr>
            <tr  bgcolor="#9FE0FF">
              <td align="center">IMPORTE</td>
              <td align="center">IMPORTE</td>
            </tr>
            
<%
Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 

%>           
            <tr>
              <td><%=cont%></td>
              <td align="left"><%=RSCuad.Fields("nombres")%></td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td>&nbsp;</td>
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
          
     <br> 
     <br> 
     <br>     
<table cellspacing="0" cellpadding="0">
	<tr>
    	<td rowspan="4">&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
          <td colspan="4">__________________________________________________________________</td>
        </tr>
        <tr>
          <td colspan="4">FIRMA DEL RESPONSABLE DE LA ENTREGA DE FONDOS</td>
        </tr>

  <tr>
    <td colspan="4">NOMBRE Y APELLIDOS: <%= administrativo %></td>
  </tr>
  <tr>
    <td colspan="4">DNI N&deg;: <%=dni_administrativo%></td>
  </tr>
</table>
  <%else%>

<table width='95%' align='center'>
  <tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
  </tr>
</table>
          <%end if%>
