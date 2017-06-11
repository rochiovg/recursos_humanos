var itemStylesNames=["subitem","item",];
var menuStylesNames=[];

var isHorizontal = 1;
var saveNavigationPath = 1;
var showByClick = 0;
var bottomUp = 0;
var orientation = 0;
var columnPerSubmenu = "";
var pressedItem = -2;
var blankImage = "";
var pathPrefix = "";
var statusString = "link";

var menuWidth = "70";
var menuBorderWidth = 0;
var menuBorderStyle = "none";
var menuBackImage = "";

var absolutePos = 0;
var posX = 0;
var posY = 0;
var floatable = 0;
var floatIterations = 6;
var movable = 0;
var moveWidth = 12;
var moveHeight = 20;
var moveCursor = "default";
var moveImage = "";

var topDX = 0;
var topDY = 0;
var DX = -5;
var DY = 0;

var fontStyle = "bold 9px Verdana"; 
var fontColor = ["#0C4877","#FA490E"];
var fontDecoration = ["none","none"];

var itemBorderWidth = 1;
var itemBorderStyle = ["none","none"];
var itemBackImage = ["",""];
var itemAlign = "left";
var subMenuAlign = "";
var itemSpacing = 2;
var itemPadding = 2;
var itemCursor = "hand";
var itemTarget = "_self";

var menuBackColor = "#B6D0F8";
var menuBorderColor = "";
var itemBackColor = ["#B6D0F8","#FFE7E7"];
var itemBorderColor = ["",""];

var iconTopWidth = 24;
var iconTopHeight = 24;
var iconWidth = 16;
var iconHeight = 16;
var arrowImageMain = ["",""];
var arrowImageSub = ["",""];
var arrowWidth = 9;
var arrowHeight = 9;

var separatorWidth = "100%";
var separatorHeight = "3";
var separatorAlignment = "left";
var separatorImage = "";
var separatorVWidth = "3";
var separatorVHeight = "100%";
var separatorVImage = "";



var transparency = "100";
var transition = 0;
var transDuration = 300;
var transOptions = "";
var shadowLen = 0;
var shadowTop = 1;
var shadowColor = "#777777";

var cssStyle = 0;
var cssClass = "";

var macIEoffX = 10;
var macIEoffY = 15;
var macIEtopDX = 0;
var macIEtopDY = 2;
var macIEDX = -3;
var macIEDY = 0;

var itemStyles = [
	["fontStyle=normal 9px Verdana","fontColor=#0C4877,","fontDecoration=none,none","itemBackColor=#B6D0F8,#FFFFFF"], 
];


var ruta="";

var menuItems = [
	["| <img src='images/ingreso.ico' width=16 height=16 />INGRESO ECE &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|", ruta+"", "", "", "", "", "0", "", "", "", "",],
	["| <img src='images/hogar.gif' width=16 height=16 />REPORTES &nbsp;&nbsp;&nbsp;&nbsp;|", ruta+"javascript:Abrir_Ventana('http://desarrollo/intr/vleche/consultas/')", "", "", "", "", "0", "", "", "", "",],

	
];


apy_init();

