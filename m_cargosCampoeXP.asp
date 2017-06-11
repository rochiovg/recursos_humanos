<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_F2.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 

id_usuario=  Session("id_usuario")
id_Proyecto=Session("id_proyecto")


SQL1 = "exec dbo.PA_CARGOSCAMPO_LISTAR '"& id_Proyecto &"' "	

Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then  %>
    <table width='72%' border="1" align='center' cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
     <tr  bordercolor="#DAE8F3">
          <th colspan="3" bgcolor="#DAE8F3" class="dato" >CARGOS DE LA RED OPERATIVA &nbsp;&nbsp;</th>
        </tr>
        <tr  bordercolor="#DAE8F3">
          <th width="18%" bgcolor="#DAE8F3" class="dato" >ID_PRESUPUESTO </th>
          <th width="18%" bgcolor="#DAE8F3" class="dato" >CARGO FUNCIONAL</th>
          <th width="27%" bgcolor="#DAE8F3" class="dato" >CARGO CONTRATACION </th>
        </tr>
        
        <%registro = 0					
				
			Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 
				
				%>
                

        <tr >
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("id_Presupuesto")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("desc_CargoFuncional")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("DESC_CARG")%></td>
        </tr>   
          <%
			registro = registro + 1
			RSCuad.MoveNext

			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close %>   
              
    </table>
    <%end if%>

	