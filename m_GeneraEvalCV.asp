<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<!-- #include file="Include/pd_funcion.asp" --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"	

Server.ScriptTimeout = 1800 

id_proyecto=session("id_proyecto") 
id_rol=Session("txtTipoUsuarioValido")

varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsConvCar=Request.Form("lsConvCar")
VALOR=Request.Form("VALOR")
estados=Request.Form("estados")
lszona=request.Form("txtzona")	
lsseccion=request.Form("txtseccion")	

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

cargo = Mid(plsCargo,2)

lsvarzona=mid(lszona,7,5) 
lsvarseccion=mid(lsseccion,12,5)	

SQLContCapac = "EXEC dbo.usp_count_EVALCV_cc '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"', '"&lsvarzona&"', '"&lsvarseccion&"' " 

Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
wRsDataCapc.cursorlocation=3
wRsDataCapc.Open SQLContCapac, MiCone, 3,3

'---- declaracion de parametros ----
'---- declaracion de parametros ----
pcar_zon = cadParam("PROCEVADCARZ",plsCargo)	
pcar_sec = cadParam("PROCEVADCARS",plsCargo)	

contadorPre	="0"
If wRsDataCapc.RecordCount > 0 Then 
	contadorPre	=wRsDataCapc(0)
End if

SQLContCapac1 = "EXEC dbo.usp_count_pea_cv '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"', '"&lsvarzona&"', '"&lsvarseccion&"' " 
	
Set wRsDataCapc1	= Server.CreateObject("ADODB.Recordset") 
wRsDataCapc1.cursorlocation=3
wRsDataCapc1.Open SQLContCapac1, MiCone, 3,3

contadorMeta	="0"
If wRsDataCapc1.RecordCount > 0 Then 
	contadorMeta	=wRsDataCapc1(0)
End if

if varccdd="99" and varccpp="99" and varccdi="99" then
	vartittn=" A Nivel Nacional"
end if

if varccdd<>"99" then
	vartit1= "Departamento : " & nomccdd
end if

if varccpp<>"99" then
	vartit2= " / Provincia : "& nomccpp
end if

if varccdi<>"99" then
				
	vartit3= " / Distrito : "&nomccdi
end if

strubig=strubig1 & strubig2 & strubig3
strubigT=strubig1T & strubig2T & strubig3T
vartitt=vartit1 & vartit2 & vartit3


consulta1 = "EXEC dbo.uspGet_DatosCalificacionCV '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"', '"&lsvarzona&"', '"&lsvarseccion&"', '"&estados&"' " 
Set RsP = Server.CreateObject("ADODB.Recordset")
RsP.cursorlocation=3
RsP.Open consulta1, MiCone, 3,3

If Not RsP.BOF And Not RsP.EOF Then  %>
	<table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
		<tr>
			<td colspan="16" align="left" ><span class="titulo"><%=vartitt%></span></td>
		</tr>
		<tr>
			<td colspan="15" >
				<div align="right" >
					<span>
						<span class="titulo">
							<img src="images/excell1.gif" onclick="enviar_consultaCV()"  width="32" height="29" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span>Meta
						<input type="text" class='e_texto' id='txtMeta' name='txtMeta' maxlength="5" value="<%=contadorMeta%>" style="width:50" disabled="true">
						Titulares
					</span>
					<input type="text" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true">
				</div>
			</td>
		</tr>
		<tr style="font-size:9px" >
			<th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
      <!-- <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >DEPARTAMENTO</th>  -->
      <% if pcar_zon = "S" then%>
      	<th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >ZONA</th> 
      <% End if%>
      <% if pcar_sec = "S" then%>
      	<th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >SECCION</th> 
      <% End if%>
      <th colspan="4" bgcolor="#DAE8F3" class="dato3" >&nbsp;</th>
      <th width="8%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >NIVEL EDUCATIVO</th>
			<% if id_rol=9999   then %>
      <th width="8%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >NIVEL EDUCATIVO</th>
	      <% if id_proyecto=139 then %>
			<th width="8%" bgcolor="#DAE8F3" class="dato3" >EXP. ACTIVIDADES  DE COORDINACI&Oacute;N Y SUPERVISI&Oacute;N DE INSTRUMENTOS EN CAMPO</th>
				<%else%>
      <th width="8%" bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA LABORAL</th>
    	  <%end  if%>
      
      	<% if id_proyecto=139 then %>
      <th width="8%"  bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA EN APLICACIONES</th>
      	<%ELSE%>  
      <th width="8%"  bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA EN AULA</th>
      	<%END IF%>
      
      	<% if id_proyecto<>139 then %>
      <th width="7%" bgcolor="#DAE8F3" class="dato3" >TIEMPO DE EXPERIENCIA</th>
      	<%END IF%>
      <%end if%>
      <th width="5%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >NOTA AUT.</th>
      <%if id_rol=0 or id_rol = 31 or id_rol = 1 or id_rol = 38 or id_rol = 34  or id_rol = 7  or id_rol = 6  then %>
      <th width="13%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >ESTADO EVALUACI&Oacute;N</th>
      <%end if%>
		</tr>
		<tr style="font-size:9px" >
      <th width="15%" bgcolor="#DAE8F3" class="dato3" >APELLIDOS Y NOMBRES</th>
      <th width="6%"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
      <th width="4%"  bgcolor="#DAE8F3" class="dato3" >TELEFONO</th>
      <th width="4%"  bgcolor="#DAE8F3" class="dato3" >CORREO ELECTR&Oacute;NICO</th>
      <!-- <th width="8%"  bgcolor="#DAE8F3" class="dato3" >DESCRIPCION*</th> -->
      <% if id_rol=9999  then %>
      <th width="4%"  bgcolor="#DAE8F3" class="dato3" >PUNTOS</th>
      <th bgcolor="#DAE8F3" class="dato3" >PUNTOS</th>
      <th  bgcolor="#DAE8F3" class="dato3" >PUNTOS</th>
      	<% if id_proyecto<>139 then %>
      <th bgcolor="#DAE8F3" class="dato3" >PUNTOS</th>
      	<%end if%>
      <%end if %>
		</tr>
		<%registro = 0
		Do While Not RsP.EOF
		response.Flush()
		cont = registro+1
		%>
		<tr  class='<%=clase%>' style="font-size:9px;">
			<%  varvisualiza=""
			'if RsP.Fields("Activo")="1" then
			'	varvisualiza="disabled=""disabled"""
			'else
			'if id_rol="11"  or id_rol="34"   or id_rol="38"  or id_rol="1"  then
			if RsP.Fields("cenviocontra")="1" or RsP.Fields("cenviocontra")="2" or RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
					varvisualiza="disabled=""disabled"""
			end if
			' end if
			'end if %>
			<td height="34" class='e_td_string1'><%response.Write(cont)%></td>
			<!-- <td class='e_td_string1'><'%=RsP.Fields("DPTO")%></td> -->
      <% if pcar_zon = "S" then%>
				<td class='e_td_string1' align="center"><%=RsP.Fields("ZONA_I")%></td>
      <% End if%>
      <% if pcar_sec = "S" then%>
				<td class='e_td_string1' align="center"><%=RsP.Fields("SECCION_I")%></td>
      <% End if%>
			<td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
			<td class='e_td_string1' align="center"><%=RsP.Fields("dni")%></td>
			<td class='e_td_string1'><%=RsP.Fields("telefono")%></td>
			<td class='e_td_string1'><%=RsP.Fields("correo")%></td>
			<td class='e_td_string1'><%=RsP.Fields("nivel")%></td>
			<% if id_rol=9999 then %>
			<td class='e_td_string1'>
				<input <%=varvisualiza%> name="txt11<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="p_formacionAct<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p_formacionAct")%>"  onblur="guardarCV('p_formacionAct','<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="2" /> - <%=varvisualiza%>
			</td>
			<td class='e_td_string1'><input <%=varvisualiza%>  name="p_formacionAct<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="p_expLaboral<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p_expLaboral")%>"  onblur="guardarCV('p_expLaboral','<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="2" />
			</td>
			<td class='e_td_string1'><input <%=varvisualiza%>  name="p_formacionAct<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="p_expAula<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p_expAula")%>"  onblur="guardarCV('p_expAula','<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="2" />
			</td>
			<% if id_proyecto<>139 then %>
			<td class='e_td_string1'><input <%=varvisualiza%> name="p_formacionAct<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="p_experiencia<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p_experiencia")%>"  onblur="guardarCV('p_experiencia','<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="2" />
			</td>
			<%end if%>
			<% end if %>
			<td class='e_td_string1' align="center"><a href="#" onclick="verDetalle('<%=RsP.Fields("dni")%>',<%=lsConvCar%>,<%=id_proyecto%>)" title="Ver Detalle" ><%=RsP.Fields("nota_automatica")%></a>
      </td>
			<%if id_rol=0 or id_rol = 31 or id_rol = 1 or id_rol = 38 or id_rol = 34 or id_rol = 7 or id_rol = 6 then%>
			<td class='e_td_string1' align="center" id="t<%=RsP.Fields("ID_PER")%>"><div id="seleccion" >
				<select <%=varvisualiza%>  style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onfocus="valorinicial(this.value,this.id)" onchange="f_contador_cap(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
					<option value="" >...</option>
					<option value="1" <%if(RsP.Fields("bandaprob")="1") then response.write("selected") end if%> >Seleccionado</option>
					<option value="9" <%if(RsP.Fields("bandaprob")="9") then response.write("selected") end if%> >Reserva</option>
					<option value="3" <%if(RsP.Fields("bandaprob")="3") then response.write("selected") end if%> >Alta</option>
					<option value="4" <%if(RsP.Fields("bandaprob")="4") then response.write("selected") end if%>>Baja</option>
				</select></div>
			</td>
			<% end if %>
			<% lsNivel= RsP.Fields("nivel")
			registro = registro + 1
			RsP.MoveNext
		Loop	
		RsP.close %>
		</tr>
	</table>
	<% else %>
	<table width='95%' align='center'>
		<tr>
			<td class='subtitulo' colspan='4'><br>No hay registros disponibles</td>
		</tr>
	</table>
  

	<% end If	%>
  
