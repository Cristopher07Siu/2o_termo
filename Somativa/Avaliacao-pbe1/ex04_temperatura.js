const entrada = require('readline-sync');

console.log(" ==== REGISTRO DE TEMPERATURAS ====")

function temp (temperatura) {
    if (temperatura >= 60 && temperatura <= 80) {
        return "NORMAL";
    } else {
        return "ATENCAO";
    }
}

for (let i = 1; i <=1; i++) {
    let analise = entrada.questionFloat(`Digite a temperatura: `)
    let status = temp(analise);

    console.log(`Resultado do peso: ${status}\n`);
    console.log("----------------");

}


