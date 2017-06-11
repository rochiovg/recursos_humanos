<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
id_proyecto=session("id_proyecto") 
lsUsuario=Session("id_usuario")
id_rol=Session("txtTipoUsuarioValido")


dni = Request.Form("dni")



' ---- Dejamos el DNI solo con caracteres num�ricos: -----------
d=""
for i=1 to len(dni)
    if mid(dni,i,1)>="0" and mid(dni,i,1)<="9"  then
	   d=d&mid(dni,i,1)
	end if   
next 
dni=d

' ------------------------------------------------------------------------
dim fs
set fs=Server.CreateObject("Scripting.FileSystemObject")

if fs.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_1.pdf" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo1 = ORIGEN & "1.pdf"

elseif fs.FileExists("\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_1.jpg" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo1 = ORIGEN & "1.jpg"

elseif fs.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_1.png" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo1 = ORIGEN & "1.png"

elseif fs.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_1.gif" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo1 = ORIGEN & "1.gif"

end if

set fs=nothing



dim fs2
set fs2=Server.CreateObject("Scripting.FileSystemObject")

if fs2.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_2.pdf" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo2 = ORIGEN & "2.pdf"

elseif fs2.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_2.jpg" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo2 = ORIGEN & "2.jpg"

elseif fs2.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_2.png" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo2 = ORIGEN & "2.png"

elseif fs2.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_2.gif" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo2 = ORIGEN & "2.gif"

end if

set fs2=nothing



dim fs3
set fs3=Server.CreateObject("Scripting.FileSystemObject")

if fs3.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_3.pdf" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo3 = ORIGEN & "3.pdf"

elseif fs3.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_3.jpg" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo3 = ORIGEN & "3.jpg"

elseif fs3.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_3.png" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo3 = ORIGEN & "3.png"

elseif fs3.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&dni&"_3.gif" ) then 

origen="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/"& dni & "_"
archivo3 = ORIGEN & "3.gif"

end if

set fs3=nothing

'if fs.FileExists(archivo1) then 
'archivo1="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/sin_datos.pdf"
'else
'archivo1=archivo1
'end if 

'if fs.FileExists(archivo2) then 
'archivo2=archivo2
'else
'archivo2="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/sin_datos.pdf"
'end if 

'if fs.FileExists(archivo3) then 
'archivo3=archivo3
'else
'archivo3="http://economicas.inei.gob.pe/imagenes/CCRRHH/" & id_proyecto & "/sin_datos.pdf"
'end if 

set fs=nothing

consulta1 = "EXEC dbo.pa_ficha_datosCV '" & dni & "', '" & id_proyecto & "'" 

Set RsP	= Server.CreateObject("ADODB.Recordset") 
RsP.cursorlocation=3
RsP.Open consulta1, MiCone, 3,3

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
   <link rel="shortcut icon" href="images/favicon.ico" />
</head>
<body onLoad="cargarImagen()">

<table border="1" bordercolor="#DAE8F3" height="610px" align="center">
<tr style="height:10px;" bgcolor="#DAE8F3" class="dato"> 
    <td colspan="3"  width="165px" style="height:10px; color:#FFF" align="center" bgcolor="#E8EA82"><p><strong><img src="images/cuidado.png" width="25" height="25" alt="" border="0" style="CURSOR: hand" onClick=""  /><font class="titulo">IMPORTANTE:  SI NO PUEDE VISUALIZAR EL CONTENIDO DEL ARCHIVO PDF, PROCEDA A DESCARGARLO Y  ABRIR EL ARCHIVO.</font></strong> </p></td>
   <input type="hidden" name="num_vista" id="num_vista" value="1" />
    <td  width="165px" style="height:10px;" align="center">&nbsp;</td></tr>
     <tr >
    <tr style="height:10px;" bgcolor="#DAE8F3" class="dato"> 
    <td  width="165px" style="height:10px;" align="center" background=""><input type="hidden" name="txtDNI" id="txtDNI" value="<%=dni%>" />
      CONSTANCIAS 
      <img src="images/nivel.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('1')" />
      <br>
      <%
	  consulta3 = "EXEC dbo.pa_archivos_inscripcion_listar_cantidad '" & dni & "', '" & id_proyecto & "', '1' " 

		Set RsP3	= Server.CreateObject("ADODB.Recordset") 
		RsP3.cursorlocation=3
		RsP3.Open consulta3, MiCone, 3,3
		
		If  Not RsP3.BOF And Not RsP3.EOF Then 
		
			c1=1
			Do While Not RsP3.EOF
			Response.Write("<a href=""#"" onClick=""ver_cv('"&RsP3.Fields("num")&"');"">"&c1&"</a>&nbsp;&nbsp;")
			c1 = c1 + 1
			RsP3.MoveNext
			Loop	
			set RsP3=nothing
    
    	end if
	  %>
      
      
      </td>
    <td  width="165px" style="height:10px;" align="center">DNI <img src="images/dni.jpg" width="30" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('2')" /><br>
    <%
	  consulta4 = "EXEC dbo.pa_archivos_inscripcion_listar_cantidad '" & dni & "', '" & id_proyecto & "', '2' " 

		Set RsP4	= Server.CreateObject("ADODB.Recordset") 
		RsP4.cursorlocation=3
		RsP4.Open consulta4, MiCone, 3,3
		
		If  Not RsP4.BOF And Not RsP4.EOF Then 
		
			c4=1
			Do While Not RsP4.EOF
			Response.Write("<a href=""#"" onClick=""ver_cv('"&RsP4.Fields("num")&"');"">"&c4&"</a>&nbsp;&nbsp;")
			c4 = c4 + 1
			RsP4.MoveNext
			Loop	
			set RsP4=nothing
    
    	end if
	  %>
    </td>
    <td  width="165px" style="height:10px;" align="center">GRADO OBTENIDO<img src="images/resultados.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('3')" /><br>
    <br>
    <%
	  consulta5 = "EXEC dbo.pa_archivos_inscripcion_listar_cantidad '" & dni & "', '" & id_proyecto & "', '3' " 

		Set RsP5	= Server.CreateObject("ADODB.Recordset") 
		RsP5.cursorlocation=3
		RsP5.Open consulta5, MiCone, 3,3
		
		If  Not RsP5.BOF And Not RsP5.EOF Then 
		
			c5=1
			Do While Not RsP5.EOF
			Response.Write("<a href=""#"" onClick=""ver_cv('"&RsP5.Fields("num")&"');"">"&c5&"</a>&nbsp;&nbsp;")
			c5 = c5 + 1
			RsP5.MoveNext
			Loop	
			set RsP5=nothing
    
    	end if
	  %>
    </td>
    <td  width="165px" style="height:10px;" align="center">DATOS</td></tr>
     <tr >
<td  colspan="3">
    <div id="foto" style="width:500; height:120; ">
    <iframe id="foto1" src="<%=archivo1%>" width="500px" height="600px" style="border:none; display:block "> </iframe> 
    <iframe  id="foto2" src="<%=archivo2%>" width="500px" height="600px" style="border:none; display:none"> </iframe> 
    <iframe  id="foto3" src="<%=archivo3%>" width="500px" height="600px" style="border:none ; display:none"> </iframe> 
    <%
   
    consulta2 = "EXEC dbo.pa_archivos_inscripcion_listar '" & dni & "', '" & id_proyecto & "'" 
	Set RsP2= Server.CreateObject("ADODB.Recordset") 
	RsP2.cursorlocation=3
	RsP2.Open consulta2, MiCone, 3,3
    
	If  Not RsP2.BOF And Not RsP2.EOF Then 
	   Do While Not RsP2.EOF
	   
	   cantidad=1
    %>
    <iframe  id="foto<%=RsP2.Fields("num")%>" src="<%=RsP2.Fields("ruta")%>" width="500px" height="600px" style="border:none ; display:none"> </iframe> 
   <% cantidad = cantidad + 1
		RsP2.MoveNext
		Loop	
		set RsP2=nothing
    
    end if
	cantidad=cantidad+3
   
	%>
    </div>
    
    <input type="hidden" name="cantidad" id="cantidad" value="<%=cantidad%>" />
    
    </td>
     
    <TD valign="top" >
     <%If  Not RsP.BOF And Not RsP.EOF Then 
	 
	 
	 registro = 0					
		Do While Not RsP.EOF
		response.Flush()
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
					
			cont = registro+1
	 %>
    <TABLE border="1" cellpadding="2" bordercolor="#DAE8F3" style="margin-BOTTON:1PX;">
    <TR>
    <TD   bgcolor="#DAE8F3">DNI</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("dni")%></span></TD>
    </TR>
    <TR>
    <TD   bgcolor="#DAE8F3">Nombre</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("nombre")%></span></TD>
    </TR>
    <TR>
    <TD   bgcolor="#DAE8F3">Fecha Nacimiento</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("FEC_NAC")%></span></TD>
    </TR>
    <TR>
    <TD bgcolor="#DAE8F3">Nivel Estudios</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("NIVEL")%></span></TD>
    </TR>
    <TR>
    <TD bgcolor="#DAE8F3">Grado</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("GRADO")%></span></TD>
    </TR>
    <TR>
    <TD bgcolor="#DAE8F3">Profesi&oacute;n</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("PROFESION")%></span></TD>
    </TR>
        <TR>
    <TD bgcolor="#DAE8F3">RUC</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("RUC")%></span></TD>
    </TR>
    
        <TR>
    <TD bgcolor="#DAE8F3">Fec. ini RNP</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("FECHAINIRNP")%></span></TD>
    </TR>
    
        <TR>
    <TD bgcolor="#DAE8F3">Fec. fin RNP</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("FECHAFINRNP")%></span></TD>
    </TR>
    
    
    <TR>
    <TD bgcolor="#DAE8F3">Experiencia General</TD>
    <TD><span class="e_td_string1"><%="A&ntilde;o:"&RsP.Fields("expgen_anio")&" Meses:"&RsP.Fields("expgen_meses")%></span></TD>
    </TR>
    
    <TR>
    <TD bgcolor="#DAE8F3"><% if RsP.Fields("experiencia_1")="" or isnull(RsP.Fields("experiencia_1")) then %>
                          A&ntilde;os o meses  de experiencia en trabajos de Campo (Censo y/o Encuestas)<%else%><%=RsP.Fields("experiencia_1")%><%end if%></TD>
    <TD><span class="e_td_string1"><%="A&ntilde;o:"&RsP.Fields("expCampo_anio")&" Meses:"&RsP.Fields("expCampo_meses")%></span></TD>
    </TR>
    
    <TR>
    <TD bgcolor="#DAE8F3"><% if RsP.Fields("experiencia_2")="" or isnull(RsP.Fields("experiencia_2")) then %>A&ntilde;os o meses  de experiencia en manejo de grupos:<%else%><%=RsP.Fields("experiencia_2")%><%end if%></TD>
    <TD><span class="e_td_string1"><%="A&ntilde;o:"&RsP.Fields("expGrupo_anio")&" Meses:"&RsP.Fields("expGrupo_meses")%></span></TD>
    </TR>
    
    <TR>
    <TD bgcolor="#DAE8F3">Trabajo en el INEI</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("inei")%></span></TD>
    </TR>
    
    <TR style="display:none">
    <TD bgcolor="#DAE8F3">Proyecto</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("Pr")%></span></TD>
    </TR>
    <TR >
    <TD bgcolor="#DAE8F3">Curso Solicitado</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("cursoCapacitacion")%></span></TD>
    </TR>
    
    <TR  >
    <TD bgcolor="#DAE8F3">Fechas cursos</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("fechas_cap")%></span></TD>
    </TR>
     <%    if RsP.Fields("Activo")="1" then
	   varvisualiza="disabled=""disabled"""
	   else
	    'if id_rol="11"  or id_rol="34"   or id_rol="38"  or id_rol="1"  then
			if RsP.Fields("cenviocontra")="1" or RsP.Fields("cenviocontra")="2" or RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
	     		varvisualiza="disabled=""disabled"""
			end if
       ' end if

	   end if  %>
      <TR  >
    <TD bgcolor="#DAE8F3">Horas Lectivas</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("HorasLectivas")%></span></TD>
    </TR>

<%if id_rol <> 35  then
	if id_rol <> 34  then %>
    <TR>
    <TD bgcolor="#DAE8F3">Observaci&oacute;n</TD>
    <TD><select  <%=varvisualiza%> style="font-size:10px; width:300px" name="cmbObservacion" id="cmbObservacion" >
      <option value="" >Seleccione...</option>
      <option value="Formaci&oacute;n academica no requerida.">1 Formaci&oacute;n academica no requerida</option>
      <option value="Falta adjuntar grado obtenido.">2 Falta adjuntar grado obtenido.</option>
      <option value="Falta experiencia laboral general.">3 Falta experiencia laboral general. </option>
      <option value="Falta experiencia laboral especifica.">4 Falta experiencia laboral especifica.</option>
      <option value="No adjunta documentos sustentatorios.">5 No adjunta documentos sustentatorios.</option>
      <option value="Falta curso de capacitaci&oacute;n.">6 Falta curso de capacitaci&oacute;n.</option>
      <option value="Falta actualizar curso de capacitaci&oacute;n.">7 Falta actualizar curso de capacitaci&oacute;n.</option>
      <option value="Falta adjuntar constancia RNP.">9 Falta adjuntar constancia RNP. </option>
      <option value="No coinciden fechas de ficha con RNP.">10 No coinciden fechas de ficha con RNP.</option>
      <option value="RNP no vigente">11 RNP no vigente.</option>
      <option value="Nro DNI incorrecto.">12 Nro DNI incorrecto.</option>
      <option value="Falta post grado o curso de capacitaci&oacute;n.">13 Falta post grado o curso de capacitaci&oacute;n.</option>
      <option value="Otros.">8 Otros.</option>
    </select></TD>
    </TR>

    <TR>
    <TD bgcolor="#DAE8F3">Otros</TD>
    <TD><span class="e_td_string1">
      <input <%=varvisualiza%>  name="txtobs<%=RsP.Fields("ID_PER")%>" type="text" id="txtobs<%=RsP.Fields("ID_PER")%>" size="50" maxlength="100" value="<%=RsP.Fields("cv_observacion")%>" />
    </span></TD>
    </TR>
   
  
     
     <TR>
    <TD bgcolor="#DAE8F3">Resultado</TD>
    <TD><select <%=varvisualiza%> style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onChange="f_contador_cv(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
      <option value="9" <%if(RsP.Fields("bandAprob")="9") then response.write("selected")end if%>>Seleccione...</option>
      <option value="1" <%if(RsP.Fields("bandAprob")="1") then response.write("selected")end if%> >Aprobado</option>
      <option value="2" <%if(RsP.Fields("bandAprob")="2") then response.write("selected")end if%>>Desaprobado</option>
    </select>
    </TD>
    </TR>
  <% end if 
  end if%>
    <tr>
    <TD colspan="2" align="center" bgcolor="#DAE8F3"><a href="declaracion.asp?id=<%=RsP.Fields("id_cc")%>&p=<%=id_proyecto%>&dni=<%=dni%>" class="boton" target="_blank">Ver Ficha</a></TD>
    </TR>
    
    </TABLE>
     <% lsNivel= RsP.Fields("nivel")
		registro = registro + 1
		RsP.MoveNext
		Loop	
		RsP.close 
 end If %>
</TD>
    </tr>
    
    </table>
</body>
</html>

