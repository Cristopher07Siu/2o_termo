const entrada = require ('readline-sync');
const oficina = require ('./funcoesOficina');

console.log("=== SISTEMA DE GESTAO DE OFICINA 1.0 ===");

const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");
const total = oficina.calcularOrcamento(peca, horas);
const garantia = oficina.verificarGarantia(tempoUso);
const descontoTotal = total - oficina.desconto (total);


console.log("\n--- RELATORIO DE SERVIÇO ---");
console.log(`Orcamento total: R$ ${total.toFixed(2)}`);
console.log(`Garantia            ${garantia}`);
console.log(`Seu desconto é:     ${descontoTotal.toFixed(2)}`)
console.log("--------------------");
