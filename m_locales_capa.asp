<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

depa=  MID(Request.Form("depa"),1,2)
prov=  MID(Request.Form("prov"),3,2)
dist = MID(Request.Form("dist"),5,2)

idProyecto=Session("id_proyecto")

SQL1 = "exec dbo.usp_mostrar_localCap '"&depa&"', '"&prov&"', '"&dist&"','"&idProyecto&"' "	

Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>
	
	<table width='91%' border="1" align='center' cellpadding="2" cellspacing="2" bordercolor="#DAE8F3"  id="Exportar_a_Excel" style="font-size:10px">
        <tr>
          <th width="5%"  bgcolor="#DAE8F3"  class="dato">ID</th>
          <th width="13%"  bgcolor="#DAE8F3" class="dato">Departamento</th>
          <th width="10%"  bgcolor="#DAE8F3" class="dato">Provincia</th>
          <th width="8%"  bgcolor="#DAE8F3" class="dato">Distrito</th>
          <th width="6%"  bgcolor="#DAE8F3" class="dato">Local</th>
          <th width="9%"  bgcolor="#DAE8F3" class="dato">Direccion</th>
          <th width="17%"  bgcolor="#DAE8F3" class="dato">Referencia</th>
          <th width="6%"  bgcolor="#DAE8F3" class="dato">Fecha</th>
          <th width="6%"  bgcolor="#DAE8F3" class="dato">Hora</th>
          <th width="7%"  bgcolor="#DAE8F3" class="dato">Aulas</th>
           <th width="10%"  bgcolor="#DAE8F3" class="dato">Cantidad<br>PEA</th> 
            <th width="10%"  bgcolor="#DAE8F3" class="dato">PEA<br>Asignada</th>
            <th width="10%"  bgcolor="#DAE8F3" class="dato">Distribuci&oacute;n<br>Aulas</th> 
            <th width="10%"  bgcolor="#DAE8F3" class="dato">Distribuci&oacute;n<br>Aulas Archivo</th> 
           <th width="10%"  bgcolor="#DAE8F3" class="dato">Editar<br></th>
          <th width="9%"  bgcolor="#DAE8F3" class="dato">Eliminar</th>
        </tr>
        <% 	 					  		  
          Do While Not RSCuad.EOF		
           response.Flush()
           registro = registro + 1
							
        %>
        <tr bgcolor='<%=color%>'>
          <td class="e_texto"><%=RSCuad.Fields("id_lugar")%></td>
                    <td class='e_texto'><%=RSCuad.Fields("departamento")%></td>
          <td class='e_texto'><%=RSCuad.Fields("provincia")%></td>
          <td class='e_texto'><%=RSCuad.Fields("distrito")%></td>
          <td class='e_texto'><%=RSCuad.Fields("local")%></td>
          <td class='e_texto'><%=RSCuad.Fields("direccion")%></td>
          <td class='e_texto'><%=RSCuad.Fields("referencia")%></td>
          <td class='e_texto'><%=RSCuad.Fields("fecha")%>&nbsp;</td>
          <td class='e_texto'><%=RSCuad.Fields("hora")%></td>
          <td class='e_texto'><%=RSCuad.Fields("aulas")%></td>
          
          <%  if isnull(RSCuad.Fields("PEA")) then
		  eli=""
		  else	  
		  eli="<img src=""images/ventana.png"" width=""16"" height=""16"" border=""0"" onclick=""ver_LocalesCap('"&RSCuad.Fields("id_lugar")&"')"" />" 
		  end if%>
          <td class='e_texto'>&nbsp;<%=RSCuad.Fields("PEA")%></td>
          <td class='e_texto'>&nbsp;<%=RSCuad.Fields("totalAsi")%></td>
          <td class='e_texto'><%=eli%> </td>
          <td align="center" class='e_texto' ><img src="images/edita.PNG" width="16" height="16" onclick="reg_pea(<%=RSCuad.Fields("id_lugar")%>);" /></td>
          <td align="center" class='e_texto' ><img src="images/edita.PNG" width="16" height="16" onclick="Editar(<%=RSCuad.Fields("id_lugar")%>);" /></td>
          <%if RSCuad.Fields("totalAsi")>0 then%>
          <td align="center" class='e_texto' ><img src="images/x2.png" width="16" height="16" /></td>
          <%else%>
          <td align="center" class='e_texto' ><img src="images/Eliminar.gif" width="16" height="16" onclick="eliminar(<%=RSCuad.Fields("id_lugar")%>);" /></td>
          <%end if%>
        </tr>
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