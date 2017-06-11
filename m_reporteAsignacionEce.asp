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


id_proyecto=Session("id_proyecto")
lsRol = Session("txtTipoUsuarioValido")

varccdd= Request("lsDPTO")
varccpp = Request("lsPROV")
varccdi = Request("lsDIST")
cargo = Request("lscargo") 
nivel = Request("lsnivel")
tipo = Request("tipo")


varccpp = Mid(varccpp,4,2)
varccdi = Mid(varccdi,6,2)

consulta1 = "exec dbo.pa_listar_asignacion_eceNac  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '" & id_proyecto & "', '" & nivel & "' "

if tipo=1 then 

		consulta1 = "exec dbo.pa_listar_asignacion_ece  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '" & id_proyecto & "', '" & nivel & "' "

end if

if tipo=3 then 
	consulta1 = "exec dbo.pa_listar_ruteo_eceNac  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '" & id_proyecto & "', '" & nivel & "' "
end if					
	
	
	
	
	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
	
		
	  If  Not RsP.BOF And Not RsP.EOF Then 
            
        If lscargo<>"0"    then  %>
<style type="text/css">
.titulo {
	text-align: right;
}
</style>

                <table width='100%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
               
                    
                <tr>
                
                <td colspan="17" align="left">ASIGNACIÓN DE RUTAS<span class="titulo"><span class="titulo"></span></span></td>
                </tr>
    <tr style="font-size:11px">
    <th width="4%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">N&deg;</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Cod. Sede Regional</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Sede Regional</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Cod. Sede Provincial</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Sede Provincial</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Cod. Sede Distrital</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Sede Distrital</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DNI</th>
    <th width="19%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Nombre </th>
    <th width="19%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Nota Cap. </th>
    <th width="6%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Tipo Operativo</th>
       <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Tipo Cargo</th>
    <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">COD. APLICADOR</th>
    <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">COD. A. SUP.</th>
    <th width="12%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">COD. MODULAR</th>
    <th width="12%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">IE</th>
    <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Pasajes</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Movilidad</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Gastos Op.</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Bonificaci&oacute;n</th>
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
  <tr class='<%=clase%>'>
    <td height="34" class='e_td_string1'><%response.Write(cont)%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("COD_SEDE_REG")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("sede_region")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("COD_SEDE_PROV")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("sede_provincia")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("COD_SEDE_DISTRITAL")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("sededistrital")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("dni")%>&nbsp;</td>
    <td class='e_td_string1' align="left"><%=RsP.Fields("nombres")%>&nbsp;</td>
    <td class='e_td_string1' align="left"><%=RsP.Fields("notacap")%>&nbsp;</td>
    <td class='e_td_string1' align="left"><%=RsP.Fields("tipo_operativo")%></td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("desc_cargo")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("codigo_cargo")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("codigo_cargo_A")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("cod_modular")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("nom_ie")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("pasaje_1")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("movilidad_1")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("gasto_operativo_1")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("bonificacion_1")%></td>    
    <% 
		registro = registro + 1
		RsP.MoveNext
		Loop	
		RsP.close 
		Set RsP = Nothing
		%>
  </tr>
            </table>
<%end if
		 
else %>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles.</td>
                  </tr>
                </table>
                
		<% end If %>
          

