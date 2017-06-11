<!--#include file="conexion.asp"--> 
<!--#include file="utilidades/clsUpload.asp"-->
<%
Server.ScriptTimeout = 3800 
Response.Expires = 0
Response.Buffer = true 
Response.Flush 


id_usuario = Session("id_usuario")

id_proyecto=session("id_proyecto") 
cboReporte=request.form("cboReporte")
lsCargo=request.form("lsCargo")
txtConvocartoria=request.form("txtConvocartoria")

lsCargo=mid(lsCargo,2)


	SQL2 = "exec dbo.pa_SELECCION_GENERAL_ELIMINAR '"&id_proyecto&"', '" &cboReporte& "', '" &txtConvocartoria&" ' "
	
	
		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
		Set RSCuad2=Nothing
		
		
dim fs, f

Set fs=Server.CreateObject("Scripting.FileSystemObject")

set f=fs.OpenTextFile(Server.MapPath("csv/archivo_"&id_proyecto&".csv"), 1)

i=0
do while f.AtEndOfStream = false
linea = f.ReadLine

i=i+1

if i>1 then 

a= "insert into seleccion_general (ODEI,DNI, ID_PRESUPUESTO, ID_CONVOCATORIACARGO,proceso,id_usuario,fecha_reg, id_proyecto) values (''"&REPLACE(replace(linea,",","'',''"),";","'',''")&"'',''"&lsCargo&"'',''"&txtConvocartoria&"'',''"&cboReporte&"''  ,''"&id_usuario&"'',getdate(), "&id_proyecto&")"


SQL1 = "exec dbo.pa_seleccion_insertar '"&a&"', '"&id_proyecto&"', '"&cboReporte&"', '" &txtConvocartoria& "' "


		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3

end if
'next
loop

f.Close
Set f=Nothing
Set fs=Nothing


SQL2 = "exec dbo.pa_seleccion_validar '"&id_proyecto&"', '"&cboReporte&"', '" &txtConvocartoria& "' "



		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
	
Set RSCuad2=Nothing
Set RSCuad=Nothing

response.write("SE ACTUALIZ&Oacute; TODOS LOS REGISTROS")

%>
