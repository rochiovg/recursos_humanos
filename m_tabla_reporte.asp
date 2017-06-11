<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
   
  id_cc = Request.Form("id_cc")
  ccdd = Request.Form("ccdd")
  ccpp = Request.Form("ccpp")
  ccdi = Request.Form("ccdi")
  zona = Request.Form("zona")
  seccion = Request.Form("seccion")
  
	consulta1 = "EXEC dbo.pa_ficha_cobertura_listar '"&id_cc&"', '"&ccdd&"', '"&ccpp&"', '"&ccdi&"', '"& zona &"', '"& seccion &"' "  
	
	Set RsP = Server.CreateObject("ADODB.Recordset")
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3

	If  Not RsP.BOF And Not RsP.EOF Then
	
%>
<script language="javascript">
	$(document).ready(function() {
    $('#example').DataTable( {
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false
    } );
	} );

</script>

	<!-- Scrollable datatable -->
<html>
	<head>
    <script src="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	</head>
  <!-- <table id="example" class="display" cellspacing="0" width="100%"> -->
	<table class="display" width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#DAE8F3">
  
  	<thead>
    	<tr bgcolor="#DAE8F3" style="text-align:center">
      	<th align="center" width="4%">Nro.</th>
        <th align="center" width="7%">DNI</th>
        <th align="center" width="17%">Apellidos y Nombres</th>
        <th align="center" width="21%">Nivel/Grado Académico</th>
        <th align="center" width="21%">Profesión</th>
        <th align="center" width="14%">Correo</th>
        <th align="center" width="8%">Teléfono</th>
        <th align="center" width="8%">Celular</th>
        <!--
        <th>Tipo Vía</th>
        <th>Vía</th>
        <th>Puerta</th>
        <th>Dpto.</th>
        <th>Piso</th>
        <th>Interior</th>
        <th>Manzana</th>
        <th>Lote</th>
        <th>Km.</th>
        -->
      </tr>
    </thead>
    
    <tbody>
		<%registro = 0					
      Do While Not RsP.EOF
        If registro Mod 2 = 0 Then
          clase = "e_tr_even"
        Else
          clase = "e_tr_odd"
        End If	
        
        cont = registro+1 
    %>
      <tr>
        <td align="center"><%=cont%></td>
        <td align="center"><%=RsP.Fields("dni")%></td>
        <td><%=RsP.Fields("apellidos")%></td>
        <td><%=RsP.Fields("nivel_grado")%></td>
        <td><%=RsP.Fields("profesion")%></td>
        <td><%=RsP.Fields("correo")%></td>
        <td><%=RsP.Fields("telefono")%></td>
        <td><%=RsP.Fields("celular")%></td>
        <!--
        <td><%'=RsP.Fields("tipoVia")%></td>
        <td><%'=RsP.Fields("DireccionNombreVia")%></td>
        <td><%'=RsP.Fields("DireccionPuerta")%></td>
        <td><%'=RsP.Fields("Direcciondepa")%></td>
        <td><%'=RsP.Fields("DireccionPiso")%></td>
        <td><%'=RsP.Fields("DireccionInterior")%></td>
        <td><%'=RsP.Fields("DireccionManzana")%></td>
        <td><%'=RsP.Fields("DireccionLote")%></td>
        <td><%'=RsP.Fields("DireccionKm")%></td>
        -->
      </tr>
		<% 
    		registro = registro + 1
      	RsP.MoveNext
      Loop	
      
			RsP.close 
		%>
    </tbody>
  </table>
<!-- /scrollable datatable -->

<%else 
  	response.Write("No hay registros")
	end If
%>

</html>
