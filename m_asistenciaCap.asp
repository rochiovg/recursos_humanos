<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
	Server.ScriptTimeout = 230400  
	Response.Expires = 0
	Response.Buffer = True 
	Response.ContentType = "text/html; charset=iso-8859-1"
	
	
	id_proyecto=session("id_proyecto") 

	aula = request("lsDIST")	'150101LIMA
	lsRol=Request.Form("lsRol")
	usuario=Session("id_usuario")

		
	SQL1 = "exec dbo.pa_ficha_listarCapacitacion '" & aula & "', '" & id_proyecto & "' "	
	

	Set RSCuad = Server.CreateObject("ADODB.Recordset")

	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3

	
	If Not RSCuad.BOF And Not RSCuad.EOF Then
	
	
	
	
%>
	<link href="Styles/inei.css" rel="stylesheet" type="text/css" />
	
	<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3">
		<tr>
			<td colspan="15" >
				<span class="titulo">PERSONAL CAPACITACION : <%=vartitt%>
					<span class="e_td_string1">
						<input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
					</span>
				</span></td>
		</tr>
        
		<tr style="font-size:9px;">
			<th width="2%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Nro</th>
            <th width="30%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">DEPARTAMENTO</th>
            <th width="30%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">PROVINCIA</th>
			<th width="30%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Nombre</th>             		
			<th width="7%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">DNI</th>
			<th width="15%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">CARGO</th>
            <%if id_proyecto=15 then%>
			<th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">06/03/2014<span class="e_td_string1">
		  </span></th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">07/03/2014<span class="e_td_string1">
		  </span></th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">08/03/2014</th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">09/03/2014</th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">10/03/2014</th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">11/03/2014</th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">12/03/2014</th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">13/03/2014</th>
            <%else%>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">17/03/2014<span class="e_td_string1">
		  </span></th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">18/03/2014<span class="e_td_string1">
		  </span></th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">19/03/2014</th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">20/03/2014</th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">21/03/2014</th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">22/03/2014</th>
            <th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">23/03/2014</th>
            <%end if%>
		</tr>
		<%
			registro = 0
			contadorSeleccion = 0
			
			Do While Not RSCuad.EOF
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro + 1
		%>
		<tr class='<%=clase%>'>
			<td width="2%" class="alerta4" style="font-size:9px;"><%response.Write(cont)%></td>
            <td width="30%" class="alerta4" style="font-size:9px;" align="left"><%=RSCuad.Fields("nombred")%></td>   
            <td width="30%" class="alerta4" style="font-size:9px;" align="left"><%=RSCuad.Fields("nombreP")%></td>   
			<td width="30%" class="alerta4" style="font-size:9px;" align="left"><%=RSCuad.Fields("nombre")%></td>              
			<td width="7%" class="alerta4" style="font-size:9px;">&nbsp;<%=RSCuad.Fields("dni")%></td>
			<td width="15%" class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("cargo")%></td>		
               <td  width="5%" align="center" class='e_td_string1' id="Ad1<%=RSCuad.Fields("id_per")%>"> <div id="chek" style="display:none"></div><input  type="checkbox" value="1" class=""  <% if RSCuad.Fields("Asist1")="1" then response.Write("checked=""checked""")  end if %> name="Al"  onclick="alerta_datos('<%=RSCuad.Fields("id_per")%>',this,'<%=lsUsuario%>','1')" id="Al<%=RSCuad.Fields("id_per")%>" />&nbsp;</td>
               
               <td  width="5%" align="center" class='e_td_string1' id="Ad2<%=RSCuad.Fields("id_per")%>"> <div id="chek" style="display:none"></div><input  type="checkbox" value="1"  <% if RSCuad.Fields("Asist2")="1" then response.Write("checked=""checked""")  end if %> name="A2"  onclick="alerta_datos('<%=RSCuad.Fields("id_per")%>',this,'<%=lsUsuario%>','2')" id="A2<%=RSCuad.Fields("id_per")%>" /></td>
               
               <td  width="5%" align="center" class='e_td_string1' id="Ad3<%=RSCuad.Fields("id_per")%>"> <div id="chek" style="display:none"></div><input  type="checkbox" value="1"  <% if RSCuad.Fields("Asist3")="1" then response.Write("checked=""checked""")  end if %> name="A3"  onclick="alerta_datos('<%=RSCuad.Fields("id_per")%>',this,'<%=lsUsuario%>','3')" id="A3<%=RSCuad.Fields("id_per")%>" /></td>
               
               <td  width="5%" align="center" class='e_td_string1' id="Ad4<%=RSCuad.Fields("id_per")%>"> <div id="chek" style="display:none"></div><input  type="checkbox" value="1"  <% if RSCuad.Fields("Asist4")="1" then response.Write("checked=""checked""")  end if %> name="A4<%=RSCuad.Fields("id_per")%>"  onclick="alerta_datos('<%=RSCuad.Fields("id_per")%>',this,'<%=lsUsuario%>','4')" id="A4<%=RSCuad.Fields("id_per")%>" /></td>
               
               <td  width="5%" align="center" class='e_td_string1' id="Ad5<%=RSCuad.Fields("id_per")%>"> <div id="chek" style="display:none"></div><input  type="checkbox" value="1"  <% if RSCuad.Fields("Asist5")="1" then response.Write("checked=""checked""")  end if %> name="A5<%=RSCuad.Fields("id_per")%>"  onclick="alerta_datos('<%=RSCuad.Fields("id_per")%>',this,'<%=lsUsuario%>','5')" id="A5<%=RSCuad.Fields("id_per")%>" /></td>
               
               <td  width="5%" align="center" class='e_td_string1' id="Ad6<%=RSCuad.Fields("id_per")%>"> <div id="chek" style="display:none"></div><input  type="checkbox" value="1"  <% if RSCuad.Fields("Asist6")="1" then response.Write("checked=""checked""")  end if %> name="A6<%=RSCuad.Fields("id_per")%>"  onclick="alerta_datos('<%=RSCuad.Fields("id_per")%>',this,'<%=lsUsuario%>','6')" id="A6<%=RSCuad.Fields("id_per")%>" /></td>
               
               <td  width="5%" align="center" class='e_td_string1' id="Ad7<%=RSCuad.Fields("id_per")%>"> <div id="chek" style="display:none"></div><input  type="checkbox" value="1"  <% if RSCuad.Fields("Asist7")="1" then response.Write("checked=""checked""")  end if %> name="A7<%=RSCuad.Fields("id_per")%>"  onclick="alerta_datos('<%=RSCuad.Fields("id_per")%>',this,'<%=lsUsuario%>','7')" id="A7<%=RSCuad.Fields("id_per")%>" /></td>
               <%if id_proyecto=15 then%>
               <td  width="5%" align="center" class='e_td_string1' id="Ad8<%=RSCuad.Fields("id_per")%>"> <div id="chek" style="display:none"></div><input  type="checkbox" value="1"  <% if RSCuad.Fields("Asist8")="1" then response.Write("checked=""checked""")  end if %> name="A8<%=RSCuad.Fields("id_per")%>"  onclick="alerta_datos('<%=RSCuad.Fields("id_per")%>',this,'<%=lsUsuario%>','8')" id="A8<%=RSCuad.Fields("id_per")%>" /></td>
<%  end if
				registro = registro + 1
				RSCuad.MoveNext 
			Loop	
			RSCuad.close
			set RSCuad = nothing 
			MiCone.close 
			set MiCone = nothing
		%>
		</tr>
		<tr>
			<td><input type="hidden" id="hdnContadorSeleccion" value="<%=contadorSeleccion%>" /></td>
		</tr>
	</table>
		
<%
	else
%>
	<table width='95%' align='center'>
		<tr>
			<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
		</tr>
	</table>
<%
	end if
%>



