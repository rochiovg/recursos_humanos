<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  -->
 <style> 
 .t {mso-number-format:"\@";}
 </style> 
<%

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"
	
lsUsuario = Request.Form("lsUsuario")		
	
		SQL1 = "exec dbo.PA_OBSERVADOS_ECE_LISTAR "
		
			
		Set RS3	= Server.CreateObject("ADODB.Recordset") 	
		RS3.cursorlocation=3
		RS3.Open SQL1, MiCone, 3,3
		
If Not RS3.BOF And Not RS3.EOF Then

	%>	
    <form Id="frmMANTE_Proc" name="frmMANTE_Proc" method="post" action="m_observados_ece.asp"> 
    

<%
	'actualizamos numero de pagina
	If Request.Form("pag")<>"" Then 
		Pag=Request.Form("pag")
	Else
		Pag=1
	End If

	num_registros = 20 
	'Dimensionamos las paginas y determinamos la pagina actual
	If RS3.RecordCount > 0 Then 
		RS3.PageSize=num_registros
		RS3.AbsolutePage=Pag
	End If 
	%>
    
    <script language="javascript"> 


function CambioPag()
{		
	document.frmMANTE_Proc.submit(); 
} 

</script> 


		<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
        <tr>
                  <td colspan="16" align="center"><span class="titulo">
                  
                  <table border="0" width="95%" align="center" cellpadding="0" cellspacing="0"> 
		<tr ><td align="right" Class="e_td_string1" width="100%">
             P&aacute;gina:&nbsp; 
			<select name="pag" onChange="CambioPag()" style="width:40;">
			<%i=0 
			While i<RS3.PageCount 
				i=i+1%>
				<option value="<%=i%>" <%If cint(Pag) = cint(i) Then%>Selected<%End If%>><%=i%></option>
			<%Wend%> 
		    </select>&nbsp;/&nbsp;<b><%=RS3.PageCount%></b>&nbsp;<br>&nbsp;    
			    Total Registros:&nbsp;<b><%=RS3.RecordCount%></b>&nbsp;(<%=RS3.PageSize%>&nbsp;Reg. por P&aacute;gina)
          </td> 
		</tr> 
	</table> 
    
                  </td>
          </tr>
        
       <tr>
                  <td colspan="16" align="center"><span class="titulo">REPORTE DE OBSERVADOS</span></td>
          </tr>
				<tr><span style="text-align:justify"> </span>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro</th>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" style="width:25%">Apellidos Y nombres</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3"  style="width:8%">DNI</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3"  style="width:40%">Observaci&oacute;n</th>             		
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3"  style="width:10%">Responsable</th>
					
  
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3"  style="width:10%">Proyecto</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3"  style="width:10%">A&ntilde;o</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3"  style="width:10%">Estado</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Editar</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Registrar</th>
         
          </tr>
		  <%registro = 0					
							
			registro = (cint(Pag) * num_registros) -  num_registros
			
			'registro = 0		
            'Do While Not RS3.EOF
			registros_mostrados = 0 
			Do While  (Not RS3.eof And registros_mostrados < num_registros)
		   registros_mostrados = registros_mostrados +1
			
			
            registro = registro + 1 	
			
				%>
		<tr class='<%=clase%>'>
        
        						
        
        
				  <td class='e_td_string1'><%response.Write(registro)%></td>
				  <td class='e_td_string1'>&nbsp;<%=RS3.Fields("APE_NOM")%></td>
				  <td class='e_td_string1'><%=RS3.Fields("DNI")%></td>
				  <td class='e_td_string1'><%=RS3.Fields("OBSERVACIONES")%></td>              
				  <td class='t'><%=RS3.Fields("responsable_ob")%></td>

           <td  class='e_td_string1'><%=RS3.Fields("desc_PROYECTO")%></td>
<td  class='e_td_string1'><%=RS3.Fields("annio")%></td>
<td  class='e_td_string1'><%=RS3.Fields("desc_estado")%></td>
<td  class='e_td_string1'>&nbsp;</td>
<td  class='e_td_string1'>&nbsp;</td>

          </tr>
     
		<%
			RS3.MoveNext
            Loop	
            RS3.close 
            Set RS3 = Nothing 
            %>
 
          <tr>
                
                <td colspan="16" align="right"><p>FECHA Y HORA: <%= Now() %>&nbsp;</p></td>
                </tr>
                
		</table>
		
<%else%>
<span class="titulo"><%=REPORTE%></span>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if %>

