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

fecha=Date() 
' ------------------------------------------------------------------------

set wRsDptoapli = Micone.execute(" exec dbo.pa_ficha_entrevistaUsuario '"&lsUsuario&"', '"&id_proyecto&"', '"&fecha&"' ")

If  Not wRsDptoapli.BOF And Not wRsDptoapli.EOF Then
	cantidad=wRsDptoapli(0)
else
	cantidad=0
end if

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing



consulta1 = "EXEC dbo.pa_ficha_datosCV '" & dni & "', '" & id_proyecto & "'" 
Set RsP	= Server.CreateObject("ADODB.Recordset") 
RsP.cursorlocation=3
RsP.Open consulta1, MiCone, 3,3



%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
   <link rel="shortcut icon" href="images/favicon.ico" />
   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
   <link href="SpryAssets/SpryValidationCheckbox.css" rel="stylesheet" type="text/css">
   <script src="SpryAssets/SpryValidationCheckbox.js" type="text/javascript"></script>
   <style type="text/css">
<!--
.Estilo9 {font-family: verdana, arial, sans-serif; font-size: 10px; }
.Estilo10 {font-weight: bold; color: #FFF; background: #035C95; border: 0px; width: 200px; height: 19px; cursor: hand; text-decoration:none; font-family: Verdana, Arial, Helvetica, sans-serif;}
.Estilo12 {width:100px; height:80px; text-decoration:none; background-image:url(images/boton.png) font:Arial, Helvetica, sans-serif; font-weight:bold; color: #039;}
.Estilo13 {font-family: verdana, arial, sans-serif; font-size: 10px; font-weight: bold; }
.Estilo14 {font-family: verdana, arial, sans-serif; font-size: 10px; color: #000000; }
-->
   </style>
   </head>
<body onLoad="cargarImagen()">
<%
	     
	If  Not RsP.BOF And Not RsP.EOF Then  %>
    
                 <%if isnull(RsP.Fields("presenPersonal")) then
			 disa=""
			 else
			 disa="disabled"
			 end if
			 
			 if isnull(RsP.Fields("Trato")) then
			 disa1=""
			 else
			 disa1="disabled"
			 end if
			 
			  if isnull(RsP.Fields("pronunciacion")) then
			 disa2=""
			 else
			 disa2="disabled"
			 end if
			 
			 
			  if isnull(RsP.Fields("vocacionServicio")) then
			 disa3=""
			 else
			 disa3="disabled"
			 end if
			 
			 if isnull(RsP.Fields("informacion"))then
			 disa4=""
			 else
			 disa4="disabled"
			 end if
			 
			 if isnull(RsP.Fields("motivacion")) then
			 disa5=""
			 else
			 disa5="disabled"
			 end if
			 
			 if  RsP.Fields("aptoTotalEntrevista")=3 then
			 disa1="disabled"
			 disa2="disabled"
			 disa3="disabled"
			 disa4="disabled"
			 disa="disabled"
			 end if 
			 
			 %>
    
	<table border="0"  align="center">
    <tr  class="dato"> 
    <td align="center" ><span class="Estilo9"><strong>Entrevistas del D&iacute;a:<%=cantidad%> </strong><a href="AptosEntrevista.asp"; target="_blank">(Ver detalle)</a><br> 
      </span>      <table width="578" border="1" cellpadding="2" bordercolor="#DAE8F3">
    <tr>
    <td width="167" class="Estilo14"> Departamento</td>
    <td colspan="2" class="Estilo9"><%=RsP.Fields("detadepen")%>
      <input type="hidden" name="txtDpto1" id="txtDpto1" value="<%=RsP.Fields("ccdd_i")%>"></td></tr>
    <tr>
    <td class="Estilo14"> Apellidos Y nombres</td>
    <td colspan="2" class="Estilo9"> <%=RsP.Fields("nombre")%></td></tr>
    <tr>
    <td class="Estilo14"> Cargo al que postula</td>
    <td colspan="2" class="Estilo9"> <%=RsP.Fields("cargo")%></td></tr>
    <tr>
    <td class="Estilo14"> Ficha de Inscripci&oacute;n</td>
    <td width="134" class="Estilo9"><a href="m_fichaDatos.asp?id=<%=RsP.Fields("id_cc")%>&p=<%=id_proyecto%>&dni=<%=dni%>"  target="_blank">Ver Ficha</a></td>
    <td class="Estilo9"><input name='buttonR' type='button' class="Estilo10" id='button2' title="Clickear en caso la persona no se haya apersonado a la entrevista" onClick="javascript:GuradarEntrevistaNSP()" value='No se present&oacute;' <%=disa%> /></td>
    </tr>
    </table>
	</td>
    </tr>
     <tr ><td align="center"><table border="1" cellpadding="2" bordercolor="#DAE8F3" style="display:none">
           <tr>
             <td width="63" rowspan="3" bgcolor="#DAE8F3" class="Estilo9">ITEM</td>
             <td width="200" colspan="3" rowspan="3" bgcolor="#DAE8F3" class="Estilo9">ASPECTOS A EVALUARSE</td>
             <td width="300" rowspan="3" bgcolor="#DAE8F3" class="Estilo9">DEFINICI&Oacute;N</td>
             <td width="441" colspan="8" bgcolor="#DAE8F3" class="Estilo9">CALIFICACION</td>
           </tr>
           <tr>
             <td width="441" colspan="3" bgcolor="#DAE8F3" class="Estilo9">BAJO</td>
             <td width="441" bgcolor="#DAE8F3" class="Estilo9">REGULAR</td>
             <td width="441" colspan="2" bgcolor="#DAE8F3" class="Estilo9">BUENO</td>
             <td width="441" colspan="2" bgcolor="#DAE8F3" class="Estilo9">MUY BUENO</td>
           </tr>
           <tr>
             <td width="441" colspan="3" bgcolor="#DAE8F3" class="Estilo9">1</td>
             <td width="441" bgcolor="#DAE8F3" class="Estilo9">2</td>
             <td width="441" colspan="2" bgcolor="#DAE8F3" class="Estilo9">3</td>
             <td width="441" colspan="2" bgcolor="#DAE8F3" class="Estilo9">4</td>
           </tr>
           <tr>
             <td width="63" rowspan="2" class="Estilo9">I</td>
             <td colspan="2" rowspan="6" class="Estilo9">PERSONAL</td>
             <td width="200" rowspan="2" class="Estilo9">PRESENTACION    PERSONAL</td>
             <td width="300" rowspan="2" class="Estilo9">Evalua la primera impresi&oacute;n ,    como impacta a la vista en general, su cuidado personal</td>
             <td width="441" colspan="3" class="Estilo9">Es indiferente     no muestra ningun interes por su persona, se presento totalmente    desaliniada.</td>
             <td width="441" class="Estilo9">Es    indiferente  muestra poco interes por    su arreglo personal, se muestra poco aseada</td>
             <td width="441" colspan="2" class="Estilo9">Muestra interes     por  su arreglo personal, se    muestra bien peinada, u&ntilde;as cuidadas, vestimenta limpia.</td>
             <td width="441" colspan="2" class="Estilo9">Muestra una impecable presentaci&oacute;n.</td>
           </tr>
           <tr>
             <td width="441" align="center" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
           </tr>
           <tr>
             <td width="63" rowspan="2" class="Estilo9">II</td>
             <td width="200" rowspan="2" class="Estilo9">TRATO AGRADABLE    Y CORTES</td>
             <td width="300" rowspan="2" class="Estilo9">Evalua el buen    trato, tiene facilidad para relacionarse con cordialidad.</td>
             <td width="441" colspan="3" class="Estilo9">No muestra buen trato, seca, parca.</td>
             <td width="441" class="Estilo9">Poco    tratable.</td>
             <td width="441" colspan="2" class="Estilo9">Muestra un trato agradable, denotando simpatia.</td>
             <td width="441" colspan="2" class="Estilo9">Trato totalmente agradable y cort&Eacute;s. Se    relaciona con facilidad.</td>
           </tr>
           <tr>
             <td colspan="3" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
           </tr>
           <tr>
             <td rowspan="2" class="Estilo9">III</td>
             <td width="200" rowspan="2" class="Estilo9">PRONUNCIACION   (Lectura del parrafo)</td>
             <td width="300" rowspan="2" class="Estilo9">Evalua la    diccion de las palabras.</td>
             <td width="441" colspan="3" class="Estilo9">Muestra dificultad para pronunciar    palabras </td>
             <td width="441" class="Estilo9">Muestra    cierta dificultad para pronunciar palabras </td>
             <td width="441" colspan="2" class="Estilo9">Muestra facilidad para pronunciar palabras </td>
             <td width="441" colspan="2" class="Estilo9">Muestra gran facilidad para pronunciar    palabras </td>
           </tr>
           <tr>
             <td colspan="3" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
           </tr>
           <tr>
             <td rowspan="2" class="Estilo9">IV</td>
             <td width="200" colspan="2" rowspan="2" class="Estilo9">COGNITIVO</td>
             <td width="200" rowspan="2" class="Estilo9">CAPACIDAD DE    ANALISIS Y SENTIDO COMUN</td>
             <td width="300" rowspan="2" class="Estilo9">Evalua    las habilidades de comprensi&oacute;n e interpretaci&oacute;n de refranes</td>
             <td width="441" colspan="3" class="Estilo9">Muestra gran dificultad para comprender e    interpretar  refranes</td>
             <td width="441" class="Estilo9">Muestra    cierta dificultad para comprender e interpretar  refranes</td>
             <td width="441" colspan="2" class="Estilo9">Muestra facilidad para comprender e    interpretar  refranes</td>
             <td width="441" colspan="2" class="Estilo9">Muestra gran facilidad para comprender e    interpretar  refranes</td>
           </tr>
           <tr>
             <td colspan="3" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
           </tr>
           <tr>
             <td rowspan="2" class="Estilo9">V</td>
             <td width="200" colspan="2" rowspan="2" class="Estilo9">CULTURA</td>
             <td width="200" rowspan="2" class="Estilo9">INFORMACION</td>
             <td width="300" rowspan="2" class="Estilo9">Evalua el    conocimiento de la postulante de temas del INEI (Misi&oacute;n, Visi&oacute;n, IPC, Que es    la ENDES, Etc.)</td>
             <td width="441" colspan="3" class="Estilo9">No cuenta con informaci&oacute;n acerca del INEI</td>
             <td width="441" class="Estilo9">Cuenta    con cierta informaci&oacute;n acerca del INEI</td>
             <td width="441" colspan="2" class="Estilo9">Cuenta     con  adecuada informaci&oacute;n acerca    del INEI</td>
             <td width="441" colspan="2" class="Estilo9">Se encuentra muy bien informada</td>
           </tr>
           <tr>
             <td width="441" colspan="3" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
             <td width="441" colspan="2" class="Estilo9"><input type="radio" name="pp1" id="TODOS" value="9"   onclick="GuardarCalif(this.value);"/></td>
           </tr>
         </table>
         <span class="Estilo9"><br>
         </span>
        <table width="578" border="1" cellpadding="2" bordercolor="#DAE8F3" style="display:none">
    <tr>
    <td colspan="2" align="center"  bgcolor="#DAE8F3" class="Estilo9">FASE II</td>
    </tr>
    <tr>
    <td colspan="2" align="center"  bgcolor="#DAE8F3" class="Estilo9">DETERMINACION DEL HABLA FLUIDO DEL IDIOMA QUECHUA</td>
    </tr>
    <tr>
    <td colspan="2" class="Estilo9">A. Habla fluidamente el idioma quechua?      </td>
    </tr>
    <tr>
    <td width="50%" class="Estilo9">Si 
      <input type="radio" name="qq1" id="qq1" value="1" title="Es indiferente no muestra ningun interes por su persona, se presento totalmente desaliniada."   onclick="GuardarCalif(this.value, 'qq', this.id);"/> </td>
    <td width="280" class="Estilo9">No 
      <input type="radio" name="qq2" id="qq2" value="2" title="Es indiferente no muestra ningun interes por su persona, se presento totalmente desaliniada."   onclick="GuardarCalif(this.value, 'qq', this.id);"/></td></tr>
      <tr>
    <td colspan="2" class="Estilo9">B. Sr. Director<BR>
      Entregue Usted la hoja impresa cionteniendo las 3 preguntas en idioma castellano, y espere que la postulante realice la traducci&oacute;n de forma verbal , correspondiente al idioma quechua para cada pregunta.<br>TRADUZCA AL  IDIOMA QUECHUA LAS SIGUIENTES PREGUNTAS<br> 
      Habla fluidamente el quechua?      </td>
    </tr>
 <tr>
    <td width="50%" class="Estilo9">Si 
      <input type="radio" name="qqs1" id="qqs1" value="1" title="Es indiferente no muestra ningun interes por su persona, se presento totalmente desaliniada."   onclick="GuardarCalif(this.value, 'qqs', this.id);"/> </td>
    <td width="280" class="Estilo9">No 
      <input type="radio" name="qqs2" id="qqs2" value="2" title="Es indiferente no muestra ningun interes por su persona, se presento totalmente desaliniada."   onclick="GuardarCalif(this.value, 'qqs', this.id);"/></td></tr>
    </table>
         <table width="98%" height="569" border="1" cellpadding="2" bordercolor="#DAE8F3" class="tabla2"><% if RsP.Fields("aptoTotalEntrevista")=3 then%>
         <tr><td colspan="10" align="center" class="Estilo9"> La persona no se present&oacute; a la entrevista</td></tr><%end if%>
             <td width="31" rowspan="2" align="center"  valign="middle" bgcolor="#DAE8F3" class="Estilo13"><input type="hidden" name="qqsf" id="qqsf" value="0">
			 <input type="hidden" name="qqf" id="qqf" value="0">
             ITEM</td>
             <td colspan="3" rowspan="2" align="center" valign="middle" bgcolor="#DAE8F3" class="Estilo13">ASPECTOS A EVALUARSE</td>
             <td width="316" rowspan="2"  align="center"  valign="middle" bgcolor="#DAE8F3" class="Estilo13">DEFINICI&Oacute;N</td>
             <td width="486" rowspan="2"  align="center"  valign="middle" bgcolor="#DAE8F3" class="Estilo13">CRITERIO</td>
             <td colspan="4" align="center" bgcolor="#DAE8F3" class="Estilo13">CALIFICACION</td>
           </tr>
           <tr>
             <td width="38" height="25" align="center" bgcolor="#DAE8F3" class="Estilo13">BAJO			 </td>
             <td width="57"  align="center" bgcolor="#DAE8F3" class="Estilo13">REGULAR</td>
             <td width="43"  align="center" bgcolor="#DAE8F3" class="Estilo13">BUENO</td>
             <td width="77"  align="center" bgcolor="#DAE8F3" class="Estilo13">MUY BUENO</td>
           </tr>
           <tr bgcolor="#F0F1CF" class='e_td_string1'>
             <td width="31" height="77" class="Estilo9">I</td>
             <td colspan="2" rowspan="3" class="Estilo9">PERSONAL</td>
             <td width="119" class="Estilo9">PRESENTACION    PERSONAL
             <input type="hidden" name="ppf" id="ppf" value="0"></td>
             <td width="316" class="Estilo9">EVAL&Uacute;A LA PRIMERA IMPRESI&Oacute;N, LA VESTIMENTA CON LA QUE SE PRESENTA Y SU CUIDADO PERSONAL.</td>
             <td width="486" class="Estilo9"><div align="justify">OBSERVAR LA FORMA C&Oacute;MO ACUDE EL POSTULANTE, SI EST&Aacute; CORRECTAMENTE VESTIDO (VESTIMENTA FORMAL) Y QUE SU PRESENTACI&Oacute;N PERSONAL SEA CUIDADOSA (CABELLO PEINADO, U&Ntilde;AS LIMPIAS, ETC).</div></td>
            
             
             
             <td width="38"  align="center" valign="middle" class="Estilo9"  ><input type="radio" name="pp1" id="pp1" value="1" <%=disa%> title="DESCUIDADO Y DESASEADO."   onclick="GuardarCalif(this.value, 'pp', this.id);" <% if RsP.Fields("presenPersonal")="1" then %> checked="checked" <%end if%>/></td>
             <td width="57"  align="center" valign="middle" class="Estilo9"><input type="radio" name="pp2" id="pp2"  <%=disa%> title="VESTIMENTA ADECUADA, MEDIANAMENTE ARREGLADO" value="2"   onclick="GuardarCalif(this.value, 'pp', this.id);" <% if RsP.Fields("presenPersonal")="2" then %> checked="checked" <%end if%>/></td>
             <td width="43" align="center" valign="middle" class="Estilo9"><input type="radio" name="pp3" id="pp3"  <%=disa%> value="3" title="VESTIDO FORMALMENTE, ASEADO"   onclick="GuardarCalif(this.value, 'pp', this.id);" <% if RsP.Fields("presenPersonal")="3" then %> checked="checked" <%end if%> /></td>
             <td width="77"  align="center" valign="middle" class="Estilo9" ><input type="radio" name="pp4" id="pp4"  <%=disa%> value="4" title="IMPECABLE EN SU PRESENTACI&Oacute;N."   onclick="GuardarCalif(this.value,'pp', this.id);" <% if RsP.Fields("presenPersonal")="4" then %> checked="checked" <%end if%>/></td>
           </tr>
           <tr  bgcolor="#F0F1CF"  class='e_td_string1'>
             <td width="31" class="Estilo9">II</td>
             <td width="119" class="Estilo9">DESENVOLVIMIENTO
             <input type="hidden" name="taf" id="taf" value="0"></td>
             <td width="316" class="Estilo9">EVAL&Uacute;A EL BUEN TRATO, LA FACILIDAD DE INTEGRACI&Oacute;N AL GRUPO Y LA CONFIANZA EN S&Iacute; MISMO.</td>
             <td width="486" class="Estilo9"><div align="justify">CONSIDERAR LA FACILIDAD DE INTEGRARSE A UN NUEVO GRUPO Y LA SEGURIDAD PARA ACERCARSE A LAS PERSONAS QUE RECI&Eacute;N CONOCE. UTILIZA RECURSOS COMO UNA SONRISA O UNA BROMA.</div></td>
             <td width="38"  align="center" valign="middle" class="Estilo9" ><input type="radio" name="ta1" id="ta1" value="1" title="NO MUESTRA BUEN TRATO, SECO, PARCO"   onclick="GuardarCalif(this.value, 'ta', this.id);" <% if RsP.Fields("Trato")="1" then %> checked="checked" <%end if%> <%=disa1%> /></td>
             <td width="57"  align="center" valign="middle" class="Estilo9"><input type="radio" name="ta2" id="ta2" value="2"   onclick="GuardarCalif(this.value, 'ta', this.id);" title="POCO TRATABLE"  <% if RsP.Fields("Trato")="2" then %> checked="checked" <%end if%> <%=disa1%>/></td>
             <td width="43"  align="center" valign="middle" class="Estilo9"><input type="radio" name="ta3" id="ta3" value="3"   onclick="GuardarCalif(this.value, 'ta', this.id);" title="SE DESENVUELVE ADECUADAMENTE"  <% if RsP.Fields("Trato")="3" then %> checked="checked" <%end if%> <%=disa1%> /></td>
             <td width="77"  align="center" valign="middle" class="Estilo9"><input type="radio" name="ta4" id="ta4" value="4"  title="SE INTEGRA FACILMENTE UTILIZANDO RECURSOS QUE FACILITEN SU INTEGRACI&Oacute;N" onClick="GuardarCalif(this.value, 'ta', this.id);"  <% if RsP.Fields("Trato")="4" then %> checked="checked" <%end if%> <%=disa1%>/></td>
           </tr>
           <tr  bgcolor="#F0F1CF"  class='e_td_string1'>
             <td width="31" class="Estilo9">III</td>
             <td width="119" class="Estilo9">LENGUAJE               <input type="hidden" name="prf" id="prf" value="0"></td>
             <td width="316" class="Estilo9">EVAL&Uacute;A LA CLARIDAD DE EXPRESI&Oacute;N Y EL MANEJO ADECUADO DEL VOCABULARIO DURANTE LA ENTREVISTA.                                   * DOMINIO DE OTRA LENGUA NATIVA (QUECHUA, AYMARA,ETC.)</td>
             <td width="486" class="Estilo9"><div align="justify">UTILIZA CORRECTAMENTE LAS PALABRAS Y CADA RESPUESTA DEBE DARSE DENTRO DEL CONTEXTO DE LO PREGUNTADO (NO SE VA POR LAS RAMAS).                                      *PEDIR AL POSTULANTE QUE EFECT&Uacute;E LA TRADUCCI&Oacute;N QUE SE ANEXAN EN EL INSTRUCTIVO.</div></td>
             
             
             <td width="38"  align="center" valign="middle" class="Estilo9" ><input type="radio" name="pr1" id="pr1" value="1" title="NO CONTESTA DENTRO DEL CONTEXTO, DIFICULTAD DE PRONUNCIACI&Oacute;N."   onclick="GuardarCalif(this.value, 'pr', this.id);"  <% if RsP.Fields("pronunciacion")="1" then %> checked="checked" <%end if%> <%=disa2%>/></td>
             <td width="57"  align="center" valign="middle" class="Estilo9"><input type="radio" name="pr2" id="pr2" title="NO CONTESTA  DENTRO DEL CONTEXTO, CIERTA DIFICULTAD PARA PRONUNCIAR ALGUNAS PALABRAS" value="2"   onclick="GuardarCalif(this.value, 'pr', this.id);"  <% if RsP.Fields("pronunciacion")="2" then %> checked="checked" <%end if%> <%=disa2%> /></td>
             <td width="43"   align="center" valign="middle" class="Estilo9"><input type="radio" name="pr3" id="pr3" value="3" title="RESPONDE ADECUADAMENTE A CADA PREGUNTA SIN PRESENTAR DIFICULTAD DE PRONUNCIACION"   onclick="GuardarCalif(this.value, 'pr', this.id);"  <% if RsP.Fields("pronunciacion")="3" then %> checked="checked" <%end if%> <%=disa2%>/></td>
             <td width="77"  align="center" valign="middle" class="Estilo9" ><input type="radio" name="pr4" id="pr4" value="4" title="BRINDA RESPUESTAS ADECUADAS Y SE EXPRESA CORRECTAMENTE.* ADEMÁS TIENE DOMINIO DE OTRA LENGUA NATIVA."   onclick="GuardarCalif(this.value,'pr', this.id);"  <% if RsP.Fields("pronunciacion")="4" then %> checked="checked" <%end if%> <%=disa2%>/></td>
           </tr>
           <tr bgcolor="#D8F7FC" class='e_td_string1'>
             <td width="31" class="Estilo9">IV</td>
             <td colspan="2" class="Estilo9">COGNITIVO</td>
             <td width="119" class="Estilo9">DOMINIO TEM&Aacute;TICO               
             <input type="hidden" name="inf" id="inf" value="0"></td>
             <td width="316" class="Estilo9">EVAL&Uacute;A LOS CONOCIMIENTOS NECESARIOS Y LA EXPERIENCIA PREVIA PARA DESEMPE&Ntilde;ARSE EN EL CARGO; AS&Iacute; COMO LA  CONTINUIDAD EN SU CARRERA.</td>
              <td width="486" class="Estilo9"><div align="justify">CENTRARSE EN LAS COMPETENCIAS (CONOCIMIENTOS Y HABILIDADES) QUE DEBE POSEER EL CANDIDATO PARA DESEMPE&Ntilde;ARSE EN EL PUESTO SOLICITADO. QU&Eacute; EXPERIENCIA TIENE Y LA CONTINUIDAD DE SU DESEMPE&Ntilde;O DE ACUERDO A LO QUE HA ESTUDIADO.</div></td>
             <td width="38"  align="center" valign="middle" class="Estilo9" ><input type="radio" name="in1" id="in1" value="1"   onClick="GuardarCalif(this.value, 'in', this.id);" title="NO MUESTRA INTERÉS Y NO CONOCE LAS FUNCIONES A DESEMPE&Ntilde;AR"   <% if RsP.Fields("informacion")="1" then %> checked="checked" <%end if%> <%=disa4%>/></td>
             <td width="57"  align="center" valign="middle" class="Estilo9"><input type="radio" name="in2" id="in2" value="2"   onClick="GuardarCalif(this.value, 'in', this.id);" title="BRINDA POCA INFORMACION, NO EXPLICA CLARAMENTE LAS FUNCIONES" <% if RsP.Fields("informacion")="2" then %> checked="checked" <%end if%> <%=disa4%>/></td>
             <td width="43"  align="center" valign="middle" class="Estilo9"><input type="radio" name="in3" id="in3" value="3"   onClick="GuardarCalif(this.value, 'in', this.id);" title="EXPLICA ADECUADAMENTE LAS FUNCIONES Y POSIBLES APORTES" <% if RsP.Fields("informacion")="3" then %> checked="checked" <%end if%> <%=disa4%>/></td>
             <td width="77"  align="center" valign="middle" class="Estilo9"><input type="radio" name="in4" id="in4" value="4"   onClick="GuardarCalif(this.value, 'in', this.id);" title="EXPLICA DETALLADAMENTE LAS FUNCIONES Y BUENOS APORTES" <% if RsP.Fields("informacion")="4" then %> checked="checked" <%end if%> <%=disa4%> /></td>
           </tr>
           <tr bgcolor="#FFE6E6" class='e_td_string1'>
             <td width="31" class="Estilo9">V</td>
             <td colspan="2" rowspan="2" class="Estilo9">ACTITUD HACIA EL TRABAJO</td>
             <td width="119" class="Estilo9">VOCACI&Oacute;N DE SERVICIO
             
             <input type="hidden" name="vof" id="vof" value="0"></td>
             <td width="316" class="Estilo9">EVAL&Uacute;A EL INTER&Eacute;S DEL POSTULANTE PARA ENRIQUECER EL TRABAJO EN BIEN DE LA INSTITUCI&Oacute;N. </td>
             <td width="486" class="Estilo9"><div align="justify">COMENTA C&Oacute;MO SE DESEMPE&Ntilde;AR&Iacute;A EN EL CASO DE SER ELEGIDO, EXPLICANDO DETALLADAMENTE QU&Eacute; FUNCIONES CONOCE Y POSIBLES APORTES QUE HAR&Iacute;A PARA LA MEJORA DEL TRABAJO Y DE LA INSTITUCI&Oacute;N.</div></td>
             <td width="38" align="center" valign="middle" class="Estilo9" ><input type="radio" name="vo1" id="vo1" value="1"   onClick="GuardarCalif(this.value,'vo', this.id);" title="Desconoce el tema"  <% if RsP.Fields("vocacionServicio")="1" then %> checked="checked" <%end if%> <%=disa3%>/></td>
             <td width="57"  align="center" valign="middle" class="Estilo9"><input type="radio" name="vo2" id="vo2" value="2"   onClick="GuardarCalif(this.value,'vo', this.id);" title="Tiene una idea pero no completa del tema"   <% if RsP.Fields("vocacionServicio")="2" then %> checked="checked" <%end if%> <%=disa3%>/></td>
             <td width="43" align="center" valign="middle" class="Estilo9" ><input type="radio" name="vo3" id="vo3" value="3"   onClick="GuardarCalif(this.value,'vo', this.id);" title="Tiene dominio del tema"   <% if RsP.Fields("vocacionServicio")="3" then %> checked="checked" <%end if%> <%=disa3%>/></td>
             <td width="77"  align="center" valign="middle" class="Estilo9"  ><input type="radio" name="vo4" id="vo4" value="4"   onClick="GuardarCalif(this.value,'vo', this.id);" title="Conoce y domina el tema"   <% if RsP.Fields("vocacionServicio")="4" then %> checked="checked" <%end if%> <%=disa3%>/></td>
           </tr>
           
           <tr bgcolor="#FFE6E6"  class='e_td_string1'>
             <td width="31" class="Estilo9">VI</td>
             <td width="119" class="Estilo9">MOTIVACI&Oacute;N               <input type="hidden" name="mof" id="mof" value="0"></td>
             <td width="316" class="Estilo9">EVAL&Uacute;A LA PREDISPOSICI&Oacute;N HACIA LA INSTITUCI&Oacute;N, AS&Iacute; COMO PARA EL TRABAJO Y TRANSMITIR SUS CONOCIMIENTOS.</td>
             <td width="486" class="Estilo9"><div align="justify">SE INTERESA EN LA INSTITUCI&Oacute;N, EXPLICA QUE HA BUSCADO INFORMACI&Oacute;N VIA CONOCIDOS Y/O P&Aacute;GINA WEB; DE IGUAL MANERA, SE EVAL&Uacute;A SU CAPACIDAD  DE ENSE&Ntilde;AR A LOS DEM&Aacute;S, DE SER NECESARIO. POR EJEMPLO, VA A UNA CAPACITACI&Oacute;N Y LUEGO DEBE COMPARTIR LA INFORMACI&Oacute;N CON SUS COMPA&Ntilde;EROS.</div></td>
             <td width="38"  align="center" valign="middle" class="Estilo9"><input type="radio" name="mo1" id="mo1" value="1"   onclick="GuardarCalif(this.value, 'mo', this.id);" title="NO CONOCE DE LA INSTITUCI&Oacute;N"   <% if RsP.Fields("motivacion")="1" then %> checked="checked" <%end if%> <%=disa5%>/></td>
             <td width="57"  align="center" valign="middle" class="Estilo9"><input type="radio" name="mo2" id="mo2" value="2"   onclick="GuardarCalif(this.value, 'mo', this.id);" title="TIENE CIERTO CONOCIMIENTO DE LA INSTITUCI&Oacute;N" <% if RsP.Fields("motivacion")="2" then %> checked="checked" <%end if%> <%=disa5%>/></td>
             <td width="43"  align="center" valign="middle" class="Estilo9" ><input type="radio" name="mo3" id="mo3" value="3"   onclick="GuardarCalif(this.value, 'mo', this.id);" title="SE HA INFORMADO SOBRE LA INSTITUCI&Oacute;N, DISPOSICION PARA TRANSMITIR SUS CONOCIMIENTOS" <% if RsP.Fields("motivacion")="3" then %> checked="checked" <%end if%> <%=disa5%>/></td>
             <td width="77"  align="center" valign="middle" class="Estilo9" ><input type="radio" name="mo4" id="mo4" value="4"   onclick="GuardarCalif(this.value, 'mo', this.id);" title="CONOCE Y MUESTRA INTERES EN TRABAJAR EN LA INSTITUCI&Oacute;N Y  DE TRANSMITIR SUS CONOCIMIENTOS EN BIEN DE LA MISMA" <% if RsP.Fields("motivacion")="4" then %> checked="checked" <%end if%> <%=disa5%> /></td>
           </tr>
           <tr bgcolor="#E4DBF7">
             <td colspan="10" align="left" class="Estilo9">OBSERVACIONES ADICIONALES: SI  OBSERVA ALG&Uacute;N  ASPECTO NO CONTENIDO EN &Eacute;STE FORMATO Y QUE CONSIDERE QUE ES NECESARIO TOMAR EN CUENTA.</td>
           </tr>
           <tr  bgcolor="#E4DBF7" >
             <td height="62" colspan="10" align="center" class="Estilo9"><span class="e_td_string1">
               <input <%=varvisualiza%>  name="txtobs" type="text" id="txtobs" size="200px" maxlength="1000" value="<%=RsP.Fields("obsEntrevista")%>" />
             </span></td>
           </tr>
           
           <tr>
             <td height="86" colspan="10" align="center" class="Estilo9"><input name='button1' type='button' class="subtitulo1" id='button1' onClick="javascript:GuradarEntrevista()" value='Finalizar' <%=disa%> /></td>
           </tr>
         </table>
         </td>
    </tr>
</table>
<%else%>
<div>No existen datos registrados con este n&uacute;mero de DNI</div>
<%end if%>
</body>
</html>

