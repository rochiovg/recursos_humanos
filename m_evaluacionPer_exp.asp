<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%
Response.ContentType="text/html; charset=iso-8859-1"	

Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_EVALUACION.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.Flush 
	 	 
id_proyecto=session("id_proyecto") 
varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
plsCargo = Request("lsCargo")
lsUsuario=Request("lsUsuario")
lsConvCar=Request("lsConvCar")
VALOR=Request("VALOR")

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


SQL4 = "exec dbo.getNombreProy '" & id_proyecto& "'  "	
	
		Set RSCuad4	= Server.CreateObject("ADODB.Recordset") 
		RSCuad4.cursorlocation=3
		RSCuad4.Open SQL4, MiCone, 3,3
		
		

		consulta1 = "EXEC dbo.pa_evaluacion_desempenio'" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"'" 
		
		
		
		
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
 
 
 
 
<table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
    
      <tr>
      <td colspan="11" align="CENTER" ><span class="titulo"><%=RSCuad4.Fields("nombre")%></span><div id="divProm"></div></td>
    </tr>
    
    <tr>
      <td colspan="11" align="left" ><span class="titulo"><%=vartitt%> </span><div id="divProm"></div></td>
    </tr>


<tr   bgcolor="#DAE8F3" class="dato3" >
  <td   bgcolor="#DAE8F3" class="dato3" >Nro</td>
  <td   bgcolor="#DAE8F3" class="dato3" >Apellidos y Nombres</td>
  <td   bgcolor="#DAE8F3" class="dato3" >Cargo</td>
  <td title="Eval&uacute;a el conocimiento demostrado en la ejecucion de las tareas encomendadas">Capacidad para realizar el trabajo</td>
  <td title="Eval&uacute;a el conocimiento de los procedimientos establecidos en los manuales y directivas">Manejo de Procedimientos</td>
  <td title="Eval&uacute;a la exactitud, la frecuencia de errores, la presentaci&oacute;n, el orden y el esmero que caracterizan al trabajador">Calidad del trabajo</td>
  <td title="Eval&uacute;a la capacidad de seguir instrucciones, reglas o normas de conducta en forma correcta en la ejecucion de las tareas encomendadas">Disciplina</td>
  <td title="Eval&uacute;a el grado de cumplimiento a tareas asignadas en el plazo establecido.">Puntualidad</td>
  <td title="Eval&uacute;a la capacidad para desarrollar el trabajo en conjunto con sus compañeros, con la finalidad de cumplir las tareas asignadas.">Trabajo en Equipo</td>
  <td  title="Eval&uacute;a el grado de compromiso que deberán tener todos los trabajadores dentro de la Institucion.">Compromiso con la Instituci&oacute;n</td>
  <td title="Eval&uacute;a la asistencia y permanancia del personal al lugar/centro de trabajo asignado.">Asistencia</td>
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
     <%=RsP.Fields("criterio1")%>
    </td>
    <% if  RsP.Fields("criterio2")="" or isnull(RsP.Fields("criterio2")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
		  <td  align="center" <%=color%> class='e_td_string1' id="td_2_<%=RsP.Fields("id_evaluacion")%>"><%=RsP.Fields("criterio2")%></td>
		  <% if  RsP.Fields("criterio3")="" or isnull(RsP.Fields("criterio3")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
    <td align="center" <%=color%> class='e_td_string1' id="td_3_<%=RsP.Fields("id_evaluacion")%>"><%=RsP.Fields("criterio3")%></td>
   <% if  RsP.Fields("criterio4")="" or isnull(RsP.Fields("criterio4")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_4_<%=RsP.Fields("id_evaluacion")%>"><%=RsP.Fields("criterio4")%></td>
   <% if  RsP.Fields("criterio5")="" or isnull(RsP.Fields("criterio5")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_5_<%=RsP.Fields("id_evaluacion")%>"><%=RsP.Fields("criterio5")%></td>
   <% if  RsP.Fields("criterio6")="" or isnull(RsP.Fields("criterio6")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_6_<%=RsP.Fields("id_evaluacion")%>"><%=RsP.Fields("criterio6")%></td>
   <% if  RsP.Fields("criterio7")="" or isnull(RsP.Fields("criterio7")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_7_<%=RsP.Fields("id_evaluacion")%>"><%=RsP.Fields("criterio7")%></td>
   <% if  RsP.Fields("criterio8")="" or isnull(RsP.Fields("criterio8")) then 
				color=""
				else 
				color ="bgcolor=""#98CBA4"""
				end if
				 %>
   <td align="center" <%=color%> class='e_td_string1' id="td_8_<%=RsP.Fields("id_evaluacion")%>"><%=RsP.Fields("criterio8")%></td>
   


      
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
