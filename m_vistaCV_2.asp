<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
id_proyecto=session("id_proyecto") 
lsUsuario=Session("id_usuario")
id_rol=Session("txtTipoUsuarioValido")

dni = Request.Form("dni")



' ---- Dejamos el DNI solo con caracteres num?ricos: -----------
d=""
for i=1 to len(dni)
    if mid(dni,i,1)>="0" and mid(dni,i,1)<="9"  then
	   d=d&mid(dni,i,1)
	end if   
next 
dni=d


consulta1 = "EXEC dbo.pa_ficha_datosCV '" & dni & "', '" & id_proyecto & "'" 

Set RsP	= Server.CreateObject("ADODB.Recordset") 
RsP.cursorlocation=3
RsP.Open consulta1, MiCone, 3,3

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Documento sin t&iacute;tulo</title>
<style type="text/css">
<!--
.Estilo7 {font-size: 12px}
.Estilo9 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #000000; }
.Estilo10 {color: #FFFFFF}
-->
</style>
</head>

</body>
<table border="1" bordercolor="#DAE8F3" height="500px" align="center">
<tr style="height:10px;" bgcolor="#DAE8F3" class="dato"> 
    <td colspan="3" align="center" valign="top" bordercolor="#000000" bgcolor="#FF0000" style="height:10px; color:#FFF"><p align="center"><strong><img src="images/cuidado.png" alt="" width="27" height="31" border="0" align="top" style="CURSOR: hand" onClick=""  /><font class="titulo">IMPORTANTE:  SI NO PUEDE VISUALIZAR EL CONTENIDO DEL ARCHIVO PDF, PROCEDA A DESCARGARLO Y  ABRIR EL ARCHIVO.</font></strong> </p></td>
   <input type="hidden" name="num_vista" id="num_vista" value="1" />
    <td  width="696" style="height:10px;" align="center"><strong>DATOS</strong></td>
</tr>
<tr >
  <tr style="height:10px;" bgcolor="#DAE8F3" class="dato"> 
    <td width="207" align="center" bordercolor="#000000" background="" style="height:10px;"><input type="hidden" name="txtDNI" id="txtDNI" value="<%=dni%>"/>
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
    	     %>    </td>
    <td  width="196" align="center" bordercolor="#000000" style="height:10px;">DNI <img src="images/dni.jpg" width="30" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('2')" /><br>
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
    	  %>    </td>
    <td  width="199" align="center" bordercolor="#000000" style="height:10px;">GRADO OBTENIDO<img src="images/resultados.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('3')" /><br>
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
    	  %>    </td>
    <td  width="696" align="center" valign="middle" style="height:10px;">&nbsp;</td>
  </tr>
    <tr bordercolor="#000000" >
      <td  colspan="3">
          <div id="foto" style="width:800; height:120; ">
			<!-- controla la parte extrior del cuadro de archivos -->
            <iframe id="foto1" src="<%=archivo1%>" width="800px" height="500px" style="border:none;"> </iframe>
			<%
				consulta2 = "EXEC dbo.pa_archivos_inscripcion_listar '" & dni & "', '" & id_proyecto & "'" 
            	Set RsP2= Server.CreateObject("ADODB.Recordset") 
            	RsP2.cursorlocation=3
            	RsP2.Open consulta2, MiCone, 3,3
            	If  Not RsP2.BOF And Not RsP2.EOF Then 
					Do While Not RsP2.EOF
            	 		cantidad=1
            %>
					<!-- controla el cuadro interno de la ventana de archivos -->
					<iframe id="foto<%=RsP2.Fields("num")%>" src="<%=RsP2.Fields("ruta")%>" width="800px" height="500px" style="border:none ; display:none"> </iframe> 
				<% 	cantidad = cantidad + 1
					RsP2.MoveNext
					Loop	
					set RsP2=nothing
				end if
          	 	cantidad=cantidad+3
				%>
        </div>
		<input type="hidden" name="cantidad" id="cantidad" value="<%=cantidad%>" />      </td>
    <td valign="top" >
     <%
      If  Not RsP.BOF And Not RsP.EOF Then 
	 
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
            <TD width="334"   bgcolor="#DAE8F3"><span class="Estilo9">DNI</span></TD>
            <TD width="328"><span class="e_td_string1 Estilo7"><%=RsP.Fields("dni")%></span></TD>
        </TR>
        <TR>
            <TD   bgcolor="#DAE8F3"><span class="Estilo9">Nombre</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("nombre")%></span></TD>
        </TR>
        <TR>
            <TD   bgcolor="#DAE8F3"><span class="Estilo9">Fecha Nacimiento</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("FEC_NAC")%></span></TD>
        </TR>
        <TR>
            <TD bgcolor="#DAE8F3"><span class="Estilo9">Nivel Estudios</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("NIVEL")%></span></TD>
        </TR>
        <TR>
            <TD bgcolor="#DAE8F3"><span class="Estilo9">Grado</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("GRADO")%></span></TD>
        </TR>
        <TR>
            <TD bgcolor="#DAE8F3"><span class="Estilo9">Profesi&oacute;n</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("PROFESION")%></span></TD>
        </TR>
            <TR>
            <TD bgcolor="#DAE8F3"><span class="Estilo9">RUC</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("RUC")%></span></TD>
        </TR>
            <TR>
              <TD bgcolor="#DAE8F3"><span class="Estilo9">Fec. ini RNP</span></TD>
              <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("FECHAINIRNP")%></span></TD>
            </TR>
        <TR>
        <TD bgcolor="#DAE8F3"><span class="Estilo9">Fec. fin RNP</span></TD>
        <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("FECHAFINRNP")%></span></TD>
        </TR>
        <TR>
            <TD bgcolor="#DAE8F3"><span class="Estilo9">Experiencia General</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%="A&ntilde;o:"&RsP.Fields("expgen_anio")&" Meses:"&RsP.Fields("expgen_meses")%></span></TD>
        </TR>
        <TR>
            <TD bgcolor="#DAE8F3"><span class="Estilo9">
            <% if RsP.Fields("experiencia_1")="" or isnull(RsP.Fields("experiencia_1")) then %>
              A&ntilde;os o meses  de experiencia en trabajos de Campo (Censo y/o Encuestas)
              <%else%>
              <%=RsP.Fields("experiencia_1")%>
              <%end if%>
            </span></TD>
            <TD><span class="e_td_string1 Estilo7"><%="A&ntilde;o:"&RsP.Fields("expCampo_anio")&" Meses:"&RsP.Fields("expCampo_meses")%></span></TD>
        </TR>
        <TR>
            <TD bgcolor="#DAE8F3"><span class="Estilo9">
            <% if RsP.Fields("experiencia_2")="" or isnull(RsP.Fields("experiencia_2")) then %>
            A&ntilde;os o meses  de experiencia en manejo de grupos:
            <%else%>
            <%=RsP.Fields("experiencia_2")%>
            <%end if%>
            </span></TD>
            <TD><span class="e_td_string1 Estilo7"><%="A&ntilde;o:"&RsP.Fields("expGrupo_anio")&" Meses:"&RsP.Fields("expGrupo_meses")%></span></TD>
        </TR>
        <TR>
            <TD bgcolor="#DAE8F3"><span class="Estilo9">Trabajo en el INEI</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("inei")%></span></TD>
        </TR>
        <TR style="display:none">
            <TD bgcolor="#DAE8F3"><span class="Estilo9">Proyecto</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("Pr")%></span></TD>
        </TR>
        <TR >

            <TD bgcolor="#DAE8F3"><span class="Estilo9">Curso Solicitado</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("cursoCapacitacion")%></span></TD>
        </TR>
        <TR  >
            <TD bgcolor="#DAE8F3"><span class="Estilo9">Fechas cursos</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("fechas_cap")%></span></TD>
        </TR>
           <%    
            if RsP.Fields("Activo")="1" then
        	   varvisualiza="disabled=""disabled"""
        	  else
        			if RsP.Fields("cenviocontra")="1" or RsP.Fields("cenviocontra")="2" or RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
        	     		varvisualiza="disabled=""disabled"""
        			end if
        	 end if  
           %>
        <TR>
            <TD bgcolor="#DAE8F3"><span class="Estilo9">Horas Lectivas</span></TD>
            <TD><span class="e_td_string1 Estilo7"><%=RsP.Fields("HorasLectivas")%></span></TD>
        </TR>
        <%
          if id_rol <> 35  then
          if id_rol <> 34  then 
        %>
            <TR>
              <TD bgcolor="#DAE8F3"><span class="Estilo9">Observaci&oacute;n</span></TD>
              <TD>
                  <span style="font-size: 12px">
                  <select  <%=varvisualiza%> style="font-size:10px; width:300px" name="cmbObservacion" id="cmbObservacion" >
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
                  </select>
                  </span> </TD>
            </TR>
            <TR>
              <TD bgcolor="#DAE8F3"><span class="Estilo9">Otros</span></TD>
              <TD>
                <span class="e_td_string1 Estilo7">
                <input <%=varvisualiza%>  name="txtobs<%=RsP.Fields("ID_PER")%>" type="text" id="txtobs<%=RsP.Fields("ID_PER")%>" size="50" maxlength="100" value="<%=RsP.Fields("cv_observacion")%>" />
                </span>              </TD>
            </TR>
            <TR>
              <TD bgcolor="#DAE8F3"><span class="Estilo9">Resultado</span></TD>
              <TD>
                <span style="font-size: 12px">
                <select <%=varvisualiza%> style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onChange="f_contador_cv(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
                  <option value="9" <%if(RsP.Fields("bandAprob")="9") then response.write("selected")end if%>>Seleccione...</option>
                  <option value="1" <%if(RsP.Fields("bandAprob")="1") then response.write("selected")end if%> >Aprobado</option>
                  <option value="2" <%if(RsP.Fields("bandAprob")="2") then response.write("selected")end if%>>Desaprobado</option>
                </select>
                </span> </TD>
            </TR>
      <% end if 
      end if %>
  <tr>
            <TD colspan="2" align="center" bgcolor="#DAE8F3"><a href="declaracion.asp?id=<%=RsP.Fields("id_cc")%>&p=<%=id_proyecto%>&dni=<%=dni%>" target="_blank" class="boton Estilo7 Estilo10">Ver Ficha</a>            </TD>
          </TR> 
        </TABLE>    </td>
	 <% lsNivel= RsP.Fields("nivel")
    		registro = registro + 1
    		RsP.MoveNext
    		Loop	
    		RsP.close 
        end If %>
  </tr>
</table>
</body>
</html>

