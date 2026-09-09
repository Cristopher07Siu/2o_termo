const entrada = require('readline-sync');

function pesoPesa(peso) {
    if (peso >= 95 && peso <= 110) {
        return "APROVADA";
    } else {
        return "REPROVADA";
    }
}

console.log(" --- APROVAÇÕES --- ");
for (let i = 1; i <=1; i++) {
    let leitura = entrada.questionFloat(`Digite o peso da peca: `);

    let status = pesoPesa(leitura);

    console.log(`Resultado do peso ${i}: ${status}\n`);
    console.log("----------------");

}