<%@ Language=VBScript %>
<%
Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0 
muestra_acepta = "none"

id_proyecto=session("id_proyecto") 
lsUsuario=Session("id_usuario")

%>
<!-- #include file="Conexion.asp"  --> 
<html>
<head>
 <title>..:: SISTEMA DE CONSECUCI&Oacute;N DE RECURSOS HUMANOS ::..</title>

   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
   <script type="text/javascript" src="js/cliente.js"></script>
   <script>function AbrirLugares(cod){	 		
	pagina = "lugares.asp";		
	win = window.open(pagina,'','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=360,top=250,left=250');
    }
	
	function abrir()
	{
		window.location.href = "ficha.asp";
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
<!--#include file="cabecera.html"-->
    
<%
		SQL1 = "exec dbo.pa_listar_entrevista_dia '"&id_proyecto&"','"&lsUsuario&"' "	
		

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
If Not RSCuad.BOF And Not RSCuad.EOF Then 
	%>
	

<table  border="0" width="100%" align=center cellspacing=1 cellpadding=1><tr  height=4 bgcolor=darkblue><td></td></tr></table>
<div style="padding:0px 10px 10px 10px; text-align: center;"> 
<table border="0" width="95%" align=center cellspacing=1 cellpadding=1 >
 
  <tr height=5>
    <td colspan=2></td>

  <tr height=30>
    <td colspan="3" align="center" class="alerta2" >
    
    <table width='80%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
    <tr>
        <th colspan="6"   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Entrevistas del d&iacute;a <%=Date()%> - Proyecto <%=Session("nmeta")%></th>
        </tr>
      <tr>
        <th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro</th>
        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Depatamento</th>
        <th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nombre</th>
        <th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
        <th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Cargo</th>
        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado</th>
      </tr>
      
       <%  



registro = 0					
							
			Do While Not RSCuad.EOF
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 %>
      <tr class='<%=clase%>'>
        <td class='etiqueta'><%response.Write(cont)%></td>
        <td class='etiqueta'>&nbsp;<%=RSCuad.Fields("DPTO")%></td>
        <td class='etiqueta'><%=RSCuad.Fields("NOMBRES")%></td>
        <td class='etiqueta'><%=RSCuad.Fields("dni")%></td>
        <td class='etiqueta'><%=RSCuad.Fields("cargo")%></td>
        <td class='etiqueta'><%=RSCuad.Fields("estado")%></td>
      </tr>
                 <%
			registro = registro + 1
			RSCuad.MoveNext
			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
 %>
      
      
    </table>
    </td>
    </tr>
    <tr>
    <td width="4%" align="left" valign="top">
</td>
    <td width="96%" align="left" valign="top"><div align="right" class="titulo">
      <table width="90%" border="0" align="center">
        </table>
        
   
      </div></td>
  </tr>

</table>
</div>
</div>
    
    <%		
	else%>
    
   
<table  border="0" width="100%" align=center cellspacing=1 cellpadding=1><tr  height=4 bgcolor=darkblue><td></td></tr></table> 
<table border="0" width="95%" align=center cellspacing=1 cellpadding=1 >
 
  <tr height=5>
    <td width="100%"></td>
  </tr>
  <tr >
    <td height="41" align=left valign="top"><p class="tituloPrin"> No hay Registros</p>
</td>

</table>
    <%end if %> 

</body>
</html>