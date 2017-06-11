<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

id=  Request.Form("id")


SQL1 = "exec dbo.usp_mostrar_localCapEdi '"&id&"'"
Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then
           Do While Not RSCuad.EOF		
           response.Flush()
           registro = registro + 1
	%>
    
      <table width='73%' border="1" align='center' cellpadding="2" cellspacing="2" bordercolor="#DAE8F3"  style="font-size:10px">
    <tr>
      <td colspan="2"  bgcolor="#DAE8F3" align="center"><span class="titulo">Modificaci&oacute;n de Local&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
    </tr>
    <tr>
      <td width="61" bgcolor="#DAE8F3"><span class="dato">Id Local</span></td>
      <td width="547"><span class="e_texto"><%=RSCuad.Fields("id_lugar")%></span></td>
    </tr>
    <tr>
      <td bgcolor="#DAE8F3"><span class="dato">Departamento</span></td>
      <td><span class="e_texto"><%=RSCuad.Fields("departamento")%></span></td>
    </tr>
    <tr>
      <td bgcolor="#DAE8F3"><span class="dato">Provincia</span></td>
      <td><span class="e_texto"><%=RSCuad.Fields("provincia")%></span></td>
    </tr>
    <tr>
      <td bgcolor="#DAE8F3">Distrito</td>
      <td><span class="e_texto"><%=RSCuad.Fields("distrito")%></span></td>
    </tr>
    <tr>
      <td bgcolor="#DAE8F3"><span class="dato">Local</span></td>
      <td><span class="style9">
        <input type="text" class='e_texto' style="width:400" id="txtloc<%=RSCuad.Fields("id_lugar")%>" name="txtloc<%=RSCuad.Fields("id_lugar")%>" value="<%=RSCuad.Fields("local")%>" maxlength="100" />
      </span></td>
    </tr>
    <tr>
      <td bgcolor="#DAE8F3"><span class="dato">Direccion</span></td>
      <td><input type="text" class='e_texto' style="width:400" id="txtdir<%=RSCuad.Fields("id_lugar")%>" name="txtdir<%=RSCuad.Fields("id_lugar")%>" value="<%=RSCuad.Fields("direccion")%>" maxlength="100" /></td>
    </tr>
    <tr>
      <td bgcolor="#DAE8F3"><span class="dato">Referencia</span></td>
      <td><input type="text" class='e_texto' style="width:500" id="txtref<%=RSCuad.Fields("id_lugar")%>" name="txtref<%=RSCuad.Fields("id_lugar")%>" value="<%=RSCuad.Fields("referencia")%>" maxlength="100" /></td>
    </tr>
     <tr>
      <td bgcolor="#DAE8F3"><span class="dato">Fecha</span></td>
      <td><input type="text" class='e_texto' style="width:180" id="txtfec<%=RSCuad.Fields("id_lugar")%>" name="txtfec<%=RSCuad.Fields("id_lugar")%>" value="<%=RSCuad.Fields("fecha")%>" maxlength="50" /></td><input name="" type="text" />
    </tr>
    <tr>
      <td bgcolor="#DAE8F3">Hora</td>
      <td><input type="text" class='e_texto' style="width:150" id="txthor<%=RSCuad.Fields("id_lugar")%>" name="txthor<%=RSCuad.Fields("id_lugar")%>" value="<%=RSCuad.Fields("hora")%>" maxlength="50" /></td><input name="" type="hidden" value="" />
    </tr>
    <tr>
      <td bgcolor="#DAE8F3">Cantidad Aulas</td>
      <td><input type="text" class='e_texto' style="width:50" id="txtaul<%=RSCuad.Fields("id_lugar")%>" name="txtaul<%=RSCuad.Fields("id_lugar")%>" value="<%=RSCuad.Fields("aulas")%>" maxlength="2" />
        <label for="txtaulasOrg"></label>
      <input type="hidden" name="txtaulasOrg" id="txtaulasOrg" value="<%=RSCuad.Fields("aulas")%>" /></td>
    </tr>
    <tr>
      <td bgcolor="#DAE8F3">Camntidad PEA</td>
      <td><input type="text" class='e_texto' style="width:50" id="txtcan<%=RSCuad.Fields("id_lugar")%>" name="txtcan<%=RSCuad.Fields("id_lugar")%>" value="<%=RSCuad.Fields("PEA")%>" maxlength="50" />
      <input type="hidden" name="txtPEAorg" id="txtPEAorg" value="<%=RSCuad.Fields("PEA")%>" /></td>
    </tr>
    <tr>
      <td bgcolor="#DAE8F3" align="center"><span class="e_td_string">
        <input 
                        name='button'  type='button'			
                        id='button' 
                        onclick="javascript:mostrar()" 
                        value='Regresar' />
      </span></td>
      <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="e_td_string">
        <input 
                        name='button2'  type='button' 			
                        id='button2' 
                        onclick="Actualizar('<%=RSCuad.Fields("id_lugar")%>')" 
                        value='Actualizar' />
      </span></td>
    </tr>
  </table>
 <%  										
         RSCuad.MoveNext
        Loop		
		RSCuad.close
		set RSCuad=nothing 
		MiCone.close 
		set MiCone=nothing	
%>

		
<%else%>
    <table width='95%' align='center'>
     <tr>
       <td class='subtitulo' colspan='4'>No hay registros disponibles</td>
     </tr>
    </table>
<%end if%>