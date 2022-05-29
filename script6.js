function botonP1() {
    document.getElementById("parrafo1").style.fontFamily = "Arial";
}

function botonP2() {
    document.getElementById("parrafo2").style.fontFamily = "Verdana";
}

function botonP3() {
    document.getElementById("parrafo3").style.fontFamily = "Times New Roman";
}

// Cambiar imagen

function cambiaIMG(nombre) {
    document.getElementById('imagen').src = nombre;   
}

// Cambiar <div>
var texto = "Soy Fabio"
var numeros = "2003"
var textoNUM = "Me llamo Fabio tengo 18, soy español"

function div1() {
    document.getElementById("LMAR").innerHTML = texto;
}

function div2() {
    document.getElementById("LMAR1").innerHTML = numeros;
}

function div3() {
    document.getElementById("LMAR2").innerHTML = textoNUM;
}