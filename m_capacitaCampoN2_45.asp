<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"

 usuario=Session("id_usuario")
 
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
nivelrrhh=Request.Form("nivelrrhh")
capacitacion=Request.Form("capacitacion")

lsConvocaroria=Request.Form("lsConvocaroria")

idProyecto=Session("id_proyecto")
tipousuario=Session("txtTipoUsuarioValido")
id_usuario=  Session("id_usuario")

  habilitado=""

if (nivelrrhh = 8 ) then

	nomccdd = ""
	varccdd = "99"
	nomccpp = ""
	varccpp = "99"
	nomccdi = ""
	varccdi = "99"
lsCargo = 00
tipocargo = 8
else

	varccdd=len(varccddTot)
  varccdd = Mid(varccddTot,1,2)

	
	
	lsCargo = "00"
tipocargo = nivelrrhh

END IF 

consulta1 = "EXEC dbo.sp_GetDatosCapacitacion_apli '" & lsCargo & "', '" & varccdd & "', '" & varccppTot & "', '" & varccdiTot & "', '" & tipocargo & "', '" & idProyecto & "', '" & capacitacion & "'" 

	
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3

	  If  Not RsP.BOF And Not RsP.EOF Then  
	  
	 nota_min= RsP.Fields("nota_min")

	  %>
      <br>
<table width='98%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
        
  <tr style="font-size:14px">
          <td colspan="16" align="center">REGISTRO DE NOTAS DE CAPACITACI&Oacute;N APLICADOR Y ORIENTADOR&nbsp;&nbsp;<img src="images/excell1.gif" onclick="ver_reporte(2)"  width="32" height="29" /></td>
          </tr>
          
<tr  bordercolor="#DAE8F3" style="font-size:14px">

<td colspan="4"><DIV style="display:none">Nota M&iacute;nima de aprobaci&oacute;n:<% if tipousuario<>"11" then %> <span class="etiqueta">
  <input  name="notMin"onkeypress="return fs_numeros(event)" class="etiqueta"  type="text" id="notMin" value="<%=nota_min%>"  onblur="guardarMin('<%=RsP.Fields("etapa")%>', this.value)" size="8" maxlength="2" />
</span><%else%><%=nota_min%><%end if%></DIV></td>
            <td colspan="9" >&nbsp;</td>
            <td colspan="3" align="right" ><input type="HIDDEN" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="0" style="width:50" /></td>
  </tr>

          <tr bgcolor="#DAE8F3" class="dato" style="font-size:12px">
            <td rowspan="2" width="80">Nro.</td>
            <td rowspan="2" width="80">Tipo de Candidato</td>
            <td rowspan="2" width="80">Sede</td>
            <td rowspan="2" width="186">Local de Capacitaci&oacute;n</td>
            <td rowspan="2" width="202">Aula</td>
            <td colspan="3" width="240">DATOS PERSONALES</td>
            <td colspan="3" width="595">CRITERIO DE EVALUACI&Oacute;N</td>
            <td colspan="3" width="357">RESULTADO</td>
            <td colspan="2" width="160">&nbsp;</td>
          </tr>
          <tr bgcolor="#DAE8F3" class="dato" style="font-size:12px">
            <td width="240">Apellidos</td>
            <td width="146">Nombres</td>
            <td width="113">DNI</td>
            <td width="595" title="Manejo de los procedimiento de aplicaci&oacute;n">Criterio 1<br />
              (de 0 a 8 puntos)</td>
            <td width="202" title="Desempe&ntilde;o durante las simulaciones ">Criterio 2<br />
              (de 0 a 12 puntos)</td>
            <td width="207" title="Resultado de la prueba escrita">Criterio 3<br />
              (de 0 a 20 puntos)</td>
            <td width="357">Sumatoria    (Criterio1 + Criterio2 + Criterio3)</td>
            <td width="113">Actitud    durante las sesiones de capacitaci&oacute;n</td>
            <td>Observaciones</td>
            <td width="160">Aprobaci&oacute;n</td>
            
            <td width="80" style="display:none">Selecci&oacute;n</td>
          </tr>
            <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 	%>
          
          <tr >
          <%
		  
		  if RsP.Fields("Activo")="1" then
	   varvisualiza="disabled=""disabled"""
	   else
			if RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
	     		varvisualiza="disabled=""disabled"""
	
        end if

	   end if
	   
	   
		  %>
          
          <td width="80" class='e_td_string1'><span class="e_td_string1">
            <%response.Write(cont)%>
          </span></td>
            <td width="80" class='e_td_string1'><span class="e_td_string1"><%=RsP.Fields("cargo")%></span></td>
            <td width="80" class='e_td_string1'><span class="e_td_string1"><%=RsP.Fields("DEPARTAMENTO")%>&nbsp;&nbsp;<%=RsP.Fields("provincia")%></span></td>
            <td width="186" class='e_td_string1'><span class="e_td_string1"><%=RsP.Fields("LOCAL")%></span></td>
            <td width="202" class='e_td_string1'><span class="e_td_string1"><%=RsP.Fields("Aula")%></span></td>
            <td width="240"class='e_td_string1'><span class="e_td_string1"><%=RsP.Fields("apellidos")%></span></td>
            <td width="146" class='e_td_string1'><span class="e_td_string1"><%=RsP.Fields("nombre1")%></span></td>
            <td width="113" class='e_td_string1'><span class="e_td_string1"><%=RsP.Fields("dni")%></span></td>
            <td align="center" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%>  name="txtp1<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtp1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p1")%>"  onblur="guardarCAPAED('p1','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value, '1')" size="5" maxlength="1" /> </span></td>
            <td width="202" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%>  name="txtp2<%=RsP.Fields("id_per")%>" onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtp2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p2")%>"  onblur="guardarCAPAED('p2','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value, '2')" size="5" maxlength="2" />
            </span></td>
            <td width="207" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtp3<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtp3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p3")%>"  onblur="guardarCAPAED('p3','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value, '3')" size="5" maxlength="5" />
            </span></td>
            <td width="357" class='e_td_string1'><div id="txtprom<%=RsP.Fields("id_per")%>"><%=RsP.Fields("notacap")%></div></td>
            <td width="113" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%> name="txt4<%=RsP.Fields("id_per")%>" onKeyPress="return fs_SoloLetras(event)" class="etiqueta"  type="text" id="txt4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("desc_actitud")%>"  onblur="guardarCAPAED('desc_actitud','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'4')" size="50" maxlength="300" />
            </span></td>
            <td width="80" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%> name="txt5<%=RsP.Fields("id_per")%>" onKeyPress="return fs_SoloLetras(event)" class="etiqueta"  type="text" id="txt5<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("observacion")%>"  onblur="guardarCAPAED('observacion','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value, '5')" size="50" maxlength="300" />
            </span></td>
            <td width="160" class='e_td_string1'><div id="txtaprob<%=RsP.Fields("id_per")%>"><%=RsP.Fields("estado")%></div></td>
            <td width="80" class='e_td_string1' style="display:none">
            <select <%=varvisualiza%>  style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onchange="f_contador_pre1(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
                <option value="9" <%if(RsP.Fields("capacita")="9") then response.write("selected")end if%>>Elija Opci&oacute;n...</option>
                <option value="1" <%if(RsP.Fields("capacita")="1") then response.write("selected")end if%> >Seleccionado</option>
                <option value="2" <%if(RsP.Fields("capacita")="2") then response.write("selected")end if%>>No Seleccionado</option>
              </select>
            </td>
          </tr>
          	<% 
	lsNivel= RsP.Fields("nivel")
		registro = registro + 1
		dato2 = dato2+1 %>
    <%		RsP.MoveNext
		Loop	
		RsP.close %>
          
        </table>
<% else %>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles</td>
                  </tr>
</table>
		         <% end If




		 %>