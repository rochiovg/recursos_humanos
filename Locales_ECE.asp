<%@ Language=VBScript %>
<%
Response.Expires = 0 
muestra_acepta = "none"
%>
<!-- #include file="Conexion.asp"  --> 
<html>
<head>
 <title>..:: SISTEMA DE CONSECUCI&Oacute;N DE RECURSOS HUMANOS ::..</title>

   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
   <script type="text/javascript" src="js/cliente.js"></script>
   <script>function AbrirLugares(cod){	 		
	pagina = "lugares.asp";		
	win = window.open(pagina,'','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=360,top=250,left=250');
    }
	
	function abrir()
	{
		window.location.href = "ficha.asp";
		}
	function f_acepto(){
		band=document.miFormulario.chkacepto.checked;
		if (band==false){
			document.getElementById("inscripcion").setAttribute("disabled","true");

		}else
		{	
		document.getElementById("inscripcion").removeAttribute("disabled");
		document.getElementById('ver').style.display='block';		
		}
	}
</script>
   <script type="text/javascript" src="js/tooltip3.js"></script>
   <style type="text/css">
<!--
.style6 {
	color: #000066;
	font-weight: bold;
}
-->
   </style>
</head>
<body oncontextmenu="return false" topmargin=0>
<div align="center" style="width:90%">
  <table width='50%' border="1" cellpadding="1" cellspacing="1" bordercolor="#DAE8F3">
        <tr>
          <td rowspan="3"  align="center" class="tituloPrin" width="10%" >SEDE</td>
          <td rowspan="3" class="tituloPrin" align="center" width="10%" >OFICINA PROVINCIAL</td>
          <td class="tituloPrin" colspan="4"  align="center" >UBICACI&Oacute;N</td>
        </tr>
        <tr>
          <td  width="30%" class="tituloPrin" rowspan="2"  align="center" >DIRECCI&Oacute;N</td>
          <td colspan="2" class="tituloPrin" align="center" >TEL&Eacute;FONO</td>
          <td rowspan="2"  width="30%" class="tituloPrin" align="center" >REFERENCIA (UBICACI&Oacute;N)</td>
        </tr>
        <tr>
          <td  width="10%" align="center" class="tituloPrin">FIJO</td>
          <td  width="10%" align="center" class="tituloPrin">CELULAR</td>
        </tr>
    <tr>
          <td colspan="6"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">AMAZONAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AMAZONAS</td>
          <td  class='etiqueta'>BAGUA</td>
          <td class='etiqueta'>ESQUINA DEL    JR.TACNA Y ANCHAS</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>945953163</td>
          <td class='etiqueta'>INTERIOR DE    MAESTRANZA MUNICIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AMAZONAS</td>
          <td  class='etiqueta'>BONGARA</td>
          <td class='etiqueta'>JR.COMERCIO    CDRA 5 (DISTRITO DE JUMBILLA)</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>979614157</td>
          <td class='etiqueta'>COSTADO    ORM.</td>
        </tr>
         <tr>
          <td  class='etiqueta'>AMAZONAS</td>
          <td  class='etiqueta'>CHACHAPOYAS</td>
          <td class='etiqueta'>JR    JUNIN Nro. 758</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#972903124</td>
          <td class='etiqueta'>A    MEDIA CUADRA DEL JARDIN PILOTO</td>
        </tr>
       <tr>
          <td  class='etiqueta'>AMAZONAS</td>
          <td  class='etiqueta'>CONDORCANQUI</td>
          <td class='etiqueta'>JR.    IQUITOS SN (DISTRITO DE SANTA MARIA DE NIEVA)</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>949692370</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA JUAN VELASCO ALVARADO, AL LADO DE LA IGLESIA.</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AMAZONAS</td>
          <td  class='etiqueta'>LUYA</td>
          <td class='etiqueta'>JR.    BOLIVAR S/N- CUADRA 3 (DISTRITO DE LAMUD)</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>974490578</td>
          <td class='etiqueta'>A    30 METROS DE LA PLAZA PRINCIPAL DE LAMUD</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AMAZONAS</td>
          <td  class='etiqueta'>RODRIGUEZ    DE MENDOZA</td>
          <td class='etiqueta'>JR.    BRAULO CAMPO REDONDO (DISTRITO DE SAN NICOLAS)</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#969543205</td>
          <td class='etiqueta'>FRENTE    A LA LOZA DEPORTIVADEL ISTP. RODRIGUEZ DE MENDOZA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AMAZONAS</td>
          <td  class='etiqueta'>UTCUBAMBA</td>
          <td class='etiqueta'>JR.    ABRAHAM VALDELOMAR Nro. 171</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>977249058</td>
          <td class='etiqueta'>AL    COSTADO DEL BANCO DE LA NACI&Oacute;N</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>JAEN</td>
          <td class='etiqueta'>CALLE MARIETA    415 - MORRO SOLAR - JAEN</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>942464783</td>
          <td class='etiqueta'>COSTADO DEL    PARQUE INFANTIL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>SAN    IGNACIO</td>
          <td class='etiqueta'>JR.    SANTO DOMINGO S/N - CUADRA 2</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943941929</td>
          <td class='etiqueta'>A    UNA CUADRA DE LA RENIEC</td>
        </tr>
        <tr>
          <td colspan="6"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">ANCASH - CHIMBOTE</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - CHIMBOTE</td>
          <td  class='etiqueta'>CASMA</td>
          <td class='etiqueta'>CALLE    NEPE&Ntilde;A S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943160659</td>
          <td class='etiqueta'>FRENTE A LA OFICINA DE SERVICIOS P&Uacute;BLICOS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - CHIMBOTE</td>
          <td  class='etiqueta'>HUARMEY</td>
          <td class='etiqueta'>AV.INCA    GARCILAZO DE LA VEGA MZ-B LT-10</td>
          <td class='etiqueta'>043-400094</td>
          <td class='etiqueta'>944451400</td>
          <td class='etiqueta'>A    UNA CUADRA DEL RESTAURANT VILELA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - CHIMBOTE</td>
          <td  class='etiqueta'>PALLASCA</td>
          <td class='etiqueta'>MUNICIPALIDAD    DISTRITAL DE CAVANA PLAZA DE ARMAS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>COSTADO    DE LA IGLESIA</td>
        </tr>
       <tr>
          <td  class='etiqueta'>ANCASH - CHIMBOTE</td>
          <td  class='etiqueta'>SANTA</td>
          <td class='etiqueta'>Jr.    LADISLAO ESPINAR Nro. 167</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943055768</td>
          <td class='etiqueta'>AL    COSTADO DE LA DIRINCRI CHIMBOTE</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">ANCASH - HUARAZ</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>AIJA</td>
          <td class='etiqueta'>JR.    CONFRATERNIDAD Nro.260</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>996158855</td>
          <td class='etiqueta'>A    6 CUADRAS DE LA PLAZA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>ANTONIO    RAIMONDI</td>
          <td class='etiqueta'>JR    SIMON BOLIVAR 2DA CUADRA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>945299343</td>
          <td class='etiqueta'>BIBLIOTECA    MUNICIPAL DE LLAMELLIN</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>ASUNCI&Oacute;N</td>
          <td class='etiqueta'>JR.    BOLIVAR Nro. 420</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>42281958</td>
          <td class='etiqueta'>A    ESPALDAS DE LA PARROQUIA SANTO DOMINGO DE GUZMAN</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>BOLOGNESI</td>
          <td class='etiqueta'>JR.    BOLOGNESI S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>976501398</td>
          <td class='etiqueta'>PLAZA    DE ARMAS DE CHIQUIAN</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>CARHUAZ</td>
          <td class='etiqueta'>JR.    28 DE JULIO S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>984558278</td>
          <td class='etiqueta'>AL    COSTADO DE CAJA TRUJILLO A 2 CUADRAS DE LA PLAZA DE ARMAS</td>
        </tr>
         <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>CARLOS    FITZACARRALD</td>
          <td class='etiqueta'>JR.    DANIEL ALCIDES CARRION S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>980052131</td>
          <td class='etiqueta'>FRENTE    A LA COMISARIA (PNP)</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>CORONGO</td>
          <td class='etiqueta'>JR.    LIMA Nro. 505</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>981678585</td>
          <td class='etiqueta'>AL    COSTADO DEL TEATRO MUNICIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>HUARAZ</td>
          <td class='etiqueta'>JR.    DAMAZO ANTUNES Nro. 723</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943979725</td>
          <td class='etiqueta'>PLAZUELA    DE BELEN - HUARAZ</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>HUARI</td>
          <td class='etiqueta'>JR.    SUCRE Nro. 312</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>964649709</td>
          <td class='etiqueta'>FRENTE    A HIDRANDINA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>HUAYLAS</td>
          <td class='etiqueta'>JR    CORDOVA Nro. 403</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943498819</td>
          <td class='etiqueta'>AL    COSTADO DE LA AGENCIA DE TRANSPORTE HUARALINO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>MARISCAL    LUZURRIAGA</td>
          <td class='etiqueta'>JR.    MARISCAL LUZURIAGA Nro. 210</td>
          <td class='etiqueta'>043-785200</td>
          <td class='etiqueta'>992821938</td>
          <td class='etiqueta'>A    MEDIA CUADRA DE LA COMISARIA PNP</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>OCROS</td>
          <td class='etiqueta'>JR.    BOLIVAR Nro. 420</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>42281958</td>
          <td class='etiqueta'>A    ESPALDAS DE LA PARROQUIA SANTO DOMINGO DE GUZMAN</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>POMABAMBA</td>
          <td class='etiqueta'>JR.    HUAMACHUCO S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>969146659</td>
          <td class='etiqueta'>AL    COSTADO DEL BANCO DE LA NACI&Oacute;N</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>RECUAY</td>
          <td class='etiqueta'>JR.    PALMIRA Nro. 151</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>959815904</td>
          <td class='etiqueta'>AL    COSTADO DEL MUNICIPIO PROVINCIAL</td>
        </tr>
       <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>SIHUAS</td>
          <td class='etiqueta'>JR.    SE&Ntilde;OR DE LOS MILAGROS Nro. 121</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>989740976</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ANCASH - HUARAZ</td>
          <td  class='etiqueta'>YUNGAY</td>
          <td class='etiqueta'>JR.    MIGUEL GRAU Nro.  226</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943736342</td>
          <td class='etiqueta'>FRENTE    A NOTARIA EDUVIGES</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">APURIMAC</td>
        </tr>
        <tr>
          <td  class='etiqueta'>APURIMAC</td>
          <td  class='etiqueta'>ABANCAY</td>
          <td class='etiqueta'>AV.    CIRCUNVALACI&Oacute;N S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>983620262</td>
          <td class='etiqueta'>A    300 METROS DE SENATI</td>
        </tr>
        <tr>
          <td  class='etiqueta'>APURIMAC</td>
          <td  class='etiqueta'>ANDAHUAYLAS</td>
          <td class='etiqueta'>JR.    RICARDO PALMA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>983904611</td>
          <td class='etiqueta'>CENTRO    C&Iacute;VICO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>APURIMAC</td>
          <td  class='etiqueta'>ANTABAMBA</td>
          <td class='etiqueta'>PLAZA    DE ARMAS</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>946621432</td>
          <td class='etiqueta'>GOBERNATURA    PROVINCIAL DE ANTABAMBA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>APURIMAC</td>
          <td  class='etiqueta'>AYMARAES</td>
          <td class='etiqueta'>AV.    RICARDO PALMA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>980264788</td>
          <td class='etiqueta'>GOBERNATURA    PROVINCIAL DE AYMARAES</td>
        </tr>
        <tr>
          <td  class='etiqueta'>APURIMAC</td>
          <td  class='etiqueta'>CHINCHEROS</td>
          <td class='etiqueta'>JR    RAYMONDI S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>971437272</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE CHINCHEROS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>APURIMAC</td>
          <td  class='etiqueta'>COTABAMBAS</td>
          <td class='etiqueta'>JR.    AMAUTA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>956657291</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE COTABAMBAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>APURIMAC</td>
          <td  class='etiqueta'>GRAU</td>
          <td class='etiqueta'>JR    CUSCO Nro. 107</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>983746860</td>
          <td class='etiqueta'>FRENTE    AL MERCADO</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">AREQUIPA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA - LA    JOYA</td>
          <td class='etiqueta'>JR. DOS DE MAYO    S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>959512393</td>
          <td class='etiqueta'>AL COSTADO DE    LA PLAZA PRINCIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - AREQUIPA</td>
          <td class='etiqueta'>AV.    VENEZUELA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>958052682</td>
          <td class='etiqueta'>AL    COSTADO DEL ESTADIO MONUMENTAL DE LA    U.N.S.A.</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - CAYMA</td>
          <td class='etiqueta'>AV.    FRANCISCO BOLOGNESI S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>958691961</td>
          <td class='etiqueta'>EN    EL COLISEO FRANCISCO BOLOGNESI DE    CAYMA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - CERRO COLORADO</td>
          <td class='etiqueta'>AV.    ALFONSO UGARTE S/N (2DO PISO DEL MERCADO DE CERRO COLORADO)</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>958996390</td>
          <td class='etiqueta'>AL    COSTADO DE LA COMISARIA DE CERRO COLORADO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - TIABAYA-UCHUMAYO-YURA</td>
          <td class='etiqueta'>CALLE    BOLIVAR S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>982121572</td>
          <td class='etiqueta'>A    MEDIA CUADRA DE LA IGLESIA PRINCIPAL DE TIABAYA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - YANAHUARA-SACHACA</td>
          <td class='etiqueta'>CALLE MIGUEL GRAU Nro. 403</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>992820678</td>
          <td class='etiqueta'>AL    FRENTE DE LA PLAZA DE YANAHUARA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - ALTO SELVA ALEGRE</td>
          <td class='etiqueta'>AV.    OBRERA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>940656917</td>
          <td class='etiqueta'>MINICIPALIDAD    DE ASA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - JACOBO HUNTER</td>
          <td class='etiqueta'>AV.    VI&Ntilde;A DEL MAR S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>956363697</td>
          <td class='etiqueta'>EN LA BIBLIOTECA MUNICIPAL DE HUNTER</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - MARIANO MELGAR</td>
          <td class='etiqueta'>AV.    SIMON BOLIVAR S/N (CENTRO CIVICO)</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943751333</td>
          <td class='etiqueta'>A    UNA CUADRA DEL MODULO DE JUSTICIA DE MARIANO MELGAR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - MIRAFLORES</td>
          <td class='etiqueta'>LA    INTERSECCI&Oacute;N DE LA AV. GOYONECHE CON AV. TACNA Y ARICA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>949812218</td>
          <td class='etiqueta'>ESTADIO    EDIFICADORES MISTI</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - JOSE LUIS BUSTAMANTE Y RIVERO</td>
          <td class='etiqueta'>AV.    CARACAS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>959336654</td>
          <td class='etiqueta'>AL    COSTADO DE LA COMISARIA DE SIMON BOLIVAR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - PAUCARPATA</td>
          <td class='etiqueta'>AV.    PIZARRO S/N (IST PEDRO P DIAZ)</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>957709064</td>
          <td class='etiqueta'>A    UNA CUADRA DEL MALL AVENTURA PLAZA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - SOCABAYA</td>
          <td class='etiqueta'>ESQUINA    CALLE GRAU CON CALLE SAN MARTIN S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>958529197</td>
          <td class='etiqueta'>EN    LA PLAZA PRINCIPAL DE SOCABAYA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - LA JOYA</td>
          <td class='etiqueta'>JR.    DOS DE MAYO Nro. 311</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>995477168</td>
          <td class='etiqueta'>INSTITUTO    SUPERIOR TECNOL&Oacute;GICO P&Uacute;BLICO DE LA JOYA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>AREQUIPA    - MAJES</td>
          <td class='etiqueta'>CAMPAMENTO    SHUTON, Av. AREQUIPA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>973157727</td>
          <td class='etiqueta'>A    ESPALDAS DEL TERMINAL TERRESTRE</td>
        </tr>
         <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>UGEL    NORTE</td>
          <td class='etiqueta'>AV.    VENEZUELA S/N FACULTAD DE ED. UNIV. NAC. DE SAN AGUSTIN</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>958903458</td>
          <td class='etiqueta'>AL    COSTADO DEL ESTADIO MONUMENTAL DE LA U.N.S.A</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>UGEL    SUR</td>
          <td class='etiqueta'>AVENIDA    PIZARRO SN, I.S.T. PEDRO P DIAZ</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>983862126</td>
          <td class='etiqueta'>A    UNA CUADRA DEL MALL AVENTURA PLAZA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>CAMANA</td>
          <td class='etiqueta'>URB. VILLA SALAZAR C-1</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>959398094</td>
          <td class='etiqueta'>A    TRES CUADRAS DE LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>CARAVELI</td>
          <td class='etiqueta'>CALLE    COMERCIO Nro.  202</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>946707133</td>
          <td class='etiqueta'>MUNICIPALIDAD    DE CHALA 2ro.  PISO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>CASTILLA</td>
          <td class='etiqueta'>AVENIDA    TRES DE ABRIL S/N APLAO</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>941825381</td>
          <td class='etiqueta'>A    UN COSTADO DEL HOTEL MUNICIPAL DE APLAO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>CAYLLOMA</td>
          <td class='etiqueta'>CALLE    SIGLO XX S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>941413053</td>
          <td class='etiqueta'>A    EXTERIORES DEL COLISEO LA MONTERA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>CONDESUYOS</td>
          <td class='etiqueta'>AVENIDA    LIMA Nro.  502</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>957875273</td>
          <td class='etiqueta'>FRENTE    AL HOSTAL EL MIRADOR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>ISLAY</td>
          <td class='etiqueta'>PRIMERA    CUADRA DE LA CALLE AREQUIPA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>959807777</td>
          <td class='etiqueta'>A    UN COSTADO DEL MALECON FRENTE A LA PLAZA GRAU</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AREQUIPA</td>
          <td  class='etiqueta'>LA    UNION</td>
          <td class='etiqueta'>CALLE    AREQUIPA Nro.  118</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>948872428</td>
          <td class='etiqueta'>FRENTE    AL BANCO FONDESURCO</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">AYACUCHO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>CANGALLO</td>
          <td class='etiqueta'>AV.    PEDRO C. CARDENAS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>966903692</td>
          <td class='etiqueta'>FRENTE    A LA I.E.I. NI&Ntilde;O JESUS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>HUAMANGA</td>
          <td class='etiqueta'>JR.    28 DE JULIO Nro. 586</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943625912</td>
          <td class='etiqueta'>A    5 CUADRAS DE LA PLAZA DE ARMAS</td>
        </tr>
       <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>HUANCASANCOS</td>
          <td class='etiqueta'>AV.    ANANIAS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>980230252</td>
          <td class='etiqueta'>COSTADO    DE LA MUNICIPALIDAD DE SANCOS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>HUANCASANCOS</td>
          <td class='etiqueta'>AV.    ANANIAS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>A    UNA CUADRA DE LA MUNICIPALIDAD</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>HUANTA</td>
          <td class='etiqueta'>JR.    OSWALDO M REGAL Nro. 181</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>998400503</td>
          <td class='etiqueta'>MULTISERVICIOS    PUNTO COM</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>HUANTA</td>
          <td class='etiqueta'>JR.    RICARDO URBANO 2 DA CUADRA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>ESPALDA    DE LA IGLESIA DE LOS MORMONES</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>LA    MAR</td>
          <td class='etiqueta'>PLAZA    PRINCIPAL S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>966831086</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE SAN MIGUEL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>SUCRE</td>
          <td class='etiqueta'>PLAZA    PRINCIPAL S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>978011999</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE QUEROBAMBA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>VICTOR    FAJARDO</td>
          <td class='etiqueta'>PLAZA    PRINCIPAL S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>966969737</td>
          <td class='etiqueta'>MUNICIPALIDAD    DE HUANCAPI</td>
        </tr>
         <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>VILCASHUAMAN</td>
          <td class='etiqueta'>AV.    EL SOL Nro. 126</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>964969075</td>
          <td class='etiqueta'>COSTADO    DE LA IE MICAELA BASTIDAS 39012</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAJAMARCA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>CAJABAMBA</td>
          <td class='etiqueta'>JR.CELSO    BENIGNO CALDERON Nro. 394</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>970918680    *185220</td>
          <td class='etiqueta'>GOBERNACI&Oacute;N    PROVINCIAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td class='etiqueta'>JR.    EL COMERCIO Nro. 629</td>
          <td class='etiqueta'>76361588</td>
          <td class='etiqueta'>#    976623336</td>
          <td class='etiqueta'>AL    COSTADO DE LA RENIEC</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>CELENDIN</td>
          <td class='etiqueta'>JR.    SAN CAYETANO Nro. 153-CUADRA 1</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>971554740</td>
          <td class='etiqueta'>A    UNA CUADRA DEL PARQUE LA ALAMEDA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>CHOTA</td>
          <td class='etiqueta'>AV    TODOS LOS SANTOS Nro. 1379</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>976851520</td>
          <td class='etiqueta'>AL    FRENTE DE LA ESCUELA Nro. 11039</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>CONTUMAZA</td>
          <td class='etiqueta'>JR.    EL QUIQUE Nro. 136</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>976393770</td>
          <td class='etiqueta'>COSTADO    DE LA I.E ABEL ALVA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>CUTERVO</td>
          <td class='etiqueta'>Jr.    SANTA ROSA Nro. 1025</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#944925592<br>
            976558776</td>
          <td class='etiqueta'>A    DOS CUADRAS Y MEDIA DE LA PLAZUELA SANTA CRUZ</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>HUALGAYOC</td>
          <td class='etiqueta'>JR.    SAN CARLOS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#    964012440</td>
          <td class='etiqueta'>IPD</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>SAN    MARCOS</td>
          <td class='etiqueta'>JR.    TUPAC AMARU S/N - GOBERNACION PROVINCIAL</td>
          <td class='etiqueta'>076-558076</td>
          <td class='etiqueta'>943883356</td>
          <td class='etiqueta'>AL    COSTADOO DE LA PLAZA PECUARIA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>SAN    MIGUEL</td>
          <td class='etiqueta'>JR.    BOLIVAR S/N</td>
          <td class='etiqueta'>076    319319</td>
          <td class='etiqueta'>978074007</td>
          <td class='etiqueta'>GOBERNACI&Oacute;N    SAN MIGUEL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>SAN    PABLO</td>
          <td class='etiqueta'>JR.    GREGORIO PITA Nro. 431</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#999393410</td>
          <td class='etiqueta'>A    1/2 CUADRA DEL MIRADOR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CAJAMARCA</td>
          <td  class='etiqueta'>SANTA    CRUZ</td>
          <td class='etiqueta'>PASAJE    LOS LAURELES S/N URB. CARRANZA PIEDRA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>954883840</td>
          <td class='etiqueta'>A    2 CUADRAS DEL COLEGIO JUAN UGAZ</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>BOLIVAR    DE LA LIBERTAD</td>
          <td class='etiqueta'>JR.    BOLIVAR CUADRA 1</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>968619339</td>
          <td class='etiqueta'>FRENTE    A LA RENIEC</td>
        </tr>
       <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CALLAO</td>
        </tr>
         <tr>
          <td  class='etiqueta'>CALLAO</td>
          <td  class='etiqueta'>BELLAVISTA</td>
          <td class='etiqueta' width="30%">JR. JUAN    SALCEDO 291 URB. SAN JOAQUIN     BELLAVISTA&quot;CLUB DE LEONES&quot;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>996054732</td>
          <td width="30%"  class='etiqueta'>ALTURA    DE PLAZA VEA Y LA BOUTIQUE DEL PAN</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CALLAO</td>
          <td  class='etiqueta'>CALLAO 1</td>
          <td width="30%"  class='etiqueta'>AV. HAYA DE LA TORRE SN CUADRA 16  &quot;COMPLEJO DEPORTIVO CAMPOLO&quot;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>955064691</td>
          <td width="30%"  class='etiqueta'>ALTURA DE AV. VENEZUELA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CALLAO</td>
          <td  class='etiqueta'>CALLAO 2</td>
          <td width="30%"  class='etiqueta'>AV. PRIMERO DE MAYO SIN CUADRA 8     CENTRO PASTORIL &quot;SAN JOSE&quot;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>986159308</td>
          <td width="30%"  class='etiqueta'>COSTADO DE LA MUNICIPALIDAD CARMEN DE LA LEGUA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CALLAO</td>
          <td  class='etiqueta'>CARMEN DE LA    LEGUA</td>
          <td width="30%"  class='etiqueta'>AV. 1ERO DE MAYO CARMEN DE LA LEGUA LOCAL  COMUNAL DEL ADULTO MAYOR</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>980935274</td>
          <td width="30%"  class='etiqueta'>COSTADO DE LA MUNICIPALIDAD DE CARMEN DE LA LEGUA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CALLAO</td>
          <td  class='etiqueta'>LA PERLA</td>
          <td width="30%"  class='etiqueta'>CETPRO  VIRGEN DEL CARMEN</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>966324207</td>
          <td width="30%"  class='etiqueta'>ALTURA DE LA AV. HAYA DE LA TORRE Y AV. VENEZUELA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CALLAO</td>
          <td  class='etiqueta'>VENTANILLA 1</td>
          <td width="30%"  class='etiqueta'>AV.CAJAMARCA S/N CRUCE CON AV. TRUJILLO  MIPERU AUDITORIO 2 DE LA PISCINA MUNICIPAL    MI PERU</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>976365186</td>
          <td width="30%"  class='etiqueta'>COSTADO DEL COLGIO ELIM</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CALLAO</td>
          <td  class='etiqueta'>VENTANILLA 2</td>
          <td width="30%"  class='etiqueta'>CALLE 17 AV. BELTRAN SIN URB. SATELITE &quot;MINI ENCIMAS&quot;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>996541922 RPM: 945195051</td>
          <td width="30%"  class='etiqueta'>COSTADO BIBLIOTECA MUNICIPAL</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CUSCO</td>
       </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>ACOMAYO</td>
          <td class='etiqueta'>PLAZA    DE ARMAS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>984495776</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE ACOMAYO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>ANTA</td>
          <td class='etiqueta'>AV.    LOS ANDES S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>995556089</td>
          <td class='etiqueta'>CASA    DE LA CULTURA DE LA MUNICIPALIDAD PROVINCIAL DE ANTA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>CALCA</td>
          <td class='etiqueta'>CALLE    MARISCAL CASTILLA S/N</td>
          <td class='etiqueta'>084-202270</td>
          <td class='etiqueta'>992620656</td>
          <td class='etiqueta'>A    100 DEL MERCADO MODELO CALCA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>CANAS</td>
          <td class='etiqueta'>PLAZA    DE ARMAS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>941407971</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE CANAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>CANCHIS</td>
          <td class='etiqueta'>ASC.    LUIS BELTRAN G. A - 17</td>
          <td class='etiqueta'>084-434346</td>
          <td class='etiqueta'>950790442</td>
          <td class='etiqueta'>ESPALDA    DEL HOSPITAL DE SICUANI</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>CHUMBIVILCAS</td>
          <td class='etiqueta'>CALLE    MIRAFLORES S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>974358447</td>
          <td class='etiqueta'>A    UNA CUADRA DE LA FISCALIA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>CUSCO</td>
          <td class='etiqueta'>AV.    EL SOL Nro. 272 SEGUNDO PISO</td>
          <td class='etiqueta'>084-226645</td>
          <td class='etiqueta'>984565272</td>
          <td class='etiqueta'>FRENTE    AL PALACIO DE JUSTICIA / PRIMER PISO RENIEC</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>ESPINAR</td>
          <td class='etiqueta'>AV    TINTAYA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>988966425</td>
          <td class='etiqueta'>LOCAL    DE ABASTECIMIENTOS DE LA UGEL DE    ESPINAR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>LA    CONVENCI&Oacute;N</td>
          <td class='etiqueta'>JR.    ESPINAR Nro. 336</td>
          <td class='etiqueta'>084-282009</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>AUDITORIUM    DE LA MUNICIPALIDAD PROVINCIAL DE LA CONVENCI&Oacute;N</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>PARURO</td>
          <td class='etiqueta'>PLAZA    DE ARMAS S/N</td>
          <td class='etiqueta'>084-254221</td>
          <td class='etiqueta'>993489660</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE PARURO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>PAUCARTAMBO</td>
          <td class='etiqueta'>AV.    ENRIQUE YABAR S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>975524724</td>
          <td class='etiqueta'>A    50 METROS DE LA MUNICIPALIDAD    PROVINCIAL DE PAUCARTAMBO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>QUISPICANCHI</td>
          <td class='etiqueta'>PLAZA    DE ARMAS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>984574216</td>
          <td class='etiqueta'>MUNICIPALIDAD    DISTRITAL DE URCOS</td>
        </tr>
         <tr>
          <td  class='etiqueta'>CUSCO</td>
          <td  class='etiqueta'>URUBAMBA</td>
          <td class='etiqueta'>AV.    FERROCARRIL Nro. 890</td>
          <td class='etiqueta'>084-605865</td>
          <td class='etiqueta'>973687907</td>
          <td class='etiqueta'>FRENTE    A LA GOBERNACI&Oacute;N PROVINCIAL DE URUBAMBA</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">HUANCAVELICA</td>
         </tr>
        <tr>
          <td  class='etiqueta'>HUANCAVELICA</td>
          <td  class='etiqueta'>ACOBAMBA</td>
          <td class='etiqueta'>JR.    CHOQUEHUANCA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>956381969</td>
          <td class='etiqueta'>LOCAL    MDO. CHANIN ACOBAMBA 1/2 CDRA COLEGIO SAN FRANCISCO DE ASIS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANCAVELICA</td>
          <td  class='etiqueta'>ANGARAES</td>
          <td class='etiqueta'>JR.    9 DE DICIEMBRE Nro.  221</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>986404112</td>
          <td class='etiqueta'>A    UNA CUADRA DEL PARQUE ANDRES AVELINO CACERES</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANCAVELICA</td>
          <td  class='etiqueta'>CASTROVIRREYNA</td>
          <td class='etiqueta'>AV.    SAN MARTIN S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>947908020</td>
          <td class='etiqueta'>LOCAL    DE LA UGEL - CASTROVIRREYNA 2do. NIVEL BARRIO YANA RUMI</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANCAVELICA</td>
          <td  class='etiqueta'>CHURCAMPA</td>
          <td class='etiqueta'>JR.    DOS DE MAYO S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>995871480</td>
          <td class='etiqueta'>A    UNA CUADRA DE LA MUNICIPALIDAD PROVINCIAL CHURCAMPA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANCAVELICA</td>
          <td  class='etiqueta'>HUANCAVELICA</td>
          <td class='etiqueta'>MALECON    VIRGEN DE LA CANDELARIA Nro.  104</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>990506605</td>
          <td class='etiqueta'>COSTADO DE    ESCUELA DE POLICIA NACIONAL DEL PERU - HUANCAVELICA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANCAVELICA</td>
          <td  class='etiqueta'>HUAYTARA</td>
          <td class='etiqueta'>AV.    BELAUNDE TERRY S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943873434</td>
          <td class='etiqueta'>FRENTE    AL HOTEL DE TURISTAS HUAYTARA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANCAVELICA</td>
          <td  class='etiqueta'>TAYACAJA</td>
          <td class='etiqueta'>JR.    OLAYA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>950560784</td>
          <td class='etiqueta'>LOCAL CASA    DEL ADULTO MAYOR - TAYACAJA</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">HUANUCO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>AMBO</td>
          <td class='etiqueta'>GOBERNACI&Oacute;N</td>
          <td class='etiqueta'>062512349</td>
          <td class='etiqueta'>#962556038</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>DOS    DE MAYO</td>
          <td class='etiqueta'>MUNICIPALIDAD</td>
          <td class='etiqueta'>513133</td>
          <td class='etiqueta'>968689442</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>HUACAYBAMBA</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE HUACAYBAMBA AV. EL EJERCITO S/N</td>
          <td class='etiqueta'>062512630</td>
          <td class='etiqueta'>981859595</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>HUAMALIES</td>
          <td class='etiqueta'>MUNICIPALIDAD</td>
          <td class='etiqueta'>969905224</td>
          <td class='etiqueta'>969905224</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>HUANUCO</td>
          <td class='etiqueta'>URB.    SANTA ELENA MZ &quot;K&quot; LOTE 18 - AMARILIS</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>943961407</td>
          <td class='etiqueta'>A    ESPALDAS DE INSTITUTO ISABEL LA CATOLICA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>LAURICOCHA</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE LAURICOCHA JR. CRISTOBAL COLON S/N</td>
          <td class='etiqueta'>964890494</td>
          <td class='etiqueta'>#964890494</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>LEONCIO    PRADO</td>
          <td class='etiqueta'>Jr.    FRANCISCO BOLOGNESI Nro. 110</td>
          <td class='etiqueta'>062633734</td>
          <td class='etiqueta'>945110098</td>
          <td class='etiqueta'>OFICINA    DE LA GOBERNACION</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>MARA&Ntilde;ON</td>
          <td class='etiqueta'>MUNICIPALIDAD</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>989773575</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>PACHITEA</td>
          <td class='etiqueta'>JR.    GRAU S/N</td>
          <td class='etiqueta'>993759267</td>
          <td class='etiqueta'>957695444</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>YAROWILCA</td>
          <td class='etiqueta'>Jr.    HUANUCO S/N</td>
          <td class='etiqueta'>997446562</td>
          <td class='etiqueta'>990706062</td>
          <td class='etiqueta'>OFICINA    DE LA GOBERNACION</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">ICA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ICA</td>
          <td  class='etiqueta'>CHINCHA</td>
          <td class='etiqueta'>AVENIDA    LUIS GALVEZ CHIPOCO Nro. 192</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#956995937</td>
          <td class='etiqueta'>OVALO    DE TELEF&Oacute;NICA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ICA</td>
          <td  class='etiqueta'>ICA</td>
          <td class='etiqueta'>AVENIDA    MUNICIPALIDAD Nro. 209- 213</td>
          <td class='etiqueta'>056-224491</td>
          <td class='etiqueta'>985965366</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ICA</td>
          <td  class='etiqueta'>NAZCA</td>
          <td class='etiqueta'>AV.    MARIA REICHE S/N 1RA CUADRA.</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>956561265</td>
          <td class='etiqueta'>COSTADO    DE LA FISCALIA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ICA</td>
          <td  class='etiqueta'>PALPA</td>
          <td class='etiqueta'>URB.    SAN AUGUSTIN CALLE FRANCISCO PICONNE DONAYRE Nro. 267</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>968475777</td>
          <td class='etiqueta'>GOBERNACI&Oacute;N</td>
        </tr>
        <tr>
          <td  class='etiqueta'>ICA</td>
          <td  class='etiqueta'>PISCO</td>
          <td class='etiqueta'>URBANIZACION    SAN ISIDRO MZ. H LOTE 6 (PISO 2)</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#963954728</td>
          <td class='etiqueta'>TRES    CUADRAS DEL CEMENTERIO DE PISCO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>LUCANAS</td>
          <td class='etiqueta'>JIRON    BOLIVAR Nro. 420</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>966726338<br>
            #950440959</td>
          <td class='etiqueta'>ESPALDA    DEL MERCADO MUNICIPAL<br>
            MEDIA CUADRA DE ELECTRODUNAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>PARINACOCHAS</td>
          <td class='etiqueta'>JR.    BALTA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>996353094</td>
          <td class='etiqueta'>A CUATRO CUADRAS DE LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>AYACUCHO</td>
          <td  class='etiqueta'>PAUCAR    DEL SARA SARA</td>
          <td class='etiqueta'>AVENIDA    28 DE JULIO Nro. 1026</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>990278690</td>
          <td class='etiqueta'>A    DOS CUADRAS DE LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">JUNIN</td>
        </tr>
        <tr>
          <td  class='etiqueta'>JUNIN</td>
          <td  class='etiqueta'>CHANCHAMAYO</td>
          <td class='etiqueta'>JR.    JOSE VEGA JAUREGUI S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>998922326</td>
          <td class='etiqueta'>ESTADIO    MUNICIPAL - EX OFICINA SERENAZGO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>JUNIN</td>
          <td  class='etiqueta'>CHUPACA</td>
          <td class='etiqueta'>JR.    BRUNO TERREROS Nro. 553</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>986216936</td>
          <td class='etiqueta'>A    UNA CUADRA Y MEDIA DE LA PLAZA PRINCIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>JUNIN</td>
          <td  class='etiqueta'>CONCEPCI&Oacute;N</td>
          <td class='etiqueta'>JR.    GRAU Nro. 607 2DO PISO</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>964511292</td>
          <td class='etiqueta'>1/2    CUADRA DE LA PLAZA PRINCIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>JUNIN</td>
          <td  class='etiqueta'>HUANCAYO</td>
          <td class='etiqueta'>JR.    SEBASTIAN LORENTE Nro. 530 - EL TAMBO</td>
          <td class='etiqueta'>64243488</td>
          <td class='etiqueta'>964536735</td>
          <td class='etiqueta'>PARALELO    AL BANCO DE LA NACI&Oacute;N, COSTADO DE PLAZA VEA EL TAMBO.</td>
        </tr>
        <tr>
          <td  class='etiqueta'>JUNIN</td>
          <td  class='etiqueta'>JAUJA</td>
          <td class='etiqueta'>JR.    GALVEZ Nro.  350</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>985559663</td>
          <td class='etiqueta'>100    M DEL PARQUE STA ISABEL Y 1/2 CUADRA DE LA RADIO SAN FERNANDO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>JUNIN</td>
          <td  class='etiqueta'>JUNIN</td>
          <td class='etiqueta'>JR.    COLOMBIA Nro. 896</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>958444077</td>
          <td class='etiqueta'>COSTADO    DEL ESTADIO MUNICIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>JUNIN</td>
          <td  class='etiqueta'>SATIPO</td>
          <td class='etiqueta'>AV.    ANTONIO RAYMONDI Nro. 646</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>969838373</td>
          <td class='etiqueta'>AUDITORIO    DE LA GOB. PROV. DE SATIPO, 1 CDRA. DEL IEP. PAMER</td>
        </tr>
        <tr>
          <td  class='etiqueta'>JUNIN</td>
          <td  class='etiqueta'>TARMA</td>
          <td class='etiqueta'>JR.    HUANUCO Nro. 462 - INTERIOR B</td>
          <td class='etiqueta'>064323541</td>
          <td class='etiqueta'>#964689147</td>
          <td class='etiqueta'>A    MEDIA CUADRA DEL MERCADO MODELO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>JUNIN</td>
          <td  class='etiqueta'>YAULI</td>
          <td class='etiqueta'>JR.    ALFONSO UGARTE Nro. 113</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>964119271</td>
          <td class='etiqueta'>COSTADO    DE LA SEDE DE LA UNIVERSIDAD NACIONAL DANIEL ALCIDES CARRI&Oacute;N</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LA LIBERTAD</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'> ASCOPE</td>
          <td class='etiqueta'>JR.    BELLAV&Iacute;STA Nro.  160 - ASCOPE</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>949933158</td>
          <td class='etiqueta'>A    MEDIA CUADRA DE LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>CHEP&Eacute;N</td>
          <td class='etiqueta'>CALLE    TRUJILLO Nro.107 - CHEP&Eacute;N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>949559823</td>
          <td class='etiqueta'>A    DOS CUADRAS DE LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>GRAN    CHIM&Uacute;</td>
          <td class='etiqueta'>JR.    BOL&Iacute;VAR Nro.  549 - CASCAS</td>
          <td class='etiqueta'>651802</td>
          <td class='etiqueta'>947837785</td>
          <td class='etiqueta'>A    DOS CUADRAS DE LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>JULC&Aacute;N</td>
          <td class='etiqueta'>JR.    FRANCISCO BOLOGNESI Nro.  150 BARRIO    SAN ISIDRO</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>949051700</td>
          <td class='etiqueta'>AL    COSTADO DEL LOCAL DE LA GOBERNACI&Oacute;N    JULC&Aacute;N</td>
        </tr>
       <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>OTUZCO</td>
          <td class='etiqueta'>CALLE    ANDR&Eacute;S AV&Eacute;LINO Nro.  660</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>990103186</td>
          <td class='etiqueta'>A    MEDIA CUADRA DEL COLEGIO JUAN ALVARADO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>PACASMAYO</td>
          <td class='etiqueta'>PSJ.    JULIO C. BRITO S/N - SAN PEDRO DE LLOC</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>949020426</td>
          <td class='etiqueta'>2do    PISO - MERCADO CENTRAL<br>
            SINDICATO DE TRABAJADORES MUNICIPALES</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>PATAZ</td>
          <td class='etiqueta'>AV.    ALFONSO UGARTE S/N - TAYAMBAMBA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>973420061</td>
          <td class='etiqueta'>CASA    DEL MAESTRO A UNA CUADRA DE LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>S&Aacute;NCHEZ    CARRI&Oacute;N</td>
          <td class='etiqueta'>JR.    SAN ROMAN Nro.  513</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>999336444</td>
          <td class='etiqueta'>PLAZA    DE ARMAS - EX COMISARIA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>SANTIAGO    DE CHUCO</td>
          <td class='etiqueta'>CALLE    SAN MARTIN Nro. 844</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>949410888</td>
          <td class='etiqueta'>BENEFICENCIA    P&Uacute;BLICA A CUATRO CUADRAS DE LA PLAZA    DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>TRUJILLO</td>
          <td class='etiqueta'>CALLLE JOS&Eacute; SABOGAL Nro.  320<br>
            URB. PALERMO</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>985808067</td>
          <td class='etiqueta'>A    DOS CUADRAS DEL MERCADO MAYORISTA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LA LIBERTAD</td>
          <td  class='etiqueta'>VIR&Uacute;</td>
          <td class='etiqueta'>CALLE    PUNO Nro. 181 - VIR&Uacute;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>947871228</td>
          <td class='etiqueta'>A    UNA CUADRA DE LA COMISERIA</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LAMBAYEQUE</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LAMBAYEQUE</td>
          <td  class='etiqueta'>CHICLAYO</td>
          <td class='etiqueta'>AV. BALTA Nro.    658</td>
          <td class='etiqueta'>074 206826</td>
          <td class='etiqueta'>#957990163</td>
          <td class='etiqueta'>AL COSTADO DE LA RENIEC</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LAMBAYEQUE</td>
          <td  class='etiqueta'>FERRE&Ntilde;AFE</td>
          <td class='etiqueta'>CALLE UNI&Oacute;N Nro.834 - FERRE&Ntilde;AFE</td>
          <td class='etiqueta'>NO</td>
          <td class='etiqueta'>947827165</td>
          <td class='etiqueta'>A 3 CUADRAS DE LA PLAZA PRINCIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LAMBAYEQUE</td>
          <td  class='etiqueta'>LAMBAYEQUE</td>
          <td class='etiqueta'>CALLE PAUL    HARRIS 304 PBLO. JOVEN SAN MARTIN</td>
          <td class='etiqueta'>NO</td>
          <td class='etiqueta'>962513866</td>
          <td class='etiqueta'>CALLE MANUEL    ITURREGUI ESPALDA DEL CUALTEL FRANCISCO BOLOGNESI</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LIMA UGEL 01 SAN JUAN DE MIRAFLORES</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 01 SAN JUAN DE MIRAFLORES</td>
          <td  class='etiqueta'>BALNEARIOS</td>
          <td class='etiqueta'>MUNICIPALIDAD DE PUNTA NEGRA - ESCUELA DE SOLDADURA &quot; EDUARDO A. HERRERA MARENGO&quot;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>MOVISTAR:    986880870 RPM: #986880870</td>
          <td class='etiqueta'>MUNICIPALIDAD DE PUNTA NEGRA - ESCUELA DE SOLDADURA &quot;EDUARDO A. HERRERA MARENGO&quot;</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 01 SAN JUAN DE MIRAFLORES</td>
          <td  class='etiqueta'>LURIN</td>
          <td colspan="4" class='etiqueta'>ACERCARSE A  SEDE DE SAN JUAN DE MIRAFLORES O VILLA EL SALVADOR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 01 SAN JUAN DE MIRAFLORES</td>
          <td  class='etiqueta'>PACHACAMAC</td>
          <td colspan="4" class='etiqueta'>ACERCARSE A  SEDE DE SAN JUAN DE MIRAFLORES O VILLA EL SALVADOR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 01    - SAN JUAN DE MIRAFLORES</td>
          <td  class='etiqueta'>SAN JUAN DE    MIRAFLORES</td>
          <td class='etiqueta'>AV.BELISARIO    SUAREZ Nro.1075 - ZONA D -MUNICIPALIDAD DE    SAN JUAN DE MIRAFLORES</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>MOVISTAR: 985 117    567</td>
          <td class='etiqueta'>POR LA CLINICA SANTA MARIA DEL    SUR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 01    - SAN JUAN DE MIRAFLORES</td>
          <td  class='etiqueta'>VILLA EL    SALVADOR</td>
          <td class='etiqueta'>AV.BOLIVAR Nro.    100 - VILLA EL SALVADOR - INSTITUTO SUPERIOR TECNOLOGICO PUBLICO &quot;JULIO    C. TELLO&quot;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>RPC:980 580    510</td>
          <td class='etiqueta'>CRUCE DE LA AVENIDA BOLIVAR CON    LA AVENIDA CENTRAL, AL FRENTE DE LA UNE TECNOL&Oacute;GICA DEL SUR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 01    - SAN JUAN DE MIRAFLORES</td>
          <td  class='etiqueta'>VILLA MARIA    DEL TRIUNFO</td>
          <td class='etiqueta'>JR. SAN ANTONIO Nro. 975 LOCAL COMUNAL COPROBE</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>MOVISTAR 959 058 312 RPM: #959 058 312</td>
          <td class='etiqueta'>UBICADO A MEDIA CUADRA DE CAPILLA &quot;SAN ANTONIO&quot; AV. EL TRIUNFO</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LIMA UGEL 02 RIMAC</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 02    RIMAC</td>
          <td  class='etiqueta'>INDEPENDENCIA</td>
          <td class='etiqueta'>COLISEO DE LA    AMISTAD PERU JAPON AV. HUAMACHUCO    CUADRA 1 / N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'># 947647013</td>
          <td class='etiqueta'>ALT.AV. TAHUANTINSUYO PARADERO    EX CINE</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 02 RIMAC</td>
          <td  class='etiqueta'>LOS    OLIVOS</td>
          <td class='etiqueta'>CETPRO &quot;SAN MARCOS&quot; CALLE 4 MZ F </td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>996482731</td>
          <td class='etiqueta'>KM 20.5 PANAMERICANA NORTE A 2 CDRAS UNIVERSIDAD CESAR VALLEJO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 02 RIMAC</td>
          <td  class='etiqueta'>RIMAC</td>
          <td class='etiqueta'>CETPRO    PROMAE RIMAC AV. SAMUEL ALCAZARAMUEL ALCAZAR Nro. 351 A</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>967710481</td>
          <td class='etiqueta'>PARADERO    BELLIDO ALT. PLAZA VEA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 02 RIMAC</td>
          <td  class='etiqueta'>SAN    MARTIN DE PORRAS - 01</td>
          <td class='etiqueta'>CETPRO    SAN MARTIN DE PORRES JR. SANTA CLORINDA Nro. 971 URB. PALAO</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>998054923</td>
          <td class='etiqueta'>ALTURA SEGUNDA    ENTRADA DE PALAO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 02 RIMAC</td>
          <td  class='etiqueta'>SAN    MARTIN DE PORRAS - 02</td>
          <td class='etiqueta'>INSTITUTO LUIS    NEGREIROS VEGA AV. JOSE GRANDA S/N CDRA 24</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>970912996</td>
          <td class='etiqueta'>ALTURA MERCADO    CENTRO CIVICO DE CONDEVILLA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 02 RIMAC</td>
          <td  class='etiqueta'>SAN    MARTIN DE PORRAS - 03</td>
          <td class='etiqueta'>ASOC. DE PROPIETARIOS DE SAN DIEGO &quot;PRUSAC&quot; AV. SANDIEGO DE ALCALA CDRA 9 SN</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>970912996</td>
          <td class='etiqueta'>BOTICA JERUSALEN A 2 CUADRAS</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LIMA UGEL 03 BRE&Ntilde;A</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 03 - BRE&Ntilde;A</td>
          <td  class='etiqueta'>BRE&Ntilde;A    / PUEBLO LIBRE</td>
          <td colspan="4" class='etiqueta'>ACERCARSE A  SEDE DE CERCADO DE LIMA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 03 - BRE&Ntilde;A</td>
          <td  class='etiqueta'>CERCADO    DE LIMA</td>
          <td class='etiqueta'>AV ARNALDO    MARQUEZ Nro. 511 OFICINA Nro. 503</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#    984081183</td>
          <td class='etiqueta'>CUADRA 15 DE    AVENIDA BRASIL A DOS CUADRAS DE PLAZA    VEA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 03 - BRE&Ntilde;A</td>
          <td  class='etiqueta'>JESUS MARIA /    SAN ISIDRO / LINCE</td>
          <td colspan="4" class='etiqueta'>ACERCARSE A  SEDE DE CERCADO DE LIMA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 03 - BRE&Ntilde;A</td>
          <td  class='etiqueta'>LA VICTORIA</td>
          <td class='etiqueta'>JR    GARCIA NARANJO Nro. 647</td>
          <td class='etiqueta'>5793541</td>
          <td class='etiqueta'>980443543</td>
          <td class='etiqueta'>ALTURA DE LA    CDRA 6 DE LA AV GRAU ESPALDA DEL IST JOSE PARDO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 03 - BRE&Ntilde;A</td>
          <td  class='etiqueta'>SAN    MIGUEL / MAGDALENA DEL MAR</td>
          <td colspan="4" class='etiqueta'>ACERCARSE A  SEDE DE CERCADO DE LIMA</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LIMA UGEL 04 COMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 04    COMAS</td>
          <td  class='etiqueta'>ANCON / SANTA ROSA</td>
          <td width="287"  class='etiqueta'>MUNICIPALIDAD    DISTRITAL DE &quot;SANTA ROSA&quot; AV. ALFREDO BERTELO CDRA 2 SN</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#949848215</td>
          <td width="240"  class='etiqueta'>ALTURA    DEL ARCO DE SANTA ROSA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 04    COMAS</td>
          <td  class='etiqueta'>CARABAYLLO    1</td>
          <td width="287"  class='etiqueta'>LOCAL    COMUNAL RAUL PORRAS BARRENECHEA AV. TUPAC AMARU</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#949848215</td>
          <td width="240"  class='etiqueta'>ALTURA MUNICIPALIDAD DE CARABAYLLO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 04 COMAS</td>
          <td  class='etiqueta'>CARABAYLLO    2</td>
          <td width="287"  class='etiqueta'>LOCAL    CUMUNAL &quot;LA FLOR&quot; JR. INDUSTRIAL SN PPJJ LA FLOR</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#949848215</td>
          <td width="240"  class='etiqueta'>PARADERO 2da ESCALERA LA FLOR DE LA AV. TUPAC AMARU</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 04 COMAS</td>
          <td  class='etiqueta'>COMAS    1</td>
          <td width="287"  class='etiqueta'>AV.    UNIVERSITARIA CUADRA 100 S/N PISCINA MUNICIPAL MANHATAN </td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#949848215</td>
          <td width="240"  class='etiqueta'>A UNA CUADRA DE LA AV. SAN FELIPE </td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 04 COMAS</td>
          <td  class='etiqueta'>COMAS    2</td>
          <td width="287"  class='etiqueta'>CENTRO    CIVICO DE COMAS AV. 22 AGOSTO SN - URB. SANTA LUZMILA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#949848215</td>
          <td width="240"  class='etiqueta'>CUADRA 26 DE AV. UNIVERSITARIA ESPALDA DE MERCADO MODELO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 04 COMAS</td>
          <td  class='etiqueta'>PUENTE    PIEDRA</td>
          <td width="287"  class='etiqueta'>CLUB MADRES &quot;MICAELA BASTIDAS II &quot; MZ E LOTE 14</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#949848215</td>
          <td width="240"  class='etiqueta'>ALT KIM 32 PANAMERICANA NORTE (PARADERO GRIFO EL NORTE&Ntilde;O)</td> 
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LIMA UGEL 05 SAN JUAN DE LURIGANCHO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL    05 - SAN JUAN DE LURIGANCHO</td>
          <td  class='etiqueta'>EL    AGUSTINO</td>
          <td class='etiqueta'>JR.TEJADA DIAZ    Nro. 202 - CENTRO DE DESARROLLO EMPRESARIAL EL AGUSTINO</td>
          <td class='etiqueta'>7152121</td>
          <td class='etiqueta'>997303362</td>
          <td class='etiqueta'>A 4 CUADRAS DE    LA MUNICIPALIDAD DEL AGUSTINO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL    05 - SAN JUAN DE LURIGANCHO</td>
          <td  class='etiqueta'>SAN JUAN DE LURIGANCH0 - 1</td>
          <td class='etiqueta'>AV.    PRIMERO DE MAYO MZ 32A LOTE 2 -CEPRO BAYOVAR</td>
          <td class='etiqueta'>2863244</td>
          <td class='etiqueta'>997204089</td>
          <td class='etiqueta'>A    1 CUADRA DE LA COMISARIA DE BAYOVAR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL    05 - SAN JUAN DE LURIGANCHO</td>
          <td  class='etiqueta'> SAN JUAN DE LURIGANCH0 - 2</td>
          <td class='etiqueta'>JR. AGUA MARINA    Nro. 121 - URB. SAN HILARION - CEPRO SE&Ntilde;OR DE LOS MILAGROS</td>
          <td class='etiqueta'>3883702</td>
          <td class='etiqueta'>998776714</td>
          <td class='etiqueta'>ENTRE    PARADERO LOS POSTES Y PARADERO 17 AV. PROCERES DE LA INDEPENDENCIA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL    05 - SAN JUAN DE LURIGANCHO</td>
          <td  class='etiqueta'>SAN JUAN DE LURIGANCH0 - 3</td>
          <td class='etiqueta'>CALLE LAS    MANDRAGORAS Nro. 417 URB. SAN HILARION - CEPRO SAN HILARION</td>
          <td class='etiqueta'>4585205</td>
          <td class='etiqueta'>966762155</td>
          <td class='etiqueta'>ALT.    PARADERO 10 - AV. LAS FLORES</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL    05 - SAN JUAN DE LURIGANCHO</td>
          <td  class='etiqueta'>SAN JUAN DE LURIGANCH0 - 4</td>
          <td class='etiqueta'>JR.    JOSE ANTONIO ENCINAS Nro. 400 URB. LAS FLORES - CEPRO MICAELA BASTIDAS</td>
          <td class='etiqueta'>3764050</td>
          <td class='etiqueta'>984538406</td>
          <td class='etiqueta'>ALT.    PARADERO 03 - AV. LAS FLORES</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LIMA UGEL06 ATE</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 06 - ATE</td>
          <td  class='etiqueta'>ATE    1</td>
          <td class='etiqueta'>AV.    LOS QUECHUAS CDRA 11 S/N URB SALAMANCA DE MONTERRICO</td>
          <td class='etiqueta'>013626262</td>
          <td class='etiqueta'>991024282</td>
          <td class='etiqueta'>ALTURA    DE LA AV. SANTA ROSA CON QUECHUAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 06 - ATE</td>
          <td  class='etiqueta'>ATE 2</td>
          <td class='etiqueta'>ESTADIO ANDRES BEDOYA DIAZ VITARTE CARRETERA    CENTRAL Km 6.9</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>945155883</td>
          <td class='etiqueta'>A    UNA CUADRA DE LA MUNICIPALIDAD DE VITARTE</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 06 - ATE</td>
          <td  class='etiqueta'>ATE    3</td>
          <td class='etiqueta'>PLAZA    DE ARNAS DE HUAYCAN S/N</td>
          <td class='etiqueta'>013715323</td>
          <td class='etiqueta'>994949368</td>
          <td class='etiqueta'>AL    COSTADO DE LA AGENCIA MUNICIPAL DE HUAYCAN</td>
        </tr>
       <tr>
          <td  class='etiqueta'>UGEL 06 - ATE</td>
          <td  class='etiqueta'>CHACLACAYO</td>
          <td class='etiqueta'>CALLE    LAS DALIAS CON MAGNOLIAS S/N</td>
          <td class='etiqueta'>013602803</td>
          <td class='etiqueta'>989912435</td>
          <td class='etiqueta'>A    ESPALDAS DEL ESTADIO TAHUANTINSUYO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 06 - ATE</td>
          <td  class='etiqueta'>CIENEGUILLA</td>
          <td class='etiqueta'>AV. PACHACUTEC MZ A LT 8 TAMBO VIEJO - CIENEGUILLA</td>
          <td class='etiqueta'>014799158</td>
          <td class='etiqueta'>991402417</td>
          <td class='etiqueta'>ALTURA    PARADERA LA CRUZ</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 06 - ATE</td>
          <td  class='etiqueta'>LA    MOLINA</td>
          <td class='etiqueta'>AV.    LA MOLINA Nro. 1486 B URB. SOL DE LA MOLINA</td>
          <td class='etiqueta'>0167440681</td>
          <td class='etiqueta'>983467585</td>
          <td class='etiqueta'>PARADERO    SAN SEBASTIAN LA MOLINA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 06 - ATE</td>
          <td  class='etiqueta'>LURIGANCHO    1</td>
          <td class='etiqueta'>AV.    LOS CANARIOS MZ O2 LT 5</td>
          <td class='etiqueta'>014625490</td>
          <td class='etiqueta'>940089182</td>
          <td class='etiqueta'>FRENTE    AL INTITUTO TECNOLOGICO MONSERAT</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 06 - ATE</td>
          <td  class='etiqueta'>LURIGANCHO    2</td>
          <td class='etiqueta'>AV.    ENRIQUE GUZMAN S/N</td>
          <td class='etiqueta'>15847813</td>
          <td class='etiqueta'>969708076</td>
          <td class='etiqueta'>UNIVERSIDAD    ENRIQUE GUZMAN Y VALLE &quot; LA CANTUTA&quot;</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL 06 - ATE</td>
          <td  class='etiqueta'>SANTA    ANITA</td>
          <td class='etiqueta'>AV    MARIA PARADO DE BELLIDO CDRA 1 S/N</td>
          <td class='etiqueta'>13830700</td>
          <td class='etiqueta'>995744449</td>
          <td class='etiqueta'>AL    COSTADO DE LA POSTA HUASCAR FRENTE A LA FABRICA TECNO</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LIMA UGEL 07 SAN BORJA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL -07 -SAN BORJA</td>
          <td  class='etiqueta'>CHORRILLOS</td>
          <td class='etiqueta'>CETPRO &quot;JOSE OLAYA&quot; AV. JOSE OLAYA N°583</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#984088780</td>
          <td class='etiqueta'>ALTURA DE BOMBEROS DE CHORRILLOS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL -07 -SAN BORJA</td>
          <td  class='etiqueta'>SAN    BORJA / SAN LUIS</td>
          <td class='etiqueta'>Av    LAS ARTES Nro. 860 SAN BORJA - CASA DE RETIRO PARROQUIA SAN FRANCISCO DE BORJA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#984088780</td>
          <td class='etiqueta'>ALT    DE LA CDRA 8 DE LA AV. LAS ARTES NORTE</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL -07 -SAN BORJA</td>
          <td  class='etiqueta'>SURCO</td>
          <td class='etiqueta'>BIBLIOTECA    MUNICIPAL LOS GLADIOLOS ALT DE LA CDRA 4 DE LA AV. MARISCAL CASTILLA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#984088780</td>
          <td class='etiqueta'>ESQUIINA    DE REPUBLICA DE PANAMA C/CASTILLA(PARADERO CORTIJO)</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UGEL -07 -SAN BORJA</td>
          <td  class='etiqueta'>SURQUILLO    / MIRAFLORES / BARRANCO</td>
          <td class='etiqueta'>Av.    REPUBLICA DE PANAMA Nro. 5300 - MUNICIPALIDAD DE SURQUILLO CASA DE LA JUVENTUD</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#984088780</td>
          <td class='etiqueta'>ALTURA    DEL CRUCE DE LA AV. ANGAMOS Y LA AV.REPUBLICA DE PANAMA</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LIMA - CA&Ntilde;ETE</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LIMA -    CA&Ntilde;ETE</td>
          <td  class='etiqueta'>CA&Ntilde;ETE</td>
          <td class='etiqueta'>JR. SAN    AGUSTIN S/N</td>
          <td class='etiqueta'>NO TIENE</td>
          <td class='etiqueta'>940506867</td>
          <td class='etiqueta'>GALERIAS SAN    AGUSTIN</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LIMA - CA&Ntilde;ETE</td>
          <td  class='etiqueta'>HUAROCHIRI</td>
          <td class='etiqueta'>AV    SAN MARTIN Nro. 2860</td>
          <td class='etiqueta'>NO    TIENE</td>
          <td class='etiqueta'>992263624</td>
          <td class='etiqueta'>MUNICIPALIDAD</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LIMA - CA&Ntilde;ETE</td>
          <td  class='etiqueta'>YAUYOS</td>
          <td class='etiqueta'>AV    JORGE CHAVEZ S/N</td>
          <td class='etiqueta'>NO    TIENE</td>
          <td class='etiqueta'>982243849</td>
          <td class='etiqueta'>3ER    PISO BANCO DE LA NACI&Oacute;N</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LIMA - HUACHO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LIMA - HUACHO</td>
          <td  class='etiqueta'>BARRANCA</td>
          <td class='etiqueta'>PLAZA    DE ARMAS Nro. 222 - BARRANCA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>991107646</td>
          <td class='etiqueta'>IGLESIA    SAN ILDEFONSO - BARRANCA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LIMA - HUACHO</td>
          <td  class='etiqueta'>CAJATAMBO</td>
          <td class='etiqueta'>PLAZA    DE ARMAS S/N - CAJATAMBO</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>976576306</td>
          <td class='etiqueta'>MUNICIPALIDAD    PROVINCIAL DE CAJATAMBO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LIMA - HUACHO</td>
          <td  class='etiqueta'>CANTA</td>
          <td class='etiqueta'>Jr.    TACNA S/N - CANTA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>RPC    961779523</td>
          <td class='etiqueta'>LOCAL    DE LA GOBERNACION FRENTE A LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LIMA - HUACHO</td>
          <td  class='etiqueta'>HUAURAL</td>
          <td class='etiqueta'>AV.    DEL SOLAR Nro. 118 2DO PISO - HUARAL</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>956340162</td>
          <td class='etiqueta'>GOBIERNO    REGIONAL HUARAL, A 1/2 CDRA. DE LA PLAZA CENTENARIO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LIMA - HUACHO</td>
          <td  class='etiqueta'>HUAURA</td>
          <td class='etiqueta'>AV.    DOMINGO MANDAMIENTO Nro.  710 - HUALMAY</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>987916517</td>
          <td class='etiqueta'>COMPLEJO    MUNICIPAL DE HUALMAY AL COSTADO DE LA POSTA MEDICA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LIMA - HUACHO</td>
          <td  class='etiqueta'>OYON</td>
          <td class='etiqueta'>ESQUINA    DE LA PLAZA DE ARMAS S/N - OYON</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>980232342/RPC    993363633</td>
          <td class='etiqueta'>PARROQUIA    NUESTRA SE&Ntilde;ORA DE LA ASUNCI&Oacute;N</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LORETO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LORETO</td>
          <td  class='etiqueta'>LORETO</td>
          <td class='etiqueta'>CALLE    MANUEL PACAYA CUADRA 6</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>A    TRES CUADRAS DE LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LORETO</td>
          <td  class='etiqueta'>MARISCAL    RAMON CASTILLA</td>
          <td class='etiqueta'>CALLE    CARLOS P. SAENZ C/PROGRESO S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>AL    COSTADO DEL BANCO DE LA NACI&Oacute;N</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LORETO</td>
          <td  class='etiqueta'>MAYNAS</td>
          <td class='etiqueta'>CALLE    BRASIL Nro. 1224</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>ENTRE    LA CALLE ROMULO ESPINAR Y PSJ SOLEDAD</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LORETO</td>
          <td  class='etiqueta'>REQUENA</td>
          <td class='etiqueta'>PASAJE    LOS OLIVOS S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>100    MTRS. DE LA PLAZA SARGENTO LORES</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">MADRE DE DIOS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>MADRE DE    DIOS</td>
          <td  class='etiqueta'>MANU</td>
          <td class='etiqueta'>AV. ESPERANZA    S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>974422204</td>
          <td class='etiqueta'>FRENTE A LA    PLAZA PRINCIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>MADRE DE    DIOS</td>
          <td  class='etiqueta'>TAHUAMANU</td>
          <td class='etiqueta'>JR.    GARCILAZO DE LA VEGA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>982605618</td>
          <td class='etiqueta'>FRENTE    A LA PLAZA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>MADRE    DE DIOS</td>
          <td  class='etiqueta'>TAMBOPATA</td>
          <td class='etiqueta'>JR. AREQUIPA Nro.    154</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>953765524</td>
          <td class='etiqueta'>A 50 METROS DE    LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">MOQUEGUA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>MOQUEGUA</td>
          <td  class='etiqueta'>SANCHEZ    CERRO</td>
          <td class='etiqueta'>CALLE    AREQUIPA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>987787085</td>
          <td class='etiqueta'>A    MEDIA CUADRA DE LA GOBERNACI&Oacute;N</td>
        </tr>
        <tr>
          <td  class='etiqueta'>MOQUEGUA</td>
          <td  class='etiqueta'>ILO</td>
          <td class='etiqueta'>PAMPA INALAMBRICA S/N COSTANERA    SUR KM7</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>953688518</td>
          <td class='etiqueta'>EN    EL TERMINAL TERRESTRE</td>
        </tr>
        <tr>
          <td  class='etiqueta'>MOQUEGUA</td>
          <td  class='etiqueta'>MARISCAL    NIETO</td>
          <td class='etiqueta'>CALLE ALTO PERU    194</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>961520408</td>
          <td class='etiqueta'>POR    EL COMPLEJO LOS VEGETALES</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">PASCO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PASCO</td>
          <td  class='etiqueta'>DANIEL    A. CARRION</td>
          <td class='etiqueta'>Jr.28    DE JULIO S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>972952486</td>
          <td class='etiqueta'>FRENTE    DEL HOSTAL JAMAYHUASI</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PASCO</td>
          <td  class='etiqueta'>OXAPAMPA</td>
          <td class='etiqueta'>JIRON    LIMA S/N CUADRA 3</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>981677261</td>
          <td class='etiqueta'>UNIDAD    DE GESTION EDUCATIVA LOCAL - UGEL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PASCO</td>
          <td  class='etiqueta'>PASCO</td>
          <td class='etiqueta'>JIRON    PIURA MZ4.LT19 COLUMNA PASCO</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>944485113</td>
          <td class='etiqueta'>A    5 CUADRAS DEL COLEGIO CESAR VALLEJO</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">PIURA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PIURA</td>
          <td  class='etiqueta'>AYABACA</td>
          <td class='etiqueta'>CASA    PARROQUIAL NUESTRA SRA. DEL PILAR<br>
            ESQ. AV. TACNA CON AV. GRAU S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>994563656</td>
          <td class='etiqueta'>AL    FRENTE DEL HOTEL SAMANGA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PIURA</td>
          <td  class='etiqueta'>HUANCABAMBA</td>
          <td class='etiqueta'>AV.    CENTENARIO S/N - HUANCABAMBA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>968914839</td>
          <td class='etiqueta'>A    MEDIA CUADRA DEL TERMINAL TERRESTRE HUANCABAMBA - PIURA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PIURA</td>
          <td  class='etiqueta'>MORROP&Oacute;N</td>
          <td class='etiqueta'>GOBERNACI&Oacute;N    DE CHULUCANAS - ESQUINA LANBAYEQUE Y ALFONSO UGARTE SN CHULUCANAS</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>969855086</td>
          <td class='etiqueta'>AL    COSTADO DE LA BIBLIOTECA MUNICIPAL DE CHULUCANAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PIURA</td>
          <td  class='etiqueta'>PAITA</td>
          <td class='etiqueta'>JR    JUNIN S/N QUINTA CUADRA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>968088109</td>
          <td class='etiqueta'>ESPALDAS    DE LA BIBLIOTECA MUNICIPAL, COSTADO DE LA GOBERNACI&Oacute;N</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PIURA</td>
          <td  class='etiqueta'>PIURA</td>
          <td class='etiqueta'>INSTITUTO    SUPERIOR PEDAG&Oacute;GICO DE PIURA- AV.    CHULUCANAS S/N. PIURA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>956818630</td>
          <td class='etiqueta'>FRENTE    AL EX-CAMPO FERIAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PIURA</td>
          <td  class='etiqueta'>SECHURA</td>
          <td class='etiqueta'>MZ    &quot;O&quot; LT 1 A.H. VICENTE CHUNGA    ALDANA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>968174373</td>
          <td class='etiqueta'>EN    EL AUDITORIO DE LA MUNICIPALIDAD DE SECHURA 3 PISO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PIURA</td>
          <td  class='etiqueta'>SULLANA</td>
          <td class='etiqueta'>JUNTA    DE USUARIOS AV. JOSE DE LAMA Nro.  1750 URB.SANTA ROSA.</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>969454703</td>
          <td class='etiqueta'>PASANDO    EL OVALO LA CAPULLANA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PIURA</td>
          <td  class='etiqueta'>TALARA</td>
          <td class='etiqueta'>GOBERNACI&Oacute;N    AV. JOS&Eacute; FAUSTINO S&Aacute;NCHEZ CARRI&Oacute;N S/N - PARI&Ntilde;AS</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>945343300</td>
          <td class='etiqueta'>A    20 M. DE LA MUNICIPALIDAD PROVINCIAL DE TALARA</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">PUNO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>AZANGARO</td>
          <td class='etiqueta'>JR    28 DE JULIO S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>951652990</td>
          <td class='etiqueta'>MERCADO    CENTRAL PEDRO VILCA APAZA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>CARABAYA</td>
          <td class='etiqueta'>TERMINAL    TERRESTRE S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>954629125</td>
          <td class='etiqueta'>FRENTE    AL ESTADIO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>CHUCUITO</td>
          <td class='etiqueta'>JR.    3 DE MAYO Nro. 243</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>951528473</td>
          <td class='etiqueta'>MEDIA    CUADRA DE LA IEP MARIANO ZEVALLOS GONZALES</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>EL    COLLAO</td>
          <td class='etiqueta'>AV.    PUNO S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>950863734</td>
          <td class='etiqueta'>COLISEO    CERRADO MUNICIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>HUANCANE</td>
          <td class='etiqueta'>JR.    MANUEL E. CORDERO</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>951034636</td>
          <td class='etiqueta'>A    MEDIA CUADRA DEL MERCADO DE ABASTOS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>LAMPA</td>
          <td class='etiqueta'>JR.    B. AGUIRRE S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>951024847</td>
          <td class='etiqueta'>SEGUNDO    PISO DEL MERCADO CENTRAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>MELGAR</td>
          <td class='etiqueta'>JR.    2 DE MAYO Nª 559</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>990090788</td>
          <td class='etiqueta'>AL COSTADO DE LA COMISARIA DE MELGAR</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>MOHO</td>
          <td class='etiqueta'>CALLE    PUNO Nro. 35</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>998443660</td>
          <td class='etiqueta'>ATR&Aacute;S    DEL HOTEL MUNICIPAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>PUNO</td>
          <td class='etiqueta'>JR.    MANUEL J. MORAL Nro. 252</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>951094854</td>
          <td class='etiqueta'>PARQUE    SALCEDO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>SAN    ANTONIO DE PUTINA</td>
          <td class='etiqueta'>JR.    MELGAR S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>951623037</td>
          <td class='etiqueta'>FRENTE    A COOPERATIVA DE AHORRO Y CREDITO SAN ANTONIO DE PADUA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>SAN    ROMAN</td>
          <td class='etiqueta'>AV.    CIRCUNVALACION NOROESTE Nro. 428</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>990218404</td>
          <td class='etiqueta'>A    MEDIA CUADRA DEL OVALO EL CHOLO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>SANDIA</td>
          <td class='etiqueta'>JR.    28 DE JULIO S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>956753087</td>
          <td class='etiqueta'>A    MEDIA CUADRA DE LA IGUESIA SANTIA APOSTOL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>PUNO</td>
          <td  class='etiqueta'>YUNGUYO</td>
          <td class='etiqueta'>JR.    SAN MARTIN Nro. 259</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>948485884</td>
          <td class='etiqueta'>A    UNA CUADRA DEL CLUB SOCIAL YUNGUYO</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">SAN MARTIN - MOYOBAMBA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MARTIN-MOYOBAMBA</td>
          <td  class='etiqueta'>EL    DORADO</td>
          <td class='etiqueta'>JR.    COMERCIO Nro. 123</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>942004627</td>
          <td class='etiqueta'>A    100 M DE PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MARTIN-MOYOBAMBA</td>
          <td  class='etiqueta'>LAMAS</td>
          <td class='etiqueta'>JR.    16 DE OCTUBRE Nro. 920</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>*781509</td>
          <td class='etiqueta'>A    UNA CDRA. DE LA COORPERATIVA DE SAN MARTIN DE PORRES</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MARTIN-MOYOBAMBA</td>
          <td  class='etiqueta'>MOYOBAMBA</td>
          <td class='etiqueta'>JR.    CALLAO Nro. 510</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>945488989</td>
          <td class='etiqueta'>A    UNA CDRA. DE LA PLAZA DE ARMAS</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MARTIN-MOYOBAMBA</td>
          <td  class='etiqueta'>RIOJA</td>
          <td class='etiqueta'>JR.    ANGAIZA Nro. 1155</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#966115954</td>
          <td class='etiqueta'>FRENTETE    AL SECAPS</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">SAN MARTIN - TARAPOTO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MART&Iacute;N - TARAPOTO</td>
          <td  class='etiqueta'>BELLAVISTA</td>
          <td class='etiqueta'>JR.    MARISCAL CACERES CUADRA 8</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#956957818</td>
          <td class='etiqueta'>AL    COSTADO DE LA PANEDERIA SEBASTIAN</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MART&Iacute;N - TARAPOTO</td>
          <td  class='etiqueta'>HUALLAGA</td>
          <td class='etiqueta'>JR.    HUALLAGA Nro. 214 - SAPOSOA</td>
          <td class='etiqueta'>042-781569</td>
          <td class='etiqueta'>948806692</td>
          <td class='etiqueta'>JR.    HUALLAGA Nro. 214 - SAPOSOA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MART&Iacute;N - TARAPOTO</td>
          <td  class='etiqueta'>MARISCAL    CACERES</td>
          <td class='etiqueta'>JR.    PROGRESO Nro. 585</td>
          <td class='etiqueta'>042    780863</td>
          <td class='etiqueta'>998940164</td>
          <td class='etiqueta'>JR.    PROGRESO Nro. 585</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MART&Iacute;N - TARAPOTO</td>
          <td  class='etiqueta'>PICOTA</td>
          <td class='etiqueta'>JR.    SAN MARTIN 2DA. CUADRA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#995400098</td>
          <td class='etiqueta'>JR.    SAN MARTIN 2DA. CUADRA S/N</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MART&Iacute;N - TARAPOTO</td>
          <td  class='etiqueta'>SAN    MART&Iacute;N</td>
          <td class='etiqueta'>JR.    SAN MART&Iacute;N Nro. 511</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#978492973</td>
          <td class='etiqueta'>JR.    SAN MART&Iacute;N Nro. 511</td>
        </tr>
        <tr>
          <td  class='etiqueta'>SAN MART&Iacute;N - TARAPOTO</td>
          <td  class='etiqueta'>TOCACHE</td>
          <td class='etiqueta'>JIRON:    ESTEBAN DELGADO Nro. 505</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>954957085/    980651562</td>
          <td class='etiqueta'>JIRON:    ESTEBAN DELGADO Nro. 505</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LORETO</td>
          <td  class='etiqueta'>ALTO    AMAZONAS</td>
          <td class='etiqueta'>CALLE    TNTE. CESAR LOPEZ Nro. 118</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#949814046</td>
          <td class='etiqueta'>CALLE    TNTE. CESAR LOPEZ Nro. 118</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LORETO</td>
          <td  class='etiqueta'>DATEM    DEL MARA&Ntilde;ON</td>
          <td class='etiqueta'>CALLE    HUALLAGA Nro.418</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>965    300667</td>
          <td class='etiqueta'>CALLE    HUALLAGA Nro.418</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">TACNA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>TACNA</td>
          <td  class='etiqueta'>CANDARAVE</td>
          <td class='etiqueta'>AV.    2 DE MAYO S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>952974525</td>
          <td class='etiqueta'>A    UNA CUADRA DEL COLEGIO ZORA CABAJAL</td>
        </tr>
        <tr>
          <td  class='etiqueta'>TACNA</td>
          <td  class='etiqueta'>JORGE    BASADRE</td>
          <td class='etiqueta'>CALLE    SUCRE S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>952878157</td>
          <td class='etiqueta'>A    ESPALDAS DE LA MUNICIPALIDAD DE JORGE BASADRE</td>
        </tr>
        <tr>
          <td  class='etiqueta'>TACNA</td>
          <td  class='etiqueta'>TACNA</td>
          <td class='etiqueta'>AV.    SAN MARTIN Nro.  520</td>
          <td class='etiqueta'>052-412991</td>
          <td class='etiqueta'>979898962</td>
          <td class='etiqueta'>A    10 M. DEL PASEO CIVICO (CENTRO DE LA CIUDAD)</td>
        </tr>
        <tr>
          <td  class='etiqueta'>TACNA</td>
          <td  class='etiqueta'>TARATA</td>
          <td class='etiqueta'>CALLE    RAMON COPAJA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>945139226</td>
          <td class='etiqueta'>AL    COSTADO DE LA PARROQUIA SAN BENEDICTO DE TARATA</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">TUMBES</td>
        </tr>
        <tr>
          <td  class='etiqueta'>TUMBES</td>
          <td  class='etiqueta'>CONTRALMIRANTE VILLAR</td>
          <td class='etiqueta'>AV.    PANAMERICANA NORTE S/N</td>
          <td class='etiqueta'>521698</td>
          <td class='etiqueta'>972604208</td>
          <td class='etiqueta'>TERMINAL    PESQUERO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>TUMBES</td>
          <td  class='etiqueta'>TUMBES</td>
          <td class='etiqueta'>AV.TUMBES    NORTE Nro.  534</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>996424028</td>
          <td class='etiqueta'>FRENTE    A LA I.E. Nro.  013 LEONARDO RODRIGUEZ ARELLANO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>TUMBES</td>
          <td  class='etiqueta'>ZARUMILLA</td>
          <td class='etiqueta'>AV.    EL EJERCITO S/N (BIBLIOTECA MUNICIPAL)</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>#0198501</td>
          <td class='etiqueta'>FRENTE    A LA CLINICA DEL DOCTOR GUILLERMO SANJINEZ</td>
        </tr>
        <tr>
          <td colspan="6" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">UCAYALI</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UCAYALI</td>
          <td  class='etiqueta'>ATALAYA</td>
          <td class='etiqueta'>JR.    PURUS S/N OCTAVA CUADRA</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>961095719</td>
          <td class='etiqueta'>GOBERNACI&Oacute;N    PROVINCIAL DE ATALAYA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UCAYALI</td>
          <td  class='etiqueta'>CORONEL    PORTILLO</td>
          <td class='etiqueta'>JR.    TACNA Nro.865</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>945063550</td>
          <td class='etiqueta'>COSTADO    DE LA RENIEC</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UCAYALI</td>
          <td  class='etiqueta'>PADRE    ABAD</td>
          <td class='etiqueta'>JR.    TUPAC AMARU S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>963995065</td>
          <td class='etiqueta'>COSTADO    DE LA I. E. FERNANDO CARBAJAL SEGURA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>UCAYALI</td>
          <td  class='etiqueta'>PURUS</td>
          <td class='etiqueta'>AV.    LUIS MU&Ntilde;OZ NODAL S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>947881498</td>
          <td class='etiqueta'>TEATRIN    MUNICIPAL 2DO PISO</td>
        </tr>
        <tr>
          <td  class='etiqueta'>HUANUCO</td>
          <td  class='etiqueta'>PUERTO    INCA</td>
          <td class='etiqueta'>MALECON    LEGUIA S/N</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>972862969</td>
          <td class='etiqueta'>A    LADO DE LA SUB REGION DE PUERTO INCA</td>
        </tr>
        <tr>
          <td  class='etiqueta'>LORETO</td>
          <td  class='etiqueta'>UCAYALI</td>
          <td class='etiqueta'>JR    BUENA VENTURA MARQUEZ Nro. 120</td>
          <td class='etiqueta'>&nbsp;</td>
          <td class='etiqueta'>990031009</td>
          <td class='etiqueta'>FRENTE    A LA UGEL DE CONTAMANA - LA CASA DEL MAESTRO</td>
        </tr>
  </table>
  
  
</body>
</html>