<!--#include file="conexion.asp"--> 
<%


id_usuario = Session("id_usuario")
id_proyecto=session("id_proyecto") 

id_convocatoriacargo = Request("id_convocatoriacargo")



	SQL2 = "exec dbo.PA_ETMP_fichas_GENERAL_ELIMINAR '"&id_proyecto&"' , "&id_usuario
	
'	response.write(sql2) 

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

'
if i>1 then 

a= "insert into ESTADOS_TEMPORAL_FICHAS ( ID_PROYECTO, APE_PAT_PER, APE_MAT_PER, NOM_EMP_PER, LIBR_ELEC_PER, OTRO_DOCU_PER, FEC_NAC_PER, SEXO_EMP, [EST CIVIL], TIPO_VIA, ID_TVIA, NOMB_VIA_PER, NUME_DIRE_PER, DIST_POSTULA, UBI_POST, ZONA, SECCION, PAIS_NAC, ID_PAIS_NAC, DIST_NAC, UBI_NAC, NUM_TEL_PER, NUM_CEL_PER, NIVEL, ID_NIVEL, GRADO, ID_GRADO, PROFESION, ID_PROFESION, bandaprob, preseleccionado, capacita, seleccionado, sw_titu, id_usuario, fec_reg) values ("&id_proyecto&",''"&replace(linea,",","'',''")&"''"&","&id_usuario&", getdate())" 



'response.write(a)


SQL1 = "exec dbo.pa_seleccion_etmp_fichas '"&a&"' "


		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3






end if
'next
loop

f.Close
Set f=Nothing
Set fs=Nothing





	SQL3 = "exec dbo.pa_verificar_ETMP_fichas '"&id_proyecto&"' , "&id_usuario


		Set RSCuad3= Server.CreateObject("ADODB.Recordset") 	
		RSCuad3.cursorlocation=3
		RSCuad3.Open SQL3, MiCone, 3,3
		Set RSCuad3=Nothing



response.write("Se actualizó todos los registros")

Set RSCuad=Nothing

%>
