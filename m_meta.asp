<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

cargo=Request.Form("cargo")
lsccdd=MID(request.Form("depa"),1,2)
lsprov=MID(request.Form("prov"),3,2)
 	lsvarCargo = len(Request.Form("cargo")) '6
	nombreCargo=mid(Request.Form("cargo"),2,lsvarCargo-1)

lspuesto=mid(request.Form("cargo"),1,2)
SQL1 = "exec dbo.usp_mostrar_meta '"& lsccdd &"', '"& lsprov &"', '"&cargo&"'"	

Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then
	%>
	<form id="formMeta" name="formMera" >
	<table width='95%' border="1" align='center' cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
        <tr  bordercolor="#DAE8F3">
          <th bgcolor="#DAE8F3" class="dato"  >Departamento</th>
          <th  bgcolor="#DAE8F3" class="dato"  >Provincia</th>
          <th  bgcolor="#DAE8F3" class="dato"  >Distrito</th>
          <th  bgcolor="#DAE8F3" class="dato">Meta a Reclutar</th>
          <th bgcolor="#DAE8F3" class="dato">Meta a Capacitar</th>
          <th bgcolor="#DAE8F3" class="dato">Meta a Contratar</th>
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
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("departamento")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("provincia")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("distrito")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="center" id="d<%=RSCuad.Fields("id_meta")%>">
          <input name="txt1<%=RSCuad.Fields("ccdi")%>"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt1<%=RSCuad.Fields("ccdi")%>" value="<%=RSCuad.Fields("meta")%>"  onblur="guardar('d<%=RSCuad.Fields("id_meta")%>','<%=RSCuad.Fields("id_meta")%>',this.value,1)" size="5" maxlength="5" />
          </td>
          
          <td bgcolor="<%=color%>" class='etiqueta' align="center" id="c<%=RSCuad.Fields("id_meta")%>" ><input name="txt2<%=RSCuad.Fields("ccdi")%>"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt2<%=RSCuad.Fields("ccdi")%>" value="<%=RSCuad.Fields("meta_capa")%>"  onblur="guardar('c<%=RSCuad.Fields("id_meta")%>','<%=RSCuad.Fields("id_meta")%>',this.value,2)" size="5" maxlength="5" /></td>
          
          
          <td bgcolor="<%=color%>" class='etiqueta' align="center" id="co<%=RSCuad.Fields("id_meta")%>"><input name="txt3<%=RSCuad.Fields("id_meta")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt3<%=RSCuad.Fields("id_meta")%>" value="<%=RSCuad.Fields("meta_con")%>"  onblur="guardar('co<%=RSCuad.Fields("id_meta")%>','<%=RSCuad.Fields("id_meta")%>',this.value,3)" size="5" maxlength="5" /></td>
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
       <td class='subtitulo' colspan='4'>No hay registros disponibles</td>
     </tr>
    </table>
<%end if%>