<%@ language="vbscript" %>

<!-- #include file="Conexion.asp"       --> 

<%
	' Retorna las coordenadas por ubigeo
	tipo=request("tipo") '{dpto,prov}
	u=request("u") ' Ubigeo
	
	dim ccdd
	dim ccpp
	
	response.Write("<?xml version='1.0' encoding='iso-8859-1'?>")
	response.ContentType="text/xml; charset=iso-8859-1"
	
	if tipo="" then
		sql="exec usp_mapa "
	elseif tipo="dpto" then	
		sql="exec usp_mapa_11 '" & u & "' "
		sql2="exec usp_mapa_12 '" & u & "'"
	elseif tipo="prov" then		
		sql="exec usp_mapa_21 '" & u & "'"
		sql2="exec usp_mapa_22 '"&mid(u,1,2)&"','" & u & "'"
	else
		response.Write("<datos>")
		response.Write("</datos>")
		response.End()
	end if
	
	set rs= server.CreateObject("ADODB.recordset")
	
	'Obtener nombre de ubigeo superior	
	if tipo="" then
		' Nivel Nacional
	elseif tipo="dpto" then	
		rs.open sql2,MiCone
		departamento=rs("departamento")
	elseif tipo="prov" then
		rs.open sql2,MiCone
		departamento=rs("departamento")
		provincia=rs("provincia")
	end if
	
	response.Write("<datos>")
	'Departamento y provincia
	response.Write("<leyenda>")
	if tipo="" then
		' Nivel Nacional
	elseif tipo="dpto" then	
		response.Write("<dpto>"&departamento&"</dpto>")
	elseif tipo="prov" then
		response.Write("<dpto>"&departamento&"</dpto>")
		response.Write("<prov>"&provincia&"</prov>")
	end if
	response.Write("</leyenda>")
	
	if tipo="dpto" or tipo="prov" then
		rs.close
	end if
	
	rs.open sql,MiCone	
	if request("escala") = "ok" then
		do while not rs.eof
		response.Write("<dato>")
		response.Write("<u>" & rs("ubigeo") & "</u>") ' Ubigeo
		arreglo=split(rs("coord"),",")
		response.Write("<c><![CDATA[" )
		for i=0 to ubound(arreglo)
			response.Write( (arreglo(i) * 2) & ",")
		next
		  response.Write("]]></c>")
		response.Write("</dato>")
		rs.movenext
	loop
	else
		do while not rs.eof
		response.Write("<dato>")
		response.Write("<u>" & rs("ubigeo") & "</u>") ' Ubigeo
		response.Write("<c><![CDATA[" & rs("coord") & "]]></c>")
		response.Write("</dato>")
		rs.movenext
	loop
	end if	
	rs.close
	response.Write("</datos>")
	
	
	MiCone.close
	set MiCone=nothing
%>