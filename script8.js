var frases = [
    'al pan pan y al vino vino',
    'buleria buleria',
    'illooo que no lo he enchufao',
    'ay por la raza'
]

var autor=[
    '-jose lito',
    'putin',
    'franco',
    'gitano promedio'
]

function generador(){
    var numero = Math.floor(Math.random() * (frases.length));
    document.getElementById("parrafo").innerHTML = frases[numero]
    document.getElementById("autor").innerHTML = autor[numero]

}