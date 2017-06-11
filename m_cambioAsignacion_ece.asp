<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
Response.Buffer = False

varccdd= Request.Form("lsDPTO")
varccpp = Request.Form("lsPROV")
varccdi = Request.Form("lsDIST")
cargo = Request.Form("lscargo") 
nivel = Request.Form("lsnivel")
valor = Request.Form("tipo")
tipoRot = Request.Form("tipoRot")

varccpp = Mid(varccpp,4,2)
varccdi = Mid(varccdi,6,2)

id_Proyecto=Session("id_proyecto")


if tipo=1 then 
	mensaje="Entre Titulares"
elseif tipo=2 then 
	mensaje="De Titular a reserva"
end if


sub motivoCambio()
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.pa_listar_cambiosRutas "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select "& varvisualiza &" class=""e_combo"" style=""width:200px"" id=""txtCambio"" name=""txtCambio"" >"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ title=""" & wRsDptoapli(1) & """ >" &wRsDptoapli(2) & "</option>"

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5""></span>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaPEA1()
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.pa_pea_rotacion_ece1 '"&varccdd&"','"&varccpp&"','"&varccdi&"','"&cargo&"','"&tipoRot&"', '"&nivel&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select "& varvisualiza &" class=""e_combo"" style=""width:400px"" id=""txtPEA1"" name=""txtPEA1"" onChange=""Mostrar1(this.value);"">"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5""></span>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

	
sub generaPEA2()
			
	Set wRsDptoapli2 = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.pa_pea_rotacion_ece2 '"&varccdd&"','"&varccpp&"','"&varccdi&"','"&cargo&"','"&tipoRot&"', '"&nivel&"' "
	
	wRsDptoapli2.CursorLocation=3
	wRsDptoapli2.Open sql1, Micone,3,3
	
	Response.Write "<select "& varvisualiza &" class=""e_combo"" style=""width:400px"" id=""txtPEA2"" name=""txtPEA2"" onChange=""Mostrar2(this.value);"">"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli2.EOF
	
		Response.Write "<option value=""" & wRsDptoapli2(0) & """>" &wRsDptoapli2(1) & "</option>"

		wRsDptoapli2.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5""></span>"
	wRsDptoapli2.Close
	Set wRsDptoapli2 = Nothing
	
End sub	


consulta2 = "exec dbo.pa_verificar_cierreRutas_ece  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "' , '" & nivel & "'"
		
			
	Set RsP2 = Server.CreateObject("ADODB.Recordset")
			RsP2.cursorlocation=3
			RsP2.Open consulta2, MiCone, 3,3

			  if Not RsP2.BOF And Not RsP2.EOF Then 
			  cierre=RsP2.Fields("cierre")
			  else 
			  cierre=0
			  end if 
			  
		RsP2.close 
		Set RsP2 = Nothing



if cierre>0 then
varvisualiza="disabled=""disabled"""
else 
varvisualiza=" "
end if


response.Write(cierre)

	
 %>


                <table width='100%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
               
               <tr>
               <td colspan="8">&nbsp;</td>
                </tr>    
                <tr>
                <td width="4%" rowspan="2"   align="center">N&deg;</td>
                <td colspan="5" align="center"><%=mensaje%></td>
                <td width="16%" rowspan="2"  align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato"><span class="titulo"><span class="titulo">Motivo Cambio</span></span></td>
                <td width="16%" rowspan="2"  align="center" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato"><span class="titulo"><span class="titulo">Cambiar</span></span></td>
                </tr>
                
                
    <tr style="font-size:11px">
    <th width="60%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Combos Rutas</th>
    <th width="15%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Persona</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Ruta</th>
    <th width="15%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >IE</th>
    
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >TOTAL</th>

    </tr>

  <tr  >
    <td height="34" class='e_td_string1'>1</td>
    <td class='e_td_string1'><%generaPEA1()%></td>
    <td class='e_td_string1' align="left"><font id="personaA"></font></td>
    <td class='e_td_string1' align="CENTER"><font id="rutaA"></font></td>
    <td align="LEFT"  ><font id="ieA"></font></td>
    <td align="center"  ><font id="totalA"></font></td>
    
    <td rowspan="2" align="center" class='e_td_string1'> <% motivoCambio()%></td>
    <td rowspan="2" align="center" class='e_td_string1'>
    <% if cierre=0 then%>
    <img  src="images/OK.gif" width="16" height="16" onclick="cambiarRuta(<%=tipo%>);" />
    <%else%>
    <img  src="images/OK2.gif" width="16" height="16"  /></td>
    <%end if%>
  </tr>
    <tr  >
    <td height="34" class='e_td_string1'>2</td>
    <td class='e_td_string1'><%generaPEA2()%></td>
    <td class='e_td_string1' align="left"><font id="personaB"></font></td>
    <td class='e_td_string1' align="CENTER"><font id="rutaB"></font></td>
    <td align="LEFT"  ><font id="ieB"></font></td>
    <td align="center"  ><font id="totalB"></font></td>
    
    </tr>
            </table>


          

