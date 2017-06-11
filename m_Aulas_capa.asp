<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

id_lugar=  Request.Form("id_lugar")
idProyecto=Session("id_proyecto")


SQL1 = "exec dbo.uspget_AulalocalCap '"&id_lugar&"', '"&idProyecto&"'  "	
Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>
	
	<table width='100%' border="1" align='center' cellpadding="2" cellspacing="2" bordercolor="#DAE8F3"  id="Exportar_a_Excel" style="font-size:10px">
    
     <tr>
          <th colspan="16"  class="dato">Aulas por Local de de Capacitaci&oacute;n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img  src="images/salir.gif" width="16" height="16" onclick="mostrar();" />&nbsp;<span style="font-size:12px; font-family:'Palatino Linotype', 'Book Antiqua', Palatino, serif">Regresar</span></th>
      </tr>
    
        <tr>
          <th width="2%"  bgcolor="#DAE8F3"  class="dato">ID</th>
          <th width="9%"  bgcolor="#DAE8F3" class="dato">Departamento</th>
          <th width="7%"  bgcolor="#DAE8F3" class="dato">Provincia</th>
          <th width="6%"  bgcolor="#DAE8F3" class="dato">Distrito</th>
          <th width="14%"  bgcolor="#DAE8F3" class="dato">Local</th>
          <th width="15%"  bgcolor="#DAE8F3" class="dato">Aula</th>
          <th width="22%"  bgcolor="#DAE8F3" class="dato">Cantidad<br />
          PEA</th>
          <th width="9%"  bgcolor="#DAE8F3" class="dato">PEA Asignada</th>
           <th width="9%"  bgcolor="#DAE8F3" class="dato">Asignar PEA</th>
           <th width="9%"  bgcolor="#DAE8F3" class="dato">Asistencia</th>
            <th width="9%"  bgcolor="#DAE8F3" class="dato">Reporte Notas</th>
        </tr>
        <% 					  		  
          Do While Not RSCuad.EOF		
           response.Flush()  
           registro = registro + 1											
        %>
        <tr bgcolor='<%=color%>'>
          <td class="e_texto"><%=registro%></td>
                    <td class='e_texto'><%=RSCuad.Fields("departamento")%></td>
          <td class='e_texto'><%=RSCuad.Fields("provincia")%></td>
          <td class='e_texto'><%=RSCuad.Fields("distrito")%></td>
          <td class='e_texto'><%=RSCuad.Fields("id_lugar")%></td>
          <td class='e_texto'><%=RSCuad.Fields("Aula")%></td>
          <td class='e_texto'><%=RSCuad.Fields("PEA")%></td>
          <td class='e_texto'><%=RSCuad.Fields("PEA_asig")%></td>
          
<% if RSCuad.Fields("PEA")> RSCuad.Fields("PEA_asig") then
img="<img src=""images/ok.gif"" width=""16"" height=""16""  onclick=""asignarAula_PEA('"&RSCuad.Fields("id_aula")&"','"&RSCuad.Fields("PEA")&"','"&RSCuad.Fields("id_lugar")&"')"" />"
		  else	  
		  img="<img src=""images/ok2.gif"" width=""16"" height=""16"" border=""0""  />" 
		  end if
%>
          <td class='e_texto'><%=img%></td>
        <td class='e_texto'><img src="images/resultados.png" width="16" height="16" onclick="exportarl2('<%=RSCuad.Fields("id_aula")%>');" /></td>
        
        <td class='e_texto'><img src="images/resultados.png" width="16" height="16" onclick="exportarl4('<%=RSCuad.Fields("id_aula")%>');" /></td>
       
        <%  
        											
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