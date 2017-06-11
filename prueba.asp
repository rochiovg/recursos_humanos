<table cellspacing="0" cellpadding="0">
  <tr>
    <th align="center" valign="center"  rowspan="2">UBIGEO</th>
    <th align="center" valign="center"  rowspan="2">DEPARTAMENTO</th>
    <th align="center" valign="center"  rowspan="2">PROVINCIA</th>
    <th align="center" valign="center"  rowspan="2">DISTRITO</th>
    <th align="center" valign="center"  rowspan="2">CENTRO POBLADO</th>
    <th align="center" valign="center"  rowspan="2">CONGLOMERADO</th>
    <th align="center" valign="center"  rowspan="2">VIVIENDA</th>
    <th align="center" valign="center"  rowspan="2">RESULTADO DEL CUESTIONARIO DEL HOGAR</th>
    <th align="center" valign="center"  rowspan="2">EQUIPO</th>
    <th align="center" valign="center"  rowspan="2">ESTADO</th>
    <th align="center" valign="center"  colspan="3">DATOS GPS REGISTRO</th>
    <th align="center" valign="center"  colspan="3">DATOS  GPS ENCUESTA</th>
    <th align="center" valign="center"  rowspan="2">MAPA</th>
  </tr>
  <tr>
    <th align="center" valign="center" >LONGITUD</th>
    <th align="center" valign="center" >LATITUD</th>
    <th align="center" valign="center" >ALTURA</th>
    <th align="center" valign="center" >LONGITUD</th>
    <th align="center" valign="center" >LATITUD</th>
    <th align="center" valign="center" >ALTURA</th>
  </tr>
</table>


<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%



	SQLContCapac = "EXEC dbo.pa_PRUEBA "
	
	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	
	
	set wRsDataCapc=nothing 



response.Write("Se realizó la inserción de prueba con exito")

 %>






