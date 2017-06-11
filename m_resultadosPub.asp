<%@ Language=VBScript %>
<%
Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0 
muestra_acepta = "none"

id=request("id")
etapa_p=request("etapa")
idProyecto=Session("id_proyecto")

%>
<!-- #include file="Conexion.asp"  -->
<html>
<head>
 <title>..:: SISTEMA DE CONSECUCI&Oacute;N DE RECURSOS HUMANOS ::..</title>

   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
   <script type="text/javascript" src="js/cliente.js"></script>
   
   <link rel="stylesheet" type="text/css" href="Styles/calendar-blue.css">
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calendar-setup.js"></script>
	<script type="text/javascript" src="js/calendar-es.js"></script>
	<script type="text/javascript" src="js/sorttable.js"></script>
    <script type="text/javascript" src="js/modal.js"></script>
    <script src="js/valida_fecha.js"></script>
   
   <script>
	
	
function verDetalle (id){
	if (id!=1) {
		document.getElementById("detalle_1").style.display="none"
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
		document.getElementById("detalle_"+reg).style.display="none"
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
   <style type="text/css">
<!--
.style6 {
	color: #000066;
	font-weight: bold;
}
-->
   </style>
</head>
<body oncontextmenu="return false" topmargin=0>
	<div id="divContenido">
<%
	consulta = "EXEC dbo.get_publicacion '"&id&"' "
	
	Set RsP1	= Server.CreateObject("ADODB.Recordset") 
	RsP1.cursorlocation=3
	RsP1.Open consulta, MiCone, 3,3
	
	if RsP1.RecordCount>0 then
	desc_meta=RsP1.Fields("desc_meta")
	mensaje_termino=RsP1.Fields("mensaje_termino")
	else
	desc_meta="No Existen registros "
	mensaje_termino=""
	end if 

	Rsp1.Close




SQL1 = "exec dbo.pa_convocatriacargo_resultados '"&id&"' "	

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
	If Not RSCuad.BOF And Not RSCuad.EOF Then 

		mensaje=RSCuad.fields("TextoPublicacion")
		Test_c=RSCuad.fields("test_conocimientos")
		momento_t=RSCuad.fields("momento_test")
		proceso=RSCuad.Fields("procesoactual")
		cargo=RSCuad.Fields("CARGO")
		TipoLogueo=RSCuad.Fields("TipoLogueo")
		etapa=RSCuad.Fields("etapa")
		Activar_Competencias=RSCuad.Fields("Activar_Competencias")
		Activar_Conocimientos=RSCuad.Fields("Activar_Conocimientos")
	end if
	RSCuad.Close



%>


<table align="center" width="100%">

 <% 
 IF mensaje="PLAZA DESIERTA" THEN %>
 <tr>
	<td>
    <p class="tituloPrin" style="color:#012D4E" ><%=desc_meta%>&nbsp;</p>
    <p class="tituloPrin">CARGO: <%=cargo%> </p>

    </td>
</tr>
  <tr height=30>
    <td colspan="3" align="center" class="alerta2" >
    <p class="tituloPrin"><%'response.write(cargo)
	RESPONSE.WRITE("<BR><BR>")
	response.Write(mensaje_termino)
	%></p>
    </TD></tr>
    <%ELSE%>
     <tr>
	<td>
    <p class="tituloPrin" style="color:#012D4E" ><%=desc_meta%>&nbsp;</p>
    <p class="tituloPrin">CARGO: <%=cargo%> <BR><BR><%if etapa_p=3 then
	response.Write("APTO(S) PARA ENTREVISTA")
	ELSEIF etapa_p="4" THEN 
	RESPONSE.Write("SELECCIONADO(S)")
	ELSEIF etapa_p="1" THEN
	RESPONSE.Write("APTO(S) PAAR TEST DE CONOCIMIENTOS Y/O COMPETENCIAS")
	END IF
	%></p>

    </td>
</tr>
<tr>
	<td align="center"><input name="reg" id="reg" type="hidden" value="1"><br>
    <table width='80%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    
    <% SQL2 = "exec dbo.pa_ubigeos_resultados '"&id&"', '"&idProyecto&"' "	

		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3 
    
    	If Not RSCuad2.BOF And Not RSCuad2.EOF Then 
		total=1
		Do While Not RSCuad2.EOF	
		 IF TOTAL=1 THEN
		 COLOR="bgcolor=""#6EA4D3"""
		 ELSE
		 COLOR="bgcolor=""#F2F9FF"""
		 END IF
		
	%>
        <tr>
            <td <%=COLOR%> id="TR<%=total%>">
			<img src="images/icozoom.PNG" id = 'btncontratos' name = 'btncontratos' style="CURSOR:HAND" alt="Contratos" onClick="verDetalle(<%=total%>)" ></img>&nbsp;&nbsp;<strong class="etiqueta2"><%=RSCuad2.Fields("detadepen")%></strong>
            </td>
        </tr>
        <tr>
            <td align="center">
            <% if total=1 then %>
            <div id="detalle_<%=total%>" style="overflow:auto;width:98%;position:relative; background-color:#FFFFFF;" >
            <%else%>
            <div  id="detalle_<%=total%>" style="overflow:auto;width:98%;position:relative;display:none;" >
            <%end if%>
          	<TABLE border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3"> 
       <%  SQL3 = "exec dbo.pa_verificar_publicacion '"&id&"', '"&RSCuad2.Fields("CCDD")&"', '"&RSCuad2.Fields("detadepen")&"', '"&idProyecto&"', '"&etapa_p&"' "	

		'response.write ( SQL3 ) 

		Set RSCuad3	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad3.cursorlocation=3
		RSCuad3.Open SQL3, MiCone, 3,3
		
		If Not RSCuad3.BOF And Not RSCuad3.EOF Then 
		
		fecha=RSCuad3.Fields("Fecha_entrevista")
		fecha_publica=RSCuad3.fields("fecha_publica")
		mensaje_f=RSCuad3.fields("TextoPublicacion")
		
		%>
            	<TR  bordercolor="#DAE8F3"  bgcolor="#DAE8F3">
                	<TD class="etiqueta"><strong>Nro.</strong></TD>
                    <TD class="etiqueta"><strong>Apellidos y Nombres</strong></TD>
                    <TD class="etiqueta"><strong>DNI</strong></TD>
                    <TD class="etiqueta"><strong>Fecha</strong></TD>
                    <TD class="etiqueta"><strong>Hora</strong></TD>
                </TR>
                <TR  bordercolor="#DAE8F3"  bgcolor="#DAE8F3">
                	<TD class="etiqueta" colspan="3"> </TD>
                    <TD class="etiqueta">
                    <input type='text' class='e_input' id='txtfecha'  onKeyUp="this.value=formateafecha(this.value);" name='txtfecha' value='' maxlength='10' onKeyPress=" return validaIngDesConv(event, this.value,txtfechIniConv,txtfechFinConv);">
				<input type='button' id='cbFechIniConv' value='..'>
                
          <script type="text/javascript"> 
	      Calendar.setup({ 
          inputField : "txtfecha",     // id del campo de texto 
          ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
          button     : "cbFechIniConv"     // el id del botón que lanzará el calendario 
	     });
         </script>
                  <br>  
                    
                    <input name="Reg_Fecha" type="button" value="Replica fechas"></TD>
                    <TD class="etiqueta"><input name="Reg_Hora" type="button"  value="Replica Horas"></TD>
                </TR>
                <%	 registro=1
				Do While Not RSCuad3.EOF	
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If
				%>
                <TR class='<%=clase%>' >
                	<TD class="etiqueta"><%=registro%> </TD>
                    <TD class="etiqueta"><%=RSCuad3.Fields("NOMBRES")%></TD>
                    <TD class="etiqueta"><%=RSCuad3.Fields("dni")%></TD>
                    <TD class="etiqueta"><input type='text' class='e_input' id='txtfecha_<%=RSCuad3.Fields("id_per")%>'  onKeyUp="this.value=formateafecha(this.value);" name='txtfecha_<%=RSCuad3.Fields("id_per")%>' value='<%=RSCuad3.Fields("Fecha_entrevista")%>' maxlength='10' onKeyPress=" return validaIngDesConv(event, this.value,txtfechIniConv,txtfechFinConv);">
                    </TD>
                    <TD class="etiqueta"><input type='text' class='e_input' id='txtHora' name='txtHora' value='<%=RSCuad3.Fields("Hora_entrevista")%>' maxlength='8'></TD>
                </TR>
              <%
			  registro = registro + 1
			  RSCuad3.MoveNext
			  Loop	
			  RSCuad3.close
			  set RSCuad3=nothing%>
			   </TABLE><BR>
		  	<TABLE width="90%" border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
             	<tr>
        			<td  class="etiqueta" align="right"><p>FECHA PUBLICACI&Oacute;N:<%=fecha_publica%>&nbsp;</p></td>
      			</tr>
                <tr>
          			<td align="left" class="etiqueta2"><strong><%=mensaje_f%></strong></td>
         		</tr>
      			<tr>
        			<td  class="titulo" align="right">
					<% IF (etapa=3 ) THEN %>  
        			<A href="pdf/USO_TEST.pdf">Ver Cartilla de Uso</A>
       				<%END IF%>&nbsp;&nbsp;&nbsp;&nbsp;
        			<p><% IF Activar_Competencias=1 or Activar_Conocimientos=1  THEN %>
					<A href="logueo_ev.asp">Ingrese al Test</A>
 					<%end if%></p>
 					</td>
      			</tr>
                <tr>
        			<td  class="etiqueta" align="right"><p><A href="Locales_operativos.asp">Ver Direcci&oacute;n de Locales Operativos</A></p></td>
      			</tr>
            </TABLE>
			 <% else%>  
             <TABLE border="1" cellpadding="2" cellspacing="2" bordercolor="#004993">
             	<TR>
                	<TD class="etiqueta"><STRONG>PLAZA DESIERTA</STRONG> </TD>
                </TR>
                </TABLE>
              <%
			  end if%>  

          </div>
            </td>
        </tr>
        <%
		total=total+1
			RSCuad2.MoveNext
			Loop	
			RSCuad2.close
			set RSCuad2=nothing 
		
		else%>
        <tr>
            <td>
				No Existen datos disponibles
            </td>
        </tr>
        <%end if %>
    </table>
    </td>
</tr>
<%END IF%>
</table>


</body>
</html>