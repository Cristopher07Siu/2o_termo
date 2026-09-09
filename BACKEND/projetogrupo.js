// 1. CLASSE BASE - Usando PascalCase (letra maiúscula)
class Pagamento {
    constructor(nome) {
        this.nome = nome;
    }

    // Método genérico com nome alinhado ao contexto do sistema
    processar() {
        console.log("Qual o método de pagamento?");
    }
}

// 2. SUBCLASSES - Aplicando Herança com "extends"
class Pix extends Pagamento {
    // 3. Aplicando Polimorfismo através de Sobrescrita de Método (Method Overriding)
    processar() {
        console.log("Leia o QR Code");
    }
}

class Debito extends Pagamento {
    // Aplicando Polimorfismo
    processar() {
        console.log("Aproxime o cartão!");
    }
}

// Criando as instâncias
const pix = new Pix("Método Pix");
const debito = new Debito("Método Débito");

// Executando as chamadas polimórficas
pix.processar();    // Saída: "Leia o QR Code"
debito.processar(); // Saída: "Aproxime o cartão!"
