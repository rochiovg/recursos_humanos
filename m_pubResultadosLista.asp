<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<%
  proy = Request.Form("proy")
  id_cc = Request.Form("id_cc")
  
  consulta = "exec cargos_publicaresultados_checklist '"&proy&"','"&id_cc&"' " 
  Set RsP = Server.CreateObject("ADODB.Recordset")
  RsP.cursorlocation=3
  RsP.Open consulta, MiCone, 3,3

  If Not RsP.BOF And Not RsP.EOF Then
%>
  <html>
  	<table width="100%" border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
      	<tr bgcolor="#DAE8F3" style="text-align:center">
          <td align="center" width="7%">Orden</td>
          <td align="center" width="35%">Proceso</td>
          <td align="center" width="8%">Publicado</td>
          <td align="center" width="45%">Observaciones</td>
        </tr>
      <tbody>
<% 
		Do While Not RsP.EOF
%>
        <tr>
          <td align="center"><%=RsP.Fields("cod_pro")%></td>
          <td align="letf"><%=RsP.Fields("des_pro")%></td>
          <% If RsP.Fields("ind_pub") = "S" then %> 
          <td align="center"><img src="images/ok3.jpg" width="30" height="30"</img></td>
          <% Else %> 
          	<td align="center"><img src="images/espera.jpg" width="30" height="30"</img></td>
          <% End If %> 
					<td align="letf"><%=RsP.Fields("des_obs")%></td>
        </tr>
<% 
			RsP.MoveNext
		Loop	
		RsP.close 
%>
      </tbody>
    </table>
<%
	else 
		response.Write("No hay registros")
		RsP.close
	end If
%>
  </html>