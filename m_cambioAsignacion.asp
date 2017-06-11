<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
Response.Buffer = False


varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lscargo = Request.Form("lscargo") 
lsUsuario = Request.Form("lsUsuario")
tipo = Request.Form("tipo")

if tipo=1 then 
mensaje="Rotaci&oacute;n de Rutas"
elseif tipo=2 then 
mensaje="De Titular a reserva"
elseif tipo=3 then 
mensaje="De Baja a reserva"
end if



cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)


cantvarCargoTot=len(lscargo)
nomcargo = Mid(lscargo,3,cantvarCargoTot-2)
cargo = Mid(lscargo,2)


id_Proyecto=Session("id_proyecto")

sub generaPEA1()
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getPEA1 '"&varccdd&"','"&varccpp&"','"&varccdi&"','"&cargo&"','"&id_Proyecto&"','"&tipo&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:400px"" id=""txtPEA1"" name=""txtPEA1"" onChange=""Mostrar1(this.value);"">"
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
	sql1 = " exec dbo.getPEA2 '"&varccdd&"','"&varccpp&"','"&varccdi&"','"&cargo&"','"&id_Proyecto&"','"&tipo&"'"
	
	wRsDptoapli2.CursorLocation=3
	wRsDptoapli2.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:400px"" id=""txtPEA2"" name=""txtPEA2"" onChange=""Mostrar2(this.value);"">"
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
	
 %>


                <table width='100%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
               
                    
                <tr>
                <td width="4%" rowspan="2"   align="center">N&deg;</td>
                <td colspan="4" align="center"><%=mensaje%></td>
                <td width="16%" rowspan="2"  align="center"><span class="titulo"><span class="titulo">Cambiar</span></span></td>
                </tr>
                
    <tr style="font-size:11px">
    <th width="22%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Nombre</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Ruta</th>
    <th width="6%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Total</th>
    <th width="12%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Estado Contratos</th>

    </tr>

  <tr  >
    <td height="34" class='e_td_string1'>1</td>
    <td class='e_td_string1'><%generaPEA1()%></td>
    <td class='e_td_string1' align="left"><font id="rutaA"></font></td>
    <td class='e_td_string1' align="left"><font id="totalA"></font></td>
    <td align="center"  ><font id="estadoA"></font></td>
    
    <td rowspan="2" align="center" class='e_td_string1'><img src="images/OK.gif" width="16" height="16" onclick="cambiarRuta(<%=tipo%>);" /></td>
    
  </tr>
    <tr  >
    <td height="34" class='e_td_string1'>2</td>
    <td class='e_td_string1'><%generaPEA2()%></td>
    <td class='e_td_string1' align="left"><font id="rutaB"></font></td>
    <td class='e_td_string1' align="left"><font id="totalB"></font></td>
    <td align="center"  ><font id="estadoB"></font></td>
    
    </tr>
            </table>


          

