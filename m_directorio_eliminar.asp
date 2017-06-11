<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsPaterno=request.Form("lsPaterno")
lsMaterno=request.Form("lsMaterno")
lsNombre = Request.Form("lsNombre")
lsDNI=Request.Form("lsDNI")
lsOpcion=Request.Form("lsOpcion")
lsUsuario=Request.Form("lsUsuario")

id_Proyecto=Session("id_proyecto")


SQL1 = "exec dbo.usp_mostrar_eliminar '"& lsPaterno &"', '"& lsMaterno &"', '"& lsNombre &"' , '"& lsDNI &"', '"& lsOpcion &"', '"&id_Proyecto&"' "	

Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>
	<form id="FORM1" name="FORM1" >
	<table width='72%' border="1" align='center' cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
        <tr  bordercolor="#DAE8F3">
          <th width="18%" bgcolor="#DAE8F3" class="dato" >DNI</th>
          <th width="18%" bgcolor="#DAE8F3" class="dato" >Apellido Paterno</th>
          <th width="27%" bgcolor="#DAE8F3" class="dato" >Apellido Materno</th>
          <th width="24%" bgcolor="#DAE8F3" class="dato" >Nombre</th>
          <th width="21%" bgcolor="#DAE8F3" class="dato">Proyecto          
          </th>
          <th width="21%" bgcolor="#DAE8F3" class="dato">Cargo</th>
          <th width="21%" bgcolor="#DAE8F3" class="dato">Liberado</th>
          <th width="10%" bgcolor="#DAE8F3" class="dato">Contratado</th>
          <th width="10%" bgcolor="#DAE8F3" class="dato">Permitir<br>Postulaci&oacute;n</th>
          
        </tr>
        <%  numobj = (Diferencia+1)*lsNum		 					  		  
          Do While Not RSCuad.EOF		
           response.Flush()
           If registro Mod 2 = 0 Then	
		   		color="#F2F3F4"
		   Else	
		   		color = ""	
		   End If	  
           registro = registro + 1
           sw=0				
           Fechap=""	   
           If Fechap <> "////" Then   
              For J = 0 To Diferencia Step 1												
        %>
        <tr height="10"  >
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("dni")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("ape_paterno")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("ape_materno")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("nombre")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><input type="hidden" name="id_proyectoF" id="id_proyectoF"  value="<%=RSCuad.Fields("id_proyecto")%>" /><%=RSCuad.Fields("desc_proyecto")%></t>
          <td bgcolor="<%=color%>" class='etiqueta' align="center"><%=RSCuad.Fields("cargo")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="center"><%=RSCuad.Fields("liberado")%></td>
          
          <td bgcolor="<%=color%>" class='etiqueta' align="center"><%=RSCuad.Fields("estadocontrato")%></td>
        <td bgcolor="<%=color%>" class='etiqueta' align="center"><img src="images/ok.gif" onclick="borrar('<%=RSCuad.Fields("dni")%>','<%=lsUsuario%>','<%=RSCuad.Fields("Activo")%>')" width="16" height="16" border="0" /></td>
        </tr>
        
        <%  sw=1
            Next
        End If
        IF sw = 0 Then %>
        <%	End If												
         RSCuad.MoveNext
        Loop		
        If registro <> 0 then %>
        <%End If%>
      </table>
	</form>	
<%else%>
    <table width='95%' align='center'>
     <tr>
       <td class='subtitulo' colspan='4'>La persona no esta registrada en el proyeto o existe error en los datos ingresados</td>
     </tr>
    </table>
<%end if%>