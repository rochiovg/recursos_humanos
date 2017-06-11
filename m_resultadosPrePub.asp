<%@ Language=VBScript %>
<%
Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0 
muestra_acepta = "none"

id=request("id")
etapa=request("etapa")
idProyecto=Session("id_proyecto")

%>
<!-- #include file="Conexion.asp"  -->
<html>
<head>
 <title>..:: SISTEMA DE CONSECUCI&Oacute;N DE RECURSOS HUMANOS ::..</title>

   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
   <script type="text/javascript" src="js/cliente.js"></script>
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

SQL = "exec dbo.uspGet_ReporteF2_titulo  '"&id&"', '"&idProyecto&"'"

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL, MiCone, 3,3
		
		
			If Not RSCuad.BOF And Not RSCuad.EOF Then 

		cargo=RSCuad.fields("desc_CargoFuncional")
		desc_meta=RSCuad.fields("desc_Meta")
	end if
	RSCuad.Close
	
	if etapa=1 then 
		proceso="Aprobaron CV (Aptos para test de Conocimientos)"
	elseif etapa=3 then 
		proceso="Aprobaron test de conocimientos y Competencias (Aptos para entrevista)"
	elseif etapa=4 then 
		proceso="Seleccionados"
	end if
%>


<table align="center" width="100%">
   <tr>
	<td>
    <p class="tituloPrin" style="color:#012D4E" ><%=desc_meta%>&nbsp;</p>
    <p class="tituloPrin">CARGO: <%=cargo%> <BR><BR><%=proceso%></p>

    </td>
</tr>
<tr>
	<td align="center"><input name="reg" id="reg" type="hidden" value="1"><br>
    <table width='80%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    
    <% SQL2 = "exec dbo.pa_ubigeos_resultados '"&id&"' "	

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
       <% '
	   SQL3 = "exec dbo.pd_ficha_ListarAptos '"&id&"', '"&RSCuad2.Fields("CCDD")&"', '"&idProyecto&"' , '"&etapa&"', '"&RSCuad2.Fields("detadepen")&"'  "	

		Set RSCuad3	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad3.cursorlocation=3
		RSCuad3.Open SQL3, MiCone, 3,3
		
		If Not RSCuad3.BOF And Not RSCuad3.EOF Then 
		
		
		%>
            	<TR  bordercolor="#DAE8F3"  bgcolor="#DAE8F3">
                	<TD class="etiqueta"><strong>Nro.</strong></TD>
                    <TD class="etiqueta"><strong>Provincia</strong></TD>
                    <TD class="etiqueta"><strong>Apellidos y Nombres</strong></TD>
                    <TD class="etiqueta"><strong>DNI</strong></TD>
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
                    <TD class="etiqueta"><%=RSCuad3.Fields("PROV")%></TD>
                    <TD class="etiqueta"><%=RSCuad3.Fields("NOMBRES")%></TD>
                    <TD class="etiqueta"><%=RSCuad3.Fields("dni")%></TD>
                </TR>
              <%
			  registro = registro + 1
			  RSCuad3.MoveNext
			  Loop	
			  RSCuad3.close
			  set RSCuad3=nothing%>
			   </TABLE><BR>
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
</table>


</body>
</html>