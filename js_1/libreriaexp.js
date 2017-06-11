// JavaScript Document

function eventoKey(e) {
	var keynum;
	var keychar;
	var numcheck;
	var keyretr;
	var keyenter;
	
	if(window.event) // IE 
	{ 
	keynum = e.keyCode;
	}
	else if(e.which) // Netscape/Firefox/Opera 
	{ 
	keynum = e.which;
	}
	
	return keynum;
}


function fSoloNumeros(e,obj) {
var objnum = eventoKey(e);

if(objnum == 9) {return false};

if(objnum == 13){
	var expr = /^\d+$/;
	if (expr.test(obj)) {
		//if (fconvertir(obj))
		return true;
	} else {
		alert("Fuera de Rango");
		return false;
	}
}
}

/*Funcion para eliminar los ceros que tengan*/
/*Funcion para eliminar los ceros que tengan*/
function fconvertir(obj){
	var aux = "";
	var ban = true;
	var cont = 0;
	
	for(var j=0; j<obj.length; j++) {
		var ax = parseInt(obj.charAt(j));
		if (ax != 0) {		
		break;
		}else{
		cont++;
		}
	}
	
	return parseInt(obj.substring(cont));
}


/*
Funcion para validar el PISO
e = evento
obj = el valor de la caja de texto
ini = rango inicial
fin = rango final
cval = el nombre de la caja
vpas = el nombre de la caja que va hacer el siguiente enfoque.
*/

//este rango obliga que llenes los datos
function fSoloRangoEspecial(e, obj, ini, fin, cval, cpas) {
var objnum = eventoKey(e);
if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^\d+$/;//Valida solo numero.
	var expr2 = /^(s1|s2|s3|s4|s4|s5|m|a|S1|S2|S3|S4|S5|M|A)$/
	
	// ^  =>  valor inical.
	
	
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin ) {
		pasarCajas(cval,cpas);
		return true;
		/* La primera condicion compara si la caja es numero y esta dentro del rango inicial y final.*/
	} else if (expr2.test(obj)) {
		pasarCajas(cval, cpas);
		return true;
		/* La segunda condicion compara si la caja tiene los valores indicados "S1,S2....S5,M,A" */
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
}



//es obligatorio
/*

function fSoloRangoEspecial_1(e, obj, ini, fin, cval, cpas) {
	
var objnum = eventoKey(e);
if(objnum == 9) {return false};
if(objnum == 13){
	var expr1 = /^\d+$/;//Valida solo numero.
	var expr2 = /^(S|s|s1|s2|s3|s4|s4|s5|m|a|S1|S2|S3|S4|S5|M|A)$/
	
	// ^  =>  valor inical.
	
	
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin  || obj.length == 0) {
		pasarCajas(cval,cpas);
		return true;
		/* La primera condicion compara si la caja es numero y esta dentro del rango inicial y final.*/
	/*} else if (expr2.test(obj)) {
		pasarCajas(cval, cpas);
		return true;
		/* La segunda condicion compara si la caja tiene los valores indicados "S1,S2....S5,M,A" */
	/*} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
}*/



function fSoloRangoEspecial_1(e, obj, ini, fin, cval, cpas) {
	
var objnum = eventoKey(e);
if(objnum == 9) {return false};
if(objnum == 13){
	var expr1 = /^\d+$/;//Valida solo numero.
	var expr2 = /^(S|s|s1|s2|s3|s4|s4|s5|m|a|S1|S2|S3|S4|S5|M|A)$/
	
	// ^  =>  valor inical.
	
	
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin  || obj.length == 0) {
		pasarCajas(cval,cpas);
		return true;
		/* La primera condicion compara si la caja es numero y esta dentro del rango inicial y final.*/
	} else if (expr2.test(obj)) {
		pasarCajas(cval, cpas);
		return true;
		/* La segunda condicion compara si la caja tiene los valores indicados "S1,S2....S5,M,A" */
	} 
}
}



//haciendo un rango especiaL PARA EL PISO


function fSoloRangoEspecial_piso(e, obj, ini, fin, cval, cpas) {
var objnum = eventoKey(e);
var zn=document.getElementById("txtzonasuf").value;
	var expr1 = /^\d+$/;//Valida solo numero.
	var expr2 = /^(s1|s2|s3|s4|s4|s5|m|a|S1|S2|S3|S4|S5|M|A)$/	// ^  =>  valor inical.
if(objnum == 9) {return false};
	

if(objnum == 13 && (fconvertir(zn)>0)){

	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin ) {
		pasarCajas(cval,cpas);
		return true;
		/* La primera condicion compara si la caja es numero y esta dentro del rango inicial y final.*/
	} else if (expr2.test(obj)) {
		pasarCajas(cval, cpas);
		return true;
		/* La segunda condicion compara si la caja tiene los valores indicados "S1,S2....S5,M,A" */
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
else {
		 document.getElementById("txtpiso0").focus();
	//alert ('bu');
	//alert ('zn');
	//if( (fconvertir(zn)==0)){
		//alert ('no entra');
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin  || obj.length == 0) {
		//alert ('bu');-->aqui entra
		pasarCajas(cval,cpas);
		return true;
		/* La primera condicion compara si la caja es numero y esta dentro del rango inicial y final.*/
	} else if (expr2.test(obj)) {
		pasarCajas(cval, cpas);
		return true;
		/* La segunda condicion compara si la caja tiene los valores indicados "S1,S2....S5,M,A" */
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
		
	
	//}





}




/*
funcion valida numero dentro de un rango.

e => evento
obj => valor de la caja de texto
ini => rango inicial
fin => rango final
cval => nombre de la caja de texto
cpas => nombre de la caja que se va el enfoque.
*/

function fSoloNumerosRango(e, obj, ini, fin, cval, cpas) {
var objnum = eventoKey(e);
//alert(cpas)
//var cpas1=document.getElementById("txtordensuf"+cpas)

if(objnum == 9) {return false};
if(objnum == 13 || objnum == 39){
	var expr1 = /^\d+$/; // Valida solo numero
	
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin ) {		
		//pasarCajas(cval, cpas1);
		pasarCajas(cval, cpas);
		return true;
		/*
		Condicion para compar la caja de texto si es numero y esta dentro del rango inicial y final.
		test => es una funcion de la expresion regular que compara deacuerdo a la expresion.
		*/
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}

//return (objnum==13 || (objnum>=48 && objnum<=57 ) )

}




function fSoloNumerosRango1(e, obj, ini, fin, cval, cpas) {
var objnum = eventoKey(e);

if(objnum == 9) {return false};
if(objnum == 13){
	var expr1 = /^\d+$/; // Valida solo numero
	
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin ||  obj.length == 0) {		
		pasarCajas(cval, cpas);
		return true;
		/*
		Condicion para compar la caja de texto si es numero y esta dentro del rango inicial y final.
		test => es una funcion de la expresion regular que compara deacuerdo a la expresion.
		*/
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
}



/*
funcion para validar texto

e => evento
obj => valor de la caja de texto
cval => nombre de la caja
cpas => nombre de la caja de pasa el enfoque.
*/
function fSoloTexto(e, obj, cval, cpas) {
var objnum = eventoKey(e);

if(objnum == 9) {return false};
if(objnum == 13){
	var expr1 = /^([a-z]|[A-Z]|Ò|—|\s)*$/; //valida solo letras
	/*
	\s => acepta espacio
	
	*/
	
	if (expr1.test(obj) ) {
		pasarCajas(cval, cpas);
		return true;
		/*
		compara si el valor de la caja es texto
		test => es una funcion que compara la expresion con la el valor de la caja.
		*/
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
}


function fSoloTexto1(e, obj, cval, cpas) {
var objnum = eventoKey(e);
if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^([a-z]|[A-Z]|Ò|—|\s)*$/; //valida solo letras
	/*
	\s => acepta espacio
	
	*/
	
	if (expr1.test(obj) || obj.length == 0) {
		pasarCajas(cval, cpas);
		return true;
		/*
		compara si el valor de la caja es texto
		test => es una funcion que compara la expresion con la el valor de la caja.
		*/
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
}

/*

funcion que compara letras y numeros

e => evento
obj => valor de la caja de texto
cval => nombre de la caja de texto
cpas => nombre de la cja que pasa el enfoque

*/

function fSoloAlfanumerico(e, obj, cval, cpas) {
var objnum = eventoKey(e);

if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^(\w|Ò|—|\s)*$/; // expresion que acepta letras y numeros
	
	/*
	
	\w => acepta a-z y A-Z y 0-9 pero no acpeta Ò ni —.
	\s => acepta espacio.
	
	*/
	
	if (expr1.test(obj)) {
		pasarCajas(cval, cpas);
		return true;
		//compara con el valor con la expresion.
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
}



function fSoloAlfanumerico1(e, obj, cval, cpas) {
var objnum = eventoKey(e);
//var cpas1=document.getElementById("txtordensuf"+cpas)
if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^(\w|Ò|—|\s)*$/; // expresion que acepta letras y numeros
	
	/*
	
	\w => acepta a-z y A-Z y 0-9 pero no acpeta Ò ni —.
	\s => acepta espacio.
	
	*/
	
	if (expr1.test(obj)&&  obj.length > 0 && obj != "0") {
		pasarCajas(cval, cpas);
		return true;
		//compara con el valor con la expresion.
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
}



function fSoloAlfanumerico1_pesca (e, obj, cval, cpas) {
var objnum = eventoKey(e);
if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^(\w|Ò|—|-|\s)*$/; // expresion que acepta letras y numeros
	
	/*
	
	\w => acepta a-z y A-Z y 0-9 pero no acpeta Ò ni —.
	\s => acepta espacio.
	
	*/
	
	if (expr1.test(obj)&&  obj.length > 0) {
		pasarCajas(cval, cpas);
		return true;
		//compara con el valor con la expresion.
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
}


/*

funcion para que no se repita consonates o vocales de una palabra.

e => evento
obj => valor de la caja
longitud => cantidad de consonates o vocales que se repiten
cval = nombre de la caja
cpas = nombre de la caja que pasa el enfoque.
*/

function fSoloTextoRepetir(e, obj, longitud, cval, cpas) {
var objnum = eventoKey(e);
if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 =  /^([a-z]|[A-Z]|Ò|@|—)*$/;	 // expresion que valida solo Letras
	if (expr1.test(obj)) {  
		//  || obj.value != "" para pasar de alto si el valor de la caja es vacio
		var aux = obj.charAt(0); //charAt => una funcion que extrae un caracter segun la posicion siendo 0 el primer caracter.
		var cont = 0; // variable que almacena la repiticon del consonate o vocal
		var ban = true; // variable que compara si llego a la lonquitud limite.
		
		for (var x=0; x<obj.length; x++) { //length => el tamaÒo de caracter de una palabra
			if (aux == obj.charAt(x)){ // si el aux es = al siguiente caracter
			cont++; // cont aumente de uno en uno
				if (cont >= longitud) { // compara si llego a su longitud
					ban = false;  //ban se convierte false
					break; // break corta el proceso del for.
				}
			} else {
			cont = 1;
			aux = obj.charAt(x);
			}
		}
		
		if (ban == false) {
		cval.value = "";
		cval.className = "cajainvalida";
		//alert("Fuera de Rango"); // Error si se repite los consotantes o vocales.
		return false;
		}
		
		pasarCajas(cval, cpas);
		return true;		
	} else {
		cval.value = "";
		cval.className = "cajainvalida";
		//alert("Fuera de Rango"); // Error si no es Letra.
		return false;
	}
}
}

/*

funcion para que no se repita consonates o vocales de una o mas palabras.

e => evento
obj => valor de la caja
longitud => cantidad de consonates o vocales que se repiten
cval = nombre de la caja
cpas = nombre de la caja que pasa el enfoque.

*/

function fSoloParrafoRepetir(e, obj, longitud, cval, cpas) {
var objnum = eventoKey(e);
if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 =  /^([a-z]|[A-Z]|@|Ò|—|\s)*$/;	 // expresion q acepta letras y espacio
	if (expr1.test(obj)) {
		
		var aux = obj.charAt(0);
		var cont = 0;
		var ban = true;
		
		for (var x=0; x<obj.length; x++) {
			if (aux == obj.charAt(x)){
			cont++;
				if (cont >= longitud) {
					ban = false;
					break;
				}
			} else {
			cont = 1;
			aux = obj.charAt(x);
			}
		}
		
		if (ban == false) {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
		}
		
		pasarCajas(cval, cpas);
		return true;		
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}
}
}


/*

funcion que valida el ruc

e => evento
obj => valor de la caja
cval => nombre de la caja
cpas => nombre de la caja que pasa en enfoque
*/
/*
function fSoloRuc(e, obj, cval, cpas) {
var objnum = eventoKey(e);
if(objnum == 13 || objnum == 9){
	var expr1 = /^\d+$/; // expresion solo nuemros
	//alert(parseInt(obj));
	if (expr1.test(obj) && (parseInt(obj) >= 10001111111 && parseInt(obj) <= 10999999999 || parseInt(obj) >= 15001111111 && parseInt(obj) <= 15999999999 || parseInt(obj) >= 20001111111 && parseInt(obj) <= 20999999999) && obj.length == 11) {
		pasarCajas(cval, cpas);
		/*
		parseInt => convertir de texto a numeros 
		*/
		/*return true;
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}	
}
}*/

/*
funcion que valida el dni si hay valor en la caja.
e => evento
obj => valor de la caja de texto
cval => nombre de la cja  de texto
cpas => nombre de la caja que pasa el enfoque
*/

function fSoloDni(e, obj, cval, cpas) {
var objnum = eventoKey(e);
if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^\d+$/; // solo numeros
	//alert(parseInt(obj));
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >0 && parseInt(fconvertir(obj)) <= 99999999 || obj.length == 0) {
		pasarCajas(cval, cpas);
		return true;		
	} else {
		//alert("Fuera de Rango");
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
	}	
}
}


/*funcion que pasa caja en caja segun la validacion.*/

function pasarCajas(cajaval, cajapas) {
  cajaval.className = "cajavalida"; //className = es el estilo o formato de la caja.
  cajapas.focus();
}




var navformEvento = window.Event ? true : false;
 function acceptNumFormEvento(evt)
{ 
	var key = navformEvento ? evt.which : evt.keyCode; 

	if ( key == 13 )
	{ 
	 window.event.keyCode = 9;     	  
    }
	
}

var ruc = "null";

function fSoloRuc(e, obj, cval, cpas) {
var objnum = eventoKey(e);
if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^\d+$/; // expresion solo nuemros
	
	if (obj.length == 0) {
		cval.value = "";
		pasarCajas(cval, cpas);
		return true;
	}
	
	
	
	if (expr1.test(obj) && (parseInt(obj) >= 10001111111 && parseInt(obj) <= 10999999999 || parseInt(obj) >= 15001111111 && parseInt(obj) <= 15999999999 || parseInt(obj) >= 20001111111 && parseInt(obj) <= 20999999999)) {
		pasarCajas(cval, cpas);

		return true;
	} else {
	
		cval.className = "cajainvalida";
		if (ruc == cval.value && obj != "0") {
			pasarCajas(cval, cpas);
			return true;
		}
		ruc = cval.value;
		cval.value = "";
		return false;
	}	
}
}


/*DOBLE DIGATICION DE NUMERO DE FORMULARIO*/
var nform = "null";

function fNFormulario(e, obj, ini, fin, cval, cpas) {
var objnum = eventoKey(e);

if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^\d+$/; // Valida solo numero
	
	if (obj.length == 0) {
		cval.value = "";
		pasarCajas(cval, cpas);
		return true;
	}
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin) {		
		if (nform == cval.value && obj.length > 0) {
			nform = "null";
			pasarCajas(cval, cpas);
			return true;
		}		
		nform = cval.value;
		cval.className = "cajainvalida";
		cval.value = "";
		return false;
	
	} else {
		
		cval.className = "cajainvalida";
		cval.value = "";
		return false;
	}
}
}

/*DOBLE DIGITACION NUMERO DE PERSONAS*/

var nper = "null";

function fNPersonas(e, obj, ini, fin, cval, cpas) {
var objnum = eventoKey(e);

if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^\d+$/; // Valida solo numero
	
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin && obj.length > 0) {
		
		if (nper == cval.value && obj.length > 0) {
			nper = "null";
			pasarCajas(cval, cpas);			
			return true;
		}
		nper = cval.value;
		cval.className = "cajainvalida";
		cval.value = "";
		return false;
	
	} else {
		cval.className = "cajainvalida";
		cval.value = "";
		return false;
	}
}
}


var nruc = "null";

function fnruculario(e, obj, ini, fin, cval, cpas) {
var objnum = eventoKey(e);


if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^\d+$/; // Valida solo numero
	
	if (obj.length == 0) {
		cval.value = "";
		pasarCajas(cval, cpas);
		return true;
	}
	if (expr1.test(obj) && parseInt(fconvertir(obj)) >= ini && parseInt(fconvertir(obj)) <= fin) {		
		
		if (nruc == cval.value && obj.length > 0) {
			nruc = "null";
			pasarCajas(cval, cpas);
			return true;
		}		
		nruc = cval.value;
		cval.className = "cajainvalida";
		cval.value = "";
		return false;
		/*
		Condicion para compar la caja de texto si es numero y esta dentro del rango inicial y final.
		test => es una funcion de la expresion regular que compara deacuerdo a la expresion.
		*/
	} else {
		
		cval.className = "cajainvalida";
		cval.value = "";
		return false;
	}
}
}




// Doble digitacion de direccion
var dire = "";

function fNDire(e, obj, cval, cpas) {
var objnum = eventoKey(e);

if(objnum == 9) {return false};

if(objnum == 13){
	var expr1 = /^(\w|Ò|—|\s)*$/; // valida letras y numeros
	
	if (expr1.test(obj) &&  obj.length > 0) {
		
	
		if (dire == cval.value && obj.length > 0) {
			dire = "";
			pasarCajas(cval, cpas);			
			return true;
		}
		dire = cval.value;
		cval.className = "cajainvalida";
		cval.value = "";
		return false;
		
	} else {
			cval.className = "cajainvalida";
		cval.value = "";
		return false;
	}
}
}



function fSoloAlfanumerico_dir(obj) {
	
	var expr1 = /^(\w|Ò|—|\s)*$/; // expresion que acepta letras y numeros

	if (expr1.test(obj) &&  obj.length > 0 && obj != "0") {		
		return true;
		//compara con el valor con la expresion.
	} else {		
		return false;
	}

}

function fSoloParrafoRepetir_dir(obj, longitud, expresion1, expresion2) {

	//var expr1 =  /^([a-z]|[A-Z]|@|Ò|—|\s)*$/;	 // expresion q acepta letras y espacio
	var expr1;
	
	if (expresion1 == "v") {
	expr1 =  /^(a|e|i|o|u|A|E|I|O|U|\s)*$/;	 // expresion q acepta letras y espacio
	} else {
	expr1 =  /^(b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z|Ò|B|C|D|F|G|H|J|K|L|M|N|P|Q|R|S|T|V|W|X|Y|Z|—|\s)*$/
	}
		var expr2 = expresion2; //contador de vocales io consonatntes

		
		var aux = obj.charAt(0);
		var cont = 0;
		var conb = 0;
		var ban = true;
		
		for (var x=0; x<obj.length; x++) {
			
			aux = obj.charAt(x);//u
			conb = 0
			
			for (var y=0; y<expr2.length; y++) {
			
			if (aux == expr2.charAt(y)) {
			cont++;	//=3
			conb = 1;
			}
			
			}
			
			if (aux == " " || conb == 0) cont = 0;
			
			if (cont >= longitud) {
					ban = false;
					break;					
			}
			
		}
		
		//alert(cont);
		
		if (ban == false) {
		return false;
		}
		
		return true;		

	
}


function fvalidarespecial(e, obj, cval, cpas) {
	
	var objnum = eventoKey(e);
	var alf = true;
	var voc = true;
	var con = true;

	if(objnum == 9) {return false};

	if(objnum == 13){
		
		alf = fSoloAlfanumerico_dir(obj);
		voc = fSoloParrafoRepetir_dir(obj,4,'v','aeiouAEIOU');
		con = fSoloParrafoRepetir_dir(obj,5,'c','bcdfghjklmnpqrstvwxyzÒBCDFGHJKLMNPQRSTVWXYZ—');
	
		if(alf != true || (voc == false || con == false)) {
		cval.value = "";
		cval.className = "cajainvalida";
		return false;
		} else	{
		pasarCajas(cval, cpas);
		return true;
		}
		
	}	
	
}
/////////////////////////////////////////////////razon social



function fSoloAlfanumerico_razon(obj) {
	
	var expr1 = /^(\w|Ò|—|@|\s)*$/; // expresion que acepta letras y numeros

	if (expr1.test(obj) &&  obj.length > 0 && obj != "0") {		
		return true;
		//compara con el valor con la expresion.
	} else {		
		return false;
	}

}

function fSoloParrafoRepetir_razon(obj, longitud, expresion1, expresion2) {

	var expr1;
	
	if (expresion1 == "v") {
	expr1 =  /^(a|e|i|o|u|A|E|I|O|U|\s)*$/;	 // expresion q acepta letras y espacio
	} else {
	expr1 =  /^(b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z|Ò|B|C|D|F|G|H|J|K|L|M|N|P|Q|R|S|T|V|W|X|Y|Z|—|@|\s)*$/
	}
	
	var expr2 = expresion2; //contador de vocales io consonatntes
		
		var aux = obj.charAt(0);
		var cont = 0;
		var conb = 0;
		var ban = true;
		
		for (var x=0; x<obj.length; x++) {
			
			aux = obj.charAt(x);//u
			conb = 0
			
			for (var y=0; y<expr2.length; y++) {
			
			if (aux == expr2.charAt(y)) {
			cont++;	//=3
			conb = 1;
			}
			
			}
			
			if (aux == " " || conb == 0) cont = 0;
			
			if (cont >= longitud) {
					ban = false;
					break;					
			}
			
		}
		
		
		if (ban == false) {

		return false;
		}
		
		return true;		
	
}


function fvalidarespecialrazon(e, obj, cval, cpas) {
	
	var objnum = eventoKey(e);
	var alf = true;
	var voc = true;
	var con = true;

	if(objnum == 9) {return false};

	if(objnum == 13)
		{
				if (obj.length == 0 ) {
				pasarCajas(cval, cpas);
				return true;
				} 
				else 
				{
		
						alf = fSoloAlfanumerico_razon(obj);
						voc = fSoloParrafoRepetir_razon(obj,4,'v','aeiouAEIOU');
						con = fSoloParrafoRepetir_razon(obj,6,'c','bcdfghjklmnpqrstvwxyzÒBCDFGHJKLMNPQRSTVWXYZ—@');
										if(alf != true || (voc == false || con == false)) 
						{
						cval.value = "";
					
						cval.className = "cajainvalida";
						return false;
						} 
						else	{
						pasarCajas(cval, cpas);
						return true;
							}
				}
		
		}	
	
}


	
//FUNCIONES PARA EL ONBLUR

function fs_numeros(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

            if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
            patron = /[0-9]/;//LETRAS Y NUMEROS

            te = String.fromCharCode(tecla); 

            return patron.test(te);  

}

function fs_numeros2(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

            if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 

            patron = /[0-9,.]/;//LETRAS Y NUMEROS

            te = String.fromCharCode(tecla); 

            return patron.test(te);  

}




function fs_numeros_1_2(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

            if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
		    patron = /[1-2]/;//LETRAS Y NUMEROS

            te = String.fromCharCode(tecla); 

            return patron.test(te);  

}

function fs_SoloLetras(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

            if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 

            patron =/[A-Za-z-Ò—]|\s/; // Solo acepta letras 

            te = String.fromCharCode(tecla); 

            return patron.test(te);  

}
function fs_Letras_Numeros(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

            if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
			if (tecla==32) return true;//espacio en blanco
			if (tecla==164) return true;
			if (tecla==165) return true;
			patron =/\w|[Ò—]/;

            te = String.fromCharCode(tecla); 

            return patron.test(te);  
}


function fs_Letras_Numeros_pesca(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

            if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
			if (tecla==32) return true;//espacio en blanco
			if (tecla==164) return true;
			if (tecla==165) return true;
			if (tecla==45) return true;	
			patron =/\w|[Ò—]/;

            te = String.fromCharCode(tecla); 

            return patron.test(te);  
}


function fs_Letras_Numeros_64 (e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

            if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
			if (tecla==32) return true;//espacio en blanco
			if (tecla==164) return true;
			if (tecla==165) return true;
            //patron = /\w/;//LETRAS Y NUMEROS
			patron =/\w|[Ò@—]/;

            te = String.fromCharCode(tecla); 

            return patron.test(te);  
}
function fs_Letras_Numeros_(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

            if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
			if (tecla==45) return true;// Tecla que da como resultado - 
            patron = /\w|[Ò—]/;//LETRAS Y NUMEROS

            te = String.fromCharCode(tecla); 

            return patron.test(te);  

}

function fs_piso(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 

            if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
            patron =/[0-9]|[asmASM]/ //LETRAS Y NUMEROS

            te = String.fromCharCode(tecla); 

            return patron.test(te);  

}


