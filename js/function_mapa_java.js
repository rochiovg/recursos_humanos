function nodoCadena(nodo, nombre) {
    try {
        if (nodo == null) {
            return "";
        } else if (nodo.getElementsByTagName(nombre) == null) {
            return "";
        } else if (nodo.getElementsByTagName(nombre)[0] == null) {
            return "";
        } else if (nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue == null) {
            return "";
        } else {
            return nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue;
        }
    } catch (ex) {
        return "";
    }
}

function nodoNumerico(nodo, nombre) {
    try {
        if (nodo.getElementsByTagName(nombre) == null) {
            return 0;
        }
        if (nodo.getElementsByTagName(nombre)[0] == null) {
            return 0;
        }
        if (nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue == null) {
            return 0;
        } else {
            return nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue;
        }
    } catch (e) {
        return 0;
    }
}

function nodoCadenaHtml(nodo, nombre) {
    try {
        if (nodo.getElementsByTagName(nombre) == null) {
            return "&nbsp;";
        }
        if (nodo.getElementsByTagName(nombre)[0] == null) {
            return "&nbsp;";
        }
        if (nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue == null) {
            return "&nbsp;";
        } else {
            return nodo.getElementsByTagName(nombre)[0].firstChild.nodeValue;
        }
    } catch (ex) {
        return "&nbsp;";
    }
}

function nodoNumericoHtml() {

}

function nodoValor(nodo, pos) {
    try {
        return nodo[pos].firstChild.nodeValue;
    } catch (e) {
        return "&nbsp;";
    }
}

// Operaciones comumes - FIN

var globalInicio = true;
var global_refrescar = ""; // Variable para refrescar mapas en caso de cambio de vista
var global_alcance = ""; // Variable para refrescar: tabla, grafico y mapa, dependiendo de {marco, adicional,total}

function cargar() {

    var ltipo = "1*6010";
    var lltipo = ltipo.split("*");
    var vtipo = lltipo[0];
    var tipo = lltipo[1];

    if (vtipo == 1 || vtipo == 2) {

        IndicadorDepartamental('');
       // mapaDpto('99', tipo, vtipo);

    } else {
        IndicadorDepartamental('');
       // mapaDpto('99', tipo, vtipo);
    }

}


function mapaDpto2(){
	alert ('Se muestra la funcion');
		
}

function IndicadorDepartamental(tipo) {
    buscarDatosMapa("", "", "divMapa");
}

function buscarDatosMapa(tipo, ubigeo, division) {
    var valores;

    varMapa = document.getElementById('cmbMapa').value;
    varPeriodo = document.getElementById('cmbPeriodo').value;

    var ltipo = "1*6010*1";;
    var lltipo = ltipo.split("*");
    var vtipo = lltipo[0];
    var ttipo = lltipo[1];
    var tCC = lltipo[2];
	
	console.log('Tipo: '+ltipo+' - Vtipo: '+vtipo)

    valores = "alcance=" + tipo + "&u=" + ubigeo + "&tipo=" + varMapa + "&Periodo=" + varPeriodo + "&vtipo=" + ttipo + "&tCC=" + tCC;
    if (vtipo == "1") {
        url = "IndicadoresMapa3a_java.asp";
    } else {
        if (vtipo == "2") {
            url = "IndicadoresMapa3a_java.asp";
        } else {
            url = "IndicadoresMapa3a_java.asp";
        }
    }

    var peticion = $.ajax({
        url: url,
        timeout: 7000,
        type: 'POST',
        contentType: "application/x-www-form-urlencoded",
        data: valores,
        dataType: "xml",
        beforeSend: function() {

            document.getElementById(division).innerHTML = "";
        },
        success: function(xml) {
            document.getElementById(division).innerHTML = "";
            buscarCoord(tipo, ubigeo, xml, division, ttipo);

        },
        error: function() {
            alert('Se a producido un Error');

            document.getElementById(division).innerHTML = "";

        }
    });

}

function buscarCoord(tipo, ubigeo, objDat, division, vtipo) {
    var valores;
    valores = "tipo=" + tipo + "&u=" + ubigeo;
    url = "Coord2.asp";
    var peticion = $.ajax({
        url: url,
        timeout: 7000,
        type: 'POST',
        contentType: "application/x-www-form-urlencoded",
        data: valores,
        dataType: "xml",
        beforeSend: function() {
            document.getElementById(division).innerHTML = "";
        },
        success: function(xml) {
            document.getElementById(division).innerHTML = "";

            if (tipo == "") {
                cargarMapa(tipo, ubigeo, objDat, xml, division, vtipo);
            } else {
                construirMapa(tipo, ubigeo, objDat, xml, division);
            }

        },
        error: function() {
            alert('Se a producido un Error');
            document.getElementById(division).innerHTML = "";

        }
    });
}

function cargarMapa(tipo, ubigeo, objDat, objCoor, division, vtipo) {

    var cadCoor;
    var cadCol;
    var ubig;
    cadCoor = "";
    cadCol = "";
    dato = objDat.getElementsByTagName("dato");
    for (i = 0; i < dato.length; i++) {
        c = buscarCoordenada(objCoor, nodoCadena(dato[i], "u"));
        ccdd = nodoCadena(dato[i], "u");
        cadCoor += "<area shape='poly' alt='' coords='" + c + "'"
        cadCoor += " href=javascript:mapaDpto2('" + ccdd + "','" + vtipo + "') ";
        cadCoor += " onmouseover=\"javascript:toolTip('" + nodoCadena(dato[i], "nom") + "','" + nodoCadena(dato[i], "texto") + "');\" onmouseout=javascript:toolTip(''); />";
        cadCol += "u" + (i + 1) + "=" + nodoCadena(dato[i], "u") + "&c" + (i + 1) + "=" + nodoCadena(dato[i], "color") + "&";
    }
    cad = "<table border=0 cellpadding=0 >";
    cad += "<tr><td align=center>";

    cad += "<img src='http://proyectos.inei.gob.pe/CharDirectorPages/mapa2.asp?tipo=" + tipo + "&ubigeo=" + ubigeo + "&" + cadCol + "'  usemap='#00' style='border-style:none' /> ";

    cad += "<map id='00' name='00'>";
    cad += cadCoor;
    cad += "</map>";
    cad += "</td></tr><tr><td>";
    cad += "<table align=center>";
    cad += "<tr><td bgcolor=#FFDEAD>&nbsp;&nbsp;</td><td>NT</td><td bgcolor=#FF7D7D>&nbsp;&nbsp;</td><td>No iniciado</td><td bgcolor=#0099FF>&nbsp;&nbsp;</td><td>En Trabajo</td><td bgcolor=#AAD98E>&nbsp;&nbsp;</td><td>Terminado</td></tr>";
    cad += "</table>";
    cad += "</td></tr></table>";
    document.getElementById(division).innerHTML = cad;

    if (global_refrescar == null || global_refrescar == 0 || global_refrescar == "") {
        // no hay mas vistas de mapa que actualizar
    } else {
        cambioVistaMapa(global_refrescar);
    }
    //Cambiar alcance (Segmentacion, UDRA)
    if (global_alcance == null || global_alcance == 0 || global_alcance == "") {
        // no hay mas objetos para actualizar (tabla, grafico o mapa)
    } else {
        cambioVistaAlcance(global_alcance);
    }
}

function construirMapa(tipo, ubigeo, objDat, objCoor, division) {

    var cadCoor;
    var cadCol;
    var ubig;
    cadCoor = "";
    cadCol = "";
    dato = objDat.getElementsByTagName("dato");
    for (i = 0; i < dato.length; i++) {
        c = buscarCoordenada(objCoor, nodoCadena(dato[i], "u"));
        cadCoor += "<area shape='poly' alt='' coords='" + c + "'"
        if (tipo == "dpto") {
            ubig = nodoCadena(dato[i], "u");
            ccdd = ubig.substring(0, 2);
            ccpp = ubig.substring(2, 4);
            cadCoor += " href=javascript:clickProv('" + ccdd + "','" + ccpp + "') ";
        }
        cadCoor += " onmouseover=\"javascript:toolTip('" + nodoCadena(dato[i], "nom") + "','" + nodoCadena(dato[i], "texto") + "');\" onmouseout=javascript:toolTip(''); />";
        cadCol += "u" + (i + 1) + "=" + nodoCadena(dato[i], "u") + "&c" + (i + 1) + "=" + nodoCadena(dato[i], "color") + "&";
    }
    leyenda = objCoor.getElementsByTagName("leyenda");
    cad = "<table border=0 cellpadding=0 ><tr><td><b>Avance de la Operacion de Campo</b><br><b>Departamento</b>: " + nodoCadena(leyenda[0], "dpto") + "<br>";
    if (tipo == "prov") {
        cad += "<b>Provincia:</b> " + nodoCadena(leyenda[0], "prov") + "</td>";
    }
    cad += "<td rowspan=2>";
    cad += "<img src='http://proyectos.inei.gob.pe/CharDirectorPages/mapa2.asp?tipo=" + tipo + "&ubigeo=" + ubigeo + "&" + cadCol + "'  usemap='#" + ubigeo + "' style='border-style:none' /> ";
    cad += "<map id='" + ubigeo + "' name='" + ubigeo + "'>";
    cad += cadCoor;
    cad += "</map>";
    cad += "</td></tr><tr><td>";
    cad += leyendaMapa() + "<br><a id=aZoom href=javascript:mapaEscala('" + division + "','" + ubigeo + "') ><img src='images/ico_zoom.gif' border=0 /> Zoom</a>" + "</td></tr></table>";
    document.getElementById(division).innerHTML = cad;
    if (global_refrescar == null || global_refrescar == 0 || global_refrescar == "") {
        // no hay mas vistas de mapa que actualizar
    } else {
        cambioVistaMapa(global_refrescar);
    }
    //Cambiar alcance (Segmentacion, UDRA)
    if (global_alcance == null || global_alcance == 0 || global_alcance == "") {
        // no hay mas objetos para actualizar (tabla, grafico o mapa)
    } else {
        cambioVistaAlcance(global_alcance);
    }
}

function cambioVistaMapa(num) {
    var varMapa;
    if (num == 1) { // Nivel Nacional
        global_refrescar = 2;
        if (document.getElementById('txtNacional').value == "mapa") {
            varMapa = document.getElementById('cmbMapa').value;
            IndicadorDepartamental(varMapa); // Actualizar Mapa Nivel Nacional	
        } else {
            cambioVistaMapa(2);
        }

    } else if (num == 2) { // Provincia
        global_refrescar = 3;
        estado = getEstadoSup();
        if (estado["modo"] == "mapa") {
            accionSup();
        } else {
            cambioVistaMapa(3);
        }

    } else if (num == 3) { // Distrito
        global_refrescar = "";
        estado = getEstadoInf();
        if (estado["modo"] == "mapa") {
            accionInf();
        }
    }
}

function cambioVistaAlcance(num) {
    var varMapa;
    if (num == 1) { // Nivel Nacional
        global_alcance = 2;
        if (document.getElementById('txtNacional').value == "mapa") {
            varMapa = document.getElementById('cmbMapa').value;
            IndicadorDepartamental(varMapa); // Actualizar Mapa Nivel Nacional	
        } else {
            resumenDptoCambioIU('rel');
        }
    } else if (num == 2) { // Provincia
        global_alcance = 3;
        estado = getEstadoSup();

    } else if (num == 3) { // Distrito
        global_alcance = "";

    }
}

function getCampo(IDCampo) {
    try {
        return document.getElementById(IDCampo).value;
    } catch (ex) {
        alert(ex.message);
        return "";
    }
}

function buscarCoordenada(objXml, ubigeo) {
    var coor = objXml.getElementsByTagName("dato");
    var cad;
    for (i = 0; i < coor.length; i++) {
        if (nodoCadena(coor[i], "u") == ubigeo) {
            return nodoCadena(coor[i], "c"); //retorna coordenadas pertenecientes al ubigeo
        }
    }
    return "";
}

function cambiarIU(tipo) {

    document.getElementById('divSup').innerHTML = "";
    document.getElementById("superior").style.display = "none";
    document.getElementById("divSup").style.height = '498px'; //100%

    if (tipo == "tabla") {

        resumenDptoCambioIU('rel');

    } else {

        varMapa = document.getElementById("cmbMapa").value;
        document.getElementById("txtNacional").value = "mapa";

        IndicadorDepartamental(varMapa);
    }
}


function resumenDptoCambioIU(tipo) {

    var vtipo = document.getElementById("txttipo").value;

    if (vtipo == 1) {
        url = "Resumen.asp";
    } else {
        if (vtipo == 2) {
            url = "Resumen2.asp";
        } else {
            url = "Resumen3.asp";
        }

    }

    var valores;
    valores = "alcance=dpto&tipo=" + tipo + "&filtro=" + document.getElementById("cmbAlcance").value + "&periodo=" + document.getElementById("cmbPeriodo").value + "&vtipo=" + document.getElementById("txttipo").value;

    var peticion = $.ajax({
        url: url,
        timeout: 7000,
        type: 'POST',
        contentType: "application/x-www-form-urlencoded",
        data: valores,
        dataType: "xml",
        beforeSend: function() {
            document.getElementById('divSup').innerHTML = "Cargando......";
        },
        success: function(xml) {

            document.getElementById('divSup').innerHTML = "";

            if (vtipo == 1) {
                tablaResumen(xml, "cambioIU", tipo);

            } else {
                if (vtipo == 2) {


                    tablaResumen2(xml, "cambioIU", tipo);

                } else {
                    tablaResumen3(xml, "cambioIU", tipo);
                }
            }

        },
        error: function() {
            alert('Se a producido un Error');
            document.getElementById('divSup').innerHTML = "";

        }
    });


}

function tablaResumen(objXml, tabla, tipo) {

    var vtipo = document.getElementById("txttipo").value;
    if (vtipo == "1") {
        nomproc = "Segmentacion";

    } else {
        nomproc = "OTROS";

    }

    var cad;
    var titulo;
    var columna;
    var idTabla;
    var titulo;
    columna = "Departamento";
    idDivision = "divSup";
    idTabla = "tablaSup";
    titulo = "<b>NIVEL NACIONAL</b>";
    cad = "<table width=95%  border=1 cellpadding=0 cellspacing=0  class=tabla1 >";
    cad += "<thead>";
    // titulo de tabla	
    cad += "<tr height=16px bgcolor=#B6D0F8><th colspan=14 align=left>" + titulo + "</th></tr>";

    cad += "<tr height=16px bgcolor=#B6D0F8>";
    cad += "<th rowspan=2 class=locked>Nro</font></th>";
    cad += "<th rowspan=2 class=locked>" + columna + "</th>";

    cad += "<th colspan=3 align=center>Marco</th>";
    cad += "<th colspan=3 align=center>" + nomproc + "</th>";

    cad += "</tr>";

    cad += "<tr height=16px bgcolor=#B6D0F8>";
    cad += "<th align=center >Total<br>Viv.</th>";
    cad += "<th align=center >Total<br>VivOcup.</th>";
    cad += "<th align=center >Total<br>HogarSisFoh.</th>";
    cad += "<th align=center >Total<br>JefeBrigada</th>";
    cad += "<th align=center >Total<br>Empadronador</th>";
    cad += "<th align=center >Total<br>Conglomerados</th>";

    cad += "</tr>";
    cad += "</thead>";

    cad += "<tbody>";
    // Leer XML
    var res = objXml.getElementsByTagName('resumen');
    //totales
    cad += "<tr height=16px bgcolor=#cccccc>";
    cad += "<td colspan=2 class=locked ><b><font color='blue' size='2'>Total</font></b></td>";
    cad += "<td align=center ><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a1") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a2") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a3") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a4") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a5") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a6") + "</font></b></td>";
    cad += "</tr>";

    var c = 0;

    var dato = objXml.getElementsByTagName('dato');

    //Detalles de resumen	
    if (tabla == "dpto" || tabla == "cambioIU") {
        for (var i = 0; i < dato.length; i++) {
            c++;
            if (c % 2 == 0) {

                if (nodoNumerico(dato[i], "c1") > 0) {
                    codColor = "#AFFF80";
                } else {
                    codColor = "#F0F8FF";
                }

            } else {


                if (nodoNumerico(dato[i], "c1") > 0) {
                    codColor = "#AFFF80";
                } else {
                    codColor = "#FFFFFF";
                }

            }

            cad += "<tr height=16px bgcolor=" + codColor + " onMouseOver=\"uno(this,'cccccc');\" onMouseOut=dos(this,'" + codColor + "');" + ">";
            cad += "<td align=center >" + (i + 1) + "</td>";
            cad += "<td align=left >" + nodoCadena(dato[i], "dpto") + "</td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c1") + " </td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c2") + "</td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c3") + "</td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c4") + "</td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c5") + "</td>";
            cad += "<td align=center><b>" + nodoNumerico(dato[i], "c6") + "</b></td>";
            cad += "</tr>";
        }
    }


    cad += "</tbody>";
    cad += "</table>";
    document.getElementById(idDivision).innerHTML = cad;

    //********
    IndicadorDepartamental('');
}

function tablaResumen2(objXml, tabla, tipo) {

    var vtipo = document.getElementById("txttipo").value;
    if (vtipo == "2") {
        nomproc = "Operacion de Campo";

    } else {
        nomproc = "OTROS";

    }

    var cad;
    var titulo;
    var columna;
    var idTabla;
    var titulo;
    columna = "Departamento";
    idDivision = "divSup";
    idTabla = "tablaSup";
    titulo = "<b>NIVEL NACIONAL</b>";
    cad = "<table width=95%  border=1 cellpadding=0 cellspacing=0  class=tabla1 >";
    cad += "<thead>";
    // titulo de tabla	
    cad += "<tr height=16px bgcolor=#B6D0F8><th colspan=15 align=left>" + titulo + "</th></tr>";

    cad += "<tr height=16px bgcolor=#B6D0F8>";
    cad += "<th rowspan=2 class=locked>Nro</font></th>";
    cad += "<th rowspan=2 class=locked>" + columna + "</th>";

    cad += "<th colspan=3 align=center>Marco</th>";
    cad += "<th colspan=10 align=center>" + nomproc + "</th>";

    cad += "</tr>";

    cad += "<tr height=16px bgcolor=#B6D0F8>";
    cad += "<th align=center >Total<br>Viv.</th>";
    cad += "<th align=center >Total<br>VivOcup.</th>";
    cad += "<th align=center >Total<br>Hogar<br>SisFoh.</th>";

    cad += "<th align=center >Total<br>Viv. Visitadas</th>";
    cad += "<th align=center >Total<br>Hog. Visitados</th>";
    cad += "<th align=center >Comp<BR>leta</th>";
    cad += "<th align=center >Incom<BR>pleta</th>";
    cad += "<th align=center >Rechazo</th>";
    cad += "<th align=center >Ause<BR>nte</th>";
    cad += "<th align=center >nse</th>";
    cad += "<th align=center >deso<br>cupada</th>";
    cad += "<th align=center >otros</th>";
    cad += "<th align=center >Avance(%)</th>";

    cad += "</tr>";
    cad += "</thead>";

    cad += "<tbody>";
    // Leer XML
    var res = objXml.getElementsByTagName('resumen');
    //totales
    cad += "<tr height=16px bgcolor=#cccccc>";
    cad += "<td colspan=2 class=locked ><b><font color='blue' size='2'>Total</font></b></td>";
    cad += "<td align=center ><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a1") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a2") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a3") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a4") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a5") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a6") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a7") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a8") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a9") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a10") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a11") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a12") + "</font></b></td>";
    cad += "<td align=center><b><font color='blue' size='2'>" + nodoNumerico(res[0], "a13") + "</font></b></td>";
    cad += "</tr>";

    var c = 0;

    var dato = objXml.getElementsByTagName('dato');

    //Detalles de resumen	
    if (tabla == "dpto" || tabla == "cambioIU") {
        for (var i = 0; i < dato.length; i++) {
            c++;
            if (c % 2 == 0) {

                if (nodoNumerico(dato[i], "c1") > 0) {
                    codColor = "#AFFF80";
                } else {
                    codColor = "#F0F8FF";
                }

            } else {


                if (nodoNumerico(dato[i], "c1") > 0) {
                    codColor = "#AFFF80";
                } else {
                    codColor = "#FFFFFF";
                }

            }

            cad += "<tr height=16px bgcolor=" + codColor + " onMouseOver=\"uno(this,'cccccc');\" onMouseOut=dos(this,'" + codColor + "');" + ">";
            cad += "<td align=center >" + (i + 1) + "</td>";
            cad += "<td align=left >" + nodoCadena(dato[i], "dpto") + "</td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c1") + " </td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c2") + "</td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c3") + "</td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c4") + "</td>";
            cad += "<td align=center>" + nodoNumerico(dato[i], "c5") + "</td>";
            cad += "<td align=center><b>" + nodoNumerico(dato[i], "c6") + "</b></td>";
            cad += "<td align=center><b>" + nodoNumerico(dato[i], "c7") + "</b></td>";
            cad += "<td align=center><b>" + nodoNumerico(dato[i], "c8") + "</b></td>";
            cad += "<td align=center><b>" + nodoNumerico(dato[i], "c9") + "</b></td>";
            cad += "<td align=center><b>" + nodoNumerico(dato[i], "c10") + "</b></td>";
            cad += "<td align=center><b>" + nodoNumerico(dato[i], "c11") + "</b></td>";
            cad += "<td align=center><b>" + nodoNumerico(dato[i], "c12") + "</b></td>";
            cad += "<td align=center><b>" + nodoNumerico(dato[i], "c13") + "</b></td>";
            cad += "</tr>";
        }
    }


    cad += "</tbody>";
    cad += "</table>";
    document.getElementById(idDivision).innerHTML = cad;

    //********
    IndicadorDepartamental('');
}

function jsClick(nomFun, dpto, prov) {
    //tipo: resumen o detalle
    var cad;
    if (prov == "") { // js para llamar a provincia
        cad = "javascript:" + nomFun + "('" + dpto + "')";
    } else { //js para llamar a distrito
        cad = "javascript:" + nomFun + "('" + dpto + "','" + prov + "')";
    }
    return cad;
}