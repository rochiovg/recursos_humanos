
<!-- #include file="Conexion.asp"  --> 

<%

lsRol="7"
if  lsRol="2" then 
perfil="Monitoreo"
elseif lsRol="6" then 
perfil="OFICINA DE PERSONAL"
elseif lsRol="3" then 
perfil="Monitores"
elseif lsRol="4" then 
perfil="Consultas"
elseif lsRol="5" then 
perfil="ADMINISTRACI&Oacute;N CAS"
elseif lsRol="1" then 
perfil="Administrativos"
elseif lsRol="7" then 
perfil="OTIN"
elseif lsRol="9" then 
perfil="OPERACION DE CAMPO"
elseif lsRol="98" then 
perfil="DIGITACION"
elseif lsRol="97" then 
perfil="MODIFICACION"
elseif lsRol="11" then 
perfil="REGISTRO"
elseif lsRol="12" then 
perfil="ADMINISTRACION LIMA"
elseif lsRol="18" then 
perfil="ASISTENTE ADMINISTRACION"
elseif lsRol="13" then 
perfil="CONSULTAS ADMINISTRATIVAS"
elseif lsRol="14" then 
perfil="ADMINISTRACI&Oacute;N GENERAL"
elseif lsRol="15" then 
perfil="JEFE MONITOREO ECE"
elseif lsRol="16" then 
perfil="EVALUADOR INEI"
elseif lsRol="17" then 
perfil="DIRECTOR ODEI"
elseif lsRol="19" then 
perfil="GERENCIA  PROYECTOS"
elseif lsRol="20" then 
perfil="JEFE OTA"
elseif lsRol="21" then 
perfil="Administrador"
elseif lsRol="22" then 
perfil="Entrevistador"
elseif lsRol="23" then 
perfil="Coordinador Provincial"
elseif lsRol="24" then 
perfil="Coordinador Sede"
elseif lsRol="25" then 
perfil="Actualizaci&oacute;n"
elseif lsRol="27" then 
perfil="JEFE DE OPERACION DE CAMPO"
elseif lsRol="28" then 
perfil="Personal ODEIs"
elseif lsRol="40" then 
perfil="Personal RA"
elseif lsRol="29" then 
perfil="Administrativo de RRHH"
elseif lsRol="61" then 
perfil="Eval. Psicol&oacute;gica"
end if 


usuario = Session("cuenta_competencias")
id_proyecto=Session("id_proyecto")




	
	
Function GenerarMenu()

consulta1 = "EXEC dbo.pa_menu_rol '" & lsRol& "', 0 " 
	
Set RsP = Server.CreateObject("ADODB.Recordset")
RsP.cursorlocation=3
RsP.Open consulta1, MiCone, 3,3
		
		
response.write ( "<ul id='nav'>")
Do While Not RsP.EOF
	response.Flush()
	
	response.write ( "<li class='top'><a href='#' id='contacts' class='top_link'><span class='down'>"&RsP.Fields("desc_menu")&"</span></a>")
	response.write ("<ul class='sub'>")
	
	GenerarNivel1(RsP.Fields("id1"))
	
	response.write ("	</ul>")
	response.write ("</li>")
	
	
	RsP.MoveNext
Loop	
RsP.close
response.write ( "</ul>")


End Function


   



	
Function GenerarNivel1(id1)
	
consulta1 = "EXEC dbo.pa_menu_rol '" & lsRol& "', 1, " &id1
	
Set RsP = Server.CreateObject("ADODB.Recordset")
RsP.cursorlocation=3
RsP.Open consulta1, MiCone, 3,3
		
		
Do While Not RsP.EOF
	response.Flush()

	response.write ("<li><a href='"&RsP.Fields("url")&"' title='"&RsP.Fields("desc_menu")&"'>"&RsP.Fields("desc_menu")&"</a></li>")
	
	RsP.MoveNext
Loop	
RsP.close


End Function

		
 %>
<link rel="stylesheet" type="text/css" href="Styles/inei.css">
<link rel="stylesheet" href="Styles/dhtml-horiz.css" type="text/css" media="all" />
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
     <script src="js/stuHover.js" type="text/javascript"></script>
	 <script src="js/dhtml.js" type="text/javascript"></script>
	 <script>	
function AbrirMenu(pag){	
   switch (pag)
   { case 1:window.location ="pd_welcome.asp";   break;
     case 2:window.location ="pd_eliminacion.asp"; break;
     case 3:window.location ="pd_ficha_reporte.asp";    break;
	 case 4:window.location ="pd_inicio_preseleccion.asp";    break;
     case 5:window.location ="pd_inicio_seleccion.asp";    break;
	 case 6:window.location ="pd_consultas.asp";    break;
	 case 7:window.location ="pd_inicio_modificacion.asp";    break;
	 case 8:window.location ="pd_inicio_busqueda.asp";    break;
	 case 9:window.location ="pd_bloquear.asp";    break;
	 case 10:window.location ="default.asp";    break;
   }  	
		
}

 function AbrirAyuda(){	
	window.open("pdf/actualizacionafp.pdf",'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}
</script>

	<table width="100%" align="center" border="0" bgcolor="" >
	<tr>
		<td>		
        
        
        
        
         <%If lsRol = "25"  Then ' Actualizaci&oacute;n%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
		  		<tr>
 
     			<TD>
     				<ul id="nav">


					<li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Registro</span></a>
					<ul class="sub">
                			<li><a href="pd_Actualiza.asp" title="Actualziaci&oacute;n de afiliaci&oacute;n a Sistema de Pensiones">Actualizaci&oacute;n</a></li>
                			<li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>
        			</ul> 
					</li>            
                    
					</ul>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/ayuda.jpg" width="24" border="0" title="Ayuda" onClick="AbrirAyuda()" height="24" /></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td>
     <td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		
	







<!------------------------------------------------------------------------------------------------------------------------------------------------------------>	 
        
        <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->						
 <%If lsRol = "41"  Then 'jefe de Proyecto%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     
   <li class="top"><a href="#" id="shop" class="top_link" title="Pagos"><span class="down">PAGOS</span></a>
		 
		 <ul class="sub">
               <li><a href="pd_GastosOP_func_form.asp" title="Gastos Operativos">Formatos de Pago</a></li>
  
		</ul>		 
   	
	</li>  
    
 
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>     
<% ' -----------------------------------------------------------------------------------------------------------------------  %>
        
        <%If lsRol = "22"  Then ' Administrador%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
                <li><a href="pd_entrevista.asp" title="Entrevista personal de personal seleccionado">Entrevista</a></li>
				<li><a href="pd_entrevistaTexto.asp" title="Entrevista personal de personal seleccionado - Texto">Entrevista - Texto</a></li>
        </ul> 
	</li>
    
    <li class="top"><a href="#" id="shop2" class="top_link" title="Consultas"><span class="down">Consultas</span></a>
           <ul class="sub">
             <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
             <li><a href="pd_EntrevistasFecha.asp" title="Datos de la Ficha de la RO">Ent. por fecha</a></li>
           </ul>
         </li>
   
            
		</ul>
	</li> 	
 
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		
	

<!------------------------------------------------------------------------------------------------------------------------------------------------------------>	 
        
        
        <%If lsRol = "21"  Then ' Administrador%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
        <li ><a href="pd_proyecto.asp" title="Registro de un nuevo Proyecto" >Registro Proyecto</span></a></li>    
         <li ><a href="pd_cpresupuesto.asp" title="Ingreso Presupuesto" >Cargos Presup.</span></a></li>          

         <li ><a href="pd_cargo_meta.asp" title="Registro de Solicitud CCP" >Solicitud CCP</span></a></li> 
         <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>
         <li ><a href="pd_locales_capa.asp" title="Registro de los Locales de capacitaci&oacute;n" >Local Capacitacion</span></a></li>
    </ul>
    
    </li>
	
	
    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
                  
               <li><a href="pd_calificacion_automarica.asp" title="Datos de la califiaci&oacute;n autom&aacute;tica">Calificaci&oacute;n autom&aacute;tica </a></li>
		        <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar CV RO </a></li>
                <li><a href="pd_entrevista.asp" title="Entrevista personal de personal seleccionado">Entrevista</a></li>
				<li><a href="pd_entrevistaTexto.asp" title="Entrevista personal de personal seleccionado - Texto">Entrevista - Texto</a></li>
                 <li><a href="pd_entrevistaResultado.asp" title="Resultados FInales">Resultado Final</a></li>
        </ul> 
	</li>
   
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li ><a href="pd_ConsasisCapacitacion.asp" title="Asistencias a Capacitaci&oacute;n">Asist. Capacitaci&oacute;n</a></li>
            <li ><a href="pd_ConAsignacion.asp" title="Asignaci&oacute;n de Rutas">Asignaci&oacute;n de Rutas</a></li>
           
<li ><a href="pd_calificacion_reporte.asp" title="Asignaci&oacute;n de Rutas">Reporte calificaci&oacute;n</a></li>
  

          
		</ul>
	</li> 	
 
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		


<!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->						
 <%If lsRol = "27"  Then 'jefe de Proyecto%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     
     
     
     
     
     <li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
     <li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
     <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
        </ul>
    </li>
     

     	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>
       </ul>
    </li>
     
        
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
          <li><a href="pd_segmentacion.asp" title="registrar datos de la Segmentaci&oacute;n">Segmentaci&oacute;n </a></li>
         <li><a href="pd_asignacion1.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
         <li><a href="pd_cambioAsignacion.asp" title="Cambio de Rutas">Rotacion de Rutas</a></li>
         <li style="text-decoration:underline"><a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
            <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>

        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>
    
   <li class="top"><a href="#" id="shop" class="top_link" title="Pagos"><span class="down">PAGOS</span></a>
		 
		 <ul class="sub">
		       <!--<li><a href="pd_GastosOP.asp" title="Gastos Operativos">Gastos Operativos</a></li>-->
               <li><a href="pd_GastosOP_nvo.asp" title="Gastos Operativos">Gastos Operativos Nuevo</a></li>
  
		</ul>		 
   	
	</li>  
    
 
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>     
                	
                    
                    <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->						
 <%If lsRol = "42"  Then 'jefe de Proyecto%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     
     
     
     
     
     <li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
     <li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
     <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
        </ul>
    </li>
     

     	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>
       </ul>
    </li>
     
        
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
          <li><a href="pd_segmentacion.asp" title="registrar datos de la Segmentaci&oacute;n">Segmentaci&oacute;n </a></li>
         <li><a href="pd_asignacion1.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
         <li><a href="pd_cambioAsignacion.asp" title="Cambio de Rutas">Rotacion de Rutas</a></li>
         <li style="text-decoration:underline"><a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
            <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>

        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>
    
   <li class="top"><a href="#" id="shop" class="top_link" title="Pagos"><span class="down">PAGOS</span></a>
		 
		 <ul class="sub">
		       <!--<li><a href="pd_GastosOP.asp" title="Gastos Operativos">Gastos Operativos</a></li>-->
               <li><a href="pd_GastosOP_nvo.asp" title="Gastos Operativos">Gastos Operativos Nuevo</a></li>
               <li><a href="pd_GastosOP_func_form.asp" title="Gastos Operativos">Formatos de Pago</a></li>
  
		</ul>		 
   	
	</li>  
    
 
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>     
                	


<!------------------------------------------------------------------------------------------------------------------------------------------------------------>	
               
       
   <%If lsRol = "16"  Then ' pSICOLOGAS %>				
<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
     <TD>&nbsp;</TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>
<!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->						
 <%If lsRol = "15"  Then 'jefe monitores ECE%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     
     
 <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
		<ul class="sub">
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
        </ul> 
	</li>
    

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
        
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>      
                
<!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->						


<%If lsRol = "11"  Then ' REGISTRO%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
    <ul class="sub">
    </ul>
    
    <li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
    	<li ><a href="pd_capacitacion" title="Registro Capaciataci&oacute;n" >Capacitacion</span></a></li>
        
         <li ><a href="pd_locales_capa.asp" title="Registro de los Locales de capacitaci&oacute;n" >Local Capacitacion</span></a></li>
    </ul>
    
    </li>
    
    
    
     
         <li class="top"><a href="#" id="contacts2" class="top_link"><span class="down">Procesos</span></a>
           <ul class="sub">
          <!-- <li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. Campo</a></li>-->
               <li><a href="pd_capacitacionCampo.asp" title="Capacitaci&oacute;n campo">Cap. Campo</a></li>
               
               
               
               <li><a href="pd_capacitacionCampo_apli.asp" title="Calificar CV a Aplicadores y orientadores">Cap. Aplicadores</a></li> 
               <li><a href="pd_capacitacionCampo_opInf.asp" title="Calificar CV a Aplicadores y orientadores">Cap. Operador.I</a></li> 
           </ul>
         </li>
     </ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->						


<%If lsRol = "36"  Then ' REGISTRO PRESELECCION%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
    <ul class="sub">
    </ul>
    </li>
    
         <li class="top"><a href="#" id="contacts2" class="top_link"><span class="down">Procesos</span></a>
           <ul class="sub">
           <!--<li><a href="pd_PreseleccionCampo.asp" title="Registro de Preselecci&oacute;n">Preselecci&oacute;n</a></li>-->
           </ul>
         </li>
     </ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	



<%If lsRol = "57"  Then ' REGISTRO PRESELECCION%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
    <ul class="sub">
    </ul>
    </li>
    
         <li class="top"><a href="#" id="contacts2" class="top_link"><span class="down">Procesos</span></a>
           <ul class="sub">
            <li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>
           </ul>
         </li>
     </ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
<%If lsRol = "58"  Then ' REGISTRO CAPACITACION%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
    <ul class="sub">
    </ul>
    </li>
    
         <li class="top"><a href="#" id="contacts2" class="top_link"><span class="down">Procesos</span></a>
           <ul class="sub">
            <li><a href="pd_CapacitacionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>
           </ul>
         </li>
     </ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                                
                

  
		

<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
						
				<%If lsRol = "7"  Then ' OTIN%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
    <%GenerarMenu()%>
    

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                
                
      <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
						
				<%If lsRol = "23"  Then ' Cooridnado provincial%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
          <li ><a href="pd_locales_capa.asp" title="Registro de los Locales de capacitaci&oacute;n" >Local Capacitacion</span></a></li>
          </ul>
    </li>

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <li><a href="pd_entrevista.asp" title="Entrevista personal de personal seleccionado">Entrevista</a></li>
			<li><a href="pd_entrevistaTexto.asp" title="Entrevista personal de personal seleccionado - Texto">Entrevista - Texto</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_asistenciacapacitacion.asp" title="Registrar asistencia de personal">Asistencia Cap.</a></li> 
            <li><a href="pd_capacitacionCampo.asp" title="Capacitaci&oacute;n campo">Cap. Campo</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_asignacion1.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
         <li><a href="pd_cambioAsignacion.asp" title="Cambio de Rutas">Rotacion de Rutas</a></li>
         <li style="text-decoration:underline"><a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_posibleBaja.asp" title="Altas y Bajas">Altas y Bajas </a></li>
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li><a href="pd_EntrevistasFecha.asp" title="Entrevistas por fecha">Ent. por fecha</a></li>
           <li style="text-decoration:underline"><a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
               <li ><a href="pd_ConAsignacion.asp" title="Asignaci&oacute;n de Rutas">Asignaci&oacute;n de Rutas</a></li>
		</ul>
	</li>
    

    <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
		 <ul class="sub">
            <li><a href="pd_conformidad.asp" title="Consulta de Conformidad de Pagos del Personal">Consulta de Conf.</a></li>
		</ul>		 
   	
	</li>

</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		          
                
                
                	

<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						                
		<%If lsRol = "2"  Then ' JEFE DE MONITOREO%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
				<li ><a href="ing_meta.asp" title="Registro de Meta del RRHH" >Meta del RRHH</span></a></li>
                <li ><a href="pd_ing_rpm.asp" title="Registro del RPM de la RA" >RPM RA</span></a></li> 
                          
              
    </ul>
    
    </li>

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
          <li><a href="pd_asignacion1.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
        	<li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
            <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
			<li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>

        </ul> 
	</li>

    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
			<li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
             <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
             <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
             <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
		</ul>
	</li>
            
    
    
    <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
		 
		 <ul class="sub">

             <!--<li><a href="pd_GastosOP.asp" title="Gastos Operativos">Gastos Operativos</a></li>-->
                            <li><a href="pd_GastosOP_nvo.asp" title="Gastos Operativos">Gastos Operativos Nuevo</a></li>
		</ul>		 
   	
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		
                
                
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						                
                
				<%If lsRol = "3"  Then 'MONITOR%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
                <li ><a href="ing_meta.asp" title="Registro de Meta del RRHH" >Meta del RRHH</span></a></li>
	            <li ><a href="pd_ing_rpm.asp" title="Registro del RPM de la RA" >RPM RA</span></a></li> 
                <li ><a href="pd_locales_Pres.asp" title="Ingreso de Locales de Preselecci&oacute;n" >Local Preselecci&oacute;n</span></a></li>                
                <li ><a href="pd_locales_cv.asp" title="Ingreso de Locales de Envio de CV" >Local env&iacute;o CV</span></a></li>
         <li ><a href="pd_locales_capa.asp" title="Registro de los Locales de capacitaci&oacute;n" >Local Capacitacion</span></a></li>
         <li ><a href="pd_locales_operativos.asp" title="Registro de los Locales Operativos" >Locales Operativos</span></a></li> 
    </ul>
    
    </li>

  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
          <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>

          
        </ul> 
	</li>
  <li class="top"><a href="#" id="services" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
         <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
                   <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_ConAsignacion.asp" title="Asignaci&oacute;n de Rutas">Asignaci&oacute;n de Rutas</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
<li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li ><a href="pd_consulta_locales.asp" title="Datos de locales Operativos">Locales Operativos</a></li>
            <li ><a href="pd_consulta_localesCapacita.asp" title="Datos de locales de capacitaci&oacute;n">Locales Capacitaci&oacute;n</a></li>
         </ul>
	</li>
  
  
      <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
		 <ul class="sub">
			<li><a href="pd_conformidad_monitor.asp" title="Consulta de Conformidad de Pagos del Personal">Consulta de Conf.</a></li>
		</ul>		 
	</li>
  
        <li class="top"><a href="#" id="shop" class="top_link" title="ESTASDISTICAS DE GESTI&Oacute;N"><span class="down">Estad&iacute;sticas</span></a>
		 <ul class="sub">
            <li><a href="pd_aplica_estadistico.asp" title="Datos del Estadisticos por distribuci&oacute;n Pol&iacute;tico Administrativo">Pol&iacute;tico Admin.</a></li>
		</ul>
	</li>
  
  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Sucesos</span></a>
    <ul class="sub">
			 <li><a href="pd_isucesos.asp" title="Ingreso de Sucesos">Ingreso</a></li>
           <li><a href="pd_msucesos.asp" title="Consulta de Sucesos">B&uacute;squeda</a></li>
		</ul>
	</li>
    
    
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
<%End If%>
                
                				
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						                
<%If lsRol = "4"  Then ' CONSULTAS%>				
<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
     <TD>
     <ul id="nav">  
     
      <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
                  
          <li><a href="pd_NotaCV_RAO.asp" title="Calificar el CV del Postulante de las Redes RAO ">Evaluar CV RAO </a></li>
         <li><a href="pd_asiscapacitacion_RAO.asp" title="Seleccionar a los Asistentes a la capacitacion ">Capacitaci&oacute;n RAO </a></li>
         <li><a href="pd_seleccion_ra.asp" title="Seleccionar al personal a contratar">Selecci&oacute;n RAO</a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_NotaCV_RTA.asp" title="Calificar el CV del Postulante de las Redes RAO y RTA ">Evaluar CV RTA </a></li>
         <li><a href="pd_seleccion_rta.asp" title="Seleccionar al Postulante a Laborar en la RTA">SeleccI&oacute;n RTA</a></li>
           <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		 <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Preseleccion de postulantes">Preseleccionar RO </a></li>
         <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar CV RO </a></li>
         <li><a href="pd_asiscapacitacion.asp" title="Seleccionar a los Asistentes a la capacitacion ">Capacitaci&oacute;n </a></li>
         <li><a href="pd_seleccion.asp" title="Seleccionar al personal a contratar">Seleccionar RO</a></li>
         <li><a href="pd_calificacion.asp" title="Evaluaci&oacute;n de Personal">Calificaci&oacute;n</a></li>
       
        </ul> 
	</li>
     
     
     
     
     
       
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
			<li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li ><a href="pd_calificacion_reporte.asp" title="Asignaci&oacute;n de Rutas">Reporte calificaci&oacute;n</a></li>
                        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_info_contratos.asp" title="Contratos Activos">Contratos Activos por Ubigeo</a></li>  
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li ><a href="pd_consulta_locales.asp" title="Datos de locales Operativos">Locales Operativos</a></li>
             <li ><a href="pd_consulta_localesCapacita.asp" title="Datos de locales de capacitaci&oacute;n">Locales Capacitaci&oacute;n</a></li>
		</ul>
	</li>
   
<li class="top"><a href="#" id="shop" class="top_link" title="ESTASDISTICAS DE GESTI&Oacute;N"><span class="down">Estad&iacute;sticas</span></a>
		 <ul class="sub">
            <li><a href="pd_aplica_estadistico.asp" title="Datos del Estadisticos por distribuci&oacute;n Pol&iacute;tico Administrativo">Pol&iacute;tico Admin.</a></li>
		</ul>
	</li>

    <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Sucesos</span></a>
    <ul class="sub">
           <li><a href="pd_msucesos.asp" title="Consulta de Sucesos">B&uacute;squeda</a></li>
		</ul>
	</li>
   
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>
                
                
                
                
                
                
                
                <!------------------------------------------------------------------------------------------------------------------------------------------------------------>						                
<%If lsRol = "13"  Then ' CONSULTAS_ADMINISTRATIVAS%>				
<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
     <TD>
     <ul id="nav">    
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
            <li><a href="pd_consultas_ro.asp" title="Datos de la Ficha de la RO">Consultas por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li ><a href="pd_calificacion_reporte.asp" title="Asignaci&oacute;n de Rutas">Reporte calificaci&oacute;n</a></li>                       
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li ><a href="pd_consulta_locales.asp" title="Datos de locales Operativos">Locales Operativos</a></li>
             <li ><a href="pd_consulta_localesCapacita.asp" title="Datos de locales de capacitaci&oacute;n">Locales Capacitaci&oacute;n</a></li>
		</ul>
	</li>
   
<li class="top"><a href="#" id="shop" class="top_link" title="ESTASDISTICAS DE GESTI&Oacute;N"><span class="down">Estad&iacute;sticas</span></a>
		 <ul class="sub">
            <li><a href="pd_aplica_estadistico.asp" title="Datos del Estadisticos por distribuci&oacute;n Pol&iacute;tico Administrativo">Pol&iacute;tico Admin.</a></li>
		</ul>
	</li>

    <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Sucesos</span></a>
    <ul class="sub">
           <li><a href="pd_msucesos.asp" title="Consulta de Sucesos">B&uacute;squeda</a></li>
		</ul>
	</li>
   
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>
                          
                
                
          <!------------------------------------------------------------------------------------------------------------------------------------------------------------>						                
<%If lsRol = "14"  Then ' monitores%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
        
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
		<ul class="sub">
        <li><a href="pd_calificacion_ficha.asp" title="Muestra los datos de la evaluaci&oacute;n de la ficha">Preselecci&oacute;n Autom&aacute;tica </a></li>
         <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar C.V. </a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_capacitacionCampo.asp" title="Capacitaci&oacute;n campo">Cap. Campo</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        	  <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
        </ul> 
	</li>
    
    <li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>
       </ul>
    </li>
    

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>   
                    
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						                
<%If lsRol = "28"  Then ' monitores%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
        
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
		<ul class="sub">
         <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar C.V. </a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_capacitacionCampo.asp" title="Capacitaci&oacute;n campo">Cap. Campo</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>                          


<!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->			

			
			<%If lsRol = "51"  Then ' RA%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
    
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
         <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar C.V. </a></li>
         
        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
             <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>

       </ul>
 </li>

   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                
          

<!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->			

			
			<%If lsRol = "6"  Then ' RA%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
    <li ><a href="pd_cpresupuesto.asp" title="Ingreso Presupuesto" >Cargos Presup.</span></a></li>     
    <li ><a href="pd_cargo_meta.asp" title="Registro de Solicitud CCP" >Solicitud CCP</span></a></li>     
               <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
         <li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
         <li ><a href="pd_conratar.asp" title="Registro de Contratos" >Ofc. Contrataci&oacute;n</span></a></li>
         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
           <li><a href="pd_procesoCAS.asp" title="registro de Proceso CAS">Proceso CAS</a></li>

    </ul>
    </li>
    
    
    <li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <!--<li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>  COMENTADO BPALOMINO 1510-->
            <li><a href="pd_eliminacion.asp" title="Pase a postulaci&oacute;n a convocatoria de Locaci&oacute;n">Pase a Postulaci&oacute;n</a></li>
       </ul>
    </li>
    
    
    
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
         <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar C.V. </a></li>
          <li><a href="pd_testPsicologico.asp" title="Evaluar Evaluaci&oacute;n de Competencias" >test de 24 </a></li>
           <li><a href="http://proyectos.inei.gob.pe/pruebapsicologica/MODdefault.asp?varuser=<%=usuario%>" title="Evaluar Evaluaci&oacute;n de Competencias " target="_blank" onClick="window.open(this.href, this.target, 'width=800,height=400'); return false;">Test de 185 </a></li>
    	<li><a href="pd_Conocimientos.asp" title="registrar evaluaci&oacute;n de conocimientos.">Prueba Conoc.</a></li>
        <li><a href="pd_entrevista.asp" title="Entrevista personal de personal seleccionado">Entrevista</a></li>
		<li><a href="pd_entrevistaTexto.asp" title="Entrevista personal de personal seleccionado - Texto">Entrevista - Texto</a></li>
        <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%else%>Total<%end if%>.asp" title="Seleccion de Titularidad">Selecci&oacute;n</a></li>       
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
          <li><a href="pd_testPsicologicoCAS.asp" title="Calificar el CV del Postulante de las Redes RAO ">Evaluacion Comp. CAS </a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
            <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>
        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_reporte_actCartograficaZona.asp" title="Muestra reportes Asociaco a la Actualizaci&oacute;n Cartogr&aacute;fica">Act. Cartogr&aacute;fica</a></li>
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li><a href="pd_EntrevistasFecha.asp" title="Entrevistas por fecha">Ent. por fecha</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
        <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
       <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li> 
       
        <li ><a href="pd_busquedao.asp" title="Datos del estado del RRHH">Consulta del Personal</a></li>
        
       </ul>
 </li>
   

 <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
		 
		 <ul class="sub">
		    
			<li><a href="pd_AperturarConformidad.asp" title="Apertura de Pre Conformidad">Apert. de Pre Conf.</a></li>
            <li><a href="pd_ActualizarPlanilla.asp" title="Aprobaci&oacute;n de Pre Conformidad">Aprobar Pre Confor.</a></li>
            <li><a href="pd_conformidad.asp" title="Consulta de Conformidad de Pagos del Personal">Consulta de Conf.</a></li>
		</ul>		 
   	
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                
         <!----------------------------EVALUACION PSICOLOGICA----------------------------------------------------------------------------------------------------------------------------------------->			
       
                
                <%If lsRol = "61"  Then%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
    <li ><a href="pd_cpresupuesto.asp" title="Ingreso Presupuesto" >Cargos Presup.</span></a></li>     
    <li ><a href="pd_cargo_meta.asp" title="Registro de Solicitud CCP" >Solicitud CCP</span></a></li>     
               <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
         <li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
         <li ><a href="pd_conratar.asp" title="Registro de Contratos" >Ofc. Contrataci&oacute;n</span></a></li>
         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
           <li><a href="pd_procesoCAS.asp" title="registro de Proceso CAS">Proceso CAS</a></li>

    </ul>
    </li>
    
    
    <li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <!--<li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>  COMENTADO BPALOMINO 1510-->
            <li><a href="pd_eliminacion.asp" title="Pase a postulaci&oacute;n a convocatoria de Locaci&oacute;n">Pase a Postulaci&oacute;n</a></li>
       </ul>
    </li>
    
    
    
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
         <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar C.V. </a></li>
          <li><a href="pd_testPsicologico.asp" title="Evaluar Evaluaci&oacute;n de Competencias" >test de 24 </a></li>
           <li><a href="http://proyectos.inei.gob.pe/pruebapsicologica/MODdefault.asp?varuser=<%=usuario%>" title="Evaluar Evaluaci&oacute;n de Competencias " target="_blank" onClick="window.open(this.href, this.target, 'width=800,height=400'); return false;">Test de 185 </a></li>
    	<li><a href="pd_Conocimientos.asp" title="registrar evaluaci&oacute;n de conocimientos.">Prueba Conoc.</a></li>
        <li><a href="pd_entrevista.asp" title="Entrevista personal de personal seleccionado">Entrevista</a></li>
		<li><a href="pd_entrevistaTexto.asp" title="Entrevista personal de personal seleccionado - Texto">Entrevista - Texto</a></li>
        <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%else%>Total<%end if%>.asp" title="Seleccion de Titularidad">Selecci&oacute;n</a></li>       
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
          <li><a href="pd_testPsicologicoCAS.asp" title="Calificar el CV del Postulante de las Redes RAO ">Evaluacion Comp. CAS </a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
            <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>
        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li><a href="pd_EntrevistasFecha.asp" title="Entrevistas por fecha">Ent. por fecha</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
        <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
       <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li> 
       </ul>
 </li>
   

 <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
		 
		 <ul class="sub">
		    
			<li><a href="pd_AperturarConformidad.asp" title="Apertura de Pre Conformidad">Apert. de Pre Conf.</a></li>
            <li><a href="pd_ActualizarPlanilla.asp" title="Aprobaci&oacute;n de Pre Conformidad">Aprobar Pre Confor.</a></li>
            <li><a href="pd_conformidad.asp" title="Consulta de Conformidad de Pagos del Personal">Consulta de Conf.</a></li>
		</ul>		 
   	
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                
                      
                
                <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->						
				<%If lsRol = "20"  Then ' Jefe OTA%>				
					<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">   
    <li ><a href="pd_cargo_meta.asp" title="Registro de Solicitud CCP" >Solicitud CCP</span></a></li>     
         <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
         <li ><a href="pd_conratar.asp" title="Registro de Contratos" >Ofc. Contrataci&oacute;n</span></a></li>
         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>
    </ul>
    </li>
    
    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Mantenimiento</span></a>
			<ul class="sub">
                <li><a href="pd_Actualiza.asp" title="Actualziaci&oacute;n de afiliaci&oacute;n a Sistema de Pensiones">Actualizaci&oacute;n</a></li>
                <li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>
        </ul> 
	</li>
    
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
         
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
            <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>
        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
        <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
       <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li> 
       </ul>
 </li>   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		
                
                
                <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->						
				<%If lsRol = "9"  Then ' OPERACION DE CAMPO%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">

  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
         <li><a href="pd_asignacion1.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>                   
        </ul> 
	</li>


   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
            <li><a href="pd_consultas_ro.asp" title="Datos de la Ficha de la RO">Consulta por Cargo</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
          
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		
                
                      
                	
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						
				<%If lsRol = "5"  Then ' SIGA CAS%>				
		
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
           <li><a href="pd_procesoCAS.asp" title="registro de Proceso CAS">Proceso CAS</a></li>

    </ul>
    </li>
    
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <li><a href="pd_testPsicologicoCAS.asp" title="Calificar el Test ed competencias CAS ">Evaluacion Comp. CAS </a></li>
        </ul> 
	</li>
   
   	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Consultas</span></a>

    <ul class="sub">
      <li><a href="pd_ConsultaDemerito.asp" title="registro de Proceso CAS">Dem&eacute;ritos</a></li>
    </ul>
    </li> 
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						

				<%If lsRol = "18"  Then 'Asistente Administracion %>				
	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     
	<ul id="nav">
   
  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
			<li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro.asp" title="Consulta por Cargos">Consultas por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>
  
 <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
                               
       <ul class="sub">
                 <li><a href="pd_conformidad_monitor.asp" title="Consulta de Conformidad de Pagos del Personal RO y RAO">Consulta de Conf. Mon</a></li>
                 <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>                   
            <li><a href="pd_AperturarConformidad.asp" title="Apertura de Pre Conformidad">Apert. de Pre Conf.</a></li>
            <li><a href="pd_ActualizarPlanilla.asp" title="Aprobaci&oacute;n de Pre Conformidad">Aprobar Pre Confor.</a></li>
                               </ul>                    
        
</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
<%End If%>	




<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						

				<%If lsRol = "1"  Then 'administracion%>				
	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     
	<ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">     
         <li ><a href="pd_cpresupuesto.asp" title="Ingreso Presupuesto" >Cargos Presup.</span></a></li>          
         <li ><a href="pd_cargo_meta.asp" title="Registro de Solicitud CCP" >Solicitud CCP</span></a></li> 
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Convocatoria por Cargo" >Continuidad Contrato</span></a></li>
         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>
    </ul>
    
    </li>
    
    
        <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
              <li><a href="pd_segmentacion.asp" title="Segmentación Rutas">Segmentaci&oacute;n Rutas</a></li>
                
          <li><a href="pd_asignacion1.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
			<li><a href="pd_PersonalLocN3.asp" title="PEA Locales">PEA por Locales</a></li>
            
          <!-- <li><a href="pd_GastosOP.asp" title="Gastos Operativos">Gastos Operativos</a></li>-->
                          <li><a href="pd_GastosOP_nvo.asp" title="Gastos Operativos">Gastos Operativos Nuevo</a></li>
        	<li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
            <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
			<li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>

        </ul> 
	</li>
    

  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
         <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
                   <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            
 			<li ><a href="pd_ConAsignacion.asp" title="Asignaci&oacute;n de Rutas">Asignaci&oacute;n de Rutas</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
            <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
		</ul>
	</li>
  
 <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
                               
            <ul class="sub">
			
			<li><a href="pd_AperturarConformidad.asp" title="Apertura de Pre Conformidad">Apert. de Pre Conf.</a></li>
            <li><a href="pd_ActualizarPlanilla.asp" title="Aprobaci&oacute;n de Pre Conformidad">Aprobar Pre Confor.</a></li>
            <li><a href="pd_conformidad.asp" title="Consulta de Conformidad de Pagos del Personal">Consulta de Conf.</a></li>
            </ul>                    
        
</li>

       
  
  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Sucesos</span></a>
    <ul class="sub">
			 <li><a href="pd_isucesos.asp" title="Ingreso de Sucesos">Ingreso</a></li>
           <li><a href="pd_msucesos.asp" title="Consulta de Sucesos">B&uacute;squeda</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
<%End If%>	



<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						

				<%If lsRol = "8"  Then 'administracion%>				
	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     
	<ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">     
         <li ><a href="pd_cpresupuesto.asp" title="Ingreso Presupuesto" >Cargos Presup.</span></a></li>          
         <li ><a href="pd_cargo_meta.asp" title="Registro de Solicitud CCP" >Solicitud CCP</span></a></li> 
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Convocatoria por Cargo" >Continuidad Contrato</span></a></li>
         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>
    </ul>
    
    </li>
    
    
        <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li> 
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_seleccion_global.asp" title="Selecci&oacute;n de Titularidad">Selec. Global</a></li> 
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_cambiocargo.asp" title="Seleccionar Ruta de personal">Cambio Cargo</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
       
          <li><a href="pd_asignacion1.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
           <!--<li><a href="pd_GastosOP.asp" title="Gastos Operativos">Gastos Operativos</a></li>-->
                          <li><a href="pd_GastosOP_nvo.asp" title="Gastos Operativos">Gastos Operativos Nuevo</a></li>
        	<li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
            <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
			<li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>

        </ul> 
	</li>
    

  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
         <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
                   <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
 			<li ><a href="pd_ConAsignacion.asp" title="Asignaci&oacute;n de Rutas">Asignaci&oacute;n de Rutas</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
            <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
		</ul>
	</li>
  
 <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
                               
            <ul class="sub">
			
			<li><a href="pd_AperturarConformidad.asp" title="Apertura de Pre Conformidad">Apert. de Pre Conf.</a></li>
            <li><a href="pd_ActualizarPlanilla.asp" title="Aprobaci&oacute;n de Pre Conformidad">Aprobar Pre Confor.</a></li>
            <li><a href="pd_conformidad.asp" title="Consulta de Conformidad de Pagos del Personal">Consulta de Conf.</a></li>
            </ul>                    
        
</li>

       
  
  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Sucesos</span></a>
    <ul class="sub">
			 <li><a href="pd_isucesos.asp" title="Ingreso de Sucesos">Ingreso</a></li>
           <li><a href="pd_msucesos.asp" title="Consulta de Sucesos">B&uacute;squeda</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
<%End If%>	



<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						

				<%If lsRol = "12"  Then 'administracion LIMA%>				
	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     
	<ul id="nav">
    
    
    
    <li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
        <li ><a href="ficha.asp" title="Registro de Ficha del Postulante">Postulante</a></li>

    </ul>
    
    </li>
    
    
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <!--<li><a href="pd_modificacion_ficha.asp" title="Actualización de Datos">Ficha Postulante</a></li>-->
       </ul>
    </li>

    
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
                 <li><a href="pd_NotaCV_RAO.asp" title="Calificar el CV del Postulante de las Redes RAO ">Evaluar CV RAO </a></li>
         <li><a href="pd_asiscapacitacion_RAO.asp" title="Seleccionar a los Asistentes a la capacitacion ">Capacitaci&oacute;n </a></li>
         <li><a href="pd_seleccion_ra.asp" title="Seleccionar al personal a contratar">Selecci&oacute;n RAO</a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_NotaCV_RTA.asp" title="Calificar el CV del Postulante de las Redes RAO y RTA ">Evaluar CV RTA </a></li>
         <li><a href="pd_seleccion_rta.asp" title="Seleccionar al Postulante a Laborar en la RTA">SeleccI&oacute;n RTA</a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_calificacion.asp" title="Evaluaci&oacute;n de Personal">Calificaci&oacute;n</a></li>
         </ul> 
	</li>
    
    
    	
  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
         <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
                   <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li><a href="pd_consultas.asp" title="Datos de la Ficha de la RAO">Directorio RAO</a></li>
            <li><a href="pd_consultas_ro.asp" title="Datos de la Ficha de la RO">Directorio RO</a></li>
 			<li><a href="pd_consultas_ra.asp" title="Datos de la Ficha de la RTA">Directorio RTA</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li ><a href="pd_calificacion_reporte.asp" title="Asignaci&oacute;n de Rutas">Reporte calificaci&oacute;n</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_info_contratos.asp" title="Contratos Activos">Contratos Activos por Ubigeo</a></li>

		</ul>
	</li>
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
<%End If%>	


<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						                

<%If lsRol = "10"  Then ' PAGOS%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
     <TD>
<ul id="nav">
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
     <ul class="sub">
  
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>

		</ul>
	</li>

    <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
		 <ul class="sub">
             <li><a href="pd_GastosOPer.asp" title="Reportes Gastos Operativos">Impresion GO</a></li>
             <li><a href="pd_GastosOPAdm.asp" title="Gastos Operativos">Gastos Administrativos</a></li>
             
		</ul>
	</li>
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>		


<%If lsRol = "24"  Then ' COORDINADOR DE SEDE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
     <TD>
<ul id="nav">
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Mantenimiento </span></a>
     <ul class="sub">
  
             <!--<li><a href="pd_modificacion_ficha.asp" title="Actualización de Datos">Ficha Postulante</a></li>-->

		</ul>
	</li>

    <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">Proceso</span></a>
		 <ul class="sub">
              <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que se hayan inscrito">Evaluar CV</a></li>
              <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
		</ul>
	</li>
    
    
    
     <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>		
				                
		<%If lsRol = "19"  Then ' Gerencia Proyectos %>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
    			 <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>            
		<li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
				<li ><a href="ing_meta.asp" title="Registro de Meta del RRHH" >Meta del RRHH</span></a></li>
                <li ><a href="pd_ing_rpm.asp" title="Registro del RPM de la RA" >RPM RA</span></a></li> 
                <li ><a href="pd_locales_Pres.asp" title="Ingreso de Locales de Preselecci&oacute;n" >Local Preselecci&oacute;n</span></a></li>
                <li ><a href="pd_locales_cv.asp" title="Ingreso de Locales de Envio de CV" >Local env&iacute;o CV</span></a></li>
                <li ><a href="pd_locales_capa.asp" title="Registro de los Locales de capacitaci&oacute;n" >Local Capacitacion</span></a></li>
                <li ><a href="pd_locales_operativos.asp" title="Registro de los Locales Operativos" >Locales Operativos</span></a></li>
             
              
    </ul>
    
    </li>
	
	
    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
                  
         <li><a href="pd_confirmacion_cv.asp" title="Calificar el CV del Postulante de las Redes RAO y RTA ">Calf. CV RAO/RTA </a></li>
         <li><a href="pd_seleccion_ra.asp" title="Seleccionar al Postulante a Laborar en las redes RAO y RTA">Selecc. RAO/RTA</a></li>
           <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Preseleccion de postulantes">Preseleccionar RO </a></li>
            <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar CV RO </a></li>
             <li><a href="pd_asiscapacitacion.asp" title="Seleccionar a los Asistentes a la capacitacion ">capacitaci&oacute;n </a></li>
            
			<li><a href="pd_seleccion.asp" title="Seleccionar al personal a contratar">Seleccionar RO</a></li>


        </ul> 
	</li>

    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
			<li><a href="pd_consultas.asp" title="Datos de la Ficha de la RAO">Directorio RAO</a></li>
            <li><a href="pd_consultas_ro.asp" title="Datos de la Ficha de la RO">Directorio RO</a></li>
 			<li><a href="pd_consultas_ra.asp" title="Datos de la Ficha de la RTA">Directorio RTA</a></li>
            <li ><a href="pd_ConAsignacion.asp" title="Asignaci&oacute;n de Rutas">Asignaci&oacute;n de Rutas</a></li>

            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_info_contratos.asp" title="Contratos Activos">Contratos Activos por Ubigeo</a></li>  
		<li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
             <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li ><a href="pd_consulta_localespresel.asp" title="Datos de locales Operativos">Locales Preselecci&oacute;n</a></li>  
             <li ><a href="pd_consulta_localesCapacita.asp" title="Datos de locales de capacitaci&oacute;n">Locales Capacitaci&oacute;n</a></li>
             <li ><a href="pd_consulta_locales.asp" title="Datos de locales Operativos">Locales Operativos</a></li>
		</ul>
	</li>
    
        
       <li class="top"><a href="#" id="shop" class="top_link" title="ESTASDISTICAS DE GESTI&Oacute;N"><span class="down">Estad&iacute;sticas</span></a>
		 <ul class="sub">
            <li><a href="pd_aplica_estadistico.asp" title="Datos del Estadisticos por distribuci&oacute;n Pol&iacute;tico Administrativo">Pol&iacute;tico Admin.</a></li>
             <li><a href="pd_esta_opera.asp" title="Datos del Estadisticos por distribuci&oacute;n Sede Operativa">Sede Operativa</a></li>
              <li><a href="pd_esta_alta_baja.asp" title="Muestra la cantidad de altas y Bajas Ingresadas y en el proceso en que se encuentran">Ejecucion de Altas y Bajas</a></li>
		</ul>
	</li>
  
  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Sucesos</span></a>
    <ul class="sub">
			<li><a href="pd_isucesos.asp" title="Ingreso de Sucesos">Ingresar</a></li>
           <li><a href="pd_msucesos.asp" title="Consulta de Sucesos">B&uacute;squeda</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		
                
              <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->			

			
			<%If lsRol = "26"  Then ' Evaluación%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
    <li ><a href="pd_cpresupuesto.asp" title="Ingreso Presupuesto" >Cargos Presup.</span></a></li>     
    <li ><a href="pd_cargo_meta.asp" title="Registro de Solicitud CCP" >Solicitud CCP</span></a></li>     
               <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
         <li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
         <li ><a href="pd_conratar.asp" title="Registro de Contratos" >Ofc. Contrataci&oacute;n</span></a></li>
         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
           <li><a href="pd_procesoCAS.asp" title="registro de Proceso CAS">Proceso CAS</a></li>

    </ul>
    </li>
    
    <li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_eliminacion.asp" title="Actualización de Datos">Habilitaci&oacute;n</a></li>
       </ul>
    </li>
    
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
         <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar C.V. </a></li>
          <li><a href="pd_testPsicologico.asp" title="Evaluar Evaluaci&oacute;n de Competencias" >test de 24 </a></li>
           <li><a href="http://proyectos.inei.gob.pe/pruebapsicologica/MODdefault.asp?varuser=<%=usuario%>" title="Evaluar Evaluaci&oacute;n de Competencias " target="_blank" onClick="window.open(this.href, this.target, 'width=800,height=400'); return false;">Test de 185 </a></li>
    	<li><a href="pd_Conocimientos.asp" title="registrar evaluaci&oacute;n de conocimientos.">Prueba Conoc.</a></li>
        <li><a href="pd_entrevista.asp" title="Entrevista personal de personal seleccionado">Entrevista</a></li>
		<li><a href="pd_entrevistaTexto.asp" title="Entrevista personal de personal seleccionado - Texto">Entrevista - Texto</a></li>
        <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%else%>Total<%end if%>.asp" title="Seleccion de Titularidad">Selecci&oacute;n</a></li>       
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
          <li><a href="pd_testPsicologicoCAS.asp" title="Calificar el CV del Postulante de las Redes RAO ">Evaluacion Comp. CAS </a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
            <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>
        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li><a href="pd_EntrevistasFecha.asp" title="Entrevistas por fecha">Ent. por fecha</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>


    
       <li class="top"><a href="#" id="shop" class="top_link" title="ESTASDISTICAS DE GESTI&Oacute;N"><span class="down">Estad&iacute;sticas</span></a>
		 <ul class="sub">
            <li><a href="pd_aplica_estadistico.asp" title="Datos del Estadisticos por distribuci&oacute;n Pol&iacute;tico Administrativo">Pol&iacute;tico Admin.</a></li>
		</ul>
	</li>
	

  
  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Sucesos</span></a>
    <ul class="sub">
			<li><a href="pd_isucesos.asp" title="Ingreso de Sucesos">Ingresar</a></li>
           <li><a href="pd_msucesos.asp" title="Consulta de Sucesos">B&uacute;squeda</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                  
                
                
<!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->	




<%If lsRol = "29"  Then ' Administracion de RRHH%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
         <li ><a href="pd_cpresupuesto.asp" title="Ingreso Presupuesto" >Cargos Presup.</span></a></li>          
         <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
		 <li ><a href="pd_conratar.asp" title="Registro de Contratos" >Ofc. Contrataci&oacute;n</span></a></li>
         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>
    </ul>
    
    </li>
    
         
     	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>
       </ul>
    </li>
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <li><a href="pd_calificacion_ficha.asp" title="Muestra los datos de la evaluaci&oacute;n de la ficha">Preselecci&oacute;n Autom&aacute;tica </a></li> 
          <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar CV</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        	  <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
         <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
         <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>

        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
           <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
		</ul>
	</li>
    

    <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
		 
		 <ul class="sub">
		    
			<li><a href="pd_AperturarConformidad.asp" title="Apertura de Pre Conformidad">Apert. de Pre Conf.</a></li>
            <li><a href="pd_ActualizarPlanilla.asp" title="Aprobaci&oacute;n de Pre Conformidad">Aprobar Pre Confor.</a></li>
            <li><a href="pd_conformidad.asp" title="Consulta de Conformidad de Pagos del Personal">Consulta de Conf.</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		</ul>		 
	</li> 
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                
                
      <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
      
      
      <%If lsRol = "30"  Then ' Administrativo de Capacitación%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
     	<li ><a href="pd_cpresupuesto.asp" title="Ingreso Presupuesto" >Cargos Presup.</span></a></li>          
         <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
		 <li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>

    </ul>
    
    </li>
     	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>
       </ul>
    </li>
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <li><a href="pd_calificacion_ficha.asp" title="Muestra los datos de la evaluaci&oacute;n de la ficha">Preselecci&oacute;n Autom&aacute;tica </a></li> 
          <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar CV</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
                 
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
<!---------------------------------------------------------------------------------------------------------->


 <%If lsRol = "43"  Then ' Monitoreo Nacional ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            
          <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li>  
           <li><a href="pd_aprobado<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV uno auno">Eval CV por DNI</a></li>
           
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
             <!-- <li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>-->
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
             
             
 
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        	  
              
              <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
         <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
         <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
               <li><a href="pd_asignacion_ece.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
         <li><a href="pd_cambioAsignacion_ece.asp" title="Cambio de Rutas">Rotacion de Rutas</a></li>
           

        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

          <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>

            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
                 
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                


 <%If lsRol = "50"  Then ' Monitoreo Nacional ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    <li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <!--<li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li> COMENTADO BPALOMINO 151015-->
            <li><a href="pd_eliminacion.asp" title="Pase a postulaci&oacute;n a convocatoria de Locaci&oacute;n">Pase a Postulaci&oacute;n</a></li>
             <li><a href="pd_rankin.asp" title="Ranking de Nivel III">Ranking Nivel III</a></li>
       </ul>
    </li>
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            
          <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li>  
           <li><a href="pd_aprobado<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV uno auno">Eval CV por DNI</a></li>
           
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <!--<li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>-->
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
             
             
 
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
              

              <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
         <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
         <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
               <li><a href="pd_asignacion_ece.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
         <li><a href="pd_cambioAsignacion_ece.asp" title="Cambio de Rutas">Rotacion de Rutas</a></li>
           

        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

          <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>

            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
                 
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                                         
                         
                
<!---------------------------------------------------------------------------------------------------------->




 <%If lsRol = "44"  Then 'Administrativo Sede ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           
         <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li> 
        <!--   <li><a href="pd_aprobado<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV uno auno">Eval CV por DNI</a></li>-->
           
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <!--<li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>-->
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        	 
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

          <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>

            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
                 
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                                


<!---------------------------------------------------------------------------------------------------------->




 <%If lsRol = "52"  Then 'Administrativo Sede ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           
         <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li> 
           <li><a href="pd_aprobado<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV uno auno">Eval CV por DNI</a></li>
           
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
             <!-- <li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>-->
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
              <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
               <li><a href="pd_asignacion_ece.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
         <li><a href="pd_cambioAsignacion_ece.asp" title="Cambio de Rutas">Rotacion de Rutas</a></li>
              
        	 
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

          <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>

            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
                 
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
<!---------------------------------------------------------------------------------------------------------->




 <%If lsRol = "53"  Then 'Administrativo Sede ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           
         <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li> 
           <li><a href="pd_aprobado<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV uno auno">Eval CV por DNI</a></li>
           
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
             <!-- <li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>-->
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        	 
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

          <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>

            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
                 
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                                


 <%If lsRol = "60"  Then 'GENERICO ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           


           

              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 

        	 
        </ul> 
	</li>
    	
  
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                

 <%If lsRol = "62"  Then 'GENERICO ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           


           

           
              <li><a href="pd_evaluademp.asp" title="Evalua desempeño">Ev. Desemp</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 

        	 
        </ul> 
	</li>
    	
  
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
             

 <%If lsRol = "63"  Then 'GENERICO ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           


           

            
              <li><a href="pd_evaluademp.asp" title="Evalua desempeño">Ev. Desemp</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 

        	 
        </ul> 
	</li>
    	
  
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	                
                
                        

 <%If lsRol = "64"  Then 'GENERICO ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           


           
              <li><a href="pd_evaluademp.asp" title="Evalua desempeño">Ev. Desemp</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 

        	 
        </ul> 
	</li>
    	
  
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	    
               
             

 <%If lsRol = "65"  Then 'GENERICO ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           


           

                           <li><a href="pd_evaluademp.asp" title="Evalua desempeño">Ev. Desemp</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 

        	 
        </ul> 
	</li>
    	
  
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	                              




 <%If lsRol = "66"  Then 'GENERICO ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           


           

                       <li><a href="pd_evaluademp.asp" title="Evalua desempeño">Ev. Desemp</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 

        	 
        </ul> 
	</li>
    	
  
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	  
                

 <%If lsRol = "67"  or  lsRol = "68"  or lsRol = "69"  or lsRol = "70"  or lsRol = "71"  or lsRol = "72"  or lsRol = "73"  or lsRol = "74" Then 'GENERICO ECE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
           


           

              <li><a href="pd_evaluademp.asp" title="Evalua desempeño">Ev. Desemp</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
 

        	 
        </ul> 
	</li>
    	
  
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	                  
                                              
<!--------------------------------------------------------------------------------------------->

      <%If lsRol = "45"  Then ' Operador%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
 		 <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
		<li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
        		 <li ><a href="pd_conratar.asp" title="Registro de Contratos" >Ofc. Contrataci&oacute;n</span></a></li>
                 <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                 <li ><a href="pd_locales_capa.asp" title="Registro de los Locales de capacitaci&oacute;n" >Registro Local</span></a></li>
                <li ><a href="pd_subirArchivoSedes.asp" title="permite actualizar o guardas el archivo de Sedes Operativas" >Archivo Sedes</span></a></li> 
                 
                 
                 
    </ul>
    </li>
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <li><a href="pd_calificacion_ficha.asp" title="Muestra los datos de la evaluaci&oacute;n de la ficha">Preselecci&oacute;n Autom&aacute;tica </a></li> 
          <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar CV</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <!--  <li><a href="pd_aprobado<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV uno auno">Eval CV por DNI</a></li>-->
           
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <!--<li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>-->
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
              <li><a href="pd_capacita_contrato.asp" title="Ingreso de Notas de Capacitaci&oacute;n">Registro Capacitaci&oacute;n</a></li>
              <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>           
               <li><a href="pd_capacitacionCampo_apli.asp" title="Calificar CV a Aplicadores y orientadores">Cap. Aplicadores</a></li> 
               <li><a href="pd_capacitacionCampo_opInf.asp" title="Calificar CV a Aplicadores y orientadores">Cap. Operador.I</a></li> 
               
 <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li> 
 
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        	  <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
              <li><a href="pd_seleccion_procesos.asp" title="Selecci&oacute;n General de procesos">Selecci&oacute;n general</a></li>
              <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
         <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
         <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_cambiocargo.asp" title="Seleccionar Ruta de personal">Cambio Cargo</a></li>

        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

          <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>

            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
                 
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                

<!------------------------------------------------------------------------------------------------------------->                
 
 <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
      
      
      <%If lsRol = "31"  Then ' Administrativo de Capacitación%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
 		 <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
		<li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
        		 <li ><a href="pd_conratar.asp" title="Registro de Contratos" >Ofc. Contrataci&oacute;n</span></a></li>
                 <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                 <li ><a href="pd_locales_capa.asp" title="Registro de los Locales de capacitaci&oacute;n" >Registro Local</span></a></li>
                <li ><a href="pd_subirArchivoSedes.asp" title="permite actualizar o guardas el archivo de Sedes Operativas" >Archivo Sedes</span></a></li> 
                 
                 
                 
    </ul>
    </li>
    
     	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
<!--            <li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>--->
            <li><a href="pd_modificacion_ficha.asp" title="Actualización de Datos">Ficha Postulante</a></li>
           
            <li><a href="pd_eliminacion.asp" title="Pase a postulaci&oacute;n a convocatoria de Locaci&oacute;n">Pase a Postulaci&oacute;n</a></li>
             <li><a href="pd_rankin.asp" title="Ranking de Nivel III">Ranking Nivel III</a></li>
       </ul>
    </li>
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <li><a href="pd_calificacion_ficha.asp" title="Muestra los datos de la evaluaci&oacute;n de la ficha">Preselecci&oacute;n Autom&aacute;tica </a></li> 
          <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar CV</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
          <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li> 
      <!--     <li><a href="pd_aprobado<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV uno auno">Eval CV por DNI</a></li>-->
           
           
        <% if id_proyecto="155"then %>
           
        <li><a href="pd_aprobarCV_ECE16.asp" title="Calificar CV a Aplicadores y orientadores">CV Notas ECE 16</a></li>
        
        <%ELSE%>
        <li><a href="pd_aprobarCV_EDNOM2.asp" title="Ingreso de EV. CV">Evaluacion CV  EDNOM16 N2 </a></li>
        
                <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
                
                <%END IF%>
        
        <!--solo nivel 3 para ednom-->
        <% if id_proyecto="139"then %>
        
         <li><a href="pd_aprobarCV_ednom3<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Nivel 3</a></li>
         <%end if%>
         
         
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>
<!--               <li><a href="pd_	CapacitacionCampo.asp" title="Preselecci&oacute;n campo">Capacitaci&oacute; por Aulas</a></li>-->
<li><a href="pd_capacita_aula.asp" title="Capacitacion por aulas">Capacitaci&oacute; por Aulas N3</a></li>

               
                <li><a href="pd_PersonalLocN3.asp" title="PEA Locales">PEA por Locales</a></li>
                              
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
              <li><a href="pd_capacita_contrato.asp" title="Ingreso de Notas de Capacitaci&oacute;n">Registro Capacitaci&oacute;n</a></li>
              <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>           
               <li><a href="pd_capacitacionCampo_apli.asp" title="Calificar CV a Aplicadores y orientadores">Cap. Aplicadores</a></li> 
               <li><a href="pd_capacitacionCampo_opInf.asp" title="Calificar CV a Aplicadores y orientadores">Cap. Operador.I</a></li> 
               
 <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li> 
 
   <li><a href="pd_evaluademp.asp" title="Evalua desempeño">Ev. Desemp</a></li>
   
 
              <li><a href="pd_selecciontotal<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        	  <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
              <li><a href="pd_seleccion_procesos.asp" title="Selecci&oacute;n General de procesos">Selecci&oacute;n general</a></li>
              <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
         <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
         <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_cambiocargo.asp" title="Seleccionar Ruta de personal">Cambio Cargo</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_asignacion_ece.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
         <li><a href="pd_cambioAsignacion_ece.asp" title="Cambio de Rutas">Rotacion de Rutas</a></li>
<li><a href="pd_etmp.asp" title="Actuailzacion de estados">Actualizacion de Estados</a></li>
<li><a href="pd_etmp_CARGO.asp" title="Actuailzacion de cargos">Actualizacion de Cargos</a></li>
<li><a href="pd_etmp_UBIGEO.asp" title="Actuailzacion de UBIGEOS">Actualizacion de UBIGEOS</a></li>
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

          <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>

            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
                 
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                
             <%If lsRol = "54"  Then ' Administrativo de Capacitación%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
        
<!--              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>-->
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Capacitación">Capacitaci&oacute;n</a></li>
              

        </ul> 
	</li>
    	
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                
                

		                
<%If lsRol = "32"  Then ' Consultas%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
  
     <TD>
     <ul id="nav">
     
      <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
          <li><a href="pd_aprobarCV_EDNOM2.asp" title="Ingreso de EV. CV">Evaluacion CV  EDNOM16 N2 </a></li>
           

        </ul> 
	</li>
    
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>                           


<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						                
<%If lsRol = "33"  Then ' Supervisor%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     
     
      <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
         <li><a href="pd_asignacion_ece.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
         <li><a href="pd_cambioAsignacion_ece.asp" title="Cambio de Rutas">Rotacion de Rutas</a></li>
           

        </ul> 
	</li>
     
     
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>      



<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						                
<%If lsRol = "48"  Then ' Consultas Estados del RRHH%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>     
                    
                    
                
<%If lsRol = "82"  Then ' Consultas ODEIS del RRHH%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li> 

		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>                        
                    
                    

<!------------------------------------------------------------------------------------------------------------------------------------------------------------>						     
       
              
<%If lsRol = "89"  Then ' MINEDU%>	<!--antes tenia codigo 42-->


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>    
                    
                    
<!-- se modifico rol 90 -->
                
                                         
                    
 <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
      
      <%If lsRol = "55"  Then ' CONSULTA%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">

   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>      
                    
                          
 <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
      
      
      <%If lsRol = "34"  Then ' Asistende Administrativo SEDE%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     	   

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <li><a href="pd_calificacion_ficha.asp" title="Muestra los datos de la evaluaci&oacute;n de la ficha">Preselecci&oacute;n Autom&aacute;tica </a></li> 
          <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar CV</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li>  
            
           <!-- <li><a href="pd_aprobado<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV uno auno">Eval CV por DNI</a></li>-->
           
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
<!-- SE QUITO PARA EL PROYECTO EDNOM 220316-->

  <!--solo nivel 3 para ednom-->
        <% if id_proyecto="139"then %>
        
         <li><a href="pd_aprobarCV_ednom3<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Nivel 3</a></li>
         <%end if%>
         
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
             <!-- <li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>-->
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li> 
              
   <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>           
      <li><a href="pd_PersonalLocN3.asp" title="PEA Locales">PEA por Locales</a></li>
      
               <li><a href="pd_capacitacionCampo_apli.asp" title="Calificar CV a Aplicadores y orientadores">Cap. Aplicadores</a></li> 
               <li><a href="pd_capacitacionCampo_opInf.asp" title="Calificar CV a Aplicadores y orientadores">Cap. Operador.I</a></li> 
               
 <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>              
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li> 
              <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>    
              <li><a href="pd_evaluacionPer.asp" title="Evaluaci&oacute;n de Personal">Evaluaci&oacute;n Desempe&ntilde;o</a></li>
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>

		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                                     <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
      
            <%If lsRol = "35"  Then 'MINEDU%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     	   

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
          <li><a href="pd_capacita_contrato.asp" title="Ingreso de Notas de Capacitaci&oacute;n">Registro Capacitaci&oacute;n</a></li>
        </ul> 
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                


<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
      
            <%If lsRol = "38"  Then 'supervisores EVALUACION %>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
  
     <TD>
     <ul id="nav">
     	   

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
          <li><a href="pd_evaluacionPer.asp" title="Evaluaci&oacute;n de Personal">Evaluaci&oacute;n Desempe&ntilde;o</a></li>
        </ul> 
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                

<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
      
      
      <%If lsRol = "39"  Then ' Especialista de Monitoreo%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
   
     	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>
       </ul>
    </li>
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <li><a href="pd_calificacion_ficha.asp" title="Muestra los datos de la evaluaci&oacute;n de la ficha">Preselecci&oacute;n Autom&aacute;tica </a></li> 
          
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">CV Aplicador</a></li>
              <li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Preselecci&oacute;n</a></li>
              <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>  
              <li><a href="pd_capacita_contrato.asp" title="Ingreso de Notas de Capacitaci&oacute;n">Registro Capacitaci&oacute;n</a></li>
              <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>           
              
 
              <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Selecci&oacute;n de Titularidad">Selecci&oacute;n</a></li>  
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
          <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
          <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
                 
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>				
                
 
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
 
                
                <%If lsRol = "40"  Then ' RA ECE%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
    
     <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
                     
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Evaluaci&oacute;n Curricular">Evaluaci&oacute;n de CV</a></li>
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha">Consulta por Cargos</a></li>
                            
		</ul>
	</li>
    
</ul>


     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>  
 <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
 
                
                
                <%If lsRol = "49"  Then ' RA ECE%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
    
     <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            <!--<li><a href="pd_aprobado<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV uno auno">Eval CV por DNI</a></li>-->
            
        <li><a href="pd_aprobarCV<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Evaluaci&oacute;n Curricular">Evaluaci&oacute;n de CV</a></li>
        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha">Consulta por Cargos</a></li>
                            
		</ul>
	</li>
    
</ul>


     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>  
 <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
 
                <%If lsRol = "37"  Then ' Supervisor%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>
    
    <li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_rankin.asp" title="Ranking de Nivel III">Ranking Nivel III</a></li>

       </ul>
    </li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%> 

<!------------------------------------->
     <%If lsRol = "80"  Then 'administracion%>				
	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     
	<ul id="nav">
  
 <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
                               
            <ul class="sub">
			
			<li><a href="pd_AperturarConformidad.asp" title="Apertura de Pre Conformidad">Apert. de Pre Conf.</a></li>
            <li><a href="pd_ActualizarPlanilla.asp" title="Aprobaci&oacute;n de Pre Conformidad">Aprobar Pre Confor.</a></li>
            <li><a href="pd_conformidad.asp" title="Consulta de Conformidad de Pagos del Personal">Consulta de Conf.</a></li>
            </ul>                    
        
</li>

       
  
  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Sucesos</span></a>
    <ul class="sub">
			 <li><a href="pd_isucesos.asp" title="Ingreso de Sucesos">Ingreso</a></li>
           <li><a href="pd_msucesos.asp" title="Consulta de Sucesos">B&uacute;squeda</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
<%End If%>	

     
     
					<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
      



<%If lsRol = "81"  Then ' Administracion de RRHH%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">

         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>
    </ul>
    
    </li>
    
         
    

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
      
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
         <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
         <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>

        </ul> 
	</li>
    	
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
  <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
           <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
		</ul>
	</li>
    

   
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
            <%If lsRol = "83"  Then 'MINEDU%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     	   

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
              <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li> 
              
               <li><a href="pd_aprobarCV_ECE16.asp" title="Calificar CV a Aplicadores y orientadores">CV Notas ECE 16</a></li>
<!--          <li><a href="pd_capacita_contrato.asp" title="Ingreso de Notas de Capacitaci&oacute;n">Registro Capacitaci&oacute;n</a></li>-->
          
        
          
        </ul> 
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
    
    
    
    
    <%If lsRol = "84"  Then 'EV. CV.%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     	   

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">

          <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li> 
          <li><a href="pd_aprobarCV_EDNOM2.asp" title="Ingreso de EV. CV">Evaluacion CV N2 </a></li>

-		<li><a href="pd_preseleccion.asp" title="Preseleccion">Preseleccion </a></li>
        <li><a href="pd_PreseleccionCampo.asp" title="Preselecci&oacute;n campo">Presel. por Aulas</a></li>
        <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
        </ul> 
	</li>

    <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
            <li><a href="pd_consultas_ro.asp" title="Consulta por Cargos">Consultas por Cargos</a></li>
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                 
                
    <%If lsRol = "86"  Then 'EV. CV.%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     	   

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">

          <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li> 
          <li><a href="pd_aprobarCV_ECE16.asp" title="Calificar CV a Aplicadores y orientadores">CV Notas ECE 16</a></li>
          <li><a href="pd_capacita_aula.asp" title="Capacitacion por aulas">Capacitaci&oacute; por Aulas N3</a></li>

-		
        </ul> 
	</li>

    <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
           <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>

             <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
                 <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
                 <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li>
		</ul>
	</li>
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                  <%If lsRol = "85"  Then 'ASISTENTE ADMINISTRATIVO ECE 16 ODEIS %>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     	   

    <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
              <li><a href="pd_cv_fisicos_ece.asp" title="Registro CV Fisicos">Registro CV Fisico</a></li> 
              
               <li><a href="pd_aprobarCV_ECE16.asp" title="Calificar CV a Aplicadores y orientadores">CV Notas ECE 16</a></li>
<!--          <li><a href="pd_capacita_contrato.asp" title="Ingreso de Notas de Capacitaci&oacute;n">Registro Capacitaci&oacute;n</a></li>-->
          
        
          
        </ul> 
	</li>
    
    
    
   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        

            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li style="text-decoration:underline"><a>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            
                 
		</ul>
	</li>
    
    
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                
                  
                 <%If lsRol = "87"  Then 'jefe de Proyecto%>	


	<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
     
     
     
     
     
     <li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
     <li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
     <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
        </ul>
    </li>
     

     	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>
       </ul>
    </li>
     
        
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
          <li><a href="pd_segmentacion.asp" title="registrar datos de la Segmentaci&oacute;n">Segmentaci&oacute;n </a></li>
         <li><a href="pd_asignacion1.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
         <li><a href="pd_cambioAsignacion.asp" title="Cambio de Rutas">Rotacion de Rutas</a></li>
         <li style="text-decoration:underline"><a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
            <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>

        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		</ul>
	</li>
    
   <li class="top"><a href="#" id="shop" class="top_link" title="Pagos"><span class="down">PAGOS</span></a>
		 
		 <ul class="sub">
		       <!--<li><a href="pd_GastosOP.asp" title="Gastos Operativos">Gastos Operativos</a></li>-->
               <li><a href="pd_GastosOP_nvo.asp" title="Gastos Operativos">Gastos Operativos Nuevo</a></li>
               <li><a href="pd_GastosOP_func_form.asp" title="Gastos Operativos">Formatos de Pago</a></li>
  
		</ul>		 
   	
	</li>  
    
 
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
                
                
                    <%End If%>     
                	
<%If lsRol = "88"  Then ' RA%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
    <li ><a href="pd_cpresupuesto.asp" title="Ingreso Presupuesto" >Cargos Presup.</span></a></li>     
    <li ><a href="pd_cargo_meta.asp" title="Registro de Solicitud CCP" >Solicitud CCP</span></a></li>     
               <li ><a href="pd_ConvocatoriaMant.asp" title="Registro de Convocatorias" >Convocatorias</span></a></li>
         <li ><a href="pd_ConvocatoriaCargo.asp" title="Registro de Convocatoria por Cargo" >Convocatoria por Cargo</span></a></li>
         <li ><a href="pd_ContratacionDirecta.asp" title="Registro de Continuidad de contrato" >Continuidad Contrato</span></a></li>
         <li ><a href="pd_PublicaResultado.asp" title="Publicar Resultado" >Publicar Resultados</span></a></li>
         <li ><a href="pd_conratar.asp" title="Registro de Contratos" >Ofc. Contrataci&oacute;n</span></a></li>
         <li ><a href="pd_Of_altasBajas.asp" title="Registro de Contratos" >Ofc. Altas/Bajas</span></a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
           <li><a href="pd_procesoCAS.asp" title="registro de Proceso CAS">Proceso CAS</a></li>

    </ul>
    </li>
    
    
    <li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
        <li><a href="pd_modificacion_ficha.asp" title="Actualización de Datos">Ficha Postulante</a></li>
            <!--<li><a href="pd_actualizardatos.asp" title="Actualización de Datos">Ficha Postulante</a></li>  COMENTADO BPALOMINO 1510-->
            <li><a href="pd_eliminacion.asp" title="Pase a postulaci&oacute;n a convocatoria de Locaci&oacute;n">Pase a Postulaci&oacute;n</a></li>
       </ul>
    </li>
    
    
    
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
         <li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar C.V. </a></li>
          <li><a href="pd_testPsicologico.asp" title="Evaluar Evaluaci&oacute;n de Competencias" >test de 24 </a></li>
           <li><a href="http://proyectos.inei.gob.pe/pruebapsicologica/MODdefault.asp?varuser=<%=usuario%>" title="Evaluar Evaluaci&oacute;n de Competencias " target="_blank" onClick="window.open(this.href, this.target, 'width=800,height=400'); return false;">Test de 185 </a></li>
    	<li><a href="pd_Conocimientos.asp" title="registrar evaluaci&oacute;n de conocimientos.">Prueba Conoc.</a></li>
        <li><a href="pd_entrevista.asp" title="Entrevista personal de personal seleccionado">Entrevista</a></li>
		<li><a href="pd_entrevistaTexto.asp" title="Entrevista personal de personal seleccionado - Texto">Entrevista - Texto</a></li>
        <li><a href="pd_seleccion<% if id_proyecto="103"then %>_ece<%else%>Total<%end if%>.asp" title="Seleccion de Titularidad">Selecci&oacute;n</a></li>       
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
          <li><a href="pd_testPsicologicoCAS.asp" title="Calificar el CV del Postulante de las Redes RAO ">Evaluacion Comp. CAS </a></li>
         <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_altas_bajas.asp" title="Altas y Bajas">Altas y Bajas </a></li>
          <li><a href="pd_altas_nuevas.asp" title="Altas Nuevas">Altas Nuevas </a></li>
            <li><a href="pd_exebajas.asp" title="Ejecutar Bajas">Ejecutar Bajas</a></li>
        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        <li><a href="pd_conpresupuesto.asp?lstipoCons=1" title="Muestra reportes ADM">Consultas ADM</a></li>
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
            <li><a href="pd_EntrevistasFecha.asp" title="Entrevistas por fecha">Ent. por fecha</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
		
        <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="pd_anexo2a.asp" title="Anexo 2A por fechas">Bajas x Ejecutar</a></li>
        <li><a href="pd_ebajas.asp" title="Muestra los estados de las bajas del RRHH">Estado de Bajas</a></li>
       <li><a href="pd_bajasexec.asp" title="Bajas Ejecutadas">Bajas Ejecutadas</a></li> 
       
        <li ><a href="pd_busquedao.asp" title="Datos del estado del RRHH">Consulta del Personal</a></li>
        
       </ul>
 </li>
   

 <li class="top"><a href="#" id="shop" class="top_link" title="Conformidad de Pagos del Personal"><span class="down">PAGOS</span></a>
		 
		 <ul class="sub">
		    
			<li><a href="pd_AperturarConformidad.asp" title="Apertura de Pre Conformidad">Apert. de Pre Conf.</a></li>
            <li><a href="pd_ActualizarPlanilla.asp" title="Aprobaci&oacute;n de Pre Conformidad">Aprobar Pre Confor.</a></li>
            <li><a href="pd_conformidad.asp" title="Consulta de Conformidad de Pagos del Personal">Consulta de Conf.</a></li>
		</ul>		 
   	
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                
                

<%If lsRol = "91"  Then ' RA%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	
    
    
  
    
    
    
  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
            
             <li><a href="pd_capacita<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Calificar CV a Aplicadores y orientadores">Capacitaci&oacute;n</a></li>
             
        </ul> 
	</li>

   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
        
            <li><a href="pd_consultas_ro<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Datos de la Ficha de la RO">Consulta por Cargos</a></li>
          
        
       </ul>
 </li>
   

   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	                
  
  <%If lsRol = "90"  Then ' REGISTRO CAPACITACION%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
    <ul class="sub">
    </ul>
    </li>
    
         <li class="top"><a href="#" id="contacts2" class="top_link"><span class="down">Procesos</span></a>
           <ul class="sub">
            <li><a href="pd_pago_planillas.asp" title="Pago de Planillas">Pago Planillas</a></li>
           </ul>
         </li>
     </ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>	
                                
                

  
		

<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
  
      					
				<%If lsRol = "17"  Then ' DIRECTOR ODEI%>				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
     <ul id="nav">
	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Registro</span></a>

    <ul class="sub">
                <li ><a href="ficha.asp" title="Registro de Ficha del Postulante">Postulante</a></li>
    </ul>
    </li>

  <li class="top"><a href="#" id="contacts" class="top_link"><span class="down">Procesos</span></a>
			<ul class="sub">
                <li><a href="pd_habilitarCalificacion.asp" title="Habilitacion para el Cuestionario">Hab. Cuestionario </a></li>

            	<li><a href="pd_preseleccion<% if id_proyecto="103"then %>_ece<%end if%>.asp" title="Preseleccion de postulantes">Preseleccionar RO </a></li>
            	<li><a href="pd_NotaCV.asp" title="Calificar a todos los postulantes que hayan aprovado el ex&aacute;men">Evaluar CV RO </a></li>
             	<li><a href="pd_asiscapacitacion.asp" title="Seleccionar a los Asistentes a la capacitacion ">Capacitaci&oacute;n </a></li>
				<li><a href="pd_seleccion.asp" title="Seleccionar al personal a contratar">Seleccionar RO</a></li>
                <li><a href="pd_asignacion1.asp" title="Seleccionar Ruta de personal">Asignaci&oacute;n de Rutas</a></li>
                <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_calificacion.asp" title="Evaluaci&oacute;n de Personal">Calificaci&oacute;n</a></li>
        </ul> 
	</li>


	<li class="top"><a href="#" id="services" class="top_link"><span class="down">Mantenimiento</span></a>
        <ul class="sub">
            <li><a href="pd_ActualizaDatosPer.asp" title="Actualización de DNI, Nombres y RUC">Actualizar Datos Postulan.</a></li>
            <!--<li><a href="pd_modificacion_ficha.asp" title="Actualización de Datos">Ficha Postulante</a></li>-->
            <li><a href="pd_eliminacion.asp" title="Eliminar Ficha del Postulante">Eliminar Ficha</a></li>
       </ul>
    </li>



   <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Consultas</span></a>
		<ul class="sub">
			<li><a href="pd_consultas.asp" title="Datos de la Ficha de la RAO">Directorio RAO</a></li>
            <li><a href="pd_consultas_ro.asp" title="Datos de la Ficha de la RO">Directorio RO</a></li>
 			<li><a href="pd_consultas_ra.asp" title="Datos de la Ficha de la RTA">Directorio RTA</a></li>
            <li ><a href="pd_busqueda.asp" title="Datos del estado del RRHH">Estados del RRHH</a></li>
            <li ><a href="pd_calificacion_reporte.asp" title="Asignaci&oacute;n de Rutas">Reporte calificaci&oacute;n</a></li>

             <li style="text-decoration:underline"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li><a href="pd_info_contratos.asp" title="Contratos Activos">Contratos Activos por Ubigeo</a></li>
   <li ><a href="pd_consulta_locales.asp" title="Datos de locales Operativos">Locales Operativos</a></li>
   <li ><a href="pd_consulta_localesCapacita.asp" title="Datos de locales de capacitaci&oacute;n">Locales Capacitaci&oacute;n</a></li>
		</ul>
	</li>


    
       <li class="top"><a href="#" id="shop" class="top_link" title="ESTASDISTICAS DE GESTI&Oacute;N"><span class="down">Estad&iacute;sticas</span></a>
		 <ul class="sub">
            <li><a href="pd_aplica_estadistico.asp" title="Datos del Estadisticos por distribuci&oacute;n Pol&iacute;tico Administrativo">Pol&iacute;tico Admin.</a></li>
		</ul>
	</li>
	

  
  <li class="top"><a href="#" id="shop" class="top_link"><span class="down">Sucesos</span></a>
    <ul class="sub">
			<li><a href="pd_isucesos.asp" title="Ingreso de Sucesos">Ingresar</a></li>
           <li><a href="pd_msucesos.asp" title="Consulta de Sucesos">B&uacute;squeda</a></li>
		</ul>
	</li>
   
</ul>

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></td><td> <img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></td>
     </tr>
</table>
				<%End If%>		
                
                
                	

</td></tr>
	</table>
<%
function fechaActual()
		 mes=Array("Enero", "Febrero", "Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre")
		 dia=Array("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo")
		f=now()

		dim cad
		cad=dia(Weekday(f,2)-1) & ", " & day(f) & " de " & mes(month(f)-1) & " del " & year(f)
		fechaActual=cad
end function	
%>