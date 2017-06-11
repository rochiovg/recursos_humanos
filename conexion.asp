<%
Dim Micone ,cnn ,sConnString,cad
'Set Micone = Server.CreateObject("ADODB.Connection") 
Set cnn = Server.CreateObject("ADODB.Connection")

'-------------------CONEXION DE RECLUTAMIENTO
 
'-------------------PRODUCCION
cnn.Open    "Provider=SQLOLEDB.1;Password=nU6&beTRi;Persist Security Info=True; User ID=us_inei_bdrrhh_consecucion;Initial Catalog=INEI_BDRRHH_CONSECUCION_CENSO;Data Source=192.168.203.160"
cad = "Provider=SQLOLEDB.1;Password=nU6&beTRi;Persist Security Info=True; User ID=us_INEI_BDRRHH_CONSECUCION;Initial Catalog=INEI_BDRRHH_CONSECUCION_CENSO;Data Source=192.168.203.160"

'-------------------41
'cnn.Open    "Provider=SQLOLEDB.1;Password=B*C8akuvEd;Persist Security Info=True; User ID=rvila;Initial Catalog=TMP_INEI_BDRRHH_CONSECUCION_CENSO;Data Source=172.18.1.41"
'cad = "Provider=SQLOLEDB.1;Password=B*C8akuvEd;Persist Security Info=True; User ID=rvila;Initial Catalog=TMP_INEI_BDRRHH_CONSECUCION_CENSO;Data Source=172.18.1.41"

'--------------------DESARROLLO
'cnn.Open    "Provider=SQLOLEDB.1;Password=inei1202;Persist Security Info=True; User ID=rvila;Initial Catalog=INEI_BDRRHH_CONSECUCION_CENSO;Data Source=192.168.200.250"
'cad = "Provider=SQLOLEDB.1;Password=inei1202;Persist Security Info=True; User ID=rvila;Initial Catalog=INEI_BDRRHH_CONSECUCION_CENSO;Data Source=192.168.200.250"
 
'cnn.Open    "Provider=SQLOLEDB.1;Password=inei0304;Persist Security Info=True; User ID=rvila;Initial Catalog=INEI_BDRRHH_CONSECUCION_CENSO;Data Source=172.18.1.41"
'cad = "Provider=SQLOLEDB.1;Password=inei0304;Persist Security Info=True; User ID=rvila;Initial Catalog=INEI_BDRRHH_CONSECUCION_CENSO;Data Source=172.18.1.41"
 
 'cnn.open "PROVIDER=SQLOLEDB.1; DATASOURCE=172.18.1.41; UID=INEI\otin001; PWD=Fisante2017; DATABASE=INEI_BDRRHH_CONSECUCION_CENSO"

'cnn.Open    "Provider=SQLOLEDB.1; Persist Security Info=True; Initial Catalog=TMP_INEI_BDRRHH_CONSECUCION_CENSO; Data Source=172.18.1.41"
'cad = "Provider=SQLOLEDB.1; Persist Security Info=True;Initial Catalog=TMP_INEI_BDRRHH_CONSECUCION_CENSO; Data Source=172.18.1.41"

'Micone.open "Provider=SQLOLEDB.1;Password=nU6&beTRi;Persist Security Info=True; User ID=us_inei_bdrrhh_consecucion;Initial Catalog=INEI_BDRRHH_CONSECUCION;Data Source=YANAWARA"
'Micone.open "Provider=SQLOLEDB.1;Password=inei1202;Persist Security Info=True; User ID=rvila;Initial Catalog=INEI_BDRRHH_CONSECUCION;Data Source=192.168.200.250"



Set Micone = Server.CreateObject("ADODB.Connection")
Micone.ConnectionString = cad
Micone.CommandTimeout=20000000
Micone.ConnectionTimeout=20000000
Micone.open





%> 
