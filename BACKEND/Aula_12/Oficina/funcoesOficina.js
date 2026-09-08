function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00;
    const totalMaoDeObra = horasTrabalho * valorHora;
    return precoPeca + totalMaoDeObra;
}

function verificarGarantia(meses) {
    if (meses <=3) {
        return "Dentro da Garantia";
    } else {
        return "Fora da Garantia";
    }
}

function desconto (calcularOrcamento) {
const descontoValor = calcularOrcamento * 0.8 
return descontoValor
}

module.exports = {
    calcularOrcamento,
    verificarGarantia,
    desconto
}

