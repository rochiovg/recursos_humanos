<%@ Language=VBScript  %>
<%session.lcid=2057%>
<!-- #include file="Conexion.asp"  --> 
<!--#include file="cabecera.html"-->
<%
Response.Expires = 0 
muestra_acepta = "none"
%>

<%  
id=request("id")

Response.ContentType="text/html; charset=iso-8859-1"
consulta = "EXEC dbo.get_publicacion '"&id&"'" 
	

	Set RsP1	= Server.CreateObject("ADODB.Recordset") 
	RsP1.cursorlocation=3
	RsP1.Open consulta, MiCone, 3,3
	
	If  Not RsP1.BOF And Not RsP1.EOF Then  
	
	id_proyecto=Rsp1.Fields("id_proyecto")
	desc_meta=RsP1.Fields("desc_meta")
	Objetivo_pub=RsP1.Fields("Objetivo_pub")
	dependencia=RsP1.Fields("dependencia")
	Mensaje_SUNAT=RsP1.Fields("Mensaje_SUNAT")
	referencias=RsP1.Fields("referencias")
	desc_meta=RsP1.Fields("desc_meta")
	else
	
	id_proyecto=0
	desc_meta=""
	Objetivo_pub=""
	dependencia=""
	Mensaje_SUNAT=""
	referencias=""
	desc_meta=""
	
	end if

	
	RsP1.close
	set RsP1=nothing
%>

<html>
<head>
 <title>..:: SISTEMA DE CONSECUCI&Oacute;N DE RECURSOS HUMANOS ::..</title>

   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
   <script type="text/javascript" src="js/cliente.js"></script>
   <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"></script>
   <script type="text/javascript" src="js/tooltip3.js"></script>
<script>function AbrirLugares(cod){	 		
	pagina = "lugares.asp";		
	win = window.open(pagina,'','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=360,top=250,left=250');
    }
	
	function abrir(id_proy)
	{
		var id=document.getElementById("id_cc").value;
		var p=document.getElementById("id_p").value;
		window.location.href = "logueo.asp?id="+id+'&p='+p;
		}
	function f_acepto(){
		band=document.miFormulario.chkacepto.checked;
		if (band==false){
			document.getElementById("inscripcion").setAttribute("disabled","true");

		}else
		{	
		document.getElementById("inscripcion").removeAttribute("disabled");
		document.getElementById('ver').style.display='block';		
		}
	}
	
	function verDetalle (id){
	if (id==1) {
		var reg=document.getElementById("reg").value;
		document.getElementById("trdet1").style.display="";
		document.getElementById("trdet"+reg).style.display="none";
	}
	
	if (id!=1) {
		var reg=document.getElementById("reg").value;
		document.getElementById("detalle_1").style.display="none";
		document.getElementById("trdet1").style.display="none";
		document.getElementById("trdet"+reg).style.display="none";
		document.getElementById("trdet"+id).style.display="";
		document.getElementById("TR1").style.background="#F2F9FF";
		document.getElementById("detalle_1").style.background="";
	}
 	if (document.getElementById("reg").value==1){
		document.getElementById("detalle_"+id).style.display="";
		document.getElementById("detalle_"+id).bgColor="";
		document.getElementById("reg").value=id;
		document.getElementById("TR"+id).style.background="#6EA4D3";
		document.getElementById("detalle_"+id).style.background="#FFFFFF";
	}		
	else
	{
		var reg=document.getElementById("reg").value;
		document.getElementById("detalle_"+reg).style.display="none";
		document.getElementById("TR"+reg).style.background="#F2F9FF";
		document.getElementById("detalle_"+reg).style.background="";
		document.getElementById("detalle_"+id).style.display="";
		document.getElementById("TR"+id).style.background="#6EA4D3";
		document.getElementById("detalle_"+id).style.background="#FFFFFF";
		document.getElementById("reg").value=id;

	}
	
}


   </script>
   <script type="text/javascript" src="js/tooltip3.js"></script>
<link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css">
</head>
<body oncontextmenu="return false" topmargin=0> <div id="divContenido"> 

<table  border="0" width="100%" align=center cellspacing=1 cellpadding=1><tr  height=4 bgcolor=darkblue><td></td></tr></table> <div style=" padding:0px 10px 10px 10px"><span style=" margin:10px"></span> 

 <%  consulta1 = "EXEC dbo.get_ConvocatoriacargoPublica_ver  '"&id&"'  " 
 
	Set RsP	= Server.CreateObject("ADODB.Recordset") 
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3
	total=RsP.RecordCount
	
	
	If  Not RsP.BOF And Not RsP.EOF Then  
	
	fec_inicio=RsP.Fields("inicio")
	
	
	

	 %>

   <input type="hidden" name="id_cc" id="id_cc" value="<%=id%>">
   <input type="hidden" name="id_p" id="id_p" value="<%=id_proyecto%>">
<table border="0" width="90%" align=center cellspacing=1 cellpadding=1>
   <tr><td  colspan="2" align="left" valign="top"><table width="89%" align="center" border="0"><tr><td colspan=4 align=center><form name="miFormulario" method="post">
     <table border="0" width="90%" align=center cellspacing=1 cellpadding=1>
     <tr>
       <td colspan="2"><div align="center" class="titulo">
         <table border="0" width="90%" align=center cellspacing=1 cellpadding=1>
           <tr height=5>
             <td colspan=2></td>
           </tr>
           <tr>
             <td height="41" colspan="2" align=left valign="top"><p class="tituloPrin"><strong>CONVOCATORIA BAJO LOCACI&Oacute;N DE SERVICIOS<br>
               <br>
               <%=desc_meta%></strong></p></td>
           </tr>
           <tr>
             <td colspan="2">
			 <% 
	
	consulta2 = "EXEC dbo.get_ConvocatoriaComunicado  '"&id&"'  " 

	Set RsP2	= Server.CreateObject("ADODB.Recordset") 
	RsP2.cursorlocation=3
	RsP2.Open consulta2, MiCone, 3,3
		
	If  Not RsP2.BOF And Not RsP2.EOF Then  
	
	nro_comunicado=RsP2.Fields("nro_comunicado")
	COMUNICADO=RsP2.Fields("COMUNICADO")
	MOSTRAR_ARCHIVO=RsP2.Fields("MOSTRAR_ARCHIVO")
	id_proyecto=RsP2.Fields("id_proyecto") 
	ANNIO_T=RsP2.Fields("ANNIO")
	mensaje_archivo=RsP2.Fields("mensaje_archivo")
	
	 %>
	<br>
    <div align="center" style="width:100%">
	<DIV align="center" class="titulo" style="width:90%; background:#FFFFD7; border-bottom-width:thin; border-top-width:thin; border-bottom-color:#003; border-top-color:#003; " > COMUNICADO Nro. 00<%=nro_comunicado%> - <%=ANNIO_T%><BR><BR><p align="justify"><%=COMUNICADO%></p> <% IF MOSTRAR_ARCHIVO=1 THEN %>
     <A href="http://economicas.inei.gob.pe/imagenes/CCRRHH/pdf_general/local_<%=id%>.pdf?f=<%=my_num%>","_blank",""><%=mensaje_archivo%></A> 
<%END IF %>  
    </DIV>
    </DIV>

	<% end if
	 RsP2.close
	set RsP2=nothing 	
	%>
               
               </td>
           </tr>
           <tr>
             <td width="4%" height="41" align=left valign="top"><b><font class='proyecto' color=darkblue style="line-height=210%">I.</font></b></td>
             <td width="96%" align=left valign=top><p align=justify style="padding-bottom:10px; padding-top:10px;" ><span class="cascade10"><font color=darkblue><strong class="proyecto">OBJETIVO:</strong></font></span></p>
               <ul>
                 <li class="etiqueta2"><%=Objetivo_pub%></li>
               </ul></td>
           </tr>
           <tr height=30>
             <td  align=left valign=top><b><font class='proyecto' color=darkblue>II.</font></b></td>
             <td align=left valign=top><span class="proyecto">CONVOCATORIAS VIGENTES:</span><br>
               <br></td>
           </tr>
           <tr height=30>
             <td>&nbsp;</td>
             <td colspan="2" rowspan="2"  align=left valign=top><div style="border:#ffffff 1px solid; ">
               <div style="border:#ffffff 1px solid; "> <span style="color: #0067CE; font-size:11px; border-bottom:1px solid;"> </span>
                 <div align="left" style="font:Arial, Helvetica, sans-serif; font-size:14px; color: #06C; "></div>
                 <div id="CollapsiblePanel1" class="CollapsiblePanel">
                   <div class="CollapsiblePanelTab" tabindex="0">
                     <div align="left" style="font:Arial, Helvetica, sans-serif; font-size:14px; color: #06C; ">
                       <div align="left" style="font:Arial, Helvetica, sans-serif; font-size:14px; color: #06C; "><strong><%=RsP.Fields("pea")%>&nbsp;<%=RsP.Fields("subtitulo")%><%=RsP.Fields("departamento")%></strong><strong style="">&nbsp;[clic para ver detalle]</strong></div>
                       <p><span class="etiqueta2"><strong>Se requiere: <%=RsP.Fields("pea")%>&nbsp;<%=RsP.Fields("subtitulo")%><%=RsP.Fields("departamento")%></strong><br>
                         <%=dependencia%> <br>
                         <br>
                         <%=RsP.Fields("objetivo")%></span></p>
                       <p><span class="etiqueta2"><strong>Periodo de Convocatoria</strong> <br>
                         Inicio: <%=RsP.Fields("inicio")%><br>
                         Fin: <%=RsP.Fields("fin")%></span></p>
                     </div>
                   </div>
                   
<% IF id_proyecto="103" THEN%>         

 <div class="CollapsiblePanelContent"> <br>
                     <% SQL5 = "exec dbo.PA_LSITAR_SEDES_ECE '"&id&"', '"&id_proyecto&"' "	
  

		Set RSCuad5	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad5.cursorlocation=3
		RSCuad5.Open SQL5, MiCone, 3,3
		
If Not RSCuad5.BOF And Not RSCuad5.EOF Then %>
                     <table class="tabla2"  border="1" cellpadding="2" cellspacing="2" id= bordercolor=&quot;#DAE8F3&quot;  align="center" width="70%" >
                       <tr>
                         <td colspan="2" class="etiqueta2"><div align="center"><strong>Personal Requerido</strong></div></td>
                       </tr>
                       <tr>
                         <td  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>Dependencia</strong></div>
                           <input name="reg" id="reg" type="hidden" value="1"></td>
                         <td align="center"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="etiqueta2"><div align="center"><strong>Cantidad</strong></div></td>
                       </tr>
                       <%  		
				TOTAL=1			
			Do While Not RSCuad5.EOF 
				 IF TOTAL=1 THEN
				 	t=""
				 ELSE
				 	COLOR="bgcolor=""#F2F9FF"""
					 t="style=""display:none"" "
				 END IF
			%>
                       <tr <%=COLOR%> id="TR<%=total%>">
                         <td class='etiqueta' ><img src="images/icozoom.PNG" id = 'btncontratos' name = 'btncontratos' style="CURSOR:HAND" alt="Contratos" onClick="verDetalle(<%=total%>)" >&nbsp;&nbsp;<%=RSCuad5.Fields("sede")%></td>
                         <td class='etiqueta' align="center"><p align="center"><%=RSCuad5.Fields("pea")%></p></td>
                       </tr>
                       <tr id="trdet<%=TOTAL%>" <%=t%> >
                         <td colspan="2" align="center"><% if total=1 then %>
                           <div id="detalle_<%=total%>" style="overflow:auto;width:98%;position:relative; background-color:#FFFFFF;" >
                             <%else%>
                             <div  id="detalle_<%=total%>" style="overflow:auto;width:98%;position:relative;display:none;" >
                               <%end if%>
                               <table border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" width="60%" align="center">
                                 <% SQL6 = "exec dbo.PA_LSITAR_SUB_SEDES_ECE '"&id&"' , '"&RSCuad5.Fields("sede_desc")&"', '"&id_proyecto&"' "	
								 
   
	   
		Set RSCuad6	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad6.cursorlocation=3
		RSCuad6.Open SQL6, MiCone, 3,3
		
		If Not RSCuad6.BOF And Not RSCuad6.EOF Then 

		
		%>
                                 <tr  bordercolor="#DAE8F3"  bgcolor="#DAE8F3">
                                   <td class="etiqueta"><strong>Nro.</strong></td>
                                   <td class="etiqueta"><strong>SEDE </strong></td>

                                   <td class="etiqueta"><strong>CANTIDAD</strong></td>
                                 </tr>
                                 <%	 registro=1
				Do While Not RSCuad6.EOF	
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If
				%>
                                 <tr class='<%=clase%>' >
                                   <td class="etiqueta"><%=registro%></td>
                                   <td class="etiqueta"><%=RSCuad6.Fields("subSede")%></td>
                                   <td class="etiqueta"><%=RSCuad6.Fields("pea")%></td>
                                 </tr>
                                 <%
			  registro = registro + 1
			  RSCuad6.MoveNext
			  Loop	
			  RSCuad6.close
			  set RSCuad6=nothing
			  
			  END IF%>
                               </table>
                             </div>
                           </div></td>
                       </tr>
                       <%
			RSCuad5.MoveNext
			TOTAL=TOTAL+1
			Loop	
			RSCuad5.close
			set RSCuad5=nothing 
 %>
                     </table>
                     <%end if %>
                     
                     
<% ELSE %>

                   <div class="CollapsiblePanelContent"> <br>
                     <% SQL5 = "exec dbo.pa_ubigeocaro_listarPea '"&id&"', '"&id_proyecto&"' "	
  

		Set RSCuad5	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad5.cursorlocation=3
		RSCuad5.Open SQL5, MiCone, 3,3
		
If Not RSCuad5.BOF And Not RSCuad5.EOF Then %>
                     <table class="tabla2"  border="1" cellpadding="2" cellspacing="2" id= bordercolor=&quot;#DAE8F3&quot;  align="center" width="70%" >
                       <tr>
                         <td colspan="2" class="etiqueta2"><div align="center"><strong>Personal Requerido</strong></div></td>
                       </tr>
                       <tr>
                         <td  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>Dependencia</strong></div>
                           <input name="reg" id="reg" type="hidden" value="1"></td>
                         <td align="center"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="etiqueta2"><div align="center"><strong>Cantidad</strong></div></td>
                       </tr>
                       <%  		
				TOTAL=1			
			Do While Not RSCuad5.EOF 
				 IF TOTAL=1 THEN
				 	t=""
				 ELSE
				 	COLOR="bgcolor=""#F2F9FF"""
					 t="style=""display:none"" "
				 END IF
			%>
                       <tr <%=COLOR%> id="TR<%=total%>">
                         <td class='etiqueta' ><img src="images/icozoom.PNG" id = 'btncontratos' name = 'btncontratos' style="CURSOR:HAND" alt="Contratos" onClick="verDetalle(<%=total%>)" >&nbsp;&nbsp;<%=RSCuad5.Fields("detadepen")%></td>
                         <td class='etiqueta' align="center"><p align="center"><%=RSCuad5.Fields("pea")%></p></td>
                       </tr>
                       <tr id="trdet<%=TOTAL%>" <%=t%> >
                         <td colspan="2" align="center"><% if total=1 then %>
                           <div id="detalle_<%=total%>" style="overflow:auto;width:98%;position:relative; background-color:#FFFFFF;" >
                             <%else%>
                             <div  id="detalle_<%=total%>" style="overflow:auto;width:98%;position:relative;display:none;" >
                               <%end if%>
                               <table border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" width="60%" align="center">
                                 <% SQL6 = "exec dbo.pd_listar_PROV_SEDES '"&id&"', '"&RSCuad5.Fields("CCDD")&"', '"&RSCuad5.Fields("detadepen")&"', '"&id_proyecto&"' "	
   
	   
		Set RSCuad6	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad6.cursorlocation=3
		RSCuad6.Open SQL6, MiCone, 3,3
		
		If Not RSCuad6.BOF And Not RSCuad6.EOF Then 

		
		%>
                                 <tr  bordercolor="#DAE8F3"  bgcolor="#DAE8F3">
                                   <td class="etiqueta"><strong>Nro.</strong></td>
                                   <td class="etiqueta"><strong>DPTO</strong></td>
                                   <td class="etiqueta"><strong>PROVINCIA</strong></td>
                                   <td class="etiqueta"><strong>CANTIDAD</strong></td>
                                 </tr>
                                 <%	 registro=1
				Do While Not RSCuad6.EOF	
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If
				%>
                                 <tr class='<%=clase%>' >
                                   <td class="etiqueta"><%=registro%></td>
                                   <td class="etiqueta"><%=RSCuad6.Fields("dpto")%></td>
                                   <td class="etiqueta"><%=RSCuad6.Fields("PROV")%></td>
                                   <td class="etiqueta"><%=RSCuad6.Fields("TOTAL")%></td>
                                 </tr>
                                 <%
			  registro = registro + 1
			  RSCuad6.MoveNext
			  Loop	
			  RSCuad6.close
			  set RSCuad6=nothing
			  
			  END IF%>
                               </table>
                             </div>
                           </div></td>
                       </tr>
                       <%
			RSCuad5.MoveNext
			TOTAL=TOTAL+1
			Loop	
			RSCuad5.close
			set RSCuad5=nothing 
 %>
                     </table>
                     <%end if %>
                     
 <%END IF%>                    
                     
                     <p class="etiqueta2"><strong>Perfil del Servicio:</strong></p>
                     <%if id=2 or id=3 then %>
                     <ol class="etiqueta2">
                       <li><%=RsP.Fields("perfil")%></li>
                     </ol>
                     <%else%>
                     <ol class="etiqueta2">
                       <%=RsP.Fields("perfil")%>
                     </ol>
                     <%end if%>
                     <% if RsP.Fields("datos_complementarios")="" or isnull(RsP.Fields("datos_complementarios")) then 
			else
			%>
                     <p class="etiqueta2"><strong>Datos Complementarios</strong></p>
                     <ol class="etiqueta2">
                       <%=RsP.Fields("datos_complementarios")%>
                     </ol>
                     <%end if %>
                     <p class="etiqueta2"><strong>Caracter&iacute;sticas del Servicio:</strong></p>
                     <%if id=2 or id=3 then %>
                     <ol class="etiqueta2">
                       <li><%=RsP.Fields("Caracteristicas_contrato")%></li>
                     </ol>
                     <%else%>
                     <ol class="etiqueta2">
                       <%=RsP.Fields("Caracteristicas_contrato")%>
                     </ol>
                     <%end if%>
                     <p class="etiqueta2"><strong>Proceso de Selecci&oacute;n</strong></p>
                     
<% 
				
				SQ0 = "exec dbo.pa_convocatoria_cronograma_listar_convocatoria '"&id&"' "
				  
				Set RS0	= Server.CreateObject("ADODB.Recordset") 	
				RS0.cursorlocation=3
				RS0.Open SQ0, MiCone, 3,3
				
				If Not RS0.BOF And Not RS0.EOF Then   %>
                
                <table class="tabla2"  border="1" cellpadding="2" cellspacing="2" id= bordercolor="#DAE8F3"  align="center" width="70%">
                	<tr>
                    	<td colspan="2" class="etiqueta2" bgcolor="#84C1FF" style="text-align:center"><STRONG>CRONOGRAMA</STRONG>
                        </td>
                 	</tr>
                  <%  Do While Not RS0.EOF	 %>
                    
                	<tr>
                    	<td class="etiqueta2" width="70%"> <%=RS0.Fields("descripcion")%>
                        </td>
                        <%  IF RS0.Fields("fec_fin")="01/01/1900" THEN
								IF RS0.Fields("fec_ini")="01/01/1900" THEN
									t_crono= ""
								ELSE 
									t_crono= RS0.Fields("fec_ini")
								END IF
								
							else 
								t_crono= "Del " & RS0.Fields("fec_ini") & " al " & RS0.Fields("fec_fin")
							end if
						%>
                        <td class="etiqueta2" width="30%"><%=t_crono%>&nbsp;<%=RS0.Fields("NOTA")%>
                        </td>
                    </tr>
                    
                  <%  RS0.MoveNext
					  Loop	
					  RS0.close
					  set RS0=nothing
				  
				  %>  
                    
                </table>
				<% end if %>
                     
                     <%if isnull(RsP.Fields("bonificacion")) or RsP.Fields("bonificacion")="" then 
        response.write("")
    else%>
                     <p class="etiqueta2"><strong>Bonificaci&oacute;n</strong></p>
                     <ol class="etiqueta2">
                       <li> <%=RsP.Fields("bonificacion")%></li>
                     </ol>
                     <%end if %>
                     <p class="etiqueta2"><strong></strong><strong>Modalidad de Contrato y Honorarios Profesionales:</strong></p>
                     <ol class="etiqueta2">
                       <%=RsP.Fields("modalidad")%>
                     </ol>
                     <%if isnull(RsP.Fields("vigencia")) or RsP.Fields("vigencia")="" then 
        response.write("")
    else%>
                     <p class="etiqueta2"><strong>Vigencia del Contrato:</strong></p>
                     <ol class="etiqueta2">
                       <li><%=RsP.Fields("vigencia")%></li>
                     </ol>
                     <%end if%>
                   </div>
                 </div>
                 <br />
                 <div style="border:#CCCCCC 1px solid; "> </div>
               </div>
             </div></td>
           </tr>
           <tr height=30>
             <td>&nbsp;</td>
           </tr>
           <tr height=30>
             <td>&nbsp;</td>
             <td colspan="2" class="etiqueta4"  align=right ></td>
           </tr>
           <tr height=30>
             <td  align=left valign=top>&nbsp;</td>
             <td align=left valign=top><strong class="tituloPrin"><%=Mensaje_SUNAT%></strong> <br>
               <br>
              
            
             </td>
           </tr>
           <tr>
             <td align="justify" valign="top"></td>
             <td align="left" valign="top"><% if isnull(referencias) then %>
               <table width="80%" border="0">
                 <tr>
                   <td align="left">&nbsp;</td>
                 </tr>
                 <tr>
                   <td align="right"></td>
                 </tr>
               </table>
               <%else%>
               <table width="80%" border="0">
                 <tr>
                   <td align="center" class="etiqueta2"><p align="center"><strong><%=referencias%></strong></p></td>
                 </tr>
                 <tr>
                   <td align="center"></td>
                 </tr>
               </table>
               <%end if%>
               <%  dia = Mid(fec_inicio,1,2)
	mes = Mid(fec_inicio,4,2)
	anio = Mid(fec_inicio,7,4)
	
	if mes ="01" then
		dmes="enero"
	elseif mes ="02" then
		dmes="febreo"
	elseif mes ="03" then
		dmes="marzo"
	elseif mes ="04" then
		dmes="abril"
	elseif mes ="05" then
		dmes="mayo"
	elseif mes ="06" then
		dmes="junio"
	elseif mes ="07" then
		dmes="julio"
	elseif mes ="08" then
		dmes="agosto"
	elseif mes ="09" then
		dmes="septiembre"
	elseif mes ="10" then
		dmes="octubre"
	elseif mes ="11" then
		dmes="noviembre"
	elseif mes ="12" then
		dmes="diciembre"
	end if	
	
	fecha= "Lima, "&dia&" de "&dmes&" del "&anio

 %></td>
           </tr>
  <td>
  <tr>
    <table align="right">
      <tr>
        <td align="right"><div class="etiqueta2" align="right" ><strong><%=fecha%></strong></div>
        <td>
      </tr>
    </table>
  </tr>
  <tr>
    <td  colspan="2" align="left" valign="top"><table width="89%" align="center" border="0">
      <tr>
        <td colspan=4 align=center><input type=hidden id="txtOper2" name="txtOper2" value="">
          <font size="4" color="#002E5B"><b><strong>Acepto haber le&iacute;do todas las indicaciones de la inscripci&oacute;n de postulantes y habilitar la inscripci&oacute;n a la postulaci&oacute;n</strong></b></font>
         </td>
      </tr>
    </table></td>
  </tr>
         </table>
       </div></td>
     </tr>
     </table>
     <font size="1" color=blue><b><strong></strong></b></font></form></td></tr></table></td></tr></table>
</div> </div>


<%    RsP.close
			set RsP=nothing 
			MiCone.close 
			set MiCone=nothing%>

<script type="text/javascript">

	var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1", {contentIsOpen:false});

</script>

<div id="contenido" style="display:none">
</div>
<div id="dialog" title="ALERTA">
<p id="mensaje"> </p>
</div>



</body>
<%else%>

<table border="0" width="90%" align=center cellspacing=1 cellpadding=1> <tr height=5> <td colspan=2></td> </tr> 


<tr> <td height="41" colspan="2" align=left valign="top"><p class="tituloPrin"><strong>CONVOCATORIA DE PERSONAL  PARA EL PROYECTO <%=desc_meta%></strong></p>
    </td> </tr>
    
    <tr> <td height="41" colspan="2" align=left valign="top">
	<%if id_proyecto=0 then %>
    	<p class="tituloPrin"""><strong>No existe registro<br>Gracias</strong></p>
    <%else%>
    <p class="tituloPrin"""><strong>EL PROCESO DE INSCRIPCI&Oacute;N PARA ESTA CONVOCATORIA HA FINALIZADO <br>Gracias</strong></p>
    <%end if%>
    </td> </tr>
    
    <tr> <td height="41" colspan="2" align=left valign="top">




			 <% 
	
	consulta2 = "EXEC dbo.get_ConvocatoriaComunicado  '"&id&"'  " 
 
	Set RsP2	= Server.CreateObject("ADODB.Recordset") 
	RsP2.cursorlocation=3
	RsP2.Open consulta2, MiCone, 3,3
		
	If  Not RsP2.BOF And Not RsP2.EOF Then  
	
	nro_comunicado=RsP2.Fields("nro_comunicado")
	COMUNICADO=RsP2.Fields("COMUNICADO")
	MOSTRAR_ARCHIVO=RsP2.Fields("MOSTRAR_ARCHIVO")
	id_proyecto=RsP2.Fields("id_proyecto") 
	ANNIO_T=RsP2.Fields("ANNIO")
	mensaje_archivo=RsP2.Fields("mensaje_archivo")
	
	 %>
	<br>
    <div align="center" style="width:100%">
	<DIV align="center" class="titulo" style="width:90%; background:#FFFFD7; border-bottom-width:thin; border-top-width:thin; border-bottom-color:#003; border-top-color:#003; " > COMUNICADO Nro. 00<%=nro_comunicado%> - <%=ANNIO_T%><BR><BR><p align="justify"><%=COMUNICADO%></p> <% IF MOSTRAR_ARCHIVO=1 THEN %>
     <A href="http://economicas.inei.gob.pe/imagenes/CCRRHH/pdf_general/local_<%=id%>.pdf?f=<%=my_num%>","_blank",""><%=mensaje_archivo%></A> 
<%END IF %>  
    </DIV>
    </DIV>

	<% end if
	 RsP2.close
	set RsP2=nothing 	
	%>
    </td> </tr>
    
    <tr> <td height="41" colspan="2" align=left valign="top"><p class="titulo"""><strong><div align="center" > <A href="pd_consulta.asp" title="CONSULTAS" target="_blank"><font class='codigoI' color=crimson><b><u>Consulta tu inscripci&oacute;n</u></b></font></A>              
            <%IF id=2754 or id=2755 or id=2756 then 
			'or id=3394 t%>
            <a href="http://sistemas.inei.gob.pe/consultas/pd_mostrarResultado.asp?p=<%=id_proyecto%>&id=<%=id%>" title="RESULTADOS" target="_blank"><font class='codigoI' color=crimson><b><u>Consulta de Resultados</u></b></font></a>
             <%else%>          
            
            <a href="resultados.asp?id=<%=id%>" title="RESULTADOS" target="_blank"><font class='codigoI' color=crimson><b><u>Consulta de Resultados</u></b></font></a>
            <%end if%>
            </div></strong></p>
    </td> </tr>

</table>
<%  end if%>


</html>