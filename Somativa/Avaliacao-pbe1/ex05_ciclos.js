const entrada = require('readline-sync');
const num = entrada.questionInt("Qual ciclo deseja exibir? ");

for (let i = 1; i <= 10; i++) {
    console.log(`${num} ${i} = ${num * i}`);
}

console.log("--- FIM DO CICLO ---")