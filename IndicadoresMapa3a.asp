
<%@ language="vbscript" %>
<!-- #include file="Conexion.asp"  --> 
<%

id_Proyecto=Session("id_proyecto")

	dim col(4)
	' Colores
	col(0)="FF7D7D" ' rojo  
	col(1)="0099FF" ' azul	
	col(2)="AAD98E" ' verde
	col(3)="FFF111" ' otro
	col(4)="FFFFFF" ' blanco
	'--------	
	
	' Tipo: "", recepcion, preliminar

	tipo=request("tipo") '{ , Distr, Recep, Dig, Fin, Ret}
	alcance=request("alcance") '{ , dpto,prov}
	periodo=request("periodo")
	vtipo=request("vtipo")
	tCC=request("tCC")
	
	response.Write("<?xml version='1.0' encoding='iso-8859-1'?>")
	response.Write("<datos>")
	
	dim arrayAvance1
	dim arrayAvance2
	dim arrayAvance3
	dim arrayAvance4
	dim arrayAvance5
	dim arrayAvance6
	dim arrayAvance7
	
	dim txtProc
	dim sumProcesos
	dim estado
	
	if (alcance="") then	
		response.Write("<titulo><![CDATA[" & "<b>Avance</b>" & "]]></titulo>")	
		SQLQuery1=" exec dbo.usp_Meta_mapa '"&vtipo&"', '"&id_Proyecto&"', '"&tCC&"'" 	
		
	end if
	
	
	set Rs1 = Server.Createobject("ADODB.Recordset")
	Rs1.Open SQLQuery1, MiCone
	Do While Not Rs1.Eof			
			response.Write("<dato>")
			call textoUbigeo(alcance,rs1) 'variables			
			call columna_texto(tipo,rs1,vtipo) ' Configuracion de variables, para cada poligono (Color y texto).
			' ------------------  Construir Texto -----------------
			response.Write("<texto><![CDATA[" & textoCuerpo(arrayAvance1,arrayAvance2,arrayAvance3,arrayAvance4,arrayAvance5,arrayAvance6,arrayAvance7,vtipo) & "]]></texto>")
			response.Write("<color>" & colorPoligono(arrayAvance5,arrayAvance6,estado) & "</color>")			
			response.Write("</dato>")
			Rs1.MoveNext			
	Loop	
	
	response.Write("</datos>")
	response.ContentType="text/xml; charset=iso-8859-1"
	
	Rs1.Close
	set Rs=nothing
	Micone.close
	set MiCone = nothing
	
		
	' *************************************************************	
	function textoUbigeo(alcance,rs)
		if alcance="" then
			response.Write("<nom>" & rs("nombredd") & "</nom>")
			response.Write("<u>" & rs("ccdd") & "</u>")
		end if
	end function
	
	function textoCuerpo(arrayAvance1,arrayAvance2,arrayAvance3,arrayAvance4,arrayAvance5,arrayAvance6,arrayAvance7,txtProc)
	
	    if vtipo="6" then
			nomproc="JEFE DE BRIGADA"
			elseif vtipo="7" then
			nomproc="ANALISTA DE CONTRO DE CALIDAD"
			elseif vtipo="8" then
			nomproc="REVISOR"
			elseif vtipo="9" then
			nomproc="EMPADRONADOR"
			elseif vtipo="1" then
			nomproc="DEPARTAMENTAL"
			elseif vtipo="2" then
			nomproc="PROVINCIAL"
			elseif vtipo="3" then
			nomproc="DISTRITTAL"
			elseif vtipo="4" then
			nomproc="JEFE DE GRUPO"
			elseif vtipo="7" then
			nomproc="ANALISTA DE CONTROL DE CALIDAD"
			elseif vtipo="6" then
			nomproc="JEFE DE BRIGADA"
			elseif vtipo="10" then
			nomproc="TECNICO DIFUSOR"
			elseif vtipo="11" then
			nomproc="ASIST. ADMINISTRATIVO"
			elseif vtipo="12" then
			nomproc="SUPERVISOR NACIONAL"
			elseif vtipo="13" then
			nomproc="INSTRUCTOR DEPARTAMENTAL"
			elseif vtipo="15" then
			nomproc="ACTUALIZADOR CARTOGRÁFICO "
			elseif vtipo="16" then
			nomproc="MONITOR NACIONAL"
			elseif vtipo="18" then
			nomproc="COORDINADOR DE SEDE"
			elseif vtipo="20" then
			nomproc="JEFE DE MONITOREO"
			elseif vtipo="21" then
			nomproc="JEFE DE GRUPO DE MONITOREO"
			end if
			
		cad="<table border=1 cellpadding=1 id=tabla4  cellspacing=1 width=100% >"
		cad=cad & "<tr  bgcolor=AliceBlue style=font-weight:bold ><td colspan=6 >"&nomproc&"</td></tr>"
		cad=cad & "<tr><td align=center >Total<br>Inscritos</td><td align=center >Total <br>Aprobaron CV</td><td align=center >Total Aprobaron<br>Conoc. y Comp.</td><td align=center >Total<br>Aprob. Entrev.</td><td align=center >Total<br>Seleccionados</td><td align=center >Meta<br>Selecci&oacute;n</td><td align=center >Total<br>Faltantes</td></tr>"
		
		for i=0 to ubound(arrayAvance1)
			cad = cad & "<tr align=right >"
			cad = cad & "<td align=center >" & arrayAvance1(i) & "&nbsp;</td>"
			cad = cad & "<td align=center >" & arrayAvance2(i) & "&nbsp;</td>"
			cad = cad & "<td align=center >" & arrayAvance3(i) & "&nbsp;</td>"
			cad = cad & "<td align=center >" & arrayAvance4(i) & "&nbsp;</td>"
			cad = cad & "<td align=center >" & arrayAvance5(i) & "&nbsp;</td>"
			cad = cad & "<td align=center >" & arrayAvance6(i) & "&nbsp;</td>"
			cad = cad & "<td align=center >" & arrayAvance7(i) & "&nbsp;</td>"
			cad = cad & "</tr>"
		next
		
		cad=cad & "</table>"
		textoCuerpo=cad
	end function
	
	
	function colorPoligono(arrayAvance5,arrayAvance1,estado)
	
		sumMeta=0
		sumAvance=0
		sumestado=0


		for i=0 to  ubound(arrayAvance5)
		sumMeta=sumMeta + arrayAvance5(i)
		next

			
		for i=0 to  ubound(arrayAvance1)

			sumAvance=sumAvance + arrayAvance1(i)
			sumestado=sumestado + estado(i)
		next
		
		if sumestado>0 then
			if sumAvance=0 then
				colorPoligono=4 ' No iniciado (Rojo)
			elseif sumAvance=sumMeta then
				colorPoligono=2 ' Finalizado (Verde)
			elseif sumAvance<=sumMeta then
				colorPoligono=3
			else
				colorPoligono=1 ' Iniciado (Azul)
			end if
	    else
	    	  colorPoligono=0 ' Iniciado (blanco)
	    end if
		
	end function
	
	' Nombre de columna y texto.
function columna_texto(tipo,rs,vtipo)

		if tipo="" then	
		
					
			if vtipo="6" then
			nomproc="JEFE DE BRIGADA"
			elseif vtipo="7" then
			nomproc="ANALISTA DE CONTRO DE CALIDAD"
			elseif vtipo="8" then
			nomproc="REVISOR"
			elseif vtipo="9" then
			nomproc="EMPADRONADOR"
			elseif vtipo="1" then
			nomproc="DEPARTAMENTAL"
			elseif vtipo="2" then
			nomproc="PROVINCIAL"
			elseif vtipo="3" then
			nomproc="DISTRITTAL"
			elseif vtipo="4" then
			nomproc="JEFE DE GRUPO"
			elseif vtipo="7" then
			nomproc="ANALISTA DE CONTROL DE CALIDAD"
			elseif vtipo="6" then
			nomproc="JEFE DE BRIGADA"
			elseif vtipo="10" then
			nomproc="TECNICO DIFUSOR"
			elseif vtipo="11" then
			nomproc="ASIST. ADMINISTRATIVO"
			elseif vtipo="12" then
			nomproc="SUPERVISOR NACIONAL"
			elseif vtipo="13" then
			nomproc="INSTRUCTOR DEPARTAMENTAL"
			elseif vtipo="15" then
			nomproc="ACTUALIZADOR CARTOGRÁFICO "
			elseif vtipo="16" then
			nomproc="MONITOR NACIONAL"
			elseif vtipo="18" then
			nomproc="COORDINADOR DE SEDE"
			elseif vtipo="20" then
			nomproc="JEFE DE MONITOREO"
			elseif vtipo="21" then
			nomproc="JEFE DE GRUPO DE MONITOREO"			
			end if
		   	
			arrayAvance1=Array(rs("total")) 
			arrayAvance2=Array(rs("totalaptos"))
			arrayAvance3=Array(rs("totalCC"))
			arrayAvance4=Array(rs("totalEnt"))
			arrayAvance5=Array(rs("seleccionado"))
			arrayAvance6=Array(rs("meta"))
			arrayAvance7=Array(rs("faltantes"))
			
			estado=Array(rs("estado"))
			txtProc=Array(nomproc)
		end if
end function
	
function porcentaje(meta,avance)
		if (isnull(meta) or meta=0) then
			porcentaje= 0.0
		else
			porcentaje=formatnumber(100*avance/meta,1)
		end if
end function

%>


