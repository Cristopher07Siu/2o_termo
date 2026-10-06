const fs = require('fs');
const entrada = require('readline-sync');

console.log ("==== SISTEMA DE FERRAMENTAS ====");
const itensTotal = entrada.questionInt("Quantas ferramentas deseja cadastrar?");
const ferramentas = [];

for (let i = 0; i < itensTotal; i++) {
    console.log(`\nitem ${i + 1} de ${itensTotal}:`);
    const nome = entrada.question("Nome da ferramenta: ");
    const quantidade = entrada.questionInt("Quantidade: ");
    const custoUnitario = entrada.questionFloat("Custo unitario (R$): ");

    ferramentas.push({
        nome: nome,
        quantidade: quantidade,
        custoUnitario: custoUnitario
    });
}

fs.writeFileSync('ferramentas.json', JSON.stringify(ferramentas, null, 2));

console.log("\n----------------------------------------");
console.log(`Sucesso: ${ferramentas.length} itens gravados em 'ferramentas.json'.`);
console.log("---------------------------------------");