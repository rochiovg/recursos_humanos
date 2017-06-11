<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
Response.ContentType="text/html; charset=iso-8859-1"	

Function CalcularEdad(fechaN)
If IsNull(fechaN) then wEdad = 0: Exit Function
wEdad = DateDiff("yyyy", fechaN, Now)
If Date <> DateSerial(Year(Now), Month(fechaN), Day(fechaN)) Then
wEdad = wEdad - 1
End If
wEdad = CInt(wEdad)
Response.Write(wEdad)
End Function
	 	 
id_proyecto=session("id_proyecto") 
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsConvCar=Request.Form("lsConvCar")
VALOR=Request.Form("VALOR")

id_rol=Session("txtTipoUsuarioValido")

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

	SQLContCapac = "EXEC dbo.usp_count_capacita '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"' " 
	
	
	

	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorPre	=wRsDataCapc(0)
	else
		contadorPre	="0"
	End if



		consulta1 = "EXEC dbo.pa_evaluacion_desempenio_ednom'" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"'" 
		

response.write(consulta1)
	
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta1, MiCone, 3,3
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
	  
	If  Not RsP.BOF And Not RsP.EOF Then  %>
 
 
 
 
<table width='200%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
    
      <tr>
      <td colspan="22" align="left" ><span class="titulo"><%=vartitt%> &nbsp;&nbsp;&nbsp;<!--<img src="images/excell1.gif" onclick="verReporte_evaluaci&oacute;n(1)"  width="32" height="29" />--></span><div id="divProm"></div></td>
    </tr>


<tr   bgcolor="#DAE8F3" class="dato3" >
   <td rowspan="3"   bgcolor="#DAE8F3" class="dato3" >Nro</td>
   <td rowspan="3"   bgcolor="#DAE8F3" class="dato3" >Apellidos y Nombres</td>
   <td rowspan="3"   bgcolor="#DAE8F3" class="dato3" >Cargo</td>
   <td align="center" class="dato3"  title="Eval&uacute;a el conocimiento demostrado en la ejecucion de las tareas encomendadas">CAPACIDAD PARA REALIZAR EL TRABAJO</td>
   <td class="dato3"  align="center" title="Eval&uacute;a el conocimiento de los procedimientos establecidos en los manuales y directivas">MANEJO DE PROCEDIMIENTOS</td>
   <td class="dato3"  align="center" title="Eval&uacute;a la exactitud, la frecuencia de errores, la presentaci&oacute;n, el orden y el esmero que caracterizan al trabajador">CALIDAD DEL TRABAJO</td>
   <td class="dato3"  align="center" title="Eval&uacute;a la capacidad de seguir instrucciones, reglas o normas de conducta en forma correcta en la ejecucion de las tareas encomendadas">DISCIPLINA</td>
   <td class="dato3" align="center" title="Eval&uacute;a el grado de cumplimiento a tareas asignadas en el plazo establecido.">PUNTUALIDAD</td>
   <td class="dato3"  align="center" title="Eval&uacute;a la capacidad para desarrollar el trabajo en conjunto con sus compañeros, con la finalidad de cumplir las tareas asignadas.">TRABAJO EN EQUIPO</td>
   <td class="dato3"  align="center" title="Eval&uacute;a el grado de compromiso que deber&aacute;n tener todos los trabajadores dentro de la Institucion.">CONPROMISO EN LA INSTITUCI&Oacute;N</td>
   <td class="dato3"  align="center" title="Eval&uacute;a la asistencia y permanancia del personal al lugar/centro de trabajo asignado.">ASISTENCIA</td>
   <td class="dato3"  align="center" title="Eval&uacute;a la asistencia y permanancia del personal al lugar/centro de trabajo asignado.">JUSTIFICACION</td>
    </tr>
    <tr   bgcolor="#DAE8F3" class="dato3" >
      <td>Eval&uacute;a el conocimiento demostrado en la ejecucion de las tareas encomendadas</td>
      <td>Eval&uacute;a el conocimiento de los procedimientos establecidos en los manuales y directivas</td>
      <td>Eval&uacute;a la exactitud, la frecuencia de errores, la presentación, el orden y el esmero que caracterizan al trabajador</td>
      <td>Eval&uacute;a la capacidad de seguir instrucciones, reglas o normas de conducta en forma correcta en la ejecucion de las tareas encomendadas.</td>
      <td>Eval&uacute;a el grado de cumplimiento a tareas asignadas en el plazo establecido.</td>
      <td>Eval&uacute;a la capacidad para desarrollar el trabajo en conjunto con sus compañeros, con la finalidad de cumplir las tareas asignadas.</td>
      <td>Eval&uacute;a el grado de compromiso que deberán tener todos los trabajadores dentro de la Institucion.</td>
      <td>Eval&uacute;a la asistencia y permanancia del personal  al lugar/centro de trabajo asignado.</td>
      <td>&nbsp;</td>
    </tr>
    <tr   bgcolor="#DAE8F3" class="dato3" >
   <td>Sobresaliente en el trabajo (3)<br />
     Cumple con su trabajo (2)<br />
     Debe ser guiado con frecuencia, necesita cont&iacute;nua supervsi&oacute;n (1)<br />
     Demuestra falta de conocimiento para realizar las tareas asignadas (0)<br />
     <br />
     *Asigne el c&oacute;digo de la escala de evaluaci&oacute;n seg&uacute;n corresponda</td>
   <td>Sobresaliente (3)<br />
     Conocimiento b&aacute;sico (2)<br />
     Debe ser guiado con frecuencia, necesita contin&uacute;a supervsi&oacute;n (1)<br />
     Demuestra falta de conocimiento para realizar las tareas asignadas (0)<br />
     <br />
     *Asigne el c&oacute;digo de la escala de evaluaci&oacute;n seg&uacute;n corresponda</td>
   <td>Muy cuidadoso y eficiente (3)<br />
     Cuidado normal (2)<br />
     Errores frecuentes(1)<br />
     Errores Excesivos (0)<br />
     <br />
     *Asigne el c&oacute;digo de la escala de evaluaci&oacute;n seg&uacute;n corresponda</td>
   <td>Bastante Disciplinado (3)<br />
     Disciplinado (2)<br />
     Poco Disciplinado (1) <br />
     Nada Disciplinado (0)<br />
     <br />
     *Asigne el c&oacute;digo de la escala de evaluaci&oacute;n seg&uacute;n corresponda</td>
   <td>Puntual (2)<br />
     Poco puntual (1) <br />
     Nada puntual (0)<br />
     <br />
     *Asigne el c&oacute;digo de la escala de evaluaci&oacute;n seg&uacute;n corresponda</td>
   <td><br />
     Muy Bueno (3)<br />
     Bueno (2)<br />
     Necesita Mejoramiento (1)<br />
     No satisfactorio (0)<br />
     <br />
     *Asigne el c&oacute;digo de la escala de evaluaci&oacute;n seg&uacute;n corresponda</td>
   <td>Sobresaliente (3)<br />
     Bueno (2)<br />
     Necesita Mejoramiento (1)<br />
     No satisfactorio (0)<br />
     <br />
     *Asigne el c&oacute;digo de la escala de evaluaci&oacute;n seg&uacute;n corresponda</td>
   <td>Asiste en horario normal y adem&aacute;s cuando se requiere (3)<br />
     Asiste en horario normal (2)<br />
     Asiste pero se ausenta del centro de trabajo (1)<br />
     Presenta faltas continuas (0)<br />
     <br />
     *Asigne el c&oacute;digo de la escala de evaluaci&oacute;n seg&uacute;n corresponda</td>
   <td>Para los casos donde la puntuaci&oacute;n es 0, se debe justificar en esta columna</td>
    </tr>

  
		   <% 	registro = 0					
		Do While Not RsP.EOF
		response.Flush()
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 %>
		   <tr  class='<%=clase%>' style="font-size:9px;">
      <%  varvisualiza=""  %>

		  <td height="34" class='e_td_string1'><%response.Write(cont)%> </td>
    
		  <td class='e_td_string1'><%=RsP.Fields("ape_nom")%></td>
    <td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
    <% if  RsP.Fields("criterio1")="" or isnull(RsP.Fields("criterio1")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
    
    <td  align="center" <%=color%> class='e_td_string1' id="td_1_<%=RsP.Fields("id_evaluacion")%>">
      <input  name="t1<%=RsP.Fields("id_evaluacion")%>"onkeypress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="t1<%=RsP.Fields("id_evaluacion")%>" value="<%=RsP.Fields("criterio1")%>"  onblur="guardarEval('criterio1','<%=RsP.Fields("id_evaluacion")%>',this.value, '1', <%=id_proyecto%>)" size="5" maxlength="1" />
    </td>
    <% if  RsP.Fields("criterio2")="" or isnull(RsP.Fields("criterio2")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
		  <td  align="center" <%=color%> class='e_td_string1' id="td_2_<%=RsP.Fields("id_evaluacion")%>"><input  name="t2<%=RsP.Fields("id_evaluacion")%>"onkeypress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="t2<%=RsP.Fields("id_evaluacion")%>" value="<%=RsP.Fields("criterio2")%>"  onblur="guardarEval('criterio2','<%=RsP.Fields("id_evaluacion")%>',this.value, '2', <%=id_proyecto%>)" size="5" maxlength="1" /></td>
		  <% if  RsP.Fields("criterio3")="" or isnull(RsP.Fields("criterio3")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
    <td align="center" <%=color%> class='e_td_string1' id="td_3_<%=RsP.Fields("id_evaluacion")%>"><span class="etiqueta">
     <input  name="t3<%=RsP.Fields("id_evaluacion")%>"onkeypress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="t3<%=RsP.Fields("id_evaluacion")%>" value="<%=RsP.Fields("criterio3")%>"  onblur="guardarEval('criterio3','<%=RsP.Fields("id_evaluacion")%>',this.value, '3', <%=id_proyecto%>)" size="5" maxlength="1" />
   </span></td>
   <% if  RsP.Fields("criterio4")="" or isnull(RsP.Fields("criterio4")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_4_<%=RsP.Fields("id_evaluacion")%>"><span class="etiqueta">
   <input  name="t4<%=RsP.Fields("id_evaluacion")%>"onkeypress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="t4<%=RsP.Fields("id_evaluacion")%>" value="<%=RsP.Fields("criterio4")%>"  onblur="guardarEval('criterio4','<%=RsP.Fields("id_evaluacion")%>',this.value, '4', <%=id_proyecto%>)" size="5" maxlength="1" />
   </span></td>
   <% if  RsP.Fields("criterio5")="" or isnull(RsP.Fields("criterio5")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_5_<%=RsP.Fields("id_evaluacion")%>"><span class="etiqueta">
     <input  name="t5<%=RsP.Fields("id_evaluacion")%>"onkeypress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="t5<%=RsP.Fields("id_evaluacion")%>" value="<%=RsP.Fields("criterio5")%>"  onblur="guardarEval('criterio5','<%=RsP.Fields("id_evaluacion")%>',this.value, '5', <%=id_proyecto%>)" size="5" maxlength="1" />
   </span></td>
   <% if  RsP.Fields("criterio6")="" or isnull(RsP.Fields("criterio6")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_6_<%=RsP.Fields("id_evaluacion")%>"><span class="etiqueta">
   <input  name="t6<%=RsP.Fields("id_evaluacion")%>"onkeypress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="t6<%=RsP.Fields("id_evaluacion")%>" value="<%=RsP.Fields("criterio6")%>"  onblur="guardarEval('criterio6','<%=RsP.Fields("id_evaluacion")%>',this.value, '6', <%=id_proyecto%>)" size="5" maxlength="1" />
   </span></td>
   <% if  RsP.Fields("criterio7")="" or isnull(RsP.Fields("criterio7")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_7_<%=RsP.Fields("id_evaluacion")%>"><span class="etiqueta">
     <input  name="t7<%=RsP.Fields("id_evaluacion")%>"onkeypress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="t7<%=RsP.Fields("id_evaluacion")%>" value="<%=RsP.Fields("criterio7")%>"  onblur="guardarEval('criterio7','<%=RsP.Fields("id_evaluacion")%>',this.value, '7', <%=id_proyecto%>)" size="5" maxlength="1" />
   </span></td>
   <% if  RsP.Fields("criterio8")="" or isnull(RsP.Fields("criterio8")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_8_<%=RsP.Fields("id_evaluacion")%>"><span class="etiqueta">
     <input  name="t8<%=RsP.Fields("id_evaluacion")%>"onkeypress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="t8<%=RsP.Fields("id_evaluacion")%>" value="<%=RsP.Fields("criterio8")%>"  onblur="guardarEval('criterio8','<%=RsP.Fields("id_evaluacion")%>',this.value, '8', <%=id_proyecto%>)" size="5" maxlength="1" />
   </span></td>
   <td align="center" <%=color%> class='e_td_string1' id="td_8_<%=RsP.Fields("id_evaluacion")%>"><span class="etiqueta">
     <input  name="tjus<%=RsP.Fields("id_evaluacion")%>2"onKeyPress="return fs_alfanumericoE(event)" class="etiqueta"  type="text" id="tjus<%=RsP.Fields("id_evaluacion")%>2" value="<%=RsP.Fields("justificacion")%>"  onblur="guardarEval('justificacion','<%=RsP.Fields("id_evaluacion")%>',this.value, '9', <%=id_proyecto%>)" size="100" maxlength="300"  />
   </span></td>
   


      
  <% 
		registro = registro + 1
		RsP.MoveNext
		Loop	
		RsP.close %>
	    </tr>
		 
   </table>
<% else %>
      <table width='95%' align='center'>
      <tr>
     <td class='subtitulo' colspan='4'><br>
       No hay registros disponibles</td>
      </tr>
    </table>
  <p>
		   <% end If %>
		   
</p>


  <table cellspacing="0" cellpadding="0">
    
  </table>
  <p>&nbsp;</p>
