const fs = require('fs');

console.log("==== SISTEMA DE SENSORES");

const sensores = [
    {codigo: 1, tipo: "Temperatura", leituraAtual: 25.0, status: "Operando" },
    {codigo: 2, tipo: "Pressão", leituraAtual: 50.0, status: "Alerta"},
    {codigo: 3, tipo: "Temperatura", leituraAtual: 100.0, status: "Operando"}
];
const dadosJSON = JSON.stringify(sensores, null, 2);
fs.writeFileSync('sensores.json', dadosJSON);

console.log("Arquivo 'sensores.json' gerado com sucesso.");
