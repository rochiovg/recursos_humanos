<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<%
  dni = Request.Form("dni") 
  id_cc = Request.Form("id_cc")
  proy = Request.Form("proy")

	consulta1 = "EXEC dbo.getNotaAuto_detalle '"&dni&"', '"&id_cc&"', '"&proy&"' "  
	Set RsP = Server.CreateObject("ADODB.Recordset")
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3
	
	If Not RsP.BOF And Not RsP.EOF Then
%>
	
	<html>
  	<table width="98%" border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
      	<tr bgcolor="#DAE8F3" style="text-align:center">
        	<td width="25%">Formación Academica</td>
          <td width="25%">Experiencia Laboral</td>
          <td width="25%">Grupo de Edad</td>
          <td width="20%">Total</td>
        </tr>
      <tbody>
<% 
		Do While Not RsP.EOF
%>
        <tr style="text-align:center">
          <td><%=RsP.Fields("nota1")%></td>
          <td><%=RsP.Fields("nota2")%></td>
          <td><%=RsP.Fields("nota3")%></td>
          <td><%=RsP.Fields("total")%></td>
        </tr>
<% 
			registro = registro + 1
			RsP.MoveNext
		Loop	
		RsP.close 
%>
     </tbody>
    </table>
  
<%
	else 
  	response.Write("No hay registros")
  end If
%>

</html>