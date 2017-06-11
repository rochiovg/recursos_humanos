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

SQL1 = "exec dbo.pa_ETMP_listar '"&id_Proyecto&"' "	


	
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
    <td bgcolor="#E9DBD1" width="115">bandaprob</td>
    <td bgcolor="#E9DBD1" width="65">preseleccionado</td>
    <td bgcolor="#E9DBD1" width="108">capacita</td>
    <td bgcolor="#CCFFFF" width="132">sw_titu</td>
    <td bgcolor="#CBFED7" width="77">seleccionado</td>
        <td bgcolor="#CBFED7" width="77">flag_recep</td>
                <td bgcolor="#CBFED7" width="77">Observado inei</td>
                                <td bgcolor="#CBFED7" width="77">Observado ece</td>
                                
                                 <td bgcolor="#CBFED7" width="77">Fec fin selec</td>
                                <td bgcolor="#CBFED7" width="77">Proyecto</td>
                                

    
  </tr>
  <%Do While Not RSCuad.EOF
			response.Flush()
 %>
  
  <tr>
    <td><%=RSCuad.Fields("ID_PROYECTO")%></td>
    <td><%=RSCuad.Fields("dni")%></td>
    <td><%=RSCuad.Fields("bandaprob")%></td>
    <td><%=RSCuad.Fields("preseleccionado")%></td>
    <td><%=RSCuad.Fields("capacita")%></td>
    <td><%=RSCuad.Fields("sw_titu")%></td>
    <td><%=RSCuad.Fields("seleccionado")%></td>
        <td><%=RSCuad.Fields("flag_recep")%></td>
                <td><%=RSCuad.Fields("observado_inei")%></td>
                                <td><%=RSCuad.Fields("observado_ece")%></td>
                
<%
SQL2 = "exec  pa_v_ficha_inscritos  'D','"&RSCuad.Fields("dni")&"' , '','','', '' "	

	
		
		RSCuad1.Open SQL2, MiCone, 3,3
		
		
		If Not RSCuad1.BOF And Not RSCuad1.EOF Then
        %>

	  <td><%=RSCuad1.Fields("fechafinprocesosel")%></td>
      <td><%=RSCuad1.Fields("desc_proyecto")%></td>
      <%else%>
      <td></td>
      <td></td>
  
  	<%end if
    
    

            
%>

  </tr>
  <%
			registro = registro + 1
			RSCuad.MoveNext

			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
			
			
				    RSCuad1.close
			set RSCuad1=nothing 
			
			
 %>
</table>
<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
          <%end if%>


