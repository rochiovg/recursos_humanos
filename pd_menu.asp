<!-- #include file="conexion_menu.asp"  --> 

<%

Response.ContentType="text/html; charset=iso-8859-1"

usuario = Session("cuenta_competencias")
id_proyecto=Session("id_proyecto")


consulta1 = "EXEC dbo.pa_rol_usuario '" & lsRol&"'"
	
Set RsP2 = Server.CreateObject("ADODB.Recordset")
RsP2.cursorlocation=3
RsP2.Open consulta1, MiConemenu, 3,3

perfil = ""

Do While Not RsP2.EOF
	perfil = RsP2.Fields("DESC_ROLUSUARIO")
	RsP2.MoveNext
Loop	
RsP2.close
Set RsP2= Nothing

	
	
Function GenerarMenu()

consulta1 = "EXEC dbo.pa_menu_rol '" & lsRol& "', 0 " 
	
Set RsP = Server.CreateObject("ADODB.Recordset")
RsP.cursorlocation=3
RsP.Open consulta1, MiConemenu, 3,3
		
		
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
Set RsP= Nothing


response.write ( "</ul>")


End Function
	
Function GenerarNivel1(id1)
	
consulta1 = "EXEC dbo.pa_menu_rol '" & lsRol& "', 1, " &id1
	
Set RsP = Server.CreateObject("ADODB.Recordset")
RsP.cursorlocation=3
RsP.Open consulta1, MiConemenu, 3,3
		
		
Do While Not RsP.EOF
	response.Flush()

	response.write ("<li><a href='"&RsP.Fields("url")&"' title='"&RsP.Fields("desc_menu")&"'>"&RsP.Fields("desc_menu")&"</a></li>")
	
	RsP.MoveNext
Loop	
RsP.close
Set RsP= Nothing

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
     						
				
				<table width="100%" border="0" cellspacing="1" cellpadding="0" >
  <tr>
 
     <TD>
    <%GenerarMenu()
	Miconemenu.Close 
set Miconemenu = nothing 
	
	%>
    

     </TD>
     <td><span class="dato">Perfil : <strong><%=perfil%></strong></span></td>
     <td><div align="right"><img src="images/inicio.gif" width="24" border="0" title="Inicio" onClick="AbrirMenu(1)" height="24" /></div></td><td> <div align="right"><img src="images/salir.gif" border="0" onClick="AbrirMenu(10)" width="24" height="24" /></div></td>
     </tr>
</table>
                

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
