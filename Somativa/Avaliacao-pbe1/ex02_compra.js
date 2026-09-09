const entrada = require('readline-sync');

console.log(" ==== SISTEMA DE VENDAS ==== ");

const NomeMaterial = entrada.question("Qual o nome do produto? ");
const precoUnico = entrada.questionFloat("Qual o preco unico? ")
const Unidades = entrada.questionInt("Quantas unidade foram vendidas? ");

const total = precoUnico * Unidades;

console.log("\n ---- RECIBO DA COMPRA ---- ")
console.log(`Material: ${NomeMaterial}     `);
console.log(`Valor Total da Compra: ${total}`);
console.log("------------------------------");