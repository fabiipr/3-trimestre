var frases = [
    'Hola soy fabio',
    'Tengo 18 años',
    'este ejercicio es de lenguaje de marcas',

]
function mostrar(){
    var numero = Math.floor(Math.random() * (frases.length));
    document.getElementById("parrafo").innerHTML = frases[numero]
  

}
