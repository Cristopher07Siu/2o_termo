const fs = require('fs');

const amostrasColetas = [12.1, 12.3, 11.9, 12.0];

let aprovado = true;
for(let i = 0; i < amostrasColetas.length; i++) {
    if (amostrasColetas[i] < 12.0) {
        aprovado = false;
        break;
    }
}

const relatorioInspecao = {
    data: "2026-09-23",
    inspetor: "Roberto Carlos",
    amostras: amostrasColetas,
    loteAprovado: aprovado
}

fs.writeFileSync('inspecao_qualidade.json', JSON.stringify(relatorioInspecao, null, 2));

console.log("=== RELATORIO DE QUALIDADE GERADO ===");
console.log(`Status do Lote: ${aprovado ? "APROVADO" : "REPROVADO"}`);
console.log("Arquivo 'inspecao_qualidade.json' gravado em disco.");