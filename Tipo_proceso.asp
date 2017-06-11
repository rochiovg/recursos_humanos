<!-- #include file="Conexion.asp"  --> 
<% 
id_proyecto=session("id_proyecto")

Response.ContentType="text/html; charset=iso-8859-1"

varPerfil  = Session("perfil")
varPerfil_origen  = Session("perfil")
id_proyecto=Session("id_proyecto")
lsRol = CStr(Session("txtTipoUsuarioValido"))

varPerfil="01"

if varPerfil="" then
Response.Write "Sesion Terminada, Vuelva a Ingresar"
Response.End
end if 

Set wRsSup = Server.CreateObject("ADODB.Recordset")

sql=" exec dbo.PA_CARGOS_LISTAR_WELCOME '2', '"&id_proyecto&"' "
if id_proyecto = 139 and lsRol="55" then 'Solo para ednom 2016 el rol consulta 
	sql=" exec dbo.PA_CARGOS_LISTAR_WELCOME_EDNOM3 '2', '"&id_proyecto&"' "
end if

if id_proyecto = 155 and lsRol="89" then 'Solo para ednom 2016 el rol consulta 
	sql=" exec dbo.PA_CARGOS_LISTAR_WELCOME_ECE_MINEDU '2', '"&id_proyecto&"' "
end if


wRsSup.CursorLocation=3
wRsSup.Open sql, Micone,3,3
Response.Write "<b>Cargos de la Red Operativa(RO):</b>&nbsp;<select class=""e_combo3"" style=""width:450px"" id=""txttipo"" name=""txttipo""  onchange=""cargar();"">"
  			
	While not wRsSup.EOF
		Response.Write "<option value="""&wRsSup(2)&"*"& wRsSup(0)&"*"&wRsSup(3)&""">"&wRsSup(1) &"</option>"
		wRsSup.MoveNext
	Wend
	Response.Write "</select>"
	wRsSup.Close
Set wRsSup = Nothing

%>