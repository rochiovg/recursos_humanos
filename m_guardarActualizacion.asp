<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"

lstipo_pension= Request("lstipo_pension")
lsAFP= Request("lsAFP")
lsFecAfiliacion= Request("lsFecAfiliacion")
lsCUSSP= Request("lsCUSSP")
lsComision= Request("lsComision")
'lsBanco= Request("lsBanco")
'lsTipoCuenta= Request("lsTipoCuenta")
'lsCuenta= Request("lsCuenta")
lsBanco= ""
lsTipoCuenta= ""
lsCuenta= ""

lsIDPER= Request("lsIDPER")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")


			sql1="exec dbo.pa_ficha_actualizaAfiliacion '"&lstipo_pension&"','"&lsAFP&"','"&lsFecAfiliacion&"','"&lsCUSSP&"', '"&lsComision&"','"&lsBanco&"','"&lsTipoCuenta&"' , '"&lsCuenta&"', '"&lsIDPER&"', '"&lsidProyecto&"'"	

				Call getRS(RS, sql1)

 
%>
