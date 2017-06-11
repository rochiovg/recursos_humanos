<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%
Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_ASIGNACION.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.Flush 


varccdd= Request("lsDPTO")
varccpp = Request("lsPROV")
varccdi = Request("lsDIST")
cargo = Request("lscargo") 
nivel = Request("lsnivel")
tipo = Request("tipo")
tipoRot = Request("tipoRot")

varccpp = Mid(varccpp,4,2)
varccdi = Mid(varccdi,6,2)

id_Proyecto=Session("id_proyecto")

		consulta1 = "exec dbo.pa_reporte_cambios_rutas  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '" &tipo& "', '" & tipoRot & "' "

	
	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
	
		
	  If  Not RsP.BOF And Not RsP.EOF Then  %>
<style type="text/css">
.titulo {
	text-align: right;
}
</style>

                <table width='100%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
               
                    
                <tr bgcolor="#D2F3FB">                
                <td colspan="17" align="center">ROTACI&Oacute;N DE RUTAS<span class="titulo"><span class="titulo"></span></span></td>
                </tr>
    <tr  bgcolor="#D2F3FB">
		           <td align="center">Nro</td>
                   <td align="center">COD. SEDE REG.</td>
                   <td align="center">SEDE REGIONAL</td>
                   <td align="center">COD. SEDE PROV.</td>
                   <td align="center">SEDE PROVINCIAL</td>
                   <td align="center">COD. SEDE DSITRITAL</td>
                   <td align="center">SEDE DISTRITAL</td>
		           <td align="center">DNI</td>
		           <td align="center">APELLIDOS Y NOMBRES</td>
		           <td align="center">NUMERO APLICADOR</td>
		           <td align="center">NUMERO A. SUPERVISOR</td>
		           <td align="center">CODIGO MODULAR</td>
		           <td align="center">NOMBRE IE</td>
		           <td align="center">MOTIVO CAMBIO</td>
                   <td align="center">TIPO CAMBIO</td>
                   <td align="center">USUARIO</td>
                   <td align="center">FECHA CAMBIO</td>
	             </tr>
                 
    </tr>
  <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 	%>
  <tr >
		           <td rowspan="2" ><%=cont%></td>
                   <td rowspan="2" class="t" ><%=RsP.Fields("COD_SEDE_REG")%></td>
                   <td rowspan="2" ><%=RsP.Fields("Sede_region")%></td>
                   <td rowspan="2"  class="t"><%=RsP.Fields("COD_SEDE_PROV")%></td>
                   <td rowspan="2" ><%=RsP.Fields("Sede_provincia")%></td>
                   <td rowspan="2"  class="t"><%=RsP.Fields("COD_SEDE_DISTRITAL")%></td>
                   <td rowspan="2" ><%=RsP.Fields("SedeDistrital")%></td>
                   
		           <td align="right"  class="t" bgcolor="#FFFFF9"><%=RsP.Fields("dni1")%></td>
		           <td  bgcolor="#FFFFF9"><%=RsP.Fields("ap1")%>&nbsp;<%=RsP.Fields("am1")%>&nbsp;<%=RsP.Fields("n1")%></td>
		           <td bgcolor="#FFFFF9" align="right" class="t"><%=RsP.Fields("apli1")%></td>
		           <td bgcolor="#FFFFF9"  align="right" class="t"><%=RsP.Fields("sup1")%></td>
		           <td bgcolor="#FFFFF9"  align="right" class="t"><%=RsP.Fields("cm1")%></td>
		           <td bgcolor="#FFFFF9" ><%=RsP.Fields("ie1")%></td>
		           <td rowspan="2" align="left" valign="middle"> <%=RsP.Fields("justificacion")%> </td>
                   <td rowspan="2" align="left" valign="middle"> <%=RsP.Fields("TIPO_C")%> </td>
                   <td rowspan="2" align="left" valign="middle"> <%=RsP.Fields("nombre")%> </td>
                   <td rowspan="2" align="left" valign="middle"> <%=RsP.Fields("FEC_MODIFICA")%> </td>
	             </tr>
		         <tr>
		           <td align="right" bgcolor="#FFF9FA"class="t"><%=RsP.Fields("dni2")%></td>
		           <td  bgcolor="#FFF9FA"><%=RsP.Fields("ap2")%>&nbsp;<%=RsP.Fields("am2")%>&nbsp;<%=RsP.Fields("n2")%></td>
		           <td bgcolor="#FFF9FA" align="right" class="t"><%=RsP.Fields("apli2")%></td>
		           <td bgcolor="#FFF9FA" align="right" class="t"><%=RsP.Fields("sup2")%></td>
		           <td  bgcolor="#FFF9FA"align="right" class="t"><%=RsP.Fields("cm2")%></td>
		           <td bgcolor="#FFF9FA"><%=RsP.Fields("ie2")%></td>  
    <% 
		registro = registro + 1
		RsP.MoveNext
		Loop	
		RsP.close 
		Set RsP = Nothing
		%>
  </tr>
  <tr>                
                <td colspan="8" align="center"> <%=now()%></td>
                </tr>
    <tr>
            </table>
<%		 
else %>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles.</td>
                  </tr>
                </table>
<%end if%>
                