const entrada = require('readline-sync');

console.log(" ==== PRODUCAO DE PECAS ==== ")

const pecas = entrada.questionInt("Quantas peças foram produzidas? ");
const horas = entrada.questionFloat("Em quantas horas foi produzidas as pecas? ");

const total = pecas * horas

console.log("\n ---- RELATORIO ---- ");
console.log(`Total: ${total.toFixed(2)}`);
