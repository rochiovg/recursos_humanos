<%
Dim Miconemenu ,cnnmenu ,sConnStringmenu,cadmenu
'Set Micone = Server.CreateObject("ADODB.Connection") 
Set cnnmenu = Server.CreateObject("ADODB.Connection")

'-------------------CONEXION DE RECLUTAMIENTO
 
'-------------------PRODUCCION
'cnn.Open    "Provider=SQLOLEDB.1;Password=nU6&beTRi;Persist Security Info=True; User ID=us_inei_bdrrhh_consecucion;Initial Catalog=INEI_BDRRHH_CONSECUCION;Data Source=vm-yanawara"
'cad = "Provider=SQLOLEDB.1;Password=nU6&beTRi;Persist Security Info=True; User ID=us_INEI_BDRRHH_CONSECUCION;Initial Catalog=INEI_BDRRHH_CONSECUCION;Data Source=vm-yanawara "
 

'--------------------DESARROLLO
cnnmenu.Open    "Provider=SQLOLEDB.1;Password=inei0304;Persist Security Info=True; User ID=rvila;Initial Catalog=INEI_BDRRHH_CONSECUCION_CENSO;Data Source=172.18.1.41"
cadmenu= "Provider=SQLOLEDB.1;Password=inei0304;Persist Security Info=True; User ID=rvila;Initial Catalog=INEI_BDRRHH_CONSECUCION_CENSO;Data Source=172.18.1.41"
 
 
'Micone.open "Provider=SQLOLEDB.1;Password=nU6&beTRi;Persist Security Info=True; User ID=us_inei_bdrrhh_consecucion;Initial Catalog=INEI_BDRRHH_CONSECUCION;Data Source=YANAWARA"
'Micone.open "Provider=SQLOLEDB.1;Password=inei1202;Persist Security Info=True; User ID=rvila;Initial Catalog=INEI_BDRRHH_CONSECUCION;Data Source=192.168.200.250"


Set Miconemenu= Server.CreateObject("ADODB.Connection")
Miconemenu.ConnectionString = cadmenu
Miconemenu.open


%> 
