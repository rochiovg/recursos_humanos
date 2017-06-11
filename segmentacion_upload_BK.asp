<!--#include file="conexion.asp"--> 
<%


id_usuario = Session("id_usuario")
id_proyecto=session("id_proyecto") 



	SQL2 = "exec dbo.PA_SEGMENTACION_GENERAL_ELIMINAR '"&id_proyecto&"' "

		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
		Set RSCuad2=Nothing
		
		
dim fs, f

Set fs=Server.CreateObject("Scripting.FileSystemObject")
Set f=fs.OpenTextFile(Server.MapPath("csv/archivoSeg_"&id_proyecto&".csv"), 1)

i=0
do while f.AtEndOfStream = false
linea = f.ReadLine

i=i+1

if i>1 then 

a= "insert into SEGMENTACION (ID_PRESUPUESTO,SEDE,CCDD,CCPP,CCDI,RUTA,TECNICO_CENSAL,REVISOR,EMPADRONADOR,DIFUSOR,brigada,JEFE_GRUPO,ANALISTA_CC,COOR_ZONAL,COOR_SEDE,COOR_SUBDISTRITAL,COOR_DIST,COOR_PROV,COOR_DEP,SUP_NACIONAL,TOTALDIAS,TOT_MOV_LOCAL,TOT_PASAJES,TOT_PASAJES_COBRO,TOT_INTERNET,TOT_TARJETAS,TOT_GAST_OPE,TOT_MEDICINAS,TOT_FOTOCOPIAS,TOTAL,PE_DIAS,PE_MOV_LOCAL,PE_PASAJES,PE_PASAJES_COBRO,PE_INTERNET,PE_TARJETAS,PE_GAS_OPE,pe_medicinas,pe_fotocopias,PE_TOTAL,SE_DIAS,SE_MOV_LOCAL,SE_PASAJES,SE_PASAJES_COBRO,SE_INTERNET,SE_TARJETAS,SE_GAST_OPE,se_medicinas,se_fotocopias,SE_TOTAL,TE_DIAS,TE_MOV_LOCAL,TE_PASAJES,TE_PASAJES_COBRO,TE_INTERNET,TE_TARJETAS,TE_GAST_OPE,te_medicinas,te_fotocopias,TE_TOTAL,CE_DIAS,CE_MOV_LOCAL,CE_PASAJES,CE_PASAJES_COBRO,CE_INTERNET,CE_TARJETAS,CE_GAST_OPE,ce_medicinas,ce_fotocopias,CE_TOTAL,QE_DIAS,QE_MOV_LOCAL,QE_PASAJES,QE_PASAJES_COBRO,QE_INTERNET,QE_TARJETAS,QE_GAST_OPE,qe_medicinas,qe_fotocopias,QE_TOTAL,SEX_DIAS,SEX_MOV_LOCAL,SEX_PASAJES,SEX_PASAJES_COBRO,SEX_INTERNET,SEX_TARJETAS,SEX_GAST_OPE,sex_medicinas,sex_fotocopias,SEX_TOTAL,SEP_DIAS,SEP_MOV_LOCAL,SEP_PASAJES,SEP_PASAJES_COBRO,SEP_INTERNET,SEP_TARJETAS,SEP_GAST_OPE,sep_medicinas,sep_fotocopias,SEP_TOTAL,OE_DIAS,OE_MOV_LOCAL,OE_PASAJES,OE_PASAJES_COBRO,OE_INTERNET,OE_TARJETAS,OE_GAST_OPE,oe_medicinas,oe_fotocopias,OE_TOTAL,NE_DIAS,NE_MOV_LOCAL,NE_PASAJES,NE_PASAJES_COBRO,NE_INTERNET,NE_TARJETAS,NE_GAST_OPE,ne_medicinas,ne_fotocopias,NE_TOTAL,region, id_proyecto ) values (''"&replace(linea,",","'',''")&"'', ''" & id_proyecto &"'')" 

RESPONSE.Write(a)
response.End()


SQL1 = "exec dbo.pa_seleccion_segmentacion '"&a&"' "


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
