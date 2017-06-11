<%@ Language=VBScript %>
<%session.lcid=2057%>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%

id_proyecto=session("id_proyecto")


Response.Flush 
			


	lsfecha=request("lsfecha")
	lsrol=request("rol")	'15LIMA
	
	
	if varDpto="99" and varProv="99" and varDist="99" then
		vartittn=" A Nivel Nacional"
	end if
	if varDpto<>"99" then
		vartit1= "Departamento : " & nombredpto
	end if
	if varProv<>"99" then
		vartit2= " / Provincia : "& nombreprov
	end if
	if varDist<>"99" then
		vartit3= " / Distrito : "&nombredist
	end if
	vartitt=vartit1 & vartit2 & vartit3	
  
						SQL1 = "exec dbo.usp_Altas_Bajas_Reporte_periodo '"&lsfecha&"', '"&id_proyecto&"' "	
					

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
	%> 
	

	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>

<link href="css/inei.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.t1 {mso-number-format:"\@";}
</style>

<table border="1" cellpadding="1" cellspacing="0" style="font-size:10px" bordercolor="#000000">
  <tr>
    <td colspan="13"  align="center"><table border="1" cellpadding="1" cellspacing="0" style="font-size:10px" bordercolor="#000000">
      <tr>
        <td colspan="15"  align="center"><strong><span class="etiqueta2">Ingresos de Altas y Bajas del dia <%=lsfecha%> <img src="images/excell1.gif" align="left" width="32" height="29" onclick="exp_A2A()" /></span></strong></td>
      </tr>
      <tr>
        <td width="40" bgcolor="#DBDBDB">N&deg;</td>
        <td width="136" bgcolor="#DBDBDB">FEC REG</td>
        <td bgcolor="#DBDBDB">USUARIO</td>
        <td width="136" bgcolor="#DBDBDB">CARGO</td>
        <td width="136" bgcolor="#DBDBDB">STATUS</td>
        <td width="136" bgcolor="#DBDBDB">DEPARTAMENTO</td>
        <td width="136" bgcolor="#DBDBDB">PROVINCIA</td>
        <td width="136" bgcolor="#DBDBDB">DISTRITO</td>
        <td width="136" bgcolor="#DBDBDB">APE PATERNO</td>
        <td width="136" bgcolor="#DBDBDB">APE MATERNO</td>
        <td width="151" bgcolor="#DBDBDB">NOMBRES</td>
        <td width="82" bgcolor="#DBDBDB">DNI</td>
        <td bgcolor="#DBDBDB">FEC_INI </td>
        <td bgcolor="#DBDBDB">FEC_FIN</td>
        <td bgcolor="#DBDBDB">ESTADO PAGO</td>
        
      </tr>
      <%registro = 0					
				
			Do While Not RSCuad.EOF
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 %>
      <tr>
        <td rowspan="2"><%response.Write(cont)%></td>
        <td rowspan="2"><%=RSCuad.Fields("fec_reg")%></td>
            <td rowspan="2"><%=UCase(RSCuad.Fields("usuario"))%></td>
        <td rowspan="2"><%=RSCuad.Fields("cargo")%></td>
        <td bgcolor="#996600">SALE</td>
        <td><%=RSCuad.Fields("dpto")%></td>
        <td><%=RSCuad.Fields("prov")%></td>
        <td><%=RSCuad.Fields("dist")%></td>
        <td><%=RSCuad.Fields("ape_paterno")%></td>
        <td><%=RSCuad.Fields("ape_materno")%></td>
        <td><%=trim(RSCuad.Fields("nombre"))%></td>
        <td class="t1"><%=RSCuad.Fields("dni")%></td>
        <td class="t1"><span class="t12"><%=RSCuad.Fields("fec_iniT")%></span></td>
        <td  class="t1"><span class="t14"><%=RSCuad.Fields("fec_finT")%></span></td>
        <td  class="t1"><span class="t14"><%=RSCuad.Fields("estadoP")%></span></td>
        
      </tr>
      <tr>
        <td bgcolor="#99CC66">ENTRA</td>
        <td><%=RSCuad.Fields("dptoI")%></td>
        <td><%=RSCuad.Fields("provI")%></td>
        <td><%=RSCuad.Fields("distI")%></td>
        <td><%=RSCuad.Fields("ape_paternoI")%></td>
        <td><%=RSCuad.Fields("ape_maternoI")%></td>
        <td><%=trim(RSCuad.Fields("nombreI"))%></td>
        <td class="t1"><span class="t2"><%=RSCuad.Fields("dniI")%></span></td>
        <td class="t1"><span class="t13">
          <% if RSCuad.Fields("fec_iniR")="01/01/1900" then response.Write("") else response.Write( RSCuad.Fields("fec_iniR"))  %>
        </span></td>
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
    </table>      <strong><span class="etiqueta2"></span></strong></td>
  </tr>
</table>
<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if%>