<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_CAPACITACION_INS.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.Flush 

 usuario=Session("id_usuario")
 
varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
plsCargo = Request("lsCargo")
nivelrrhh=Request("nivelrrhh")
capacitacion=Request("capacitacion")

lsConvocaroria=Request("lsConvocaroria")

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

consulta1 = "EXEC dbo.sp_GetDatosCapacitacion '" & lsCargo & "', '" & varccdd & "', '" & varccppTot & "', '" & varccdiTot & "', '" & tipocargo & "', '" & idProyecto & "' , '" & capacitacion & "'" 


	
	
	
		
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3

	  If  Not RsP.BOF And Not RsP.EOF Then  
	  
	 nota_min= RsP.Fields("nota_min")

	  %>
      <br>
<table width='98%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
        
  <tr style="font-size:14px">
          <td colspan="17" align="center">REGISTRO DE NOTAS DE CAPACITACI&Oacute;N : <%=now()%></td>
          </tr>

          <tr bgcolor="#DAE8F3" class="dato" style="font-size:12px">
            <td rowspan="2" width="80">Nro.</td>
            <td rowspan="2" width="80">Tipo de Candidato</td>
            <td rowspan="2" width="80">Sede</td>
            <td rowspan="2" width="186">Local de Capacitaci&oacute;n</td>
            <td rowspan="2" width="202">Aula</td>
            <td colspan="3" width="240">DATOS PERSONALES</td>
            <td colspan="5" width="595">CRITERIO DE EVALUACI&Oacute;N</td>
            <td colspan="3" width="357">RESULTADO</td>
            <td width="160">&nbsp;</td>
          </tr>
          <tr bgcolor="#DAE8F3" class="dato" style="font-size:12px">
            <td width="240">Apellidos</td>
            <td width="146">Nombres</td>
            <td width="113">DNI</td>
            <td width="595" title="PUNTUALIDAD">              Criterio 1<br />
              (de 0 a 10 puntos)</td>
            <td width="202" title="PARTICIPACI&Oacute;N EN EL AULA ">Criterio 2<br />
              (de 0 a 20 puntos)</td>
            <td width="207" title="MANEJO DE LOS PROCEDIMIENTOS OPERATIVOS">Criterio 3<br />
              (de 0 a 20 puntos)</td>
              <td width="207" title="MANEJO DE LOS EQUIPOS Y APLICATIVO">Criterio 4<br />
              (de 0 a 20 puntos)</td>
              <td width="207" title="PUNTAJE DE LA PRUEBA ESCRITA ">Criterio 5<br />
              (de 0 a 30 puntos)</td>
            <td width="357">Sumatoria    (Criterio1 + Criterio2 + Criterio3 + Criterio4 + Criterio5)</td>
            <td width="113">Actitud    durante las sesiones de capacitaci&oacute;n</td>
            <td>Observaciones</td>
            <td width="160">Aprobaci&oacute;n</td>
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
            <td align="center" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("p1")%>
            </span></td>
            <td width="202" class='e_td_string1'><span class="etiqueta">
              <%=RsP.Fields("p2")%>
            </span></td>
            <td width="207" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("p3")%>
            </span></td>
            <td width="207" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("p4")%>
            </span></td>
            <td width="207" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("P5")%>
            </span></td>
            <td width="357" class='e_td_string1'><div id="txtprom<%=RsP.Fields("id_per")%>"><%=RsP.Fields("notacap")%></div></td>
            <td width="113" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("desc_actitud")%></span></td>
            <td width="80" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("observacion")%>
            </span></td>
            <td width="160" class='e_td_string1'><div id="txtaprob<%=RsP.Fields("id_per")%>"><%=RsP.Fields("estado")%></div></td>
          </tr>
          	<% 
	lsNivel= RsP.Fields("nivel")
		registro = registro + 1
		dato2 = dato2+1 %>
    <%		RsP.MoveNext
		Loop	
		RsP.close %>
         
         <tr>
         <td colspan="17">Fecha y hora:&nbsp;&nbsp;<%=now()%> </td>
         </tr>
          
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