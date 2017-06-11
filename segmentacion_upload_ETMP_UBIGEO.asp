<!--#include file="conexion.asp"--> 
<%


id_usuario = Session("id_usuario")
id_proyecto=session("id_proyecto") 



	SQL2 = "exec dbo.PA_ETMP_GENERAL_ELIMINAR_UBIGEO '"&id_proyecto&"' "

		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
		Set RSCuad2=Nothing
		
		
dim fs, f

Set fs=Server.CreateObject("Scripting.FileSystemObject")
Set f=fs.OpenTextFile(Server.MapPath("csv/archivoEtmp_"&id_proyecto&".csv"), 1)

i=0
do while f.AtEndOfStream = false
linea = f.ReadLine

i=i+1

if i>1 then 

a= "insert into ESTADOS_TEMPORAL_UBIGEO ( ID_PROYECTO, dni, CCDD,CCPP,CCDI) values (''"&replace(linea,",","'',''")&"'')" 



SQL1 = "exec dbo.pa_seleccion_etmp '"&a&"' "


		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3

end if
'next
loop

f.Close
Set f=Nothing
Set fs=Nothing

response.write("Se actualizó todos los registros")

Set RSCuad=Nothing

%>
