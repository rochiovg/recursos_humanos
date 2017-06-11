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

SQL1 = "exec dbo.pa_ETMP_listar_cargo '"&id_Proyecto&"' "	


	
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
		
		
set RSCuad1	= Server.CreateObject("ADODB.Recordset") 
RSCuad1.cursorlocation=3


		
		If Not RSCuad.BOF And Not RSCuad.EOF Then

%>


    
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
<tr>
<td colspan="50"></td>
</tr>
    <tr style="font-size:11px; color:#333; font-weight:bold ">
    <td bgcolor="#DAE8F3"  width="125">ID_PROYECTO</td>
    <td bgcolor="#E9DBD1" width="115">dni</td>
    <td bgcolor="#E9DBD1" width="115">CARGO</td>

    
  </tr>
  <%Do While Not RSCuad.EOF
			response.Flush()
 %>
  
  <tr>
    <td><%=RSCuad.Fields("ID_PROYECTO")%></td>
    <td><%=RSCuad.Fields("dni")%></td>
    <td><%=RSCuad.Fields("id_convocatoriacargo")%></td>

                


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


