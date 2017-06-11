<%@ Language=VBScript %>
 <%session.lcid=2057%>
<!--#include file="conexion.asp"--> 
<%Response.ContentType="text/html; charset=iso-8859-1"

Response.Expires = 0

texto=request("dni")
id_proyecto=request("id_proyecto")



Dim objFSO
Set objFSO = CreateObject("Scripting.FileSystemObject")


'if objFSO.FileExists("\\192.168.201.225\imagenes\CCRRHH\"&id_proyecto&"\"&texto&"_1.pdf" ) then 

if objFSO.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&texto&"_1.pdf" ) then 

	aa=1		
else 
	aa=0 
end if     
	   


Dim objFSO2
Set objFSO2 = CreateObject("Scripting.FileSystemObject")

		
'if objFSO2.FileExists("\\192.168.201.225\imagenes\CCRRHH\"&id_proyecto&"\"&texto&"_2.pdf" ) then 

if objFSO.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&texto&"_2.pdf" ) then 

    bb=1
else 
	bb=0
 end if   
	   
	   
Dim objFSO3
Set objFSO3 = CreateObject("Scripting.FileSystemObject")

		
'if objFSO.FileExists("\\192.168.201.225\imagenes\CCRRHH\"&id_proyecto&"\"&texto&"_3.pdf" ) then 

if objFSO.FileExists("\\srv-fileserver\imagenes\CCRRHH\"&id_proyecto&"\"&texto&"_3.pdf" ) then 
	cc=1
else 
	cc=0
    
end if  

%>

<!DOCTYPE html>
<html lang="en">
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/non-responsive.min.css" rel="stylesheet">
        <link href="css/bootstrap-universidad.min.css" rel="stylesheet">
    
    
    </head>
    <body onLoad="cargarDNI()">
   <form ENCTYPE="multipart/form-data" name="frmMisArchivos" id="frmMisArchivos" METHOD="POST" ACTION="recibir_archivo.asp">      <!-- Fixed navbar -->
                    <div class="col-xs-12 espace-top " style="width:95%">
                         
                        <table class="table table-bordered table-det-web delpmbottom"  width="90%">
                            <thead>
                                <tr>
                                    <th colspan="4"> 
                                    Curriculum Vitae 
                                      <input type="hidden" name="id_proyectoA" id="id_proyectoA" value="0">
                                      <input type="hidden" name="txtDNIA" id="txtDNIA" value="0">
                                      <input type="hidden" name="a11" id="a11" value="<%=aa%>">
                                      <input type="hidden" name="a22" id="a22" value="<%=bb%>">
                                      <input type="hidden" name="a33" id="a33" value="<%=cc%>">
                                      <input type="hidden" name="NomArchivo" id="NomArchivo" value="">
                                      <input type="hidden" name="id_convocatoria" id="id_convocatoria" value="">
                                      <input type="hidden" name="NumA" id="NumA" value="0">
                                    <input type="hidden" name="archivActual" id="archivActual" value=""></th>
                                </tr>

                            </thead>
                            <tbody>
                                <tr>
                                    <td><div style="width:800px">Adjuntar DNI:</div></td>
                                  <td  >
                                  <label class="btn btn-primary ">
Seleccione Archivo<span>
<input type="file" id="file2" name="file2" />
</span>
</label>
<input type="text" id="url-archivo2" />  
</td>
                                  <td  ><img src="images/guardar.jpg" width="50" height="50" alt="" border="0" style="CURSOR: hand" onClick="validaArchivo('2')" /></td>
                                    <td ><img src="images/Lupa.png" width="50" height="50" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('2')" /></td>
                                </tr>

                                <tr>
                                    <td>Adjuntar formaci&oacute;n Acad&eacute;mica: (T&iacute;tulo, Bachiller, constancias de estudios, etc)</td>
                                    <td><label class="btn btn-primary ">
Seleccione Archivo<span>
<input type="file" id="file3" name="file3" />
</span>
</label>
<input type="text" id="url-archivo3" />
                                    </td>
                                    <td><img src="images/guardar.jpg" width="50" height="50" alt="" border="0" style="CURSOR: hand" onClick="validaArchivo('3')" /></td>
                                  <td><img src="images/Lupa.png" width="50" height="50" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('3')" /></td>
                                </tr>

                                <tr>
                                    <td>Adjuntar experiencia Laboral (constancias o certificados de trabajo) y capacitaci&oacute;n (Certificados o Diplomas de Capacitaci&oacute;n)</td>
                                    <td>
                                      <label class="btn btn-primary ">
Seleccione Archivo<span>
<input type="file" id="file1" name="file1" />
</span>
</label>
<input type="text" id="url-archivo1" />
                                    </td>
                                    <td><img src="images/guardar.jpg" width="50" height="50" alt="" border="0" style="CURSOR: hand" onClick="validaArchivo('1')" /></td>
                                  <td><img src="images/Lupa.png" width="50" height="50" alt="" border="0" style="CURSOR: hand" onClick="javascript:ver_cv('1')" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
<div id="dialog" title="ALERTA">
<p id="mensaje"> </p>
</div></form>

        <!-- /container -->
        <script src="js/jquery-1.11.0.min.js"></script>
        <link rel="stylesheet" href="css/jquery-ui.css" />
		<script src="js/jquery-1.9.1.js"></script>
        <script src="js/jquery-ui.js"></script>
        
        <script type="text/javascript" src="js/funciones.js?id=<%now()%>"></script>
        <script type="text/javascript">
$(document).ready(function() {
	$('#file1').change(function(){
		$('#url-archivo1').val($(this).val());
	});
});

$(document).ready(function() {
	$('#file2').change(function(){
		$('#url-archivo2').val($(this).val());
	});
});
$(document).ready(function() {
	$('#file3').change(function(){
		$('#url-archivo3').val($(this).val());
	});
});


$(function () {
	$("#dialog").dialog({
	autoOpen: false,
	modal: true,
		buttons: {
			"Cerrar": function () {
			$(this).dialog("close");
			}
		}
	});
});

        </script>
        
<style>

	input[type="file"]{
		z-index: 999;
		line-height: 0;
		font-size: 4px;
		position: absolute;
		opacity: 0;
		filter: alpha(opacity = 0);-ms-filter: "alpha(opacity=0)";
		margin: 0;
		padding:0;
		left:0;
	}
	
</style>          
    </body> 
</html>