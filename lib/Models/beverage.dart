class Beverage {
  String nome;
  double preco;
  int estoque;
  String descricao;
  bool disponivel;

  Beverage(this.nome, this.preco, this.descricao, this.estoque, [this.disponivel=true]);

  Map toMap() {
    Map<String, dynamic> map = {
      'nome': nome,
      'preco': preco,
      'estoque': estoque,
      'descricao': descricao
    };

    return map;

  }

  bool ocultar(){

    this.disponivel = !this.disponivel;

    return this.disponivel;

  }
}