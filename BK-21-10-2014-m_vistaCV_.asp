<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
id_proyecto=session("id_proyecto") 
lsUsuario=Session("id_usuario")
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

origen="\\srv-reflejo\imagenes\CCRRHH\" & id_proyecto & "\"&dni
origen_tmp="\\srv-reflejo\imagenes\CCRRHH\" & id_proyecto & "_Ant\"&dni

destino=Server.MapPath(".")&"\pdf\"&session("id_usuario")
if fs.FileExists("\\srv-reflejo\imagenes\CCRRHH\"&id_proyecto&"\"&DNI&"_1.pdf" ) then 
fs.CopyFile origen&"_1.pdf",destino&"_1.pdf"
elseif fs.FileExists("\\192.168.201.225\imagenes\CCRRHH\"&id_proyecto&"_Ant\"&DNI&"_1.pdf" ) then 
fs.CopyFile origen_tmp&"_1.pdf",destino&"_1.pdf"
else
fs.CopyFile "\\192.168.201.225\imagenes\CCRRHH\" & id_proyecto & "\sin_datos.pdf",destino&"_1.pdf"
end if

if fs.FileExists("\\192.168.201.225\imagenes\CCRRHH\"&id_proyecto&"\"&DNI&"_2.pdf" ) then 
fs.CopyFile origen&"_2.pdf",destino&"_2.pdf"
elseif fs.FileExists("\\192.168.201.225\imagenes\CCRRHH\"&id_proyecto&"_Ant\"&DNI&"_2.pdf" ) then 
fs.CopyFile origen_tmp&"_2.pdf",destino&"_2.pdf"
else
fs.CopyFile "\\192.168.201.225\imagenes\CCRRHH\" & id_proyecto & "\sin_datos.pdf",destino&"_2.pdf"
end if


if fs.FileExists("\\192.168.201.225\imagenes\CCRRHH\"&id_proyecto&"\"&DNI&"_3.pdf" ) then 
fs.CopyFile origen&"_3.pdf",destino&"_3.pdf"
elseif fs.FileExists("\\192.168.201.225\imagenes\CCRRHH\"&id_proyecto&"_Ant\"&DNI&"_3.pdf" ) then 
fs.CopyFile origen_tmp&"_3.pdf",destino&"_3.pdf"
else
fs.CopyFile "\\192.168.201.225\imagenes\CCRRHH\" & id_proyecto & "\sin_datos.pdf",destino&"_3.pdf"
end if


set fs=nothing
archivo1 = "pdf/"&session("id_usuario")&"_1.pdf?id="&time()
archivo2 = "pdf/"&session("id_usuario")&"_2.pdf?id="&time()
archivo3 = "pdf/"&session("id_usuario")&"_3.pdf?id="&time()


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
    <td  width="165px" style="height:10px;" align="center" background=""><input type="hidden" name="txtDNI" id="txtDNI" value="<%=dni%>" />
      CONSTANCIAS 
      <img src="images/nivel.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('1')" /></td>
    <td  width="165px" style="height:10px;" align="center">DNI <img src="images/dni.jpg" width="30" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('2')" /></td>
    <td  width="165px" style="height:10px;" align="center">GRADO OBTENIDO<img src="images/resultados.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('3')" /></td>
    <td  width="165px" style="height:10px;" align="center">DATOS</td></tr>
     <tr >
<td  colspan="3">
    <div id="foto" style="width:500; height:120; ">
    <iframe id="foto1" src="<%=archivo1%>" width="500px" height="600px" style="border:none; display:block "> </iframe> 
    <iframe  id="foto2" src="<%=archivo2%>" width="500px" height="600px" style="border:none; display:none"> </iframe> 
    <iframe  id="foto3" src="<%=archivo3%>" width="500px" height="600px" style="border:none ; display:none"> </iframe> 
    </div>
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
    
      <TR  >
    <TD bgcolor="#DAE8F3">Horas Lectivas</TD>
    <TD><span class="e_td_string1"><%=RsP.Fields("HorasLectivas")%></span></TD>
    </TR>
    
    <TR>
    <TD bgcolor="#DAE8F3">Observaci&oacute;n</TD>
    <TD><select style="font-size:10px; width:300px" name="cmbObservacion" id="cmbObservacion" >
      <option value="" >Seleccione...</option>
      <option value="Formaci&oacute;n academica no requerida.">1 Formaci&oacute;n academica no requerida</option>
      <option value="Falta adjuntar grado obtenido.">2 Falta adjuntar grado obtenido.</option>
      <option value="Falta experiencia laboral general.">3 Falta experiencia laboral general. </option>
      <option value="Falta experiencia laboral especifica.">4 Falta experiencia laboral especifica.</option>
      <option value="No adjunta documentos sustentatorios.">5 No adjunta documentos sustentatorios.</option>
      <option value="Falta curso de capacitaci&oacute;n.">6 Falta curso de capacitaci&oacute;n.</option>
      <option value="Falta actualizar curso de capacitaci&oacute;n.">7 Falta actualizar curso de capacitaci&oacute;n.</option>
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
     
     <TR>
    <TD bgcolor="#DAE8F3">Resultado</TD>
    <TD><select <%=varvisualiza%> style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onChange="f_contador_cv(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
      <option value="9" <%if(RsP.Fields("bandAprob")="9") then response.write("selected")end if%>>Seleccione...</option>
      <option value="1" <%if(RsP.Fields("bandAprob")="1") then response.write("selected")end if%> >Aprobado</option>
      <option value="2" <%if(RsP.Fields("bandAprob")="2") then response.write("selected")end if%>>Desaprobado</option>
    </select>
    </TD>
    </TR>
    <%if id_proyecto=45 or id_proyecto=47 then %>
    <tr>
    <TD colspan="2" align="center" bgcolor="#DAE8F3"><a href="m_declaracionEd.asp?id=<%=RsP.Fields("id_cc")%>&p=<%=id_proyecto%>&dni=<%=dni%>" class="boton" target="_blank">Ver Ficha</a></TD>
    </TR>
    <%else %>
    <tr>
    <TD colspan="2" align="center" bgcolor="#DAE8F3"><a href="m_fichaDatos.asp?id=<%=RsP.Fields("id_cc")%>&p=<%=id_proyecto%>&dni=<%=dni%>" class="boton" target="_blank">Ver Ficha</a></TD>
    </TR>
    <%end if%>
    
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

